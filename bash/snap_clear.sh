#!/usr/bin/env bash
sudo snap refresh;
echo "snap refreshed"
snap list --all | awk '/disabled/{print $1, $3}' | while read snapname revision; do

sudo snap remove "$snapname" --revision="$revision"
done
echo "old snap snapshots are removed"


