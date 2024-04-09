const ihrissmartrequire = require('ihrissmartrequire')
const fhirAxios = ihrissmartrequire("modules/fhir/fhirAxios");
const fhirpath = require('fhirpath')


const getLatestResourceById = ({resource, params, ignorefhirpath, total = 1}) => {
  return new Promise((resolve, reject) => {
    params._count = 200
    let sortedresources = []
    findResources().then(() => {
      sortedresources.sort((a,b) => parseInt(b.resource.id)-parseInt(a.resource.id))
      return resolve({
        entry: sortedresources
      })
    }).catch(() => {
      return reject()
    })
    
    function findResources(newurlparams) {
      return new Promise((resolve, reject) => {
        let searchParams = params
        if(newurlparams) {
          searchParams = newurlparams
        }
        fhirAxios.search(resource, searchParams).then((response) => {
          if(response && response.entry && response.entry.length) {
            for(let entry of response.entry) {
              if(ignorefhirpath && fhirpath.evaluate(entry.resource, ignorefhirpath)) {
                continue
              }
              if(sortedresources.length < total) {
                sortedresources.push(entry)
              } else {
                if(parseInt(sortedresources[0].resource.id) < parseInt(entry.resource.id)) {
                  sortedresources.shift()
                  sortedresources.push(entry)
                }
              }
              sortedresources.sort((a,b) => parseInt(a.resource.id)-parseInt(b.resource.id))
            }
            let next = response.link && response.link.find((link) => {
              return link.relation === "next"
            })
            if(next) {
              newurlparams = {}
              let newparams = next.url.split("?")[1]
              newparams = newparams.split("&")
              for(let newparam of newparams) {
                newparam = newparam.split("=")
                newurlparams[newparam[0]] = newparam[1]
              }
              findResources(newurlparams).then(() => {
                return resolve()
              }).catch(() => {
                return reject()
              })
            } else {
              return resolve()
            }
          } else {
            return resolve()
          }
        }).catch((err) => {
          console.log(err);
          return reject()
        })
      })
    }
  })
}

module.exports = {
  getLatestResourceById
}