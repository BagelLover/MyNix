-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Widget and layout library
local wibox = require("wibox")

-- Theme handling library
local beautiful = require("beautiful")

-- Custom Local Library: Common Functional Decoration
require("deco.titlebar")

-- reading
-- https://awesomewm.org/apidoc/classes/signals.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
  end
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
-- Floating windows on top
client.connect_signal("property::floating", function(c)
    if not c.fullscreen then
        if c.floating then
            c.ontop = true
        else
            c.ontop = false
        end
    end
end)

local function update_titlebars(c)
    local layout = awful.layout.get(c.screen)
    if c.floating or layout == awful.layout.suit.floating then
        awful.titlebar.show(c)
    else
        awful.titlebar.hide(c)
    end
end

-- Update titlebars when a window's floating state changes
client.connect_signal("property::floating", update_titlebars)

-- Update titlebars when a window is spawned
client.connect_signal("manage", update_titlebars)

-- Update titlebars when the layout changes
tag.connect_signal("property::layout", function(t)
    for _, c in ipairs(t:clients()) do
        update_titlebars(c)
    end
end)


client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
