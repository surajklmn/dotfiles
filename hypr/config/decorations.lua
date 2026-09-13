-- Window decorations: square geometry, flat unblurred surfaces, 2px gradient borders

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 6,
        border_size = 2,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = THEME_BORDER_ACTIVE,
            inactive_border = THEME_BORDER_INACTIVE,
        },
    },
    group = {
        col = {
            border_active = THEME_BORDER_ACTIVE,
            border_inactive = THEME_BORDER_INACTIVE,
        },
        groupbar = {
            font_size = 12,
            font_family = "monospace",
            font_weight_active = "ultraheavy",
            font_weight_inactive = "normal",
            indicator_height = 1,
            indicator_gap = 5,
            height = 22,
            gaps_in = 5,
            gaps_out = 0,
            text_color = "rgb(ffffff)",
            text_color_inactive = "rgba(ffffff90)",
            col = {
                active = "rgba(00000040)",
                inactive = "rgba(00000020)",
            },
            gradients = true,
            gradient_rounding = 0,
            gradient_round_only_edges = false,
        },
    },
    decoration = {
        rounding = 0,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
        },
    },
})
