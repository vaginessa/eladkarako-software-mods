<h1><img src="resources/icon.png"/> Paint.Net</h1>

current version: <code>v4.0.21</code>,
complete program (not just manifests).
Run or install.

<hr/>

How to extract it yourself:
Get paint.net installation from: https://www.getpaint.net/download.html (currently: <code>paint.net.4.0.21.install.exe</code>), 
download extended-7zip from: https://github.com/eladkarako/mods/tree/master/7z
extract <code>paint.net.*******.install.exe</code> with 7zip to a folder,
in the folder, use uniExtract 1.6 or <code>msiexec.exe /a archive.msi /qb /l log.txt TARGETDIR="C:...target-dir..."</code>,
on <code>PaintDotNet_x86.msi</code> (or <code>PaintDotNet_x64.msi</code>).
to get a flat installation folder, named <code>PaintDotNet_x86</code>,
you can use it AS-IS, or run the newly created <code>PaintDotNet_x86/PaintDotNet_x86.msi</code> to install it.
Note that it will not install any of MS' .Net-Framework files, so do it yourself (you have a web-installer in the folder that extracted in the 7zip stage above).

<hr/>

Both x86 and x64 versions available (both with patched manifest resources),
choose either, extract anywhere and run <code>PaintDotNet.exe</code>,
some registry values will be written by the program on the first time,
so not "portable",
alternatively extract it to a temp folder and run the MSI file to install it properly.