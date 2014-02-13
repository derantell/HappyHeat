
express = require 'express'
routes = require './routes'
team = require './routes/team'
http = require 'http'
path = require 'path'

app = express()

port = process.env.PORT or 1337 

# all environments
app.set 'port', port
app.set 'views', path.join __dirname, 'views'
app.set 'view engine', 'jade'
app.use express.favicon()
app.use express.logger 'dev'
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router
app.use require('stylus').middleware path.join __dirname, 'public'
app.use express.static path.join __dirname, 'public'

# development only
app.use express.errorHandler() if app.get('env') is 'development'

app.get '/',      routes.index
app.get '/:team', team.happiness

http
    .createServer app 
    .listen port, ->
        console.log "Express server listening on port #{port}"
