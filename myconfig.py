import subprocess
from shutil import copyfile, copy
from pathlib import Path
import os
import re

home = '/home/geoffrey/'
os.chdir(home)

# Install packages

print("########## Installing dependencies...")

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


# Install i3 gaps

# print("")
# print("########## Installing i3-gaps...")
# if not os.path.exists('i3-gaps'):
#     subprocess.run(['git',
#                     'clone',
#                     'https://www.github.com/Airblader/i3',
#                     'i3-gaps'
#     ])
#     os.chdir(home + 'i3-gaps')
#     subprocess.run(['autoreconf', '--force', '--install'])
#     subprocess.run(['rm', '-rf', 'build/'])
#     subprocess.run(['mkdir', '-p', 'build'])
#     os.chdir(home + 'i3-gaps/build')
#     subprocess.run(['../configure',
#                     '--prefix=/usr',
#                     '--sysconfdir=/etc',
#                     '--disable-sanitizers'])
#     subprocess.run(['make'])
#     subprocess.run(['sudo', 'make', 'install'])
#     os.chdir(home)
#     subprocess.run(['rm', '-rf', 'i3-gaps'])


# Set configuration files

print("")
print("########## Setting configuration files...")

subprocess.run(['mkdir', '.config/nvim'])
subprocess.run(['mkdir', '.fonts'])
subprocess.run(['mkdir', 'Programs'])

for subdir, dirs, files in os.walk("linux-config/ubuntu/default"):
    for f in files:
        src = str(subdir + os.sep + f)
        dst = re.sub("linux-config/ubuntu/default/", "", src)
        print(f"Adding ~/{dst}...")
        copyfile(src, dst)


print("########## You're all set! You can now press Mod + Shift + R, and enjoy the show (you might need to reboot your system).")
