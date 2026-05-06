@echo off
REM ════════════════════════════════════════════════════════════════
REM Bellwether Servicing Portal - Standalone Launcher
REM ════════════════════════════════════════════════════════════════
REM Double-click this file to launch the application
REM ════════════════════════════════════════════════════════════════

setlocal enabledelayedexpansion

REM Check if electron.exe exists
if not exist "electron.exe" (
    echo.
    echo ERROR: electron.exe not found in this directory.
    echo Please ensure you have extracted the full application folder.
    echo.
    pause
    exit /b 1
)

REM Start the application silently (no console window)
start "" /b electron.exe .

REM Exit this batch file
exit /b 0
