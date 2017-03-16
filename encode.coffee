GIFEncoder = require 'gifencoder'
fs = require 'fs'
pngFileStream = require 'png-file-stream'

encoder = new GIFEncoder 1450, 1150

pngFileStream './img/2017-03-16*.png'
	.pipe encoder.createWriteStream
		repeat: -1
		delay: 500
		quality: 10
	.pipe fs.createWriteStream 'test.gif'
