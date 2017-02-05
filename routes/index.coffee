module.exports = (app, os) ->

  routes = {}

  routes.home = (req, res) ->
    res.render("home", {layout: "views/layout.toffee", uptime: os.uptime()})

  routes.register = (req, res) ->
    res.render("register", {layout: "views/layout.toffee", uptime: os.uptime()})

  routes
