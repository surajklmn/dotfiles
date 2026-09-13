-- Minimal animations: no popin, no bouncing, no window sliding, instant workspace switching

hl.curve("fast", { type = "bezier", points = { { 0.1, 1 }, { 0.1, 1 } } })

-- Ultra-fast subtle fade (set enabled = false to disable animations completely)
hl.animation({ leaf = "global",     enabled = true,  speed = 1.5, bezier = "fast" })
hl.animation({ leaf = "windows",    enabled = false })
hl.animation({ leaf = "fadeIn",     enabled = true,  speed = 1.5, bezier = "fast" })
hl.animation({ leaf = "fadeOut",    enabled = true,  speed = 1.5, bezier = "fast" })
hl.animation({ leaf = "fade",       enabled = true,  speed = 1.5, bezier = "fast" })
hl.animation({ leaf = "layers",     enabled = false })
hl.animation({ leaf = "layersIn",   enabled = true,  speed = 1.5, bezier = "fast", style = "fade" })
hl.animation({ leaf = "layersOut",  enabled = true,  speed = 1.5, bezier = "fast", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = false })
hl.animation({ leaf = "border",     enabled = false })
