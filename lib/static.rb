require "static/version"

module Static

	def Static.machine_menu_items
		[
			['rails', 'rails', ''],
			['macrails', 'macrails', ''],
			['stagemacrails', 'devmacrails', ''],
			['devmacrails', 'devmacrails:8000', 'dk']
		]
	end

	def Static.navbar_items
		{
			"development" =>
				[
					['Elements', 'dkelements', 'elements'],
					['Photos', 'dkphotos', 'photos'],
					['Weather', 'dkweather', 'weather']
				],
			"staging" =>
				[
					['Elements', 'elements', 'elements'],
					['Weather', 'weather', 'weather']
				],
			"production" =>
				[
					['Elements', 'elements', 'elements'],
					['Weather', 'weather', 'weather']
				]
		}
	end

	def Static.left_menu(url_root, left_menu_items)
		rValue = '<ul>'
		left_menu_items.each {|x| rValue += '<li><a href="' + url_root + (x[1]) + '">' + (x[0]) + '</a></li>' }
		rValue += '</ul>'
	end
	
	def Static.header(right_text, right_link, current_header, current_navbar)
		site=''
		n = Static::navbar_items[Rails::env]
		n.each {|x| site += x[0] == current_navbar ? x[2] : ''}
		rValue ='
	  <div class="header">
	    <div class="left-header"><image class="ruby-icon" src="/static/images/rails.gif"></image></div>
	    <div class="machine-header"><ul>'
	    Static::machine_menu_items.each {|x| rValue += '<li><a href="http:/' + x[1] + '/' + x[2] + site + '">' + x[0] + '</a></li>' }
		rValue += '
	    </ul></div>
	    <div class="centre-header"><h1>' + current_header + '</h1></div>
	    <div class="right-header"><a href="' + right_link + '">' + right_text + '</a></div>
	  </div>
	  <div class="tab-header">
		<ul id="navbar">'

		n.each {|x| rValue += x[0] == current_navbar ?
			('<li><a class="current">' + x[0] + '</a></li>') :
			ENV['SERVER_PORT'] == '80' ?
			('<li><a href="http://' + ENV['SERVER_NAME'] + '/' + x[1] + '">' + (x[0]) + '</a></li>') :
			('<li><a href="http://' + ENV['SERVER_NAME'] + ':' + ENV['SERVER_PORT'] + '/' + x[1] + '">' + (x[0]) + '</a></li>') }
		rValue += '
		</ul>
	  </div>
	'
	end

	def Static.footer(rails_link)
		'
		  <div class="footer">
			<div class="left-footer">Copyright &copy;' + Time.now.year.to_s + ' Derek Knight</div>
			<div class="right-footer">Powered by Ruby on ' + rails_link + ' (' + Rails::env + '). [Ruby ' + RUBY_VERSION + ', Rails ' + Rails::VERSION::STRING + ']</div>
		  </div>
		'
	end

end
