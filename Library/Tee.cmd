@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: Tee.cmd
::
:: Funktion	: Ausgabe einer Meldung an Konsole und Logfile
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED LOG_FILE EXIT /B

ECHO %*
(ECHO %DATE% %TIME% -- %*)>>%LOG_FILE%
