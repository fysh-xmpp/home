express = require('express')
fs = require('fs')
bodyParser = require('body-parser')
path = require('path')
os = require('os')

app = express()

app.set "views", path.join(__dirname, "views")
app.set "view engine", "toffee"
app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()
app.use express.static(path.join(__dirname, "public"))

routes = require('./routes')(app, os)

app.get "/", routes.home
app.get "/register", routes.register

app.listen(3000, "::")
