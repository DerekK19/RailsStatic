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

end
