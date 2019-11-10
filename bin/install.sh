#!/bin/bash
INSTALLDIR="$HOME"
DIR="$(cd `dirname $0` && pwd)/.."
read -d '' filelist << EOF
.bash_profile
.bashrc
.gitconfig
.gitignore-global
.inputrc
.screenrc
EOF

echo "Backing up existing files.."
$DIR/.bash/file/backup_list $filelist

echo "Creating links between \"$INSTALLDIR\" -> \"$DIR\".. "
while IFS= read -r FILE
do
  echo -n "add symlink $DIR/$FILE -> $INSTALLDIR/$FILE " \
    && ln -sf "$DIR/$FILE" "$INSTALLDIR/$FILE" \
    && echo "[OK]"
done <<< "$filelist"

echo "Link your personal git config to the correct folder within bash-config.."
FROM="${INSTALLDIR}/.gitconfig-user"
TO="${DIR}/.bash/git/.gitconfig-user"
touch "${FROM}"
ln -s "${FROM}" "${TO}"

echo "Prepare message and reminder of the day files.."
DIR_VAR="${DIR}/var/data"
mkdir -p $DIR_VAR
touch "${DIR_VAR}/motd" "${DIR_VAR}/rotd"

echo "..done"
