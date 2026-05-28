@echo off
REM Build script for Bellwether Servicing Portal
REM Creates a portable and installer EXE

setlocal enabledelayedexpansion

echo Building Bellwether Servicing Portal Installer...
echo.

REM Set up environment
set NODE_PATH=.\node_modules
set PATH=.\node-v20.11.1-win-x64\bin;%PATH%

REM Create dist directory if it doesn't exist
if not exist "dist" mkdir dist

REM Copy Electron executable and dependencies
echo Copying application files...
xcopy /E /I /Y "node-v20.11.1-win-x64" "dist\Bellwether Servicing Portal\node"
copy /Y "electron.exe" "dist\Bellwether Servicing Portal\"
copy /Y "main.js" "dist\Bellwether Servicing Portal\"
copy /Y "rmwc_portfolio_portal (11).html" "dist\Bellwether Servicing Portal\index.html"
copy /Y "package.json" "dist\Bellwether Servicing Portal\"

REM Copy resources
xcopy /E /I /Y "locales" "dist\Bellwether Servicing Portal\locales"
xcopy /E /I /Y "resources" "dist\Bellwether Servicing Portal\resources"

REM Copy DLLs
copy /Y "*.dll" "dist\Bellwether Servicing Portal\"
copy /Y "*.pak" "dist\Bellwether Servicing Portal\"
copy /Y "*.bin" "dist\Bellwether Servicing Portal\"
copy /Y "*.dat" "dist\Bellwether Servicing Portal\"
copy /Y "*.json" "dist\Bellwether Servicing Portal\"

echo.
echo Build complete!
echo Portable app is ready in: dist\Bellwether Servicing Portal\
echo.

pause
