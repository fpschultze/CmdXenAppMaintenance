@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: Delay.cmd
::
:: Funktion	: Eine Anzahl von Sekunden warten
::
:: Author   : Frank Peter Schultze

SETLOCAL

SET DEFAULT_WAIT_SECONDS=5
SET ICMP_REQUESTS=%1
IF NOT DEFINED ICMP_REQUESTS (SET ICMP_REQUESTS=%DEFAULT_WAIT_SECONDS%)
SET /A ICMP_REQUESTS += 1

ping.exe -n %ICMP_REQUESTS% 127.0.0.1 >NUL

ENDLOCAL
