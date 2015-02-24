@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: MaintenanceReboot.cmd
::
:: Funktion	: Computer neu starten
::
:: Author   : Frank Peter Schultze

START /MIN %ComSpec% /C shutdown.exe /r /f /t %UNLOAD_PROFILE_DELAY%

:LOOP
PAUSE >NUL
GOTO :LOOP
