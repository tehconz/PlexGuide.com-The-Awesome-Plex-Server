#!/bin/bash
#
# [Ansible Role]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
menu=$(cat /var/plexguide/final.choice)

if [ "$menu" == "2" ]; then
  echo ""
  echo "-----------------------------------------------------"
  echo "SYSTEM MESSAGE: Please Read the Following Information"
  echo "-----------------------------------------------------"
  echo ""
  echo "NOTE: Setting the Server ID enables the Server to have"
  echo "a unique name for backup and setup purposes."
  echo ""
  echo "Remember KISS: Keep-It-Simple Stupid! Create a simple"
  echo "one word server ID such as hetzner1 or myserver"
  echo ""
  read -n 1 -s -r -p "Press [ANY KEY] to Continue"
  echo ""

  read -p "Set or Change the Project ID (y/n)? " -n 1 -r
  echo    # move cursor to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    echo ""
    echo "---------------------------------------------------"
    echo "SYSTEM MESSAGE: [Y] Key was NOT Selected - Exiting!"
    echo "---------------------------------------------------"
    echo ""
    read -n 1 -s -r -p "Press [ANY KEY] to Continue "
      echo "";
      exit 1;
  fi

  break=no
  while [ "$break" == "no" ]; do
  read -p 'Type a Sever ID & Then Press [ENTER]: ' typed
  #typed=typed+0
    echo ""
    echo "-------------------------------------------------"
    echo "SYSTEM MESSAGE: Server ID - $typed"
    echo "-------------------------------------------------"
    echo ""
    read -p "Continue with the Set Server ID (y/n)? " -n 1 -r

    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
      echo ""
      echo "---------------------------------------------------"
      echo "SYSTEM MESSAGE: [Y] Key was NOT Selected"
      echo "---------------------------------------------------"
      echo ""
      echo "You will be able to set the Server ID Again!"
      echo
      read -n 1 -s -r -p "Press [ANY KEY] to Continue "
      echo "";
    else
      echo ""
      echo "---------------------------------------------------"
      echo "SYSTEM MESSAGE: Server ID - $typed"
      echo "---------------------------------------------------"
      echo ""
      echo "Your Server ID is Now Set! Thank you!"
      echo ""
      echo $typed > /var/plexguide/server.id
      break=yes
      echo
      read -n 1 -s -r -p "Press [ANY KEY] to Continue "
      echo "";
    fi
  done

#### Final fi
fi

idtest=$(cat /var/plexguide/server.id)
if [ "$idtest" == "NOT-SET" ]; then
  echo ""
  echo "---------------------------------------------------"
  echo "SYSTEM MESSAGE: You Must Create a SERVER ID!"
  echo "---------------------------------------------------"
  echo ""
  echo "Restarting the Process"
  echo
  read -n 1 -s -r -p "Press [ANY KEY] to Continue "
  echo serverid > /var/plexguide/type.choice && bash /opt/plexguide/menu/core/scripts/main.sh
  exit
fi
