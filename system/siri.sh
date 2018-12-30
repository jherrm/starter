#!/usr/bin/env bash

###############################################################################
# Siri
###############################################################################

# Enable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool true

# Language
defaults write com.apple.assistant.backedup "Session Language" -string "en-US"

# Voice Feedback
# 2 : On
# 3 : Off
defaults write com.apple.assistant.backedup "Use device speaker for TTS" -int 3

# Keybord shortcut
# 0 : Off
# 2 : Hold Command Space
# 3 : Hold Option Space
# 4 : Press Fn (Function) Space
# 7 : Customize
defaults write com.apple.Siri HotkeyTag -int 2
# defaults write com.apple.Siri CustomizedKeyboardShortcut

# Show Siri in menu bar
defaults write com.apple.Siri StatusMenuVisible -bool false

# Dictation
###############################################################################

# Enable Dictation
defaults write com.apple.assistant.support "Dictation Enabled" -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
  DictationIMMasterDictationEnabled -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \ DictationIMIntroMessagePresented -bool true

# Use Enhanced Dictation
# Allows offline use and continuous dictation with live feedback
if [ -d '/System/Library/Speech/Recognizers/SpeechRecognitionCoreLanguages/en_US.SpeechRecognition' ]; then
  defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
     DictationIMPresentedOfflineUpgradeSuggestion -bool true
  defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
    DictationIMSIFolderWasUpdated -bool true
  defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs \
    DictationIMUseOnlyOfflineDictation -bool true
fi
