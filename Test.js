const https = require('https')
const options = {
  hostname: 'www.youtube.com/watch?v=c9N3SmXZqlk',
  port: 80,
  path: '/',
  method: 'GET'
}

const req = https.request(options, res => {
  console.log(`statusCode: ${res.statusCode}`)

  res.on('data', d => {
    process.stdout.write(d)
  })
  
})

req.on('error', error => {
  console.error(error)
})

req.end()