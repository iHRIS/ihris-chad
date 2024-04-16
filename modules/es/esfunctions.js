const moment = require("moment")

const index = {
  age: (fields) => {
    return new Promise((resolve, reject) => {
      let age = moment().diff(fields.dob, 'years');
      resolve(age)
    })
  },
  retirementDate: (fields) => {
    return new Promise((resolve, reject) => {
      if(!fields.dob) {
        return resolve()
      }
      let date = moment(fields.dob).add(60, "years").format("YYYY-MM-DD")
      resolve(date)
    })
  }
}

module.exports = index
