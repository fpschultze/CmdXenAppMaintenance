@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: EnableLogon.cmd
::
:: Funktion	: Erlaubt Aufbau neuer Sitzungen
::
:: Author   : Frank Peter Schultze

change.exe LOGON /ENABLE
