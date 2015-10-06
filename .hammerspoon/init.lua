-- http://www.hammerspoon.org/docs/hs.mjomatic.html

local hyper = {"cmd", "alt", "ctrl", "shift"}

local pad = 8
local doublePad = 2 * pad
local halfPad = pad / 2

function transformFocusedWindow(lambda)
  return function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    x, y, w, h = lambda(max.w, max.h)
    f.x = max.x + x
    f.y = max.y + y
    f.w = w
    f.h = h
    win:setFrame(f)
  end
end

hs.hotkey.bind(hyper, "h", transformFocusedWindow(function(w, h)
  return 0, 0, w / 2, h
end))

hs.hotkey.bind(hyper, "l", transformFocusedWindow(function(w, h)
  return w / 2, 0, w / 2, h
end))

hs.hotkey.bind(hyper, "f", transformFocusedWindow(function(w, h)
  return 0, 0, w, h
end))

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
