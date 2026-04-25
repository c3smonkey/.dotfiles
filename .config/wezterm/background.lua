local background = {}

function background.setup(config)

	-- config.window_background_image = require("functions.background")
	config.window_background_image_hsb = {
		brightness = 0.01,
		hue = 1.0,
		saturation = 1.0,
	}
	
	-- ===== TRANSPARENZ EINSTELLUNGEN =====
	-- Passe diese Werte an um die WezTerm Fenster-Transparenz zu steuern
	-- Niedrigere Opacity = transparenter, Höherer Blur = weicherer Hintergrund
	
	-- AKTUELL: Gute Balance - lesbar mit schönem layered effect
	config.window_background_opacity = 0.95  -- 95% Deckkraft
	config.macos_window_background_blur = 10 -- Mittlerer Blur
	
	-- OPTION: Maximale Transparenz (durchsichtiger, weniger lesbar)
	-- Aktivieren: Entferne -- davor, kommentiere "AKTUELL" oben aus
	-- config.window_background_opacity = 0.90  -- 90% Deckkraft
	-- config.macos_window_background_blur = 1  -- Minimaler Blur
	
	-- OPTION: Minimale Transparenz (sehr lesbar, subtiler Effekt)
	-- Aktivieren: Entferne -- davor, kommentiere "AKTUELL" oben aus
	-- config.window_background_opacity = 0.97  -- 97% Deckkraft
	-- config.macos_window_background_blur = 15 -- Starker Blur
	
	-- OPTION: Keine Transparenz (komplett solid, maximale Lesbarkeit)
	-- Aktivieren: Entferne -- davor, kommentiere "AKTUELL" oben aus
	-- config.window_background_opacity = 1.0   -- 100% Deckkraft (keine Transparenz)
	-- config.macos_window_background_blur = 0  -- Kein Blur

end

return background
