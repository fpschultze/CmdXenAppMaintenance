@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: DeactivateMaintenance.cmd
::
:: Funktion	: Loescht den Geplanten Task zum Starten der Maintenance
::
:: Author   : Frank Peter Schultze

schtasks.exe /Query /TN %SCHTASK_TN% >NUL && schtasks.exe /Delete /TN %SCHTASK_TN% /F
