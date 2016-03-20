local awful = require('awful')
local wibox = require('wibox')

local widget = wibox.widget.textbox()
local poll = timer({timeout = 60})

function reset()
    widget:set_text(" | GitHub")
end

reset()

poll:connect_signal("timeout",
    function()
        local fh = assert(io.popen("curl -su $(cat ~/.github-notification-auth) https://api.github.com/notifications | jq length", "r"))
        local num = fh:read("*l")
        if num and tonumber(num) > 0 then
            widget:set_markup(' | <span color="#ffffff">GitHub</span>')
        else
            reset()
        end
        fh:close()
    end
)
poll:start()

return widget
