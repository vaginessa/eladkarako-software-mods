<h1><img src="resources/icon.png"/> Locate32-Portable</h1>

A modified version of Locate32 v3.1 RC3l build 10.8220<br/>


with 'portable.reg' that makes locate32 run in semi-portable mode (settings are imported/exported each time the program starts/ends) + the old icon back for locate32.exe which is nicer + dependency update + fixed resource-24 embedded-manifest that will ensure that locate32: 1. will be supported on Windows 10 2. run without OS virtualization. 3. scale correctly text using dpiAware and PerMonitorV2. 4. increased quality and speed for GDI rendering and scaling. 5. making main thread more stable if printer driver crashes using printerDriverIsolation. + allow native theme and color control by Windows' themes. - needs some modification the first time you run it (remove my db definitions and create your own, probably check ON the checkbox for 'leave locate32 running in the background' in settings menu too, and clear all my recent searches)

you better make a backup for portable.reg,
since locate32, although great, will crash very often,
most of the time through an update cycle, and when it does,
it will get the default settings only.
by making a backup to the portable.reg, all you have to do is to
run the reg file '_clean_from_registry.reg' that cleans all leftovers of the locate32 values from the
registry, and remove the existing portable.reg,
copying (always keep one/more copy of the backup!!) the backup and renaming it
to portable.reg. also, you better delete all of the DB files so the next update will create fresh ones.

the cleanup reg file will remove any compatibility or admin settings so you need to use the properties menu of the file and re-check the run as admin (if you've used it before)-optional.

the cleanup reg will remove shell-context menu items, which is good if you don't need them and they are leftovers from an older (normal) installation of locate32. you can always put those back using the locate32 settings dialong, and checking those options (at the end of the options menu..)

you can put it on thumb drive without any issues,
but make sure that the execute is both closed(to the tray) and after a second or two, unload it by right click exit,
to make sure the db were written and done, alway do a "safe unplug" of the thumb/usb-drive.

I've removed the setup tool, but you can get it from https://github.com/eladkarako/Locate32 or the official website.

the exe files are archived for safely reasons (no password), just extract them using 7zip.

the current manifest editing make sure locate32 is compatible with Windows (will run faster), and will enable better GDI+ rendering.

in the resources folder there is the new/old icon, and a hebrew translation I've started (not finished), also the settings exporter (you don't need!) and some "registry fixes" that came with the original version that includes an additional/undocumented options to enhance locate32 (better not use any of those).