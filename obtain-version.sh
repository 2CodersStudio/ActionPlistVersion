#!/usr/bin/env bash

# Retrive the plist version
# $1 - path to Info.plist file containing CFBundleShortVersionString
#

# Example:
# obtain-version.sh MyApp/Info.plist

plist_version=$(/usr/libexec/PlistBuddy -c "Print XCFrameworkFormatVersion" $1)
echo "Info.plist version: $plist_version"
echo "::set-output name=version::$plist_version"