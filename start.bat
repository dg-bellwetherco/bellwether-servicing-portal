@echo off
:: ============================================================
:: Bellwether Servicing Portal — Dev Launcher
:: Opens the app directly in Electron (no build step needed)
:: ============================================================

setlocal

:: Use bundled Node if system Node isn't on PATH
where node >nul 2>&1
if errorlevel 1 (
    if exist "node-v20.11.1-win-x64\node.exe" (
        set "PATH=%~dp0node-v20.11.1-win-x64;%PATH%"
    ) else (
        echo ERROR: Node.js not found.
        pause & exit /b 1
    )
)

:: Install if needed
if not exist "node_modules\electron\package.json" (
    echo Installing dependencies...
    call npm install
)

call npm start
