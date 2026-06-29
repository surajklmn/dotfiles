-- Input configuration

hl.config({
    input = {
        accel_profile = "flat",
	sensitivity = 0.4,
	touchpad = {
		natural_scroll = true,
		scroll_factor = 0.4,

	}

    },
})

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down",       action = "close" })
hl.gesture({ fingers = 3, direction = "up",         action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "left",       action = "float" })
