#!/usr/bin/env bash

# Retrive the plist version
# $1 - path to Info.plist file containing the giving key
# $2 - valid keys: XCFrameworkFormatVersion or CFBundleShortVersionString
#

# Example:
# obtain-version.sh MyApp/Info.plist
echo "Entry data:"
echo "Plist path: $1"
echo "Key: $2"

if [[ -z "$1" || -z "$2" ]];
    then echo "::error::Info.plist path cant be null or empty";
else 
    if [[ $2 == "XCFrameworkFormatVersion" || $2 == "CFBundleShortVersionString" ]];
        then
        plist_version=$(/usr/libexec/PlistBuddy -c "Print $2" $1)
        if [ -z "$plist_version" ]; 
            then echo "::error Can't find version"
        else
            echo "::debug::Found version - $1 version: $plist_version"
            echo "::set-output name=version::$plist_version"
        fi
    else
        echo "::error::No valid keys"
    fi
fi


