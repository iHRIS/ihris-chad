"use strict";
const axios = require('axios');
const moment = require('moment')
const URI = require('urijs');
const config = require("../../../modules/config")

function deleteESIndex(index) {
  return new Promise((resolve, reject) => {
    let url = URI(config.get("elasticsearch:base"))
      .segment(index.toString().toLowerCase())
      .toString();
    axios.delete(url).then(() => {
      resolve()
    }).catch((err) => {
      if(err?.response?.status === 404) {
        return resolve()
      }
      reject()
    })
  })
}
function createESIndex(name, IDFields, callback) {
  console.info('Checking if index ' + name + ' exists');
  let url = URI(config.get("elasticsearch:base"))
    .segment(name.toString().toLowerCase())
    .toString();
  axios({
      method: 'head',
      url,
      auth: {
        username: config.get("elasticsearch:username"),
        password: config.get("elasticsearch:password"),
      },
    })
    .then(response => {
      if (response.status === 200) {
        console.info('Index ' + name + ' exist, not creating');
        return callback(false);
      } else {
        return callback(true);
      }
    })
    .catch(err => {
      if (err.response && err.response.status && err.response.status === 404) {
        console.info('Index not found, creating index ' + name);
        let mappings = {
          mappings: {
            properties: {
              lastUpdated: {
                type: 'date'
              }
            }
          }
        };
        for (let IDField of IDFields) {
          mappings.mappings.properties[IDField] = {};
          mappings.mappings.properties[IDField].type = 'text';
          mappings.mappings.properties[IDField].fields = {
            keyword: {
              type: 'keyword'
            }
          }
        }
        axios({
            method: 'put',
            url: url,
            data: mappings,
            auth: {
              username: config.get("elasticsearch:username"),
              password: config.get("elasticsearch:password"),
            },
          })
          .then(response => {
            if (response.status !== 200) {
              console.error('Something went wrong and index was not created');
              console.error(response.data);
              return callback(true);
            } else {
              console.info('Index ' + name + ' created successfully');
              return callback(false);
            }
          })
          .catch(err => {
            console.error(err);
            return callback(true);
          });
      } else {
        console.error('Error occured while creating ES index');
        console.error(err);
        return callback(true);
      }
    });
};

const agerange = {
  run: () => {
    return new Promise(async(resolve, reject) => {
      await deleteESIndex("agerange").catch(() => {
        console.log('An error occured while deleting the index, this may cause dupplicate age range');
      })
      createESIndex("agerange", ["agerange"], (err) => {
        if(err) {
          console.log("An error has occured");
          return
        }
        let url = URI(config.get("elasticsearch:base")).segment("chadstaffdirectorate").segment('_search').toString();
        let body = {
          "size": 0,
          "aggs": {
            "age_ranges": {
              range: {
                script: {
                  source: "return doc['age']"
                }, 
                ranges: [
                  {
                    from: 0,
                    to: 18,
                    key: "<18"
                  },
                  {
                    from: 18,
                    to: 19,
                    key: "18-19"
                  },
                  {
                    from: 20,
                    to: 29,
                    key: "20-29"
                  },
                  {
                    from: 30,
                    to: 39,
                    key: "30-39"
                  },
                  {
                    from: 40,
                    to: 49,
                    key: "40-49"
                  },
                  {
                    from: 50,
                    to: 59,
                    key: "50-59"
                  },
                  {
                    from: 60,
                    to: 69,
                    key: "60-69"
                  },
                  {
                    from: 70,
                    to: 1000,
                    key: ">69"
                  }
                ]
              }
            }
          }
        }
        let options = {
          url,
          method: "POST",
          auth: {
            username: config.get("elasticsearch:username"),
            password: config.get("elasticsearch:password"),
          },
          data: body
        }
        axios(options).then((response) => {
          const promises = []
          if(response.data && response.data.aggregations && response.data.aggregations.age_ranges && response.data.aggregations.age_ranges.buckets) {
            for(let bucket of response.data.aggregations.age_ranges.buckets) {
              promises.push(new Promise((resolve, reject) => {
                let body = {}
                body.agerange = bucket.key
                body.total = bucket.doc_count
                if(!body.total) {
                  body.total = 0
                }
                saveDoc(body).then(() => {
                  resolve()
                }).catch((err) => {
                  console.log(err);
                  reject()
                })
              }))
            }
          } else {
            resolve()
          }
          Promise.all(promises).then(() => {
            resolve()
          }).catch(() => {
            resolve()
          })
        }).catch((err) => {

        })
      })
    })
  }
}

function saveDoc(doc, practitioner) {
  return new Promise((resolve, reject) => {
    let url = URI(config.get("elasticsearch:base")).segment("agerange").segment('_doc').toString();
    let options = {
      url,
      method: "POST",
      auth: {
        username: config.get("elasticsearch:username"),
        password: config.get("elasticsearch:password"),
      },
      data: doc
    }
    axios(options).then(() => {
      resolve()
    }).catch((err) => {
      if (err.response && (err.response.status === 429 || err.response.statusText === 'Conflict' || err.response.status === 409)) {
        if(err.response.status === 429) {
          console.warn('ES is overloaded with too many requests, delaying for 2 seconds');
        }
        if(err.response.status === 409) {
          console.warn('Conflict occured, rerunning this request');
        }
        setTimeout(() => {
          saveDoc(doc, practitioner).then(() => {
            resolve()
          }).catch((err) => {
            console.error(err);
            reject()
          })
        }, 700)
      } else {
        let error = {}
        if (err.response && err.response.data) {
          error = {
            error: err.response.data
          }
        } else if(err.error) {
          error.error = err.error
        } else {
          error.error = err
        }
        error.url = url
        console.error(JSON.stringify(error, 0, 2));
        reject()
      }
    })
  })
}

module.exports = agerange
