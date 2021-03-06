#!/bin/bash
#
# This script will prepare Jumpbox to run after a release upgrade.
#

# If not already "root", script must be run with "sudo"
if [ "$(whoami)" = "root" ]; then
        # As "root", ask the user to confirm before continuing
        read -n1 -rsp $'Running Jumpbox as root, press any key to continue or ^C to cancel\n'
        PREFIX=""

fi

# Pull Jumpbox updates
COMMAND="${PREFIX}git checkout master"
echo "Checkout master Git repo ($COMMAND)..."
COMMAND="${PREFIX}git pull origin master"
echo "Pull updated Jumpbox files ($COMMAND)..."

# Install new Python packages
COMMAND="${PREFIX}pip install -r requirements.txt --upgrade"
echo "Updating required Python packages ($COMMAND)..."
eval $COMMAND

# Update complete notification
echo "Jumpbox update complete."
