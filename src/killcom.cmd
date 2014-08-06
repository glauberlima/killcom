@echo off
rem Please run as administrator, bitch!
%SystemRoot%\System32\iisreset.exe -stop
net stop comsysapp
net stop msdtc
net stop "TTI WCF Host Service"
taskkill -im WebDev.WebServer40.EXE -f
taskkill -im dllhost.exe -f
taskkill -im w3wp.exe -f
for /d %%i in ("%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\Temporary ASP.NET Files\*") do rd /s /q "%%i"
for /d %%i in ("%SystemRoot%\Microsoft.NET\Framework64\v4.0.30319\Temporary ASP.NET Files\*") do rd /s /q "%%i"
msdtc -resetlog
net start msdtc
net start comsysapp
net start "TTI WCF Host Service"
%SystemRoot%\System32\iisreset.exe -start
