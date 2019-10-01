from colorama import Fore, Style
from pathlib import Path
from shutil import copyfile, copy
import argparse
import os
import re
import subprocess


# Arguments parser
# usage: myconfig.py [--first] [--theme THEME]
parser = argparse.ArgumentParser()
parser.add_argument('--first', action='store_true', help='Triggers i3-gaps install. Use this option for a first setup, and remove it for theme change.')
parser.add_argument('--theme', help='Theme specified (default: default)')
args = parser.parse_args()

# Variables
home = '/home/geoffrey/'
os.chdir(home)

# Install packages
print(Fore.BLUE + "########## Installing dependencies..." + Style.RESET_ALL)

command = [
    'sudo',
    'apt-get',
    'install',
    '-y',
]

packages = [
    'libxcb1-dev',
    'libxcb-keysyms1-dev',
    'libpango1.0-dev',
    'libxcb-util0-dev',
    'libxcb-icccm4-dev',
    'libyajl-dev',
    'libstartup-notification0-dev',
    'libxcb-randr0-dev',
    'libev-dev',
    'libxcb-cursor-dev',
    'libxcb-xinerama0-dev',
    'libxcb-xkb-dev',
    'libxkbcommon-dev',
    'libxkbcommon-x11-dev',
    'autoconf',
    'libxcb-xrm0',
    'libxcb-xrm-dev',
    'automake',
    'libsnack2-dev',
    'libxcb-shape0-dev',
    'libev-dev',
    'build-essential',
    'git',
    'suckless-tools',
    'rofi',
    'vim',
    'chromium-browser',
    'rxvt-unicode',
    'xterm',
    'zsh',
    'feh',
    'tmux',
    'compton',
]

command.extend(packages)
subprocess.run(command)


if args.first:
    # Install i3 gaps
    print("")
    print(Fore.BLUE + "########## Installing i3-gaps..." + Style.RESET_ALL)
    if not os.path.exists('i3-gaps'):
        subprocess.run(['git',
                        'clone',
                        'https://www.github.com/Airblader/i3',
                        'i3-gaps'
        ])
        os.chdir(home + 'i3-gaps')
        subprocess.run(['autoreconf', '--force', '--install'])
        subprocess.run(['rm', '-rf', 'build/'])
        subprocess.run(['mkdir', '-p', 'build'])
        os.chdir(home + 'i3-gaps/build')
        subprocess.run(['../configure',
                        '--prefix=/usr',
                        '--sysconfdir=/etc',
                        '--disable-sanitizers'])
        subprocess.run(['make'])
        subprocess.run(['sudo', 'make', 'install'])
        os.chdir(home)
        subprocess.run(['rm', '-rf', 'i3-gaps'])


# Set configuration files
print("")
print(Fore.BLUE + "########## Setting configuration files..." + Style.RESET_ALL)

subprocess.run(['mkdir', '.config/nvim'])
subprocess.run(['mkdir', '.fonts'])
subprocess.run(['mkdir', 'Programs'])

if args.theme == None or args.theme == 'default':
    for subdir, dirs, files in os.walk("linux-config/ubuntu/default"):
        for f in files:
            src = str(subdir + os.sep + f)
            dst = re.sub("linux-config/ubuntu/default/", "", src)
            print(f"Adding ~/{dst}...")
            copyfile(src, dst)
    print("########## You're all set! You can now press Mod + Shift + R, and enjoy the show (you might need to reboot your system).")

else:
    print(Fore.RED + "########## ERROR: Unknown specified theme. Why don't you create one? Feel free to pull request at https://github.com/pypaut/linux-config." + Style.RESET_ALL)

