local apps = require("default-programs")
local mainMod = "SUPER"

-- Local fallbacks so exec_cmd never receives nil
local terminal = apps.terminal or "kitty"
local browser = apps.browser or "brave"
local chat = apps.chat or "brave --app=https://chatgpt.com"
local ipc = apps.ipc or "noctalia msg"

-- Unbind default quit shortcut
hl.unbind(mainMod .. " + Q")

-- App Binds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W", hl.dsp.window.close())
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(chat))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))

-- Screenshot Binds
hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))
hl.bind(
	mainMod .. " + SHIFT + Print",
	hl.dsp.exec_cmd(
		[[bash -c 'N=$(ls ~/Pictures/aa/*.png 2>/dev/null | wc -l); grim -g "$(slurp)" ~/Pictures/aa/$((N+1)).png']]
	)
)

-- Lock Screen
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))

-- Move Windows
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Resize Active Windows
hl.bind("SUPER + minus", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind("SUPER + equal", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind("SUPER + SHIFT + minus", hl.dsp.window.resize({ x = 0, y = -50, relative = true }))
hl.bind("SUPER + SHIFT + equal", hl.dsp.window.resize({ x = 0, y = 50, relative = true }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
