#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2019-11-21 15:54:25 +0000 (Thu, 21 Nov 2019)
#
#  https://github.com/harisekhon/bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

usage(){
    echo "
Simple query wrapper to GCE's Metadata API

${0##*/} <resource>

eg. ${0##*/} instance/scheduling/preemptible
"
    exit 3
}

if [ $# -ne 1 ]; then
    usage
fi

if [[ "$1" =~ -.* ]]; then
    usage
fi

curl -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/$1"