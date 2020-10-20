#!/bin/sh

# Find relevant device id
id=`xinput | grep TouchPad | cut -d'=' -f2 | cut -d'[' -f1`
echo "TouchPad ID is $id"

# Find relevant property id
natural_scrolling_id=`xinput list-props ${id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Property ID is ${natural_scrolling_id}"

# Set property to 1
xinput --set-prop ${id} ${natural_scrolling_id} 1 
