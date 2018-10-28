#!/bin/bash

genmon_installed=$(dpkg-query -W -f='${Status}' xfce4-genmon-plugin 2>/dev/null | grep -c 'ok installed')

if [ $genmon_installed -eq 0 ]; then
	sudo apt -y install xfce4-genmon-plugin
fi

xfce4-panel --add genmon

DIR="$(cd -P "$(dirname $0)" && pwd)"
PLUGINID=$(xfconf-query -c xfce4-panel -p /panels/panel-0/plugin-ids | tail -1)		
GENMON_CONFIG_FILE="$HOME/.config/xfce4/panel/genmon-$PLUGINID.rc"
GENMON_COMMAND="$DIR/xfce-my-ip.sh"

GENMON_CONTENT=$(cat <<EOF
Command=$GENMON_COMMAND
UseLabel=0
Text=
UpdatePeriod=60000
Font=Noto Sans 13
EOF
)

echo "$GENMON_CONTENT" > $GENMON_CONFIG_FILE
