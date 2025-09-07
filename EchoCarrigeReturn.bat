@echo off
setlocal EnableDelayedExpansion

echo "%~F0"
rem Get a Carriage Return (Ascii 13) in CR variable:
for /F %%a in ('copy /Z "%~F0" NUL') do set "CR=%%a"
rem show digit iterally.
FOR /L %%i IN (1,1,10) DO ( < NUL set /P="Count= %%i!CR!" )