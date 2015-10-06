-- http://www.hammerspoon.org/docs/hs.mjomatic.html

local hyper = {"cmd", "alt", "ctrl", "shift"}

local pad = 8
local doublePad = 2 * pad
local halfPad = pad / 2

hs.hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + pad
  f.y = max.y + pad
  f.w = (max.w / 2) - pad - halfPad
  f.h = max.h - doublePad
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2) + halfPad
  f.y = max.y + pad
  f.w = (max.w / 2) - pad - halfPad
  f.h = max.h - doublePad - 0
  win:setFrame(f)
end)

hs.hotkey.bind(hyper, "f", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + pad
  f.y = max.y + pad
  f.w = max.w - doublePad
  f.h = max.h - doublePad
  win:setFrame(f)
end)

-- convert tilde into modifier
-- actually, tab location is alright
-- or space as leader
hs.hotkey.bind(hyper, "1", function()
  hs.application.launchOrFocus("Terminal")
end)

hs.hotkey.bind(hyper, "2", function()
  hs.application.launchOrFocus("Safari")
end)

hs.hotkey.bind(hyper, "3", function()
  hs.application.launchOrFocus("Atom")
end)

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
          doReload = true
      end
  end
  if doReload then
      hs.reload()
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

hs.pathwatcher.new(os.getenv("HOME") .. "/Library/Application Support/Karabiner/private.xml", function()
  hs.execute("/Applications/Karabiner.app/Contents/Library/bin/karabiner reloadxml")
  hs.notify.new({title="Hammerspoon", informativeText="private.xml changed, reloading karabiner"}):send():release()
end):start()

hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send():release()
