#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "script must be run as root" 1>&2
  exit 1
fi

for m in /var/lib/schroot/mount/*; do
  [ ! -d $m ] && echo "no mount points found" && exit 0

  echo "unmounting $m"
  for d in /tmp /home /dev/pts /dev /sys /proc ""; do
    umount $m$d
  done
  rmdir $m  
done

