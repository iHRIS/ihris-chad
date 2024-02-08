const ihrissmartrequire = require("ihrissmartrequire")
const express = require('express')
const router = express.Router()
const nconf = ihrissmartrequire('modules/config')
const fhirAxios = nconf.fhirAxios
const outcomes = ihrissmartrequire('config/operationOutcomes')

router.get("/ValueSet/:id/\\$expand", (req, res) => {
  if ( !req.user ) {
    return res.status(401).json( outcomes.NOTLOGGEDIN )
  }
  let allowed = req.user.hasPermissionByName( "read", "ValueSet", req.params.id )
  if ( !allowed ) {
    return res.status(401).json( outcomes.DENIED )
  }
  fhirAxios.expand( req.params.id, req.query ).then( (resource) => {
    // i am not sure why the $expand operation is returning valuesets that are not for the requested ID, temporarily adding this to filter them out
    if(resource && resource.expansion && resource.expansion.contains) {
      let removed = 0
      let length = resource.expansion.contains.length
      for(let index=0;index<length;index++) {
        let newIndex = index-removed
        let expansion = resource.expansion.contains[newIndex]
        if(!resource.compose.include.find((compose) => {
          return compose.system === expansion.system
        })) {
          resource.expansion.contains.splice(newIndex, 1)
          removed++
        }
      }
    }
    if ( allowed === true ) {
      return res.status(200).json(resource)
    } else {
      // Field level access to ValueSets doesn't really make sense so don't do expansions if not full access
      return res.status(401).json( outcomes.DENIED )
    }
  } ).catch( (err) => {
    /* return response from FHIR server */
    //return res.status( err.response.status ).json( err.response.data )
    /* for custom responses */
    let outcome = { ...outcomes.ERROR }
    outcome.issue[0].diagnostics = err.message
    return res.status(500).json( outcome )
  } )
} )

module.exports = router