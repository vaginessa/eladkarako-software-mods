@echo off


::                               input is a list of URLs
set LIST="%~1"
if [%LIST% == ""]         ( goto NOLIST       )
for /f %%a in (%LIST%) do ( set "LIST=%%~fsa" )
if not exist %LIST%       ( goto NOLIST       )


::                               working environment state.
set FOLDER_BATCH=%~dp0
set ARIA=%FOLDER_BATCH%aria2c.exe


::                                          normalise path
for /f %%a in ("%FOLDER_BATCH%")do (   set "FOLDER_BATCH=%%~fsa"    )
for /f %%a in ("%ARIA%")do (           set "ARIA=%%~fsa"            )


::----------------------------------------------------------------------------


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
set ARGS=%ARGS% --referer="https://github.com"
set ARGS=%ARGS% --http-no-cache="true"
set ARGS=%ARGS% --header="DNT: 1"
set ARGS=%ARGS% --auto-save-interval="20"

::                               error handling
set ARGS=%ARGS% --retry-wait="30"
set ARGS=%ARGS% --max-tries="20"
set ARGS=%ARGS% --timeout="300"
set ARGS=%ARGS% --connect-timeout="300"
set ARGS=%ARGS% --max-file-not-found="3"


::                               do-not overwrite, and always continue, this way if one of the file in the list is complete and you still have to download other files, and you have to pause the download process, the next time you'll start the batch the existing file that downloaded successfully won't be overwrited and downloaded from the start again. it also means you need to maintain file renaming outside of this batch if you DO wish to download the same file again.
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

::                               list path
set ARGS=%ARGS% --input-file="%LIST%"


echo.
@echo on
call %ARIA% %ARGS%

@echo off
goto EXIT


:NOLIST
  echo.
  echo ERROR: argument missing (textual-based file, filled with URLs, one per line).
  goto EXIT
  
:EXIT
  echo.
  color
  pause
