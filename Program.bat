@echo off
title Binary to Minecraft Program Code
:RESTART
CLS
echo ================================
echo Binary to Minecraft Program Code
echo ================================
echo.
color 0a
set /p TName=Enter TXT File Name (like "Test.txt"):
if not exist "%TName%" (
    echo File not found!
    pause
    Goto RESTART
)
for %%f in ("%TName%") do set "BaseName=%%~nf"
mkdir %BaseName%
cd %BaseName%
set "RendCom=%BaseName%_RendCom.txt" 
set "MineProgram=%BaseName%_MineProgram.txt"
copy "..\%TName%" "%RendCom%"
for /f "usebackq delims=" %%A in ("%RendCom%") do (
set "line=%%A"
set "line=!line:*:=!"
for /f "delims=:" %%B in ("%%A") do echo %%B >> "Temp.txt"
)
copy "%RendCom%" "%BaseName%.txt"
copy "Temp.txt" "%RendCom%"
del Temp.txt

pause

