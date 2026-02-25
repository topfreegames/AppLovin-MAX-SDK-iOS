#!/bin/sh

#  ci_post_clone.sh
#  AppLovin MAX Demo App - Swift
#
#  This script runs after Xcode Cloud clones your repository
#  It installs CocoaPods dependencies

set -e

echo "Installing CocoaPods dependencies..."

# Install CocoaPods if not already installed
if ! command -v pod &> /dev/null
then
    echo "CocoaPods not found. Installing..."
    sudo gem install cocoapods
fi

# Install pods
pod install

echo "CocoaPods installation complete!"
