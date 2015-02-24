@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: CheckMsp.cmd
::
:: Funktion	: Prueft ob der XenApp Hotfix bereits installiert ist
::
:: Author   : Frank Peter Schultze

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Citrix\ProductCodes\Hotfixes\%1
