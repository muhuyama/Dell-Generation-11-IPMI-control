#Simple Dell Gen 11 IPMI control script
#Tested on: R410
#Scripted by u/muhuyama (reddit), 




@echo off 
cls
title IPMI control
:setIP
set /P IP=Please enter the IP of the server you are trying to access:
echo Your Host IP Has Been Set
pause
cls

:setUN
set /P UN=Please enter the username of the server you are trying to access:
echo Your Host Username Has Been Set
pause
cls

:setPW
set /P PW=Please enter the password of the server you are trying to access:
echo Your Host Password Has Been Set
pause
cls

:begin
cls
echo Select Mode:
echo     1) Chassis Status + Sensor Readings  
echo     2) Fan Control        
echo     3) Power   
echo     4) EZ boot   
echo     5) Custom Command                                          
echo.
echo You can always return to this menu by inputting "exit"
set /P input=Enter Mode:
if "%input%"=="1" goto inCS
if "%input%"=="2" goto inFC
if "%input%"=="3" goto inPR
if "%input%"=="4" goto inEZ
if "%input%"=="5" goto inCC
echo Invalid input
pause
cls
goto begin
:inCS
	cls
	echo Checking Chassis Status
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% chassis status
	echo Continue to Sensor Readings?
	pause
	echo Checking Sensors
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% sensor
	pause
	cls
	goto begin
:inFC
	cls
	echo Select a Fan Mode Setting:
	echo     1) 4000 RPM   
	echo     2) 2400 RPM                 
	echo     3) 1800 RPM                 
	echo     4) 1500 RPM
	echo     5) 1200 RPM                 
	echo     6) 0 RPM 
	set /P input=Enter Mode:
	if "%input%"=="1" goto FC1
	if "%input%"=="2" goto FC2
	if "%input%"=="3" goto FC3
	if "%input%"=="4" goto FC4
	if "%input%"=="5" goto FC5
	if "%input%"=="6" goto FC6
	if "%input%"=="exit" goto begin               
	:FC1

		cls
		echo Setting Fan RPM to 4000
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x1a
		pause
		cls
		goto begin

	:FC2

		cls
		echo Setting Fan RPM to 2400
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x10
		pause
		cls
		goto begin

	:FC3

		cls
		echo Setting Fan RPM to 1800
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x0C
		pause
		cls
		goto begin

	:FC4

		cls
		echo Setting Fan RPM to 1500
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x0A
		pause
		cls
		goto begin

	:FC5

		cls
		echo Setting Fan RPM to 1200
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x09
		pause
		cls
		goto begin

	:FC6

		cls
		echo Setting Fan RPM to OFF
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x0
		pause
		cls
		goto begin
:inPR
cls
	echo Select an option:
	echo     1) Status   
	echo     2) Power ON 
	echo     3) Power OFF (hard)
	echo     4) Power OFF (soft)                            
	echo     5) Power CYCLE (cold)
	echo     6) Power CYCLE (warm)

	set /P input=Enter Mode:
	if "%input%"=="1" goto PR1
	if "%input%"=="2" goto PR2
	if "%input%"=="3" goto PR3
	if "%input%"=="4" goto PR4
	if "%input%"=="5" goto PR5  
	if "%input%"=="6" goto PR6 
	if "%input%"=="exit" goto begin 
          
	:PR1

		cls
		echo Checking Power Status
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power status
		pause
		cls
		goto begin

	:PR2

		cls
		echo Turning ON
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power on
		pause
		cls
		goto begin

	:PR3

		cls
		echo Turning OFF (hard)
		echo Ensure you are ready to shut down
		pause
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power off
		pause
		cls
		goto begin

	:PR4

		cls
		echo Turning OFF (soft)
		echo Ensure you are ready to shut down
		pause
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power soft
		pause
		cls
		goto begin
	:PR5

		cls
		echo Rebooting (cold)
		echo Ensure you are ready to reboot
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power cycle
		pause
		cls
		goto begin

	:PR6

		cls
		echo Rebooting (warm)
		echo Ensure you are ready to reboot
		C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power reset
		pause
		cls
		goto begin
:inEZ
	cls
	echo Turning on your server
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% power on
	timeout /t 5 /nobreak
	echo Setting the fan RPM to 2500
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x01 0x00
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% raw 0x30 0x30 0x02 0xff 0x10
	echo Checking Chassis Status
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% chassis status
	echo System has been booted
	pause
	cls
	goto begin
:inCC
	cls
	set /P input=Enter Custom IPMI command (help for help, exit to exit):
	if "%input%"=="exit" goto begin
	C:\"Program Files (x86)"\Dell\SysMgt\bmc\ipmitool -I lanplus -H %IP% -U %UN% -P %PW% %input%
	pause
	cls
	goto begin

echo an error has occured, you will be sent to the home page
pause
gotobegin