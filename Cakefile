task 'server', 'Run Server on port 3000', (opts) ->
	express = require 'express'
	web = express.createServer()
	web.configure -> web.use express.static './public'

	web.get '*', (req, res) -> res.redirect '/404.html'
	web.listen 3000

	console.log 'http://127.0.0.1:3000'


ck_compile = (name) ->
	fs = require 'fs'
	ck = require 'coffeekup'

	ck_layout = fs.readFileSync './assets/html/layout.coffee', 'utf-8'
	ck_body = fs.readFileSync "./assets/html/#{ name }.coffee", 'utf-8'

	html_body = ck.render ck_layout, body: ck.render ck_body
	fs.writeFileSync "./public/#{ name }.html", html_body, 'utf-8'

	console.log "assets/html/#{ name }.coffee -> public/#{ name }.html"

task 'html:build', 'Compile HTML Assets', (opts) ->
	ck_compile '404'


task 'css:build', 'Compile CSS Assets', (opts) ->
	proc = require 'child_process'
	proc.exec 'stylus -c -o public/css/ assets/css/'
	console.log 'assets/css/ -> public/css/'


task 'js:build', 'Compile JavaScript Assets', (opts) ->
	proc = require 'child_process'
	proc.exec 'coffee -c -o public/js/ assets/js/'
	console.log 'assets/js/ -> public/js/'


task 'run', ->
	invoke 'build'
	invoke 'server'

task 'build', ->
	invoke 'html:build'
	invoke 'css:build'
	invoke 'js:build'
