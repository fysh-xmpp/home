express = require('express')
http = require('http')
https = require('https')
fs = require('fs')
bodyParser = require('body-parser')
path = require('path')
os = require('os')

app = express()

production = ->
  process.env.NODE_ENV == "production"

if production()
  options =
    key: fs.readFileSync('/root/certs/key.pem'),
    cert: fs.readFileSync('/root/certs/crt.pem')

app.set "views", path.join(__dirname, "views")
app.set "view engine", "toffee"
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()
app.use express.static(path.join(__dirname, "public"))

routes = require('./routes')(app, os)

app.get "/", routes.home
app.get "/register", routes.register

if production()
  http.createServer(app).listen 8080
  https.createServer(options, app).listen 8081
else
  http.createServer(app).listen 3000
