#!/bin/bash
# Inits second monitor
### BEGIN INIT INFO
# Provides:          Activation of second monitor
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Short-Description: Activates second monitor
# Description:       Activates second monitor using xrandr
### END INIT INFO

xrandr --output DP1 --mode 2560x1440 --right-of eDP1
redshift -l 33.769146899999996:-84.39136429999999
xinput --set-prop "Razer Razer DeathAdder" "Device Accel Constant Deceleration" 5
