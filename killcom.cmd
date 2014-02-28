@echo off
%SystemRoot%\System32\iisreset.exe -stop
net stop comsysapp
net stop msdtc 
net stop "TTI WCF Host Service"
taskkill -im WebDev.WebServer40.EXE -f
taskkill -im dllhost.exe -f
taskkill -im w3wp.exe -f  
net start msdtc
net start comsysapp
net start "TTI WCF Host Service"
%SystemRoot%\System32\iisreset.exe -start
