webshot = require 'webshot'

options =
  shotSize:
    height: 1450
    width: 620
  shotOffset:
    left: 150

takeone = () ->
  webshot 'www.metservice.com/towns-cities/wellington/wellington-city', "img/metservice-wellington #{Date()}.png", options, (err) ->
    if err
      console.log "Error: #{err}"
      takeone()
    else
      console.log "#{Date()}: Created screenshot"

  setTimeout takeone, 3600000  # 1 hour

takeone()
