#!/bin/bash
INSTALLDIR="$HOME"
DIR="$(cd `dirname $0` && pwd)/.."
echo "Creating links between \"$INSTALLDIR\" -> \"$DIR\".. "

while IFS= read -r FILE
do
  echo -n "add symlink $DIR/$FILE -> $INSTALLDIR/$FILE " \
    && ln --symbolic --force --backup "$DIR/$FILE" "$INSTALLDIR/$FILE" \
    && echo "[OK]"
done << EOF
.bash_profile
.bashrc
.gitconfig
.gitignore-global
.inputrc
.screenrc
EOF

echo "..done"
