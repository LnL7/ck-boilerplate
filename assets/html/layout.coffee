doctype 5


# paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/
comment '[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"><![endif]'
comment '[if lt IE 7]><html class="no-js lt-ie9 lt-ie8" lang="en"><![endif]'
comment '[if lt IE 8]><html class="no-js lt-ie9" lang="en"><![endif]'
comment '[if gt IE 8]><!--> <html class="no-js" lang="en"><!--<![endif]'



head ->
	meta charset:'utf-8'

	# Stylesheets at the top for fast page rendering:
	# http://developer.yahoo.com/performance/rules.html#css_top
	link rel:'stylesheet', href:'css/layout.css', charset:'utf-8'
	link rel:'stylesheet', href:'css/style.css', charset:'utf-8'

	# All JavaScript at the bottom, except this Modernizr build.
	# Modernizr enables HTML5 elements & feature detects for optimal performance.
	# Create your own custom Modernizr build: www.modernizr.com/download/
	script src:'js/vendor/modernizr-2.5.3.min.js', charset:'utf-8'

	# Use the .htaccess and remove these lines to avoid edge case issues.
	# More info: h5bp.com/i/378
	meta 'http-equiv':'X-UA-Compatible', content:'IE=edge,chrome=1'

	# Mobile viewport optimized: h5bp.com/viewport
	meta name:'viewport', content:'width=device-width'

	# More ideas for your <head> here: h5bp.com/d/head-Tips


	# Place favicon.ico and apple-touch-icon.png in the root directory:
	# mathiasbynens.be/notes/touch-icons

	##
	# Information
	##
	meta name:'description', content: @description || ''
	title -> @title || ''



body ->

	# Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
	# chromium.org/developers/how-tos/chrome-frame-getting-started
	comment '[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]'

	##
	# Content Start
	div id:'container', -> @body || ''
	# Content End
	##

	# JavaScript at the bottom for fast page loading:
	# http://developer.yahoo.com/performance/rules.html#js_bottom

	# Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline
	script src:'//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js', charset:'utf-8'
	coffeescript -> window.jQuery || document.write '<script src="js/vendor/jquery-1.7.2.min.js"><\/script>'

	# scripts concatenated and minified via build script
	script src:'js/plugins.js', charset:'utf-8'
	script src:'js/main.js', charset:'utf-8'

	# Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID.
	# mathiasbynens.be/notes/async-analytics-snippet
	script -> "var _gaq=[['_setAccount','" + (@analytics_id || "UA-XXXXX-X") + "'],['_trackPageview']];(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';s.parentNode.insertBefore(g,s)}(document,'script'));"


text '</html>'
