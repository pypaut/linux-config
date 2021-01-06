#!/bin/sh

# Find relevant device IDs
touch_id=`xinput | grep TouchPad | cut -d'=' -f2 | cut -d'[' -f1`
echo "TouchPad ID is $touch_id"

track_id=`xinput | grep TrackPoint | cut -d'=' -f2 | cut -d'[' -f1`
echo "TrackPoint ID is $track_id"

# Find relevant property IDs
touch_natural_scrolling_id=`xinput list-props ${touch_id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
                      echo "Natural scrolling ID (touchpad) is ${natural_scrolling_id}"

track_natural_scrolling_id=`xinput list-props ${track_id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
                      echo "Natural scrolling ID (trackpoint) is ${natural_scrolling_id}"

tapping_id=`xinput list-props ${touch_id} | \
                      grep -i "Tapping Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Tapping ID is ${tapping_id}"

disable_while_typing_id=`xinput list-props ${touch_id} | \
                      grep -i "Disable While Typing Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Disable While Typing ID is ${disable_while_typing_id}"

# Set properties
xinput --set-prop ${touch_id} ${touch_natural_scrolling_id} 1
xinput --set-prop ${touch_id} ${tapping_id} 1
xinput --set-prop ${touch_id} ${disable_while_typing_id} 0
xinput --set-prop ${track_id} ${track_natural_scrolling_id} 0
