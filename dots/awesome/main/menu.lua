-- Standard awesome library
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup").widget
-- Theme handling library
local beautiful = require("beautiful") -- for awesome.icon

local M = {}  -- menu
local _M = {} -- module

-- reading
-- https://awesomewm.org/apidoc/popups%20and%20bars/awful.menu.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- This is used later as the default terminal and editor to run.
-- local terminal = "xfce4-terminal"
local terminal = RC.vars.terminal

-- Variable definitions
-- This is used later as the default terminal and editor to run.
local editor = os.getenv("EDITOR") or "nano"
local editor_cmd = terminal .. " -e " .. editor

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

M.awesome = {
  { "Hotkeys", function() 
      hotkeys_popup.show_help(nil, awful.screen.focused()) 
    end },
  { "Terminal", terminal },
  { "Reboot", "reboot" },
  { "Restart Awesome", awesome.restart },
  { "Quit", function() awesome.quit() end }
}

M.network_main = {
  { "wicd-curses", "wicd-curses" },
  { "wicd-gtk", "wicd-gtk" }
}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()

  -- Main Menu
  local menu_items = {
    { "wallpaper", function() awful.spawn.with_shell("~/.config/awesome/main/wallpaper.sh") end },
    { "awesome", M.awesome, beautiful.awesome_subicon },
    { "terminal", terminal }
  }

  return menu_items
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, { __call = function(_, ...) return _M.get(...) end })
