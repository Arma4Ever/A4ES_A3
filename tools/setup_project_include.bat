@echo off
SETLOCAL EnableDelayedExpansion

SET "defaultSourceDir=C:\Dev\Arma4Ever\ACE3\addons"
SET "defaultDestDir=C:\Dev\Arma4Ever\A4ES\include\z\ace\addons"

echo Enter source directory [%defaultSourceDir%]: 
set /p "sourceDir="
if "!sourceDir!"=="" set "sourceDir=%defaultSourceDir%"

echo Enter destination directory [%defaultDestDir%]: 
set /p "destDir="
if "!destDir!"=="" set "destDir=%defaultDestDir%"

echo Clearing the destination directory...
rd /s /q "%destDir%"

mkdir "%destDir%"

SET "files=script_mod.hpp script_component.hpp script_macros.hpp script_version.hpp script_macros_medical.hpp script_debug.hpp defineResinclDesign.inc XEH_PREP.hpp"

FOR %%f IN (%files%) DO (
    FOR /R "%sourceDir%" %%i IN (%%f) DO (
        SET "destPath=%%i"
        SET "destPath=!destPath:%sourceDir%=%destDir%!"
        xcopy "%%i" "!destPath!" /I /Y
    )
)

echo Operation completed.
ENDLOCAL