@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: SyncFramework.cmd
::
:: Funktion	: Framework inkl. Sourcen lokal kopieren
::
:: Author   : Frank Peter Schultze

robocopy.exe %ROOT% %FRAMEWORK_CACHE% /MIR
