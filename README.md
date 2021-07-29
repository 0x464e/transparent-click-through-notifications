# Transparent Click-Through Windows Notifications
This AutoHotkey script makes your Windows notifications transparent and click-through.  
I made this because in certain non-full-screen games the Windows notifications would get in my way, but I still wouldn't want to disable them totally.  
Making the notifications semi-transparent and click-through is a good middle ground.

![image](https://i.imgur.com/9gVtUcW.gif)

## Installing 
>**AutoHotkey is Windows only!**
* Install [AutoHotkey](https://www.autohotkey.com/)
* Download the [`.ahk` file](https://raw.githubusercontent.com/0x464e/transparent-click-through-notifications/master/TransparentClickThroughNotifications.ahk) from this repository
* Run the the file by just double clicking it  
<sup><sub>(If the AHK installation would've somehow failed to associate `.ahk` files with the AHK interpreter, you can manually run `.ahk` files by just passing in the file to the interpreter, which is found in your AHK installation directory (usually `C:\Program Files\AutoHotkey\AutoHotkey.exe`))</sub></sup>  
Portable versions can be created if you have AHK installed by just right clicking the `.ahk` file and choosing `Compile Script`.  
This packs the AHK interpreter and the script file to one `.exe`.

## Usage
Just launch the script and you're all set with a transparency degree of 150.  
The scale goes from 0-255 (transparent-opaque).  
The hotkey `Ctrl` + `END` is set by default to toggle on/off.  
Examples of specifying more hotkeys:
```ahk  
F6::SetTransparency(50) ;toggle on off with transparency degree of 50
F7::SetTransparency(200, true) ;turn on with transparency degree of 200
F8::SetTransparency(, false) ;turn off
```

The script also comes with two hotstrings, one to get a test notification and one to exit the script:  
* Type "cooltestnotification" anywhere on your computer to get a test notification
* Type "coolexitnotification" anywhere on your computer to exit the application