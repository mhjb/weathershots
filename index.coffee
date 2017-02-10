http = require 'http'
finalhandler = require 'finalhandler'
serveStatic = require 'serve-static'
serveIndex = require 'serve-index'
webshot = require 'webshot'
moment = require 'moment'

serve = serveStatic './img'
index = serveIndex './img', { 'icons': true }

server = http.createServer (req, res) ->
  done = finalhandler req, res
  serve req, res, (err) ->
    if err
      done (err)
    else
      index req, res, done

server.listen 3000, () ->
  console.log "Starting web server"


options =
  shotSize:
    height: 1450
    width: 1150

url = 'www.metservice.com/towns-cities/wellington/wellington-city'

takeone = () ->
  webshot url, "img/#{moment().format()}.png", options, (err) ->
    if err
      console.log "Error: #{err}"
      takeone()
    else
      console.log "#{moment().format()}: Created screenshot of #{url}"

  setTimeout takeone, 3600000  # 1 hour

takeone()
