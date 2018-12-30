#!/usr/bin/env bash

###############################################################################
# Users & Groups
###############################################################################

# Display login window as: Name and password
sudo defaults write /Library/Preferences/com.apple.loginwindow "SHOWFULLNAME" -bool true
# To disable automatic login, see security-privacy.sh


# Allow guests to login to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show fast user switching menu as:
# 0 : Full Name
# 1 : Account Name
# 2 : Icon
#defaults write NSGlobalDomain userMenuExtraStyle -int 1

# Show password hints after count (0 to disable)
defaults write NSGlobalDomain RetriesUntilHint -int 0
