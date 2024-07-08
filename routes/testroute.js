const express = require('express')
const router = express.Router()
const ihrissmartrequire = require("ihrissmartrequire")
const fhirSecurity = ihrissmartrequire("modules/fhir/fhirSecurity")

router.post("/preprocess", (req, res) => {
  fhirSecurity.preProcess(req.body).then((uuid) => {
    console.log(uuid);
    return res.json({bundle: req.body, uuid})
  }).catch((err) => {
    console.error(err.message)
    return res.status(500).json({err: err.message})
  })
})

router.post("/postprocess/:uuid", (req, res) => {
  fhirSecurity.postProcess(req.body, req.params.uuid).then((results) => {
    return res.send()
  }).catch((err) => {
      console.error(err.message)
      return res.status(500).json({err: err.message})
  })
})
module.exports = router