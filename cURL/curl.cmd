@echo off
::-------------------------------------------
:: this is a wrapper script around curl.exe
:: allowing to use it as usuall but will add
:: several switches by default all the time.
::-------------------------------------------
:: by adding the current folder to the system's PATH
:: curl.cmd will be launched (instead of curl.exe)
:: everytime someone runs 'curl ....' (non explicit extension).
:: since Windows prioritize files with the same-name, this way..
::-------------------------------------------


chcp 65001 2>nul >nul

set "EXIT_CODE=0"

::use current-folder curl.exe
set "ARGS=%~sdp0curl.exe"

::try to continue-downloading a previously downloaded-file.
set  ARGS=%ARGS% --continue-at "-"

::simplified resolving and increase performances.
set  ARGS=%ARGS% --ipv4

::simplified HTTPS/SSL certificate issues.
set  ARGS=%ARGS% --anyauth --insecure --location-trusted

::use a generic (non-curl) user-agent.
set  ARGS=%ARGS% --user-agent "Mozilla/5.0 Chrome"

::show a lot of information.
set  ARGS=%ARGS% --verbose


::append the rest of any additional arguments (URL and such...)
echo %ARGS% %*
call %ARGS% %*


set "EXIT_CODE=%ErrorLevel%"
if ["%EXIT_CODE%"] NEQ ["0"] ( goto ERR_CURL )


goto EXIT


:ERR_CURL
  echo [ERROR] cURL reported an error while downloading the file.            1>&2
  echo Exit-Code: %EXIT_CODE%                                                1>&2
  echo All exit-codes: https://curl.haxx.se/libcurl/c/libcurl-errors.html    1>&2
  goto EXIT


:EXIT
  exit /b %EXIT_CODE%




::generate a C/libcurl equivalent.
::set  ARGS=%ARGS% --libcurl "libcurl.c"
