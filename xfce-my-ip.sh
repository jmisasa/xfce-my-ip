#!/bin/bash

# Jose M. Isasa - Oct 2018
# Released under the WTFPL http://www.wtfpl.net/about/

DIR="$(cd -P "$(dirname $0)" && pwd)"
STORAGE_FILE="$DIR/xfce-my-ip-storage"
IPIFY_ENDPOINT="https://api.ipify.org"

function register_storage()
{
	STORAGE_CONTENT=$(cat <<EOF
LAST_STATUS=$STATUS
SAME_STATUS_SINCE="$(date)"
EOF
)

	echo "$STORAGE_CONTENT" > $STORAGE_FILE
}

if [ -f $STORAGE_FILE ]; then
	source <(grep = $STORAGE_FILE)
else
	LAST_STATUS="xx"
	SAME_STATUS_SINCE="$(date)"
fi

IP=$(curl -s $IPIFY_ENDPOINT)

if [ -z $IP ]; then
	STATUS="ko"
	TEXT="???.???.???.???"
	TOOLTIP_TEXT="Internet is DOWN since $SAME_STATUS_SINCE"	
else
	STATUS="ok"
	TEXT=$IP
	TOOLTIP_TEXT="Internet is OK since $SAME_STATUS_SINCE"
fi

if [ $STATUS != $LAST_STATUS ]; then
	if [ $STATUS == "ko" ]; then
		notify-send -i "$DIR/$STATUS.png" "Internet is probably down :/"	
	else
		notify-send -i "$DIR/$STATUS.png" "Internet is up! Your IP is $IP"	
	fi

	register_storage
fi

SCRIPT_NAME=$(basename $0)
SCRIPT_FULL_PATH="$DIR/$SCRIPT_NAME"
ICON_FULL_PATH="$DIR/$STATUS.png"

RETURN=$(cat <<EOF
<txt>$TEXT</txt>
<img>$ICON_FULL_PATH</img>
<tool>$TOOLTIP_TEXT</tool>
EOF
)

echo "$RETURN"
