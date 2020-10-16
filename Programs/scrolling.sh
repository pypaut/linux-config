#!/bin/sh

# Find relevant device id
id=12
echo "Mouse ID $id"

# Find relevant property id
natural_scrolling_id=`xinput list-props ${id} | \
                      grep -i "Natural Scrolling Enabled (" \
                      | cut -d'(' -f2 | cut -d')' -f1`
echo "Natural scrolling ID ${natural_scrolling_id}"

# Set property to 1
xinput --set-prop ${id} ${natural_scrolling_id} 1 
