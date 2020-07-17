#!/bin/bash
# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/WireframeDownloader
#          downloader for all Wireframe magzine issues
#          based on Magpi Downloader: https://github.com/joergi/MagpiDownloader
#          they are downloadable for free under https://wireframe.raspberrypi.org/issues
#          or you can buy the paper issues under: https://store.rpipress.cc/collections/wireframe
#          this script is under GNU GENERAL PUBLIC LICENSE 3
# ------------------------------------------------------------------

# VERSION=0.2.0
# USAGE="Usage: bash helloworld-downloader.sh [-f firstissue] [-l lastissue]"

OUTDIR=issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi

downloadUrl="https://helloworld.raspberrypi.org/issues/%02d/pdf"
file="regular-issues.txt";
recentIssue=$(cat "$file");

# shellcheck disable=SC1090
source <(curl https://raw.githubusercontent.com/joergi/downloader/master/linux_mac/downloader.sh) "$downloadUrl" "$recentIssue" "$@"

exit 0
