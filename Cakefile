proc = require 'child_process'



task 'server', 'Run Server on port 3000', (opts) ->
	express = require 'express'
	web = express.createServer()
	web.configure -> web.use express.static './public'

	web.get '*', (req, res) -> res.redirect '/404.html'
	web.listen 3000

	console.log 'http://127.0.0.1:3000'


task 'html:build', 'Compile HTML Assets', (opts) ->
	fs = require 'fs'
	ck = require 'coffeekup'

	ck_layout = fs.readFileSync './assets/html/layout.coffee', 'utf-8'
	ck_404 = fs.readFileSync './assets/html/404.coffee', 'utf-8'
	ck_index = fs.readFileSync './assets/html/index.coffee', 'utf-8'

	html_404 = ck.render ck_layout, body: ck.render ck_404
	html_index = ck.render ck_layout, body: ck.render ck_index

	fs.writeFileSync './public/404.html', html_404, 'utf-8'
	fs.writeFileSync './public/index.html', html_index, 'utf-8'

	console.log 'assets/html/ -> public/'


task 'css:build', 'Compile CSS Assets', (opts) ->
	proc.exec 'stylus -c -o public/css/ assets/css/'
	console.log 'assets/css/ -> public/css/'


task 'js:build', 'Compile JavaScript Assets', (opts) ->
	proc.exec 'coffee -c -o public/js/ assets/js/'
	console.log 'assets/js/ -> public/js/'


task 'start', ->
	invoke 'build'
	invoke 'server'

task 'build', ->
	invoke 'html:build'
	invoke 'css:build'
	invoke 'js:build'
