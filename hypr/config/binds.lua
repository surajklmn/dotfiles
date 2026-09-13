-- Hyprland + Noctalia Keybindings Configuration
-- Applications, Window Management, Workspaces, and System Controls

local mainMod = "SUPER"
local noctCall = "noctalia msg "
local launchPrefix = "uwsm app -- " -- UWSM application wrapper

----------------------------------------------------
---- UNIVERSAL CLIPBOARD ---------------------------
----------------------------------------------------
local function send_shortcut_once(mods, key)
    return function()
        hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
        hl.timer(function()
            hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
        end, { timeout = 50, type = "oneshot" })
    end
end

local function active_window_is_terminal()
    local window = hl.get_active_window()
    if not window then return false end
    local class = (window.class or ""):lower()
    return class:match("kitty") ~= nil or class:match("alacritty") ~= nil or class:match("ghostty") ~= nil or class:match("terminal") ~= nil or class:match("foot") ~= nil
end

local function universal_clipboard_shortcut(default_mods, default_key, terminal_mods, terminal_key)
    return function()
        if active_window_is_terminal() then
            send_shortcut_once(terminal_mods, terminal_key)()
        else
            send_shortcut_once(default_mods, default_key)()
        end
    end
end

-- Universal copy, paste, cut
hl.bind(mainMod .. " + C", universal_clipboard_shortcut("CTRL", "C", "CTRL", "Insert"), { description = "Universal copy" })
hl.bind(mainMod .. " + V", universal_clipboard_shortcut("CTRL", "V", "SHIFT", "Insert"), { description = "Universal paste" })
hl.bind(mainMod .. " + X", send_shortcut_once("CTRL", "X"), { description = "Universal cut" })
hl.bind(mainMod .. " + CONTROL + V", hl.dsp.exec_cmd(noctCall .. "panel-toggle clipboard"), { description = "Clipboard manager" })

----------------------------------------------------
---- WINDOW MANAGEMENT -----------------------------
----------------------------------------------------

-- Close window
hl.bind(mainMod .. " + W", hl.dsp.window.close(), { description = "Close window" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close window" })
hl.bind("CONTROL + ALT + Delete", hl.dsp.exec_cmd("~/.local/bin/hypr-window-close-all"), { description = "Close all windows" })

-- Float / pseudo / fullscreen / pop / layout
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { description = "Toggle window split" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { description = "Pseudo window" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window floating/tiling" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { description = "Full screen" })
hl.bind(mainMod .. " + CONTROL + F", hl.dsp.exec_cmd("if [ \"$(hyprctl activewindow -j | jq -r '.fullscreenClient // 0')\" = \"2\" ]; then hyprctl dispatch fullscreenstate 0 0; else hyprctl dispatch fullscreenstate 0 2; fi"), { description = "Tiled full screen" })
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "maximized" }), { description = "Full width" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("~/.local/bin/hypr-window-pop"), { description = "Pop window out (float & pin toggle)" })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("~/.local/bin/hypr-workspace-layout-toggle"), { description = "Toggle workspace layout" })

-- Change focus
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "l" }), { description = "Focus on left window" })
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }), { description = "Focus on right window" })
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "u" }), { description = "Focus on above window" })
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "d" }), { description = "Focus on below window" })

-- Cycle windows
hl.bind("ALT + Tab", hl.dsp.window.cycle_next(), { description = "Focus on next window" })
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }), { description = "Focus on previous window" })
hl.bind("ALT + Tab", hl.dsp.window.bring_to_top(), { description = "Reveal active window on top" })
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.bring_to_top(), { description = "Reveal active window on top" })

-- Monitors
hl.bind("CONTROL + ALT + Tab", hl.dsp.focus({ monitor = "+1" }), { description = "Focus on next monitor" })
hl.bind("CONTROL + ALT + SHIFT + Tab", hl.dsp.focus({ monitor = "-1" }), { description = "Focus on previous monitor" })

-- Swap window
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.swap({ direction = "u" }), { description = "Swap window up" })
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.swap({ direction = "r" }), { description = "Swap window to the right" })
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.swap({ direction = "l" }), { description = "Swap window to the left" })
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.swap({ direction = "d" }), { description = "Swap window down" })

-- Move workspace across monitors
hl.bind(mainMod .. " + SHIFT + ALT + Left", hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to left monitor" })
hl.bind(mainMod .. " + SHIFT + ALT + Right", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to right monitor" })
hl.bind(mainMod .. " + SHIFT + ALT + Up", hl.dsp.workspace.move({ monitor = "u" }), { description = "Move workspace to up monitor" })
hl.bind(mainMod .. " + SHIFT + ALT + Down", hl.dsp.workspace.move({ monitor = "d" }), { description = "Move workspace to down monitor" })

-- Resize window (Minus/Equal layout-independent keys)
hl.bind(mainMod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left", repeating = true })
hl.bind(mainMod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Shrink window left", repeating = true })
hl.bind(mainMod .. " + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { description = "Shrink window up", repeating = true })
hl.bind(mainMod .. " + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { description = "Expand window down", repeating = true })
hl.bind(mainMod .. " + ALT + code:20", hl.dsp.window.resize({ x = -25, y = 0, relative = true }), { description = "Expand window left a little", repeating = true })
hl.bind(mainMod .. " + ALT + code:21", hl.dsp.window.resize({ x = 25, y = 0, relative = true }), { description = "Shrink window left a little", repeating = true })
hl.bind(mainMod .. " + SHIFT + ALT + code:20", hl.dsp.window.resize({ x = 0, y = -25, relative = true }), { description = "Shrink window up a little", repeating = true })
hl.bind(mainMod .. " + SHIFT + ALT + code:21", hl.dsp.window.resize({ x = 0, y = 25, relative = true }), { description = "Expand window down a little", repeating = true })
hl.bind(mainMod .. " + CONTROL + code:20", hl.dsp.window.resize({ x = -300, y = 0, relative = true }), { description = "Expand window left a lot", repeating = true })
hl.bind(mainMod .. " + CONTROL + code:21", hl.dsp.window.resize({ x = 300, y = 0, relative = true }), { description = "Shrink window left a lot", repeating = true })
hl.bind(mainMod .. " + CONTROL + SHIFT + code:20", hl.dsp.window.resize({ x = 0, y = -300, relative = true }), { description = "Shrink window up a lot", repeating = true })
hl.bind(mainMod .. " + CONTROL + SHIFT + code:21", hl.dsp.window.resize({ x = 0, y = 300, relative = true }), { description = "Expand window down a lot", repeating = true })

-- Move & Resize with mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Scroll active workspace forward" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Scroll active workspace backward" })

-- Window groups
hl.bind(mainMod .. " + G", hl.dsp.group.toggle(), { description = "Toggle window grouping" })
hl.bind(mainMod .. " + ALT + G", hl.dsp.window.move({ out_of_group = true }), { description = "Move active window out of group" })
hl.bind(mainMod .. " + ALT + Left", hl.dsp.window.move({ into_group = "l" }), { description = "Move window to group on left" })
hl.bind(mainMod .. " + ALT + Right", hl.dsp.window.move({ into_group = "r" }), { description = "Move window to group on right" })
hl.bind(mainMod .. " + ALT + Up", hl.dsp.window.move({ into_group = "u" }), { description = "Move window to group on top" })
hl.bind(mainMod .. " + ALT + Down", hl.dsp.window.move({ into_group = "d" }), { description = "Move window to group on bottom" })
hl.bind(mainMod .. " + ALT + Tab", hl.dsp.group.next(), { description = "Next window in group" })
hl.bind(mainMod .. " + ALT + SHIFT + Tab", hl.dsp.group.prev(), { description = "Previous window in group" })
hl.bind(mainMod .. " + CONTROL + Left", hl.dsp.group.prev(), { description = "Move grouped window focus left" })
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.group.next(), { description = "Move grouped window focus right" })
hl.bind(mainMod .. " + ALT + mouse_down", hl.dsp.group.next(), { description = "Next window in group" })
hl.bind(mainMod .. " + ALT + mouse_up", hl.dsp.group.prev(), { description = "Previous window in group" })
for index = 1, 5 do
    hl.bind(mainMod .. " + ALT + code:" .. tostring(index + 9), hl.dsp.group.active({ index = index }), { description = "Switch to group window " .. index })
end

-- Monitor scaling presets (1 / 1.25 / 1.6 / 2 / 3 / 4)
hl.bind(mainMod .. " + SLASH", hl.dsp.exec_cmd("~/.local/bin/hypr-monitor-scaling up"), { description = "Monitor scaling up" })
hl.bind(mainMod .. " + ALT + SLASH", hl.dsp.exec_cmd("~/.local/bin/hypr-monitor-scaling down"), { description = "Monitor scaling down" })

-- Zoom
local function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor") or 1.0
    hl.config({ cursor = { zoom_factor = zoomvalue + value } })
end
hl.bind(mainMod .. " + CONTROL + Z", function() zoomfunction(1) end, { description = "Zoom in" })
hl.bind(mainMod .. " + CONTROL + ALT + Z", function() hl.config({ cursor = { zoom_factor = 1.0 } }) end, { description = "Reset zoom" })

----------------------------------------------------
---- APPLICATION LAUNCHING -------------------------
----------------------------------------------------

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(launchPrefix .. TERMINAL), { description = "Terminal" })
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(launchPrefix .. BROWSER), { description = "Browser" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER), { description = "File manager" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(launchPrefix .. FILE_MANAGER), { description = "File manager (user alias)" })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd(launchPrefix .. BROWSER), { description = "Browser" })
hl.bind(mainMod .. " + SHIFT + ALT + B", hl.dsp.exec_cmd(launchPrefix .. BROWSER .. " --private-window"), { description = "Browser (private)" })
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd(launchPrefix .. EDITOR), { description = "Editor" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd(launchPrefix .. BROWSER .. " --new-window https://music.youtube.com"), { description = "Music" })
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd(launchPrefix .. BROWSER .. " --new-window https://youtube.com/"), { description = "YouTube" })
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd(launchPrefix .. BROWSER .. " --new-window https://x.com/"), { description = "X" })

----------------------------------------------------
---- MENUS & UTILITIES -----------------------------
----------------------------------------------------

-- Menus
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"), { description = "Launcher menu" })
hl.bind(mainMod .. " + ALT + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher"), { description = "Apps menu" })
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { description = "System menu" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { locked = true, description = "Power menu" })
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(TERMINAL .. " -e less ~/.config/hypr/keybindings.txt"), { description = "Keybindings cheat sheet" })

-- Toggles
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.exec_cmd(noctCall .. "bar-toggle"), { description = "Toggle top bar" })
hl.bind(mainMod .. " + CONTROL + Space", hl.dsp.exec_cmd(noctCall .. "panel-toggle wallpaper"), { description = "Background switcher" })
hl.bind(mainMod .. " + CONTROL + SHIFT + Space", hl.dsp.exec_cmd(noctCall .. "theme-mode-toggle"), { description = "Theme toggle (dark/light)" })
hl.bind(mainMod .. " + BackSpace", hl.dsp.exec_cmd("~/.local/bin/hypr-window-opacity-toggle"), { description = "Toggle window opacity" })
hl.bind(mainMod .. " + SHIFT + BackSpace", hl.dsp.exec_cmd("~/.local/bin/hypr-gaps-toggle"), { description = "Toggle window gaps" })

-- Notifications
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(noctCall .. "notification-clear-active"), { description = "Dismiss last notification" })
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.exec_cmd(noctCall .. "notification-clear-history"), { description = "Dismiss all notifications" })
hl.bind(mainMod .. " + CONTROL + comma", hl.dsp.exec_cmd(noctCall .. "notification-dnd-toggle"), { description = "Toggle silencing notifications" })
hl.bind(mainMod .. " + ALT + comma", hl.dsp.exec_cmd(noctCall .. "notification-invoke-latest"), { description = "Invoke last notification" })

-- Idle & Nightlight
hl.bind(mainMod .. " + CONTROL + I", hl.dsp.exec_cmd(noctCall .. "caffeine-toggle"), { description = "Toggle locking on idle (caffeine)" })
hl.bind(mainMod .. " + CONTROL + N", hl.dsp.exec_cmd(noctCall .. "nightlight-toggle"), { description = "Toggle nightlight" })

-- Notices
hl.bind(mainMod .. " + CONTROL + ALT + T", hl.dsp.exec_cmd("notify-send 'Time' \"$(date '+%A %d %B %H:%M')\""), { description = "Show time" })
hl.bind(mainMod .. " + CONTROL + ALT + B", hl.dsp.exec_cmd("notify-send 'Battery' \"$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null || cat /sys/class/power_supply/BAT1/capacity 2>/dev/null)%\""), { description = "Show battery remaining" })

-- Screenshots & Capture
hl.bind("Print", hl.dsp.exec_cmd(noctCall .. "screenshot-fullscreen"), { description = "Screenshot fullscreen" })
hl.bind("ALT + Print", hl.dsp.exec_cmd(noctCall .. "screenshot-region"), { description = "Screenshot region" })
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprpicker -a -n"), { description = "Color picker" })

-- System panels
hl.bind(mainMod .. " + CONTROL + A", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center audio"), { description = "Audio panel" })
hl.bind(mainMod .. " + CONTROL + B", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center bluetooth"), { description = "Bluetooth panel" })
hl.bind(mainMod .. " + CONTROL + W", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center network"), { description = "Network panel" })
hl.bind(mainMod .. " + CONTROL + D", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center display"), { description = "Display panel" })
hl.bind(mainMod .. " + CONTROL + P", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { description = "Power panel" })
hl.bind(mainMod .. " + CONTROL + T", hl.dsp.exec_cmd(TERMINAL .. " -e btop"), { description = "Activity monitor (btop)" })
hl.bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(launchPrefix .. TERMINAL .. " -e btop"), { description = "Task manager (btop)" })
hl.bind(mainMod .. " + CONTROL + C", hl.dsp.exec_cmd(noctCall .. "screenshot-region"), { description = "Capture region" })
hl.bind(mainMod .. " + CONTROL + O", hl.dsp.exec_cmd(noctCall .. "panel-toggle control-center"), { description = "Control center" })
hl.bind(mainMod .. " + CONTROL + H", hl.dsp.exec_cmd(noctCall .. "settings-toggle"), { description = "Settings / Hardware" })
hl.bind(mainMod .. " + Z",           hl.dsp.exec_cmd(noctCall .. "settings-toggle"), { description = "Settings (user alias)" })
hl.bind(mainMod .. " + CONTROL + E", hl.dsp.exec_cmd(noctCall .. "panel-toggle launcher /emo"), { description = "Emojis" })
hl.bind(mainMod .. " + CONTROL + Q", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR), { description = "Calculator" })
hl.bind("XF86Calculator", hl.dsp.exec_cmd(launchPrefix .. CALCULATOR), { description = "Calculator" })
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.exec_cmd(noctCall .. "session lock"), { description = "Lock system" })
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd(noctCall .. "panel-toggle session"), { description = "Session panel (user alias)" })

----------------------------------------------------
---- HARDWARE CONTROLS -----------------------------
----------------------------------------------------

-- Audio
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up"), { locked = true, repeating = true, description = "Volume up" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down"), { locked = true, repeating = true, description = "Volume down" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(noctCall .. "volume-mute"), { locked = true, description = "Mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(noctCall .. "mic-mute"), { locked = true, description = "Mute microphone" })
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(noctCall .. "volume-up 1"), { locked = true, repeating = true, description = "Volume up precise (1%)" })
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(noctCall .. "volume-down 1"), { locked = true, repeating = true, description = "Volume down precise (1%)" })

-- Keyboard backlight
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd(noctCall .. "keyboard-backlight-up"), { locked = true, repeating = true, description = "Keyboard brightness up" })
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd(noctCall .. "keyboard-backlight-down"), { locked = true, repeating = true, description = "Keyboard brightness down" })
hl.bind("XF86KbdLightOnOff", hl.dsp.exec_cmd(noctCall .. "keyboard-backlight-toggle"), { locked = true, description = "Keyboard backlight cycle" })

-- Media playback
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true, description = "Play / Pause" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(noctCall .. "media toggle"), { locked = true, description = "Pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true, description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true, description = "Previous track" })
hl.bind("ALT + XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media next"), { locked = true, description = "Next track" })
hl.bind("ALT + SHIFT + XF86AudioPlay", hl.dsp.exec_cmd(noctCall .. "media previous"), { locked = true, description = "Previous track" })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up"), { locked = true, repeating = true, description = "Brightness up" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down"), { locked = true, repeating = true, description = "Brightness down" })
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-set 100"), { locked = true, description = "Brightness maximum" })
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-set 1"), { locked = true, description = "Brightness minimum" })
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(noctCall .. "brightness-up 1"), { locked = true, repeating = true, description = "Brightness up precise (1%)" })
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(noctCall .. "brightness-down 1"), { locked = true, repeating = true, description = "Brightness down precise (1%)" })

----------------------------------------------------
---- WORKSPACES & MONITORS -------------------------
----------------------------------------------------

-- Workspaces 1-10, layout-independent keys (code:10 to code:19)
for workspace = 1, 10 do
    local key = "code:" .. tostring(workspace + 9)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(workspace) }), { description = "Switch to workspace " .. workspace })
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace) }), { description = "Move window to workspace " .. workspace })
    hl.bind(mainMod .. " + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = tostring(workspace), follow = false }), { description = "Move window silently to workspace " .. workspace })
end

-- Next / previous / former workspace
hl.bind(mainMod .. " + Tab", hl.dsp.focus({ workspace = "e+1" }), { description = "Next workspace" })
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.focus({ workspace = "e-1" }), { description = "Previous workspace" })
hl.bind(mainMod .. " + CONTROL + Tab", hl.dsp.focus({ workspace = "previous" }), { description = "Former workspace" })

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind(mainMod .. " + grave", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Toggle scratchpad" })
hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move window to scratchpad" })
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move window to scratchpad" })

-- Lid switch: hibernate when laptop lid closes
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl hibernate"), { locked = true, description = "Hibernate on lid close" })
