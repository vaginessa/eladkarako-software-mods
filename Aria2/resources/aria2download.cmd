@echo off

set URL="%~1"
if [%URL% == ""] ( goto NOURL )

::                               working environment state.
set FOLDER_BATCH=%~dp0
set ARIA=%FOLDER_BATCH%aria2c.exe

::                                          normalise path
for /f %%a in ("%FOLDER_BATCH%")do (   set "FOLDER_BATCH=%%~fsa"    )
for /f %%a in ("%ARIA%")do (           set "ARIA=%%~fsa"            )

set ARGS=
::                               probably ok
set ARGS=%ARGS% --dir="."
set ARGS=%ARGS% --file-allocation="falloc"
set ARGS=%ARGS% --save-session-interval="10"

set ARGS=%ARGS% --human-readable="true"
set ARGS=%ARGS% --enable-color="true"

::                               probably ok
set ARGS=%ARGS% --split="16"
set ARGS=%ARGS% --min-split-size="1M"
set ARGS=%ARGS% --user-agent="Mozilla/5.0 AppleWebKit/537 Chrome/62 Safari/537.3"
set ARGS=%ARGS% --referer=%URL%
set ARGS=%ARGS% --http-no-cache="true"
set ARGS=%ARGS% --header="DNT: 1"
set ARGS=%ARGS% --auto-save-interval="20"

::                               error handling
set ARGS=%ARGS% --retry-wait="2"
set ARGS=%ARGS% --max-tries="3"
set ARGS=%ARGS% --timeout="120"
set ARGS=%ARGS% --connect-timeout="300"
set ARGS=%ARGS% --max-file-not-found="1"

::                               do-not overwrite, always continue. if a file is completed it won't re-downloaded it, and overwrite it. You have to maintain renaming/deleting the older file yourself outside of this batch file. it is safer this way since you can download a huge file and then run this batch again and start the whole thing again...
set ARGS=%ARGS% --continue="true"
set ARGS=%ARGS% --allow-overwrite="false"
set ARGS=%ARGS% --auto-file-renaming="false"

::                               log
set ARGS=%ARGS% --console-log-level="notice"

::                               certificate/ssl
set ARGS=%ARGS% --check-certificate="false"
set ARGS=%ARGS% --check-integrity="false"
::set ARGS=%ARGS% --http-auth-challenge="true"
::set ARGS=%ARGS% --rpc-allow-origin-all="true"
::set ARGS=%ARGS% --rpc-secure="false"

::                               ip/connection
set ARGS=%ARGS% --enable-http-keep-alive="true"
set ARGS=%ARGS% --enable-http-pipelining="true"
set ARGS=%ARGS% --disable-ipv6="true"
set ARGS=%ARGS% --connect-timeout="120"
set ARGS=%ARGS% --max-concurrent-downloads="16"
set ARGS=%ARGS% --max-connection-per-server="16"

@echo on
call %ARIA% %ARGS%  %*

@echo off
goto EXIT


:NOURL
  echo.
  echo ERROR: argument missing (URL).
  goto EXIT
  
:EXIT
  echo.
  color
  pause
