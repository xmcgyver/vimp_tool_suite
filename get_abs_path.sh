#!/bin/bash
# script found here - http://hintsforums.macworld.com/archive/index.php/t-73839.html

#!/bin/bash -
IFS=$' \t\n'
declare -x PATH=/bin:/usr/bin

# if the call came via symlink, then use its target instead:
arg=$0; [[ -L $0 ]] && arg=$(stat -f '%Y' "$0")

# now do exactly as chriswaco + LN2 said (minor syntax tweaks by me):
pth=$(2>/dev/null cd "${arg%/*}" >&2; echo "`pwd -P`/${arg##*/}")
par=$(dirname "$pth")

echo "script = $pth"
echo "parent = $par"
