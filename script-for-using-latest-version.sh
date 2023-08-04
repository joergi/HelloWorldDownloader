#!/bin/bash
set -o errexit
#set -o pipefail
set -o nounset
IFS=$'\n\t'

# ------------------------------------------------------------------
# based on the script Kenichi Nagai https://github.com/keni-n/
# https://github.com/joergi/MagPiDownloader/blob/main/linux_mac/magpi-issue-downloader-latest.sh
# ------------------------------------------------------------------

# VERSION=0.1
# you don't need to run this script
# this is running automatically on Github each day to update the latest issues

TARGET_URL="https://helloworldraspberrypi.com/"
BASEDIR=$(dirname "$0")

#printf -v page_url "$TARGET_URL/issues"
page_url=$(printf '%s\n' "$TARGET_URL/issues")

latest_issue=$(curl -sf "$page_url" | grep "Get PDF" | head -n 1 | sed 's/^.*issues\///' | sed 's/\/pdf.*$//')
echo "Latest Issue is " "$latest_issue"

file="$BASEDIR/regular-issues.txt";
echo $file
echo "$latest_issue" >"$file"
