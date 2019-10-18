#!/usr/bin/env python3
import subprocess
import sys
import time
import math


# Script by Jacob Vlijm

# sudo apt-get install wmctrl xdotool

# To find the WM_CLASS: open your application, run in a terminal:
#
# xprop WM_CLASS # and click the window of the application

# Output:
# WM_CLASS: WM_CLASS(STRING) = "sun-awt-X11-XFramePeer", "MATLAB R2015a - academic use"
# Either use the first or the second part in the command to run the script.
#
# The command to run the script then is:
#
# python3 /path/to/lock_to_wspace.py "sun-awt-X11-XFramePeer" 2,2
# In the command, the last section; 2,2 is the workspace where you want to lock the application to (without spaces: (!) column, row), in "human" format; the first column/row is 1,1


app_class = sys.argv[1]
ws_lock = [int(n)-1 for n in sys.argv[2].split(",")]

def check_wlist():
    # get the current list of windows
    try:
        raw_list = [
            l.split() for l in subprocess.check_output(
                ["wmctrl", "-lG"]
                ).decode("utf-8").splitlines()
            ]
        ids = [l[0] for l in raw_list]
        return (raw_list, ids)
    except subprocess.CalledProcessError:
        pass

def get_wssize():
    # get workspace size
    resdata = subprocess.check_output(["xrandr"]).decode("utf-8").split()
    i = resdata.index("current")
    return [int(n) for n in [resdata[i+1], resdata[i+3].replace(",", "")]]

def get_current(ws_size):
    # vector of the current workspace to origin of the spanning desktop
    dt_data = subprocess.check_output(
        ["wmctrl", "-d"]
        ).decode("utf-8").split()
    curr = [int(n) for n in dt_data[5].split(",")]
    return (int(curr[0]/ws_size[0]), int(curr[1]/ws_size[1]))

def get_relativewinpos(ws_size, w_data):
    # vector to the application window, relative to the current workspace
    xpos = int(w_data[2]); ypos = int(w_data[3])
    xw = ws_size[0]; yw = ws_size[1]
    return (math.ceil((xpos-xw)/xw), math.ceil((ypos-yw)/yw))

def get_abswindowpos(ws_size, w_data):
    # vector from the origin to the current window's workspace (flipped y-axis)
    curr_pos = get_current(ws_size)
    w_pos = get_relativewinpos(ws_size, w_data)
    return (curr_pos[0]+w_pos[0], curr_pos[1]+w_pos[1])

def wm_class(w_id):
    # get the WM_CLASS of new windows
    return subprocess.check_output(
        ["xprop", "-id", w_id.strip(), "WM_CLASS"]
        ).decode("utf-8").split("=")[-1].strip()

ws_size = get_wssize()
wlist1 = []
subprocess.Popen(["notify-send", 'workspace lock is running for '+app_class])

while True:
    # check focussed window ('except' for errors during "wild" workspace change)
    try:
        focus = subprocess.check_output(
            ["xdotool", "getwindowfocus"]
            ).decode("utf-8")
    except subprocess.CalledProcessError:
        pass
    time.sleep(1)
    wdata = check_wlist() 
    if wdata !=  None:
        # compare existing window- ids, checking for new ones
        wlist2 = wdata[1]
        if wlist2 != wlist1:
            # if so, check the new window's class
            newlist = [[w, wm_class(w)] for w in wlist2 if not w in wlist1]
            valids = sum([[l for l in wdata[0] if l[0] == w[0]] \
                          for w in newlist if app_class in w[1]], [])
            # for matching windows, check if they need to be moved (check workspace)
            for w in valids:
                abspos = list(get_abswindowpos(ws_size, w))
                if not abspos == ws_lock:
                    current = get_current(ws_size)
                    move = (
                        (ws_lock[0]-current[0])*ws_size[0],
                            (ws_lock[1]-current[1])*ws_size[1]-56
                        )
                    new_w = "wmctrl -ir "+w[0]+" -e "+(",").join(
                        ["0", str(int(w[2])+move[0]),
                         str(int(w[2])+move[1]), w[4], w[5]]
                        )
                    subprocess.call(["/bin/bash", "-c", new_w])
                    # re- focus on the window that was focussed
                    if not app_class in wm_class(focus):
                        subprocess.Popen(["wmctrl", "-ia", focus])
        wlist1 = wlist2
