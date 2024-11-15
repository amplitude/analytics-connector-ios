#!/bin/bash

set -e

SCHEME="AnalyticsConnector"
FRAMEWORK="AnalyticsConnector"
BUILD_DIR="./.build/artifacts"
OUTPUT_PATH="$BUILD_DIR/$FRAMEWORK.xcframework"
PLATFORMS=("iOS" "iOS Simulator" "macOS" "macOS Cataylst" "watchOS" "watchOS Simulator" "tvOS" "tvOS Simulator" "visionOS" "visionOS Simulator")

build_framework_with_configuration_and_name() {
    CONFIGURATION=${1}
    # Create a framework for each supported sdk
    declare -a ARCHIVES
    for PLATFORM in "${PLATFORMS[@]}"
    do
        ARCHIVE="$BUILD_DIR/$CONFIGURATION/$FRAMEWORK-$PLATFORM.xcarchive"
        if [[ "$PLATFORM" == "macOS Cataylst" ]]
        then
            xcodebuild archive \
                -scheme "$SCHEME" \
                -configuration "$CONFIGURATION" \
                -archivePath "$ARCHIVE" \
                -destination "generic/platform=macOS,variant=Mac Catalyst" \
                SKIP_INSTALL=NO \
                BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
                SUPPORTS_MACCATALYST=YES
        else
            xcodebuild archive \
                -scheme "$SCHEME" \
                -configuration "$CONFIGURATION" \
                -archivePath "$ARCHIVE" \
                -destination "generic/platform=$PLATFORM" \
                SKIP_INSTALL=NO \
                BUILD_LIBRARY_FOR_DISTRIBUTION=YES
        fi
        ARCHIVES+=("$ARCHIVE")
    done

    # then bundle them into an xcframework
    CREATE_XCFRAMEWORK="xcodebuild -create-xcframework -output '$OUTPUT_PATH'"
    for ARCHIVE in "${ARCHIVES[@]}"
    do
        CREATE_XCFRAMEWORK="$CREATE_XCFRAMEWORK -archive '$ARCHIVE' -framework '$FRAMEWORK.framework'"
    done
    eval "$CREATE_XCFRAMEWORK"

    # Fixup - Resolve module/class name conflicts
    for SWIFT_INTERFACE in $(find "$OUTPUT_PATH" -name "*.private.swiftinterface")
    do
        sed -i "" "s/AnalyticsConnector\.//" "$SWIFT_INTERFACE"
    done
}

rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
build_framework_with_configuration_and_name "Release" "AnalyticsConnector"
