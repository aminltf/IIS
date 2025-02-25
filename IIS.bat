@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script must be run as Administrator!
    pause
    exit /b
)

sc query W3SVC >nul 2>&1
if %errorLevel% neq 0 (
    echo IIS is not installed on this system.
    echo Please install IIS first.
    pause
    exit /b
)

:menu
cls
echo ==============================================
echo              IIS Management Script
echo ==============================================
echo 1. Install and Enable IIS
echo 2. List All IIS Sites
echo 3. Add a New Website
echo 4. Remove a Website
echo 5. Start IIS
echo 6. Stop IIS
echo 7. Restart IIS
echo 8. Backup IIS Configuration
echo 9. Restore IIS Configuration
echo 10. Exit
echo ==============================================
set /p choice="Enter your choice (1-10): "

if "%choice%"=="1" goto install_iis
if "%choice%"=="2" goto list_sites
if "%choice%"=="3" goto add_site
if "%choice%"=="4" goto remove_site
if "%choice%"=="5" goto start_iis
if "%choice%"=="6" goto stop_iis
if "%choice%"=="7" goto restart_iis
if "%choice%"=="8" goto backup_iis
if "%choice%"=="9" goto restore_iis
if "%choice%"=="10" exit
echo Invalid choice! Please enter a number between 1-10.
pause
goto menu

:install_iis
echo Installing IIS...
dism /online /enable-feature /featurename:IIS-WebServer /all >nul 2>&1
if %errorLevel% neq 0 (
    echo Failed to install IIS.
) else (
    echo IIS installed successfully!
)
pause
goto menu

:list_sites
echo Listing all IIS sites...
powershell -Command "try { Get-WebSite | Format-Table Id, Name, State, PhysicalPath, Bindings } catch { Write-Host 'Error: IIS is not available.' }"
pause
goto menu

:add_site
set /p sitename="Enter site name: "
if "%sitename%"=="" (
    echo Site name cannot be empty!
    pause
    goto menu
)
set /p port="Enter port number (default 80): "
if "%port%"=="" set port=80
set /p path="Enter physical path (e.g., C:\inetpub\wwwroot\mysite): "
if not exist "%path%" (
    echo The specified path does not exist!
    pause
    goto menu
)

powershell -Command "try { New-WebSite -Name '!sitename!' -Port !port! -PhysicalPath '!path!' -Force; Write-Host 'Site added successfully!' } catch { Write-Host 'Error adding site: $_' }"
pause
goto menu

:remove_site
set /p sitename="Enter site name to remove: "
if "%sitename%"=="" (
    echo Site name cannot be empty!
    pause
    goto menu
)

powershell -Command "try { Remove-WebSite -Name '!sitename!'; Write-Host 'Site removed successfully!' } catch { Write-Host 'Error removing site: $_' }"
pause
goto menu

:start_iis
echo Starting IIS...
iisreset /start >nul 2>&1
if %errorLevel% neq 0 (
    echo Failed to start IIS.
) else (
    echo IIS Started successfully!
)
pause
goto menu

:stop_iis
echo Stopping IIS...
iisreset /stop >nul 2>&1
if %errorLevel% neq 0 (
    echo Failed to stop IIS.
) else (
    echo IIS Stopped successfully!
)
pause
goto menu

:restart_iis
echo Restarting IIS...
iisreset >nul 2>&1
if %errorLevel% neq 0 (
    echo Failed to restart IIS.
) else (
    echo IIS Restarted successfully!
)
pause
goto menu

:backup_iis
set /p backupfile="Enter backup filename: "
if "%backupfile%"=="" (
    echo Backup filename cannot be empty!
    pause
    goto menu
)

powershell -Command "try { Backup-WebConfiguration -Name '!backupfile!'; Write-Host 'Backup created successfully!' } catch { Write-Host 'Error creating backup: $_' }"
pause
goto menu

:restore_iis
set /p backupfile="Enter backup filename to restore: "
if "%backupfile%"=="" (
    echo Backup filename cannot be empty!
    pause
    goto menu
)

powershell -Command "try { Restore-WebConfiguration -Name '!backupfile!'; Write-Host 'Backup restored successfully!' } catch { Write-Host 'Error restoring backup: $_' }"
pause
goto menu
