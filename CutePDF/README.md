<h1><img src="resources/icon.png"/> CutePDF</h1>

(free)

This is a flat(er) installation,
of version 3.2.0.1 with a fixed version-info and manifest.

<hr/>

<h2>CutePDF 3.2+ <em>and GhostScript</em> (required)</h2>

Versions 3.2+ of CutePDF won't include the GhostScript anymore,
so first install GhostScript (choose <code>resources/gs922w32.exe</code> or <code>resources/gs922w64.exe</code>),
next run either <code>setup.exe</code> or <code>setup64.exe</code> and you are done.

You can download other versions from: <a href="http://www.cutepdf.com/download/converter.exe">http://www.cutepdf.com/download/converter.exe</a> (or <code>resources/converter.exe</code>)or 
from here: <a href="https://www.ghostscript.com/download/gsdnld.html">https://www.ghostscript.com/download/gsdnld.html</a> - <em>Ghostscript 9.22 for Windows (either 32/64 bit)</em>.

<hr/>

if you use the default installation placements you'll have those registry values added to your registry:
```registry
Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Software\GPL Ghostscript]
"Image"="-2147483648 -2147483648 -2147483648 -2147483648"
"Text"="108 108 680 356"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Artifex\GPL Ghostscript\9.22]
@="C:\\Program Files (x86)\\gs\\gs9.22"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\GPL Ghostscript\9.22]
"GS_DLL"="C:\\Program Files (x86)\\gs\\gs9.22\\bin\\gsdll32.dll"
"GS_LIB"="C:\\Program Files (x86)\\gs\\gs9.22\\bin;C:\\Program Files (x86)\\gs\\gs9.22\\lib;C:\\Program Files (x86)\\gs\\gs9.22\\fonts"

[HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\GPL Ghostscript 9.22]
"DisplayName"="GPL Ghostscript"
"UninstallString"="\"C:\\Program Files (x86)\\gs\\gs9.22\\uninstgs.exe\""
"Publisher"="Artifex Software Inc."
"HelpLink"="http://www.ghostscript.com/"
"URLInfoAbout"="http://www.ghostscript.com/"
"DisplayVersion"="9.22"
"NoModify"=dword:00000001
"NoRepair"=dword:00000001
```

and a file named <code>C:\Windows\gswin32.ini</code> (or <code>C:\Windows\gswin64.ini</code> if you'll install the 64-bit version...)
with this content:
```ini
[Text]
FontName=Courier New
FontSize=10
```

and a shortcut in the start-menu to run the main program:
<pre>
"C:\Program Files (x86)\gs\gs9.22\bin\gswin32.exe" "-IC:\Program Files (x86)\gs\gs9.22\lib;C:\Program Files (x86)\gs\gs9.22\..\fonts"
</pre>
(you don't really need to do this manually.. ever...)

<hr/>

You may add <code>C:\Program Files (x86)\gs\gs9.22\bin;C:\Program Files (x86)\gs\gs9.22\lib;</code> to your system <code>PATH</code>.
