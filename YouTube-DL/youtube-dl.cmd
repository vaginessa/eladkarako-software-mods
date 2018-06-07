@echo off
chcp 65001 2>nul >nul

::pre-cleanup
set "COMMAND="

set "YTDL_OLD=%~sdp0youtube-dl\youtube-dl.exe"
set "YTDL_NEW=%~sdp0youtube-dl\__main__.py"

for /f %%a in ("%YTDL_OLD%") do ( set "YTDL_OLD=%%~fsa" )
for /f %%a in ("%YTDL_NEW%") do ( set "YTDL_NEW=%%~fsa" )

set "COMMAND=%YTDL_OLD%"

for /f "tokens=*" %%a in ('where python.exe 2^>nul') do ( set "PYTHON=%%a" )
if ["%PYTHON%"] NEQ [""] ( 
  for /f %%a in ("%PYTHON%") do ( set "PYTHON=%%~fsa" )
  if exist %PYTHON% ( 
    set "COMMAND=%PYTHON% %YTDL_NEW%"
  ) 
) 

::arguments
set COMMAND=%COMMAND% %*

title %COMMAND%
call  %COMMAND%

exit /b %ErrorLevel%
