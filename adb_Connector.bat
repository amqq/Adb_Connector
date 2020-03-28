::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJH2B50s3Jh5GDBCNM2epOrkT7+fH5umIrHE0V+0xR96V07eBQA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZkoaHWQ=
::ZQ05rAF9IBncCkqN+0xwdVsFAlXMbQs=
::ZQ05rAF9IAHYFVzEqQIRLBlrbwuMMm65EroOiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDCWGPlSZCbsS7evv4Pjn
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIRaAtGQwOQPWb6ALoOqOv04eSCoVkUWuV/eYvZmqCBYOUe/0nlYZk/tg==
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATE1W8BGXs=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmi/VAjPFtxVAGBKX+/Zg==
::Zh4grVQjdCuDJGmW+0UiKRZdQgO+HmquBb0g6ez50OSIunE8UOAAW4DV1LGNNO8BpED8cPY=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
Rem Today is 2020 March 28
Rem Creator Alireza Rajabi Majd! From kernell32.ir
Rem Scripting For adb Connection
TITLE Adb_Connector v1.1.1
color 1F
mode con cols=120 lines=30
:=========================================================================================================================================
:Main
cls
echo.      
echo.                 
echo.                     _________________________________________________________
echo.                    ^|                                                         ^|
Echo.                    ^|   [1] Start For Connecting adb to NOXPlayer             ^|
Echo.                    ^|                                                         ^|
Echo.                    ^|   [2] adb Devices                                       ^|  
Echo.                    ^|                                                         ^|
Echo.                    ^|   [3] kill adb tasks                                    ^|
Echo.                    ^|                   _______________                       ^|
echo.                    ^|                                                         ^| 
Echo.                    ^|   [4] About this Program                                ^|
Echo.                    ^|                                                         ^|
Echo.                    ^|   [5] See My resume in My weblog                        ^|
Echo.                    ^|                                                         ^|
Echo.                    ^|   [6] Source Code and Updates                           ^|
Echo.                    ^|                   _______________                       ^|
echo.                    ^|                                                         ^|  
Echo.                    ^|                                                         ^|
Echo.                    ^|   [7] Exit                                              ^|
Echo.                    ^|_________________________________________________________^|
ECHO.            
choice /C:1234567 /N /M ".                    Enter Your Choice [1,2,3,4,5,6,7] : "
if errorlevel 7 goto:Exit
if errorlevel 6 goto:Source
if errorlevel 5 goto:weblog
if errorlevel 4 goto:About
if errorlevel 3 goto:Kill
if errorlevel 2 goto:Devices
if errorlevel 1 goto:Local_place
:======================================================================================================================================================
:About
Cls
echo.        ==================================================================================
echo.                                         About Text:
echo.                   This is a program for automatic connecting ADB to a emulator.
echo.               Unfortunately, this software currently only supports the NOX emulator.
echo.                  Welcome to this software, we will develop it for other emulators.
echo.        ==================================================================================
ECHO.
echo  Press any key to back mainmenu...
pause >nul
GOTO Main
:=========================================================================================================================================
:local_Place
cls
SET Localplace=%cd%
IF Exist adb.exe (
SET AdbPlace=%Localplace%
GoTO Connector
) ELSE (
GoTO Find_adb
)
:=========================================================================================================================================
:Find_adb
Echo  Adb_Connector can`t find adb.exe on this directory...
set /p AdbPlace= Enter Your adb Directory : 
Pushd %AdbPlace%
IF Exist adb.exe (
GoTO Connector
) Else (
GoTO Find_adb
)
:=========================================================================================================================================
:Connector
Echo Getting NoxPlayer tasks pid...
for /F "TOKENS=1,2,*" %%a in ('tasklist /FI "IMAGENAME eq nox_adb.exe"') do set NoxPID=%%b
if "%NoxPID%"=="No" (
	Echo Adb_Connector can`t find Nox_adb on your tasks, So Adb_Connector trying to Connect adb to nox with other plan...
	Echo Connecting...
	If Exist %Localplace%\Nox_ports (
		For /F "TOKENS=*" %%a in (%Localplace%\Nox_ports) do adb connect %%a
	) ELSE (
	ECHO Can`t Found File Nox_ports...!
	echo Press any key to back mainmenu...
	pause >nul
	GoTO Main
	)
) ELSE (
Echo Connecting...
for /F "tokens=3" %%C in ('netstat -a -n -o ^| findstr /PID %NoxPID%') do (
adb connect %%C
)
)
:=========================================================================================================================================
:Devices
cls
@echo On
adb devices
@echo off
Echo If you didn`t see your device in adb devices , You can Contact developer on Telegram with id : @amqq3233
Echo To change source for you , it`s free!
Echo Thanks For Use...
echo Press any key to back mainmenu...
pause >nul
GOTO Main
:=========================================================================================================================================
:Kill
cls
echo killing...
for /F "TOKENS=1,2,*" %%a in ('tasklist /FI "IMAGENAME eq adb.exe"') do SET AdbPID=%%b
if "%AdbPID%"=="No" (
ECHO Can`t killing ADB.exe becouse it isn`t run.
echo Press any key to back mainmenu...
pause >nul
GOTO Main
) Else (
taskkill /F /PID %AdbPID%
ECHO Killing Success!
echo Press any key to back mainmenu...
pause >nul
GOTO Main
)
:=========================================================================================================================================
:Weblog
Start https://kernell32.ir
GOTO Main
:=========================================================================================================================================
:Source
start https://github.com/amqq/Adb_Connector.git
goto Main
:=========================================================================================================================================
:Exit