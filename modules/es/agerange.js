"use strict";
const axios = require('axios');
const async = require("async")
const URI = require('urijs');
const config = require("../../../modules/config")

function deleteESIndex(index) {
  return new Promise((resolve, reject) => {
    let url = URI(config.get("elasticsearch:base"))
      .segment(index.toString().toLowerCase())
      .toString();
      axios({
        method: 'DELETE',
        url,
        auth: {
          username: config.get("elasticsearch:username"),
          password: config.get("elasticsearch:password"),
        },
      }).then(() => {
      resolve()
    }).catch((err) => {
      if(err?.response?.status === 404) {
        return resolve()
      }
      reject()
    })
  })
}
function createESIndex(name, IDFields) {
  return new Promise((resolve, reject) => {
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
          return resolve();
        } else {
          return reject();
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
                return reject();
              } else {
                console.info('Index ' + name + ' created successfully');
                return resolve();
              }
            })
            .catch(err => {
              console.error(err);
              return reject();
            });
        } else {
          console.error('Error occured while creating ES index');
          console.error(err);
          return reject();
        }
      });
  })
};

const agerange = {
  run: () => {
    return new Promise((resolve, reject) => {
      Promise.all([bygender(), bySpecialty()]).then(() => {
        resolve()
      }).catch(() => {
        reject()
      })
      function bygender() {
        return new Promise(async(resolve, reject) => {
          await deleteESIndex("agerangegender").catch(() => {
            console.log('An error occured while deleting the index, this may cause dupplicate age range');
          })
          createESIndex("agerangegender", ["agerangegender"]).then(() => {
            let url = URI(config.get("elasticsearch:base")).segment("chadstaffdirectorate").segment('_search').toString();
            let bulk = []
            let gender = ["male", "female"]
            const promises = []
            for(let gnd of gender) {
              promises.push(new Promise((resolve, reject) => {
                let body = {
                  size: 0,
                  query: {
                    bool: {
                      must: [{
                        terms: {
                          "gender.keyword": [gnd]
                        }
                      }],
                      must_not: []
                    }
                  },
                  aggs: {
                    age_ranges: {
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
                      let body = {}
                      body.agerange = bucket.key
                      body.gender = gnd
                      body.total = bucket.doc_count
                      if(!body.total) {
                        body.total = 0
                      }
                      bulk.push(body)
                    }
                    resolve()
                  } else {
                    resolve()
                  }
                  Promise.all(promises).then(() => {
                    const bulkBody = bulk.flatMap(doc => [
                      { index: { _index: 'agerangegender' } },
                      doc
                    ]);
                    let bulkRequestBody = bulkBody.map(doc => JSON.stringify(doc)).join('\n') + '\n';
                    bulkSave(bulkRequestBody).then(() => {
                      resolve()
                    }).catch(() => {
                      reject()
                    })
                  }).catch(() => {
                    resolve()
                  })
                }).catch((err) => {
                  reject()
                })
              }))
            }
            Promise.all(promises).then(() => {
              resolve()
            }).catch(() => {
              reject()
            })
          }).catch(() => {
            reject()
          })
        })
      }

      function bySpecialty() {
        return new Promise(async(resolve, reject) => {
          await deleteESIndex("agerangespecialty").catch(() => {
            console.log('An error occured while deleting the index, this may cause dupplicate age range');
          })
          createESIndex("agerangespecialty", ["agerangespecialty"]).then(async() => {
            let url = URI(config.get("elasticsearch:base")).segment("chadstaffdirectorate").segment('_search').toString();
            let specialties = await getDistinct("chadstaffdirectorate", "specialty", true)
            let bulk = []
            const promises = []
            for(let specialty of specialties) {
              promises.push(new Promise((resolve, reject) => {
                let body = {
                  size: 0,
                  query: {
                    bool: {
                      must: [{
                        terms: {
                          "specialty.keyword": [specialty.key.value]
                        }
                      }],
                      must_not: []
                    }
                  },
                  aggs: {
                    age_ranges: {
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
                  if(response.data && response.data.aggregations && response.data.aggregations.age_ranges && response.data.aggregations.age_ranges.buckets) {
                    for(let bucket of response.data.aggregations.age_ranges.buckets) {
                      let body = {}
                      body.agerange = bucket.key
                      body.specialty = specialty.key.value
                      body.total = bucket.doc_count
                      if(!body.total) {
                        body.total = 0
                      }
                      bulk.push(body)
                    }
                    resolve()
                  } else {
                    resolve()
                  }
                }).catch((err) => {
                  reject()
                })
              }))
            }
            Promise.all(promises).then(() => {
              const bulkBody = bulk.flatMap(doc => [
                { index: { _index: 'agerangespecialty' } },
                doc
              ]);
              let bulkRequestBody = bulkBody.map(doc => JSON.stringify(doc)).join('\n') + '\n';
              bulkSave(bulkRequestBody).then(() => {
                resolve()
              }).catch(() => {
                reject()
              })
            }).catch(() => {
              reject()
            })
          }).catch(() => {
            reject()
          })
        })
      }
    })
  }
}

function getDistinct(indexName, field, hasKeyword) {
  return new Promise((resolve, reject) => {
    if(hasKeyword) {
      field = `${field}.keyword`
    }
    let body = {
      size: 0,
      aggs: {
        uniq_values: {
          composite: {
            size: 10000,
            sources: [
              { value: { terms: { field: field } } }
            ]
          }
        }
      }
    }
    let url = URI(config.get('elasticsearch:base')).segment(indexName).segment('_search').toString()
    let next = true
    let buckets = []
    async.whilst(
      callback1 => {
        return callback1(null, next !== false);
      },
      callback => {
        let options = {
          method: 'GET',
          url,
          auth: {
            username: config.get('elasticsearch:username'),
            password: config.get('elasticsearch:password'),
          },
          data: body
        };
        next = false;
        axios(options).then((response) => {
          buckets = buckets.concat(response.data.aggregations.uniq_values.buckets)
          if(response.data.aggregations.uniq_values.buckets.length > 0) {
            body.aggs.uniq_values.composite.after = {}
            body.aggs.uniq_values.composite.after.value = response.data.aggregations.uniq_values.after_key.value
            next = true
          }
          return callback(null, next);
        }).catch((err) => {
          console.error(err.message);
          return reject()
        })
      }, () => {
        return resolve(buckets)
      }
    );
  })            
}

function bulkSave(bulkRequestBody) {
  return new Promise((resolve, reject) => {
    let url = URI(config.get("elasticsearch:base")).segment("_bulk").toString();
    let options = {
      url,
      method: "post",
      auth: {
        username: config.get("elasticsearch:username"),
        password: config.get("elasticsearch:password"),
      },
      headers: { 'Content-Type': 'application/x-ndjson' },
      data: bulkRequestBody
    }
    axios(options).then(() => {
      resolve()
    }).catch((err) => {
      console.log(err);
      console.error('Error during bulk operation:', err.response ? err.response.data : err.message);
      if (err.response && (err.response.status === 429 || err.response.statusText === 'Conflict' || err.response.status === 409)) {
        if(err.response.status === 429) {
          console.warn('ES is overloaded with too many requests, delaying for 2 seconds');
        }
        if(err.response.status === 409) {
          console.warn('Conflict occured, rerunning this request');
        }
        setTimeout(() => {
          bulkSave(bulkRequestBody).then(() => {
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
    });
  })
}
function saveDoc(doc, indexName) {
  return new Promise((resolve, reject) => {
    let url = URI(config.get("elasticsearch:base")).segment(indexName).segment('_doc').toString();
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
          saveDoc(doc, indexName).then(() => {
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
