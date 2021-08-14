#!/usr/bin/env bash

# Retrive the plist version
# $1 - path to Info.plist file containing CFBundleShortVersionString
#

# Example:
# obtain-version.sh MyApp/Info.plist

if [ -z "$1" ];
then echo "Info.plist path cant be null or empty";
else 
    plist_version=$(/usr/libexec/PlistBuddy -c "Print XCFrameworkFormatVersion" $1)
    if [ -z "$plist_version" ]; 
     then echo "Can't find version";
    else
        echo "::debug::Found version - $1 version: $plist_version"
        echo "::set-output name=version::4.0"
    fi
    
fi


