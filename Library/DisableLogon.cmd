@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: DisableLogon.cmd
::
:: Funktion	: Verhindert Aufbau neuer Sitzungen
::
:: Author   : Frank Peter Schultze

change.exe LOGON /DISABLE
