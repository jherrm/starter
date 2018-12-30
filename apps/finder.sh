#!/usr/bin/env bash

###############################################################################
# Finder
###############################################################################

# Create user `Sites` directory
mkdir -p "$HOME/Sites"

# Show user `Library` folder
chflags nohidden "${HOME}/Library"

# Show the /Volumes folder
sudo chflags nohidden "/Volumes"

# Create user `bin` directory
mkdir -p "$HOME/bin"

# Hide user `bin` folder
chflags -h hidden "${HOME}/bin"

# Quitting via ⌘ + Q; doing so will also hide desktop icons
#defaults write com.apple.finder QuitMenuItem -bool true

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop         -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop     -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop     -bool false

# Visibility of hidden files
#defaults write com.apple.finder AppleShowAllFiles -bool true

# Filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Path bar
defaults write com.apple.finder ShowPathbar -bool true

# Full POSIX path as window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool false

# Double-click a window's title bar to:
# None
# Mimimize
# Maximize (zoom)
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "Maximize"

# Text selection, copy & paste from within QuickLook windows
# Disabled: https://github.com/paulirish/dotfiles/issues/50
#defaults write com.apple.finder QLEnableTextSelection -bool true

# Search scope
# This Mac       : `SCev`
# Current Folder : `SCcf`
# Previous Scope : `SCsp`
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# File extension change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Arrange by
# Kind, Name, Application, Date Last Opened,
# Date Added, Date Modified, Date Created, Size, Tags, None
defaults write com.apple.finder FXPreferredGroupBy -string "Kind"

# Spring loaded directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Delay for spring loaded directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0

# Writing of .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Disk image verification
defaults write com.apple.frameworks.diskimages skip-verify        -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool false
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool false
defaults write com.apple.finder OpenWindowForNewRemovableDisk    -bool false

# Set icon view settings on desktop and in icon views
for view in 'Desktop' 'FK_Standard' 'Standard'; do

    # Item info near icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

    # Item label of icons: bottom (true) or right (false)
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

    # Snap-to-grid for icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

    # Grid spacing for icons
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

    # Icon size
    /usr/libexec/PlistBuddy -c "Set :${view}ViewSettings:IconViewSettings:iconSize 32" ~/Library/Preferences/com.apple.finder.plist

done

# Preferred view style
# Icon View   : `icnv`
# List View   : `Nlsv`
# Column View : `clmv`
# Cover Flow  : `Flwv`
# After configuring preferred view style, clear all `.DS_Store` files
# to ensure settings are applied for every directory
# sudo find / -name ".DS_Store" --delete
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# View Options
# ColumnShowIcons    : Show preview column
# ShowPreview        : Show icons
# ShowIconThumbnails : Show icon preview
# ArrangeBy          : Sort by
#   dnam : Name
#   kipl : Kind
#   ludt : Date Last Opened
#   pAdd : Date Added
#   modd : Date Modified
#   ascd : Date Created
#   logs : Size
#   labl : Tags
/usr/libexec/PlistBuddy \
    -c "Set :StandardViewOptions:ColumnViewOptions:ColumnShowIcons false" \
    -c "Set :StandardViewOptions:ColumnViewOptions:ShowPreview      true" \
    -c "Set :StandardViewOptions:ColumnViewOptions:FontSize           11" \
    -c "Set :StandardViewOptions:ColumnViewOptions:ArrangeBy        dnam" \
    ~/Library/Preferences/com.apple.finder.plist

# New window target
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Warning before emptying Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Empty Trash securely
defaults write com.apple.finder EmptyTrashSecurely -bool false

# AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Desktop Enabled
defaults write com.apple.finder CreateDesktop -bool false

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true
