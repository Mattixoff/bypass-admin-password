# 🛠️ AdminExploit

## 📚 Overview

`adminexploit` is a powerful utility designed to bypass Windows authentication and establish a secondary account with administrative privileges. This tool is intended for responsible and ethical use.


## 📦 Prerequisites

Before you begin, ensure you have the following:

- A USB stick
- [Alpine Standard x86_64 ISO](https://alpinelinux.org/downloads/)
- [Rufus](https://github.com/pbatard/rufus/releases/latest)

## 🚀 Setup

Follow these steps to set up `adminexploit`:

1. Insert your USB stick.
2. Launch Rufus.
3. In Rufus, select your USB stick as the device.
4. Click "SELECT" and navigate to the downloaded `alpine.iso`.
5. Click "START".
6. Choose "Write in ISO image mode" and click "OK".
7. Once the process completes, exit Rufus.
8. Download and extract this repository.
9. Navigate to the Alpine USB in the explorer.
10. Transfer `admin.sh` from the extracted repository to the USB.
11. Safely eject the USB.


## 💻 Usage

To use `adminexploit`, follow these steps:

1. Open `bypasser.bat` with admin permissions
2. If you have a booted USB write: `1`
3. If you don't have a booted USB write: `3`
4. If you want already a admin account write: `2`
5. Connect the USB to the target Windows machine.
6. Restart the machine and repeatedly press the boot manager key (usually F12).
7. Boot from the Alpine USB and wait for it to load.
8. When prompted for login, enter "root".
9. Execute the following commands:
    ```bash
    cd /media/usb
    chmod +x *.sh
    ./admin.sh
    ```
10. Follow the on-screen instructions and enter the correct partition (usually "/dev/sda3").
11. After seeing the "Done!" message, power off the machine using the "poweroff" command and remove the USB.
12. Boot into Windows as usual.
14. Find the new user and enjoy your admin-user!

## ⚠️ Disclaimer

`adminexploit` is intended for educational purposes only. Any misuse can result in criminal charges. The authors are not responsible for any damage caused by the misuse of this tool.