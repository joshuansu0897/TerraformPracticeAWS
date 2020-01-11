const http = require('http')
const params = {
  host: process.env.ELB_ENDPOINT
}

exports.handler = (event, context, callback) => {

  let req = http.request(params, (res) => {
    console.log(' ---- DONE ---- ')
    console.log('STATUS CODE: ' + res.statusCode)
    console.log(' ---- DONE ---- ')
  })
  req.end()

  callback(null, 'great success')
}