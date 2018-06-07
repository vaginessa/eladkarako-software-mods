@echo off

::-----------------------------------------------------
:: This File Download Single-URL or a List Automatically.
::    single URL:                     ->'ytdl2download.cmd'
::    list (more then 10 URLs):       ->'ytdl2list.cmd'
::    list (less then 10 URLs):       creates raw URLs+filenames list, runs aria on it.
::                                      On any error: ->'ytdl2list.cmd'
::-----------------------------------------------------
:: Exit-Codes:
::              0           success
::              333         missing arguments.
::              444         invalid URL (no '//').
::              other       (single URL) - it is YouTube-DL's raw exit-codes.
::              other       (list) - managed by Aria2C. When ytdl2aria was done (and all it's internal-YouTube-DL execution was done too) with exit-code 0 (success), the job is then transfered to Aria2C to handle the download and renaming the result-files. All exit-codes are forwarded from aria.
::
:: internal exit-codes you will not see in the output of this batch file
::              111         when ytdl2aria has empty content (due to NodeJS/internal YouTube-dl errors).
::              999         arbitrary-decision: ytdl2aria will not handle lists with >10 URLs. This batch-file will use the old-school way: ytdl2list.cmd (which uses '--batch-file').
::-----------------------------------------------------
chcp 65001          2>nul >nul

set "EXIT_CODE=0"

set "COMMAND="

set "LAST_ARG="

::-------------------------assuming last arg is always 'the URL' or 'the list'. writes 'LAST_ARG' variable.
call :GET_LAST_ARG %*
::---------------------------------------

if ["%~1"] EQU [""]           ( goto NOARG  )
if exist "%LAST_ARG%"         ( goto LIST   )

::---------------------------------------------------------check it is a valid-URL (has '//' in it)
echo."%LAST_ARG%" | findstr /C:"//" 2>nul 1>nul
IF ["%ErrorLevel%"] EQU ["0"] ( goto URL    )

goto INVALID_URL


::-------------------------------------------------------------------------------------------


:NOARG
  echo ERROR: missing argument (URL or text-file for list).   1>&2
  set "EXIT_CODE=333"
  goto END


:INVALID_URL
  echo ERROR: invalid URL (no "//").                          1>&2
  set "EXIT_CODE=444"
  goto END


:URL
  set COMMAND="%~sdp0ytdl2download.cmd" %*
  echo %COMMAND%
  call %COMMAND%
  set "EXIT_CODE=%ErrorLevel%"
  goto END


:LIST
  ::--------------------------------------#2 YouTube-DL gets raw URL+filename, ytdl2aria generates raw URL+filename list (compatible with aria) - multiprocess run of YouTube-DL, aria handles downloading (parallel).
  set "ARIA_INPUTFILE="
  for /f "tokens=*" %%a in ('call "%~sdp0ytdl2aria\index.cmd" "%LAST_ARG%" ') do (set "ARIA_INPUTFILE=%%a")

  ::either error or >10 URLs
  if ["%ErrorLevel%"]     NEQ ["0"] ( goto LIST_OLD )
  if ["%ARIA_INPUTFILE%"] EQU [""]  ( goto LIST_OLD )

  set COMMAND=aria2c --dir="." --file-allocation="falloc" --human-readable="true" --enable-color="true" --split="3" --min-split-size="1M" --user-agent="Mozilla/5.0 Chrome" --continue="true" --allow-overwrite="false" --auto-file-renaming="false" --check-certificate="false" --check-integrity="false" --enable-http-keep-alive="true" --enable-http-pipelining="true" --disable-ipv6="true" --max-concurrent-downloads="4" --max-connection-per-server="16" --input-file=%ARIA_INPUTFILE%
  echo %COMMAND%
  call %COMMAND%
  set "EXIT_CODE=%ErrorLevel%"
  color
  goto END


:LIST_OLD
  ::--------------------------------------#1 list-download by YouTube-DL itself (one by one, non-parallel).
  set COMMAND="%~sdp0ytdl2list.cmd" %*
  echo %COMMAND%
  call %COMMAND%
  set "EXIT_CODE=%ErrorLevel%"
  goto END


::subroutine that loop the arg.s to last without destroying the list. (as all subroutines, it must go to ':EOF' to 'mark it done'..)
:GET_LAST_ARG
  set "LAST_ARG=%~1"
  shift
  if ["%~1"] NEQ [""] goto GET_LAST_ARG
  goto :EOF


:END
  pause
  exit /b %EXIT_CODE%
