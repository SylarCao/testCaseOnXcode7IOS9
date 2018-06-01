#!/bin/sh

#  a1.sh
#  testCaseXcode7iOS9
#
#  Created by sylar on 2018/6/1.
#  Copyright © 2018年 sylar. All rights reserved.

tell application "iOS Simulator"
activate
end tell

tell application "System Events"
tell process "iOS Simulator"
tell menu bar 1
tell menu bar item "Debug"
tell menu "Debug"
tell menu item "Location"
click
tell menu "Location"
click menu item "Custom Location…"
end tell
end tell
end tell
end tell
end tell

tell window 1
set value of text field 1 to "40.69"
set value of text field 2 to "-74.045"
click button "OK"
end tell

end tell
end tell

