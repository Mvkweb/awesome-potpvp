@echo off
setlocal enabledelayedexpansion

:: Check if git repository
git rev-parse --is-inside-work-tree >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Error: Not a git repository.
    pause
    exit /b 1
)

:: Get current branch
for /f "tokens=*" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

:: If branch is master, main, or merged, ask for branch
if "%CURRENT_BRANCH%"=="master" set NEED_BRANCH=1
if "%CURRENT_BRANCH%"=="main" set NEED_BRANCH=1
if "%CURRENT_BRANCH%"=="merged" set NEED_BRANCH=1
if "%CURRENT_BRANCH%"=="" set NEED_BRANCH=1

if defined NEED_BRANCH (
    set /p BRANCH_NAME="Enter your personal branch name (e.g. Japonya): "
    if "!BRANCH_NAME!"=="" (
        echo Branch name cannot be empty.
        pause
        exit /b 1
    )
    git checkout !BRANCH_NAME! 2>nul || git checkout -b !BRANCH_NAME!
    set CURRENT_BRANCH=!BRANCH_NAME!
)

:: Count number of .zip files
set PACK_COUNT=0
for %%f in (*.zip) do set /a PACK_COUNT+=1

echo Staging files...
git add .

:: Check if there are changes
git diff-index --quiet HEAD --
if %ERRORLEVEL% EQU 0 (
    echo No changes to commit^^!
    pause
    exit /b 0
)

echo Committing...
git commit -m "Updated !PACK_COUNT! packs"

echo Pushing to branch: %CURRENT_BRANCH%...
git push origin %CURRENT_BRANCH%

echo Done^^! GitHub is now merging your new packs.
pause
