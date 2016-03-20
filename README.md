# GitHub Notification widget for Awesome

## Intro
This is a quick and dirty widget that polls `https://api.github.com/notifications` once per minute and provides unobtrusive visual feedback if you have > 0 unread notifications.

## Prerequisites
It assumes you have have your GitHub username and a token with `notification` API privileges stored in a file at `~/.github-notification-auth` in the following format:

```
username:token
```

It also assumes you have `curl` and `jq` installed.

## Install
Copy this directory into your Awesome config directory (often `~/.config/awesome`)

```
git clone git@github.com:benhartley/github-notification-widget /path/to/awesome/config/
```

Then `require` the widget into your main `rc.lua` file and add it to your `right_layout` like so:

``` lua
local github_widget = require('github-notification-widget')
right_layout:add(github_widget)
```

## Usage
It doesn't really do much. It just says "GitHub" in plain text when you don't have any notifications, polls the API once every minute, and changes the text colour to `#ffffff` when you have more that 0 unread notifications.

I combine it with a global key-mapping so I can jump to the Notifications page:

``` lua
awful.key({modkey}, "g", function() assert(io.popen("xdg-open https://github.com/notifications")) end)
```

