@ECHO OFF
REM Created by amqq From kernell32.ir
REM amqq in github.com
REM This is a tool to connect your ide (B4a) to nox 
REM Today is 2020 MAY 14
::-------------------------------------------------------------------------------------------------------------------
:SET_DESIGN
TITLE Auto ADB to NOX connector - v1.1.1
COLOR 1F
MODE con cols=120 lines=30
ECHO.
::-------------------------------------------------------------------------------------------------------------------
:: CHECK REQUIRMENTS =>
::-------------------------------------------------------------------------------------------------------------------
:CHECK_ADB
ECHO. Checking adb.exe in this place...
IF Exist adb.exe (
    GOTO CHECK_NOX
) ELSE (
    GOTO CANT_FIND_ADB
)
::-------------------------------------------------------------------------------------------------------------------
:CHECK_NOX
ECHO. Getting NoxPlayer tasks pid...
for /F "TOKENS=1,2,*" %%a in ('tasklist /FI "IMAGENAME eq nox_adb.exe"') do set NoxPID=%%b
if "%NoxPID%"=="No" (
	GOTO CANT_FIND_NOX
	)
) ELSE (
    GOTO REALTIME_CONNECTION
)

::-------------------------------------------------------------------------------------------------------------------
:: CONNECTIONS =>
::-------------------------------------------------------------------------------------------------------------------
:DATA_CONNECTION
ECHO. Setting nox ports data...
(
ECHO 50797
ECHO 50796
ECHO 62001
ECHO 50805
ECHO 50804
ECHO 5581
ECHO 51505
ECHO 51504
ECHO 62025
ECHO 51513
ECHO 51512
ECHO 5577
ECHO 51843
ECHO 51842
ECHO 62026
ECHO 51851
ECHO 51850
ECHO 5571
)>Nox_Ports.data
ECHO. Connecting with default ports data...
ECHO. this mode takes minutes...
For /F "TOKENS=*" %%a in (Nox_Ports.data) do adb connect 127.0.0.1:%%a
DEL Nox_Ports.data
GOTO DEVICES
::-------------------------------------------------------------------------------------------------------------------
:REALTIME_CONNECTION
ECHO. Connecting with realtime mode ...
for /F "tokens=3" %%C in ('netstat -a -n -o ^| findstr /PID %NoxPID%') do (
    adb connect %%C
)
GOTO DEVICES
::-------------------------------------------------------------------------------------------------------------------
:: CONNECTED DEVICES =>
::-------------------------------------------------------------------------------------------------------------------
:DEVICES
@ECHO ON
adb devices
@ECHO OFF
ECHO. ADB connectors job is finnished !
ECHO. if you cant see your devices in device list , You should restart your pc and do this steps :
ECHO. 1. Start your nox player
ECHO. 2. Start B4a
ECHO. 3. Start auto_nox_connector.
ECHO. If you see this help again you should check your b4a setting and make sure your SDK is OK!
ECHO. OR you can conact me on telegram with id : @amqq3233 or kernell32.ir
ECHO. I hope you Enjoy!!!
ECHO.
ECHO. Press any key to exit
pause >nul
exit
::-------------------------------------------------------------------------------------------------------------------
:: ERRORS =>
::-------------------------------------------------------------------------------------------------------------------
:CANT_FIND_NOX
COLOR 0e
ECHO.
ECHO. ===========
ECHO. WARNING :
ECHO.
ECHO. Adb connector can`t find NoxPlayer on your systems tasklist...
ECHO. Adb connector trying to make Connection with another plan!
pause
GOTO DATA_CONNECTION
::-------------------------------------------------------------------------------------------------------------------
:CANT_FIND_ADB
COLOR 0C
ECHO.
ECHO. =========
ECHO. ERROR :
ECHO.
ECHO. Adb_Connector can`t find adb.exe on in this directory!
ECHO. please copy this connector to platfom-tools folder in
ECHO. your Android SDK folder.
ECHO.
ECHO. Press any key to exit
PAUSE >nul
exit
::-------------------------------------------------------------------------------------------------------------------
