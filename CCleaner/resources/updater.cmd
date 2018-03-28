@echo off

echo ---------------------------------------------
echo Please allow access to those 
echo domains in your HOSTS file:
echo     www.ccleaner.com
echo     www.piriform.com
echo ---------------------------------------------
echo.

::--------------------------------------------------------download
  set "ARIA2C=D:\DOS\parallel_aria2\aria2download.cmd"
::set "URL=https://www.piriform.com/ccleaner/download/portable/downloadfile"
  set "URL=https://www.ccleaner.com/ccleaner/download/portable/downloadfile"

  set "ARGS="
::--------------------------------------------------------first-argument is the URL to be used.
  set ARGS=%ARGS% "%URL%"
::--------------------------------------------------------resolve www.piriform.com without using local-HOSTS file. ---USELESS - you still must remove blocking of www.piriform.com and piriform.com from your HOSTS file!
  set ARGS=%ARGS% "--async-dns=true"
  set ARGS=%ARGS% "--async-dns-server=8.8.8.8,8.8.4.4"
::--------------------------------------------------------explicit file-name.
  set ARGS=%ARGS% "--out=downloadfile.zip"
  call %ARIA2C% %ARGS%

::--------------------------------------------------------extract
rmdir /s /q   "tmp"                                2>nul >nul
md            "tmp"                                2>nul >nul
unzip -j -qq  "downloadfile.zip"   -d "tmp"        2>nul >nul
move  /y      "tmp\lang-1037.dll"  "."             2>nul >nul
move  /y      "tmp\portable.dat"   "."             2>nul >nul
move  /y      "tmp\CCleaner.exe"   "."             2>nul >nul
rmdir /s /q   "tmp"                                2>nul >nul
del   /f /q   "downloadfile.zip"                   2>nul >nul
ren           "CCleaner.exe"       "ccleaner.exe"  2>nul >nul

pause





::
::call aria2c.exe   --allow-overwrite=true              ^
::                  --auto-file-renaming=false          ^
::                  --check-certificate=false           ^
::                  --check-integrity=false             ^
::                  --console-log-level=notice          ^
::                  --continue=true                     ^
::                  --dir="."                           ^
::                  --disable-ipv6=true                 ^
::                  --enable-http-keep-alive=true       ^
::                  --enable-http-pipelining=true       ^
::                  --file-allocation=prealloc          ^
::                  --http-auth-challenge=false         ^
::                  --human-readable=true               ^
::                  --max-concurrent-downloads=16       ^
::                  --max-connection-per-server=16      ^
::                  --min-split-size=1M                 ^
::                  --out="downloadfile.zip"            ^
::                  --referer="eladkarako.com"          ^
::                  --rpc-secure=false                  ^
::                  --split=10                          ^
::                  --user-agent="Mozilla/5.0 Chrome"   ^
::                  "https://www.piriform.com/ccleaner/download/portable/downloadfile"



::   echo.
::   echo Download done, going to modify the UI to be using bigger font-size.
::   ::modify the FONT from 8pt to 12pt - useful for larger screens.
::   set PATH_TO_EXE=".\ccleaner.exe"
::   for /f %%a in ("%PATH_TO_EXE%")do (set "PATH_TO_EXE=%%~fsa"  )
::   call "C:\www\dialog_fontsize_mod\fontsize_increase.cmd" "%PATH_TO_EXE%"
::   
::   ::cleanup
::   del   /f /q   "ccleaner_DIALOGs.rc"                2>nul >nul
::   del   /f /q   "ccleaner_DIALOGs.res"               2>nul >nul
::   
::   ::keep original file, but convert modified file to be named ccleaner.exe to be compatible with existing scripts...
::   del   /f /q   "ccleaner_original.exe"              2>nul >nul
::   ren   "ccleaner.exe" "ccleaner_original.exe"       2>nul >nul
::   ren   "ccleaner_MOD.exe" "ccleaner.exe"            2>nul >nul
::   
::   echo.
::   echo everything done.
::   echo modified file is ccleaner.exe ^(the original is kept as ccleaner_original.exe^).
::   echo.


echo.
echo ---------------------------------------------
echo Please re-disable access to those 
echo domains in your HOSTS file:
echo     www.ccleaner.com
echo     www.piriform.com
echo ---------------------------------------------
echo.
