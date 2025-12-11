#!/bin/bash

# Kill by process name as fallback
pkill -f "realsense_d435i_color" || true

exit 0