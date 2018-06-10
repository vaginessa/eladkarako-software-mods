@echo off


call curl.exe --ipv4 --anyauth --insecure --location-trusted --verbose --url "http://youtube-dl.org/downloads/latest/youtube-dl.exe" --output "youtube-dl.exe" --resolve "youtube-dl.org:443:95.143.172.170" --resolve "youtube-dl.org:80:95.143.172.170"

if ["%ErrorLevel%"] NEQ ["0"] ( goto END )

move /y "youtube-dl.exe" "..\youtube-dl\."


::--------------------------------------------------------
::--------------------------------------------------------


call curl.exe --ipv4 --anyauth --insecure --location-trusted --verbose --url "http://youtube-dl.org/downloads/latest/youtube-dl" --output "youtube-dl.rar" --resolve "youtube-dl.org:443:95.143.172.170" --resolve "youtube-dl.org:80:95.143.172.170"

if ["%ErrorLevel%"] NEQ ["0"] ( goto END )

move /y  "youtube-dl.rar"  "..\youtube-dl\."


::remove old-version
del /f /q     "..\youtube-dl\__main__.py"   2>nul >nul
del /f /q /s  "..\youtube-dl\youtube_dl\"   2>nul >nul
rmdir  /q /s  "..\youtube-dl\youtube_dl\"   2>nul >nul
del /f /q /s  "..\youtube-dl\youtube_dl\"   2>nul >nul


7z x "..\youtube-dl\youtube-dl.rar" -y -o"..\youtube-dl\."


del /f /q "..\youtube-dl\youtube-dl.rar"


::updating "help"-information.
echo version:                          >..\readme_youtube-dl.nfo
call "..\youtube-dl.cmd" "--version"  >>..\readme_youtube-dl.nfo
echo -------------------------------- >>..\readme_youtube-dl.nfo
echo.                                 >>..\readme_youtube-dl.nfo
call "..\youtube-dl.cmd" "--help"     >>..\readme_youtube-dl.nfo


:END
  pause