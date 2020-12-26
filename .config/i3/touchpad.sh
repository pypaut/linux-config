#!/bin/sh

# Find relevant device id
id=`xinput | grep TouchPad | cut -d'=' -f2 | cut -d'[' -f1`
echo "TouchPad ID is $id"

# Find relevant property IDs
natural_scrolling_id=`xinput list-props ${id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Natural scrolling ID is ${natural_scrolling_id}"

tapping_id=`xinput list-props ${id} | \
                      grep -i "Tapping Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Tapping ID is ${tapping_id}"

disable_while_typing_id=`xinput list-props ${id} | \
                      grep -i "Disable While Typing Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Disable While Typing ID is ${disable_while_typing_id}"

# Set properties
xinput --set-prop ${id} ${natural_scrolling_id} 1
xinput --set-prop ${id} ${tapping_id} 1
xinput --set-prop ${id} ${disable_while_typing_id} 0
