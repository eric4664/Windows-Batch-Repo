@echo off
:: Ensure the script maintains an exclusive lock on itself
:: If another instance is running, the script will exit
call :lock 9>>"%~f0" || exit /b
exit /b

:lock
echo [ ] Script is running exclusively...
timeout /t 10 >nul
echo [ ] Script is done.