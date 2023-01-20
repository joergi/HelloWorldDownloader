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


# workaround for a known limitation in bash 3.x: http://lists.gnu.org/archive/html/bug-bash/2006-01/msg00018.html
# stackoverflow: https://stackoverflow.com/questions/32596123/why-source-command-doesnt-work-with-process-substitution-in-bash-3-2/32596626#32596626
# shellcheck disable=SC1091
source /dev/stdin <<<"$(curl -s https://raw.githubusercontent.com/joergi/downloader/0.4.3/linux_mac/downloader.sh)" "$downloadUrl" "$OUTDIR" "$recentIssue" "$@"

exit 0
