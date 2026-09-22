@echo off
cd /d "%~dp0"

echo Checking for changes to events.csv...
git add events.csv

git diff --cached --quiet
if %errorlevel%==0 (
    echo No changes found in events.csv - nothing to update.
    pause
    exit /b 0
)

git commit -m "Update events"
if errorlevel 1 (
    echo Something went wrong committing the change.
    pause
    exit /b 1
)

echo Pushing to GitHub...
git push
if errorlevel 1 (
    echo Push failed - check your internet connection or GitHub sign-in.
    pause
    exit /b 1
)

echo.
echo Done! The site will update automatically in a minute or two:
echo https://m-tripp-midtronics.github.io/office-events/
pause
