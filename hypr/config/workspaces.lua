-- Workspace rules wiki https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- Add your workspace rules here. Increment the workspace number as you go. Do not have duplicate workspaces.
hl.workspace_rule({ workspace = "name:gaming", monitor = PRIMARY_MONITOR, default = true })
hl.workspace_rule({ workspace = "1", monitor = MONITOR1, default = true, persistent = true })
hl.workspace_rule({ workspace = "2", monitor = MONITOR1, default = true, persistent = true })
hl.workspace_rule({ workspace = "3", monitor = MONITOR1, default = true, persistent = true })
hl.workspace_rule({ workspace = "4", monitor = MONITOR1, default = true, persistent = true })
hl.workspace_rule({ workspace = "5", monitor = MONITOR1, default = true, persistent = true })
-- hl.workspace_rule({ workspace = "4", monitor = MONITOR2, default = true, persistent = true })
-- hl.workspace_rule({ workspace = "5", monitor = MONITOR2, default = true, persistent = true })
-- hl.workspace_rule({ workspace = "6", monitor = MONITOR2, default = true, persistent = true })

-- Restore toggled workspace layouts if saved
local p = io.popen("ls " .. (os.getenv("HOME") or "") .. "/.local/state/hypr/workspace-layouts/*.lua 2>/dev/null")
if p then
    for f in p:lines() do
        dofile(f)
    end
    p:close()
end
