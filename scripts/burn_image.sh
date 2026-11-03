#!/bin/bash
set -e -o pipefail

usage() {
    echo "Usage: $0 <file.iso> <device>"
    echo "Example: $0 ~/Downloads/ubuntu.iso /dev/sda"
    exit 1
}

# Check number of arguments
[ "$#" -ne 2 ] && usage

FILE="$1"
DEVICE="$2"

# Check that the file exists and is readable
if [ ! -f "$FILE" ] || [ ! -r "$FILE" ]; then
    echo "Error: file '$FILE' does not exist or is not readable."
    exit 1
fi

# Check that the device is a block device
if [ ! -b "$DEVICE" ]; then
    echo "Error: '$DEVICE' is not a valid block device."
    exit 1
fi

# Prevent writing to a partition (e.g. /dev/sdb1) instead of the whole disk
if [ "$(lsblk -no TYPE "$DEVICE" | head -n1)" != "disk" ]; then
    echo "Error: '$DEVICE' looks like a partition. Use the whole disk (e.g. /dev/sdb)."
    exit 1
fi

# Prevent writing to the system disk
ROOT_DISK="/dev/$(lsblk -no PKNAME "$(findmnt -no SOURCE /)" 2>/dev/null || true)"
if [ "$DEVICE" = "$ROOT_DISK" ]; then
    echo "Error: '$DEVICE' is the system disk. Aborting."
    exit 1
fi

# Show info and ask for confirmation
echo "File: $FILE ($(du -h "$FILE" | cut -f1))"
echo "Target:"
lsblk -o NAME,SIZE,MODEL,MOUNTPOINT "$DEVICE"
echo
echo "WARNING: all data on $DEVICE will be erased!"
read -r -p "Type 'yes' to continue: " ANSWER
[ "$ANSWER" != "yes" ] && { echo "Cancelled."; exit 0; }

# Unmount any mounted partitions of the device
for PART in $(lsblk -lnpo NAME,MOUNTPOINT "$DEVICE" | awk '$2 != "" {print $1}'); do
    echo "Unmounting $PART..."
    sudo umount "$PART"
done

# Write the image
sudo dd if="$FILE" of="$DEVICE" bs=4M status=progress conv=fsync
sync

echo "Done! You can now remove the USB drive."
