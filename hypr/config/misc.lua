hl.config({
    dwindle = {
        preserve_split = true,
        force_split = 2,
    },
    scrolling = {
        column_width = 0.49,
    },
    master = {
        new_status = "master",
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
    misc = {
        col = {
            splash = THEME_ACCENT,
        },
        middle_click_paste = false,
        enable_swallow = true,
        swallow_regex = "(kitty|ghostty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
        vrr = 3,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_scale_notification = true,
        focus_on_activate = true,
        anr_missed_pings = 3,
        on_focus_under_fullscreen = 1,
        initial_workspace_tracking = 0,
        allow_session_lock_restore = true,
    },
    cursor = {
        hide_on_key_press = true,
        warp_on_change_workspace = 1,
    },
    binds = {
        hide_special_on_workspace_change = true,
    },
    render = {
        direct_scanout = 2,
    },
    xwayland = {
        force_zero_scaling = true,
    },
})
