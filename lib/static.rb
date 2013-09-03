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
					['Elements', 'elements'],
					['Photos', 'photos'],
					['Weather', 'weather']
				],
			"staging" =>
				[
					['Elements', 'elements'],
					['Weather', 'weather']
				],
			"production" =>
				[
					['Elements', 'elements'],
					['Weather', 'weather']
				]
		}
	end

end
