#!/bin/bash
set -o errexit
#set -o pipefail ## it's failing for line 82 + 86 in downloader
set -o nounset
IFS=$'\n\t'

# ------------------------------------------------------------------
# [Author] joergi - https://github.com/joergi/HelloWorldDownloader
#          downloader for all helloworld magzine issues and books
#          based on Magpi Downloader: https://www.raspberrypi.org/hello-world
#          they are downloadable for free under https://www.raspberrypi.org/hello-world/issues
#          or you can buy the paper issues under: https://www.raspberrypi.org/hello-world/issues
#          this script is under GNU GENERAL PUBLIC LICENSE 3
# ------------------------------------------------------------------

# VERSION=0.5.0
# USAGE="Usage: bash helloworld-books-downloader.sh "

OUTDIR=special-issues

if [ ! -d "$OUTDIR" ]; then
 mkdir "$OUTDIR"
fi


file="special-issues.txt"
while IFS= read -r line
do
	bash <(curl https://raw.githubusercontent.com/joergi/downloader/0.5.0/linux_mac/downloader.sh) "$line" "$OUTDIR"
done < "$file"

exit 0
