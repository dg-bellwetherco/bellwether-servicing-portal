@echo off
:: ============================================================
:: Bellwether Servicing Portal — Build Script
:: Produces:
::   dist/  →  NSIS installer (.exe) + Portable (.exe)
:: ============================================================

setlocal enabledelayedexpansion

echo.
echo  ===================================================
echo   Bellwether Servicing Portal — Build
echo  ===================================================
echo.

:: Use bundled Node if system Node isn't on PATH
where node >nul 2>&1
if errorlevel 1 (
    if exist "node-v20.11.1-win-x64\node.exe" (
        echo  Using bundled Node.js...
        set "PATH=%~dp0node-v20.11.1-win-x64;%PATH%"
    ) else (
        echo  ERROR: Node.js not found.
        echo  Install from https://nodejs.org/ or keep node-v20.11.1-win-x64\ in this folder.
        pause & exit /b 1
    )
)

for /f "tokens=*" %%v in ('node --version') do set NODE_VER=%%v
echo  Node.js: %NODE_VER%
echo.

:: Install deps if electron isn't installed yet
if not exist "node_modules\electron\package.json" (
    echo  Installing dependencies (first run — may take a minute)...
    call npm install
    if errorlevel 1 (
        echo  ERROR: npm install failed.
        pause & exit /b 1
    )
    echo.
)

:: Build
echo  Building installer + portable...
call npm run build
if errorlevel 1 (
    echo.
    echo  ERROR: Build failed. Check output above.
    pause & exit /b 1
)

echo.
echo  ===================================================
echo   Build complete!  Output: dist\
echo  ===================================================
echo.
pause
