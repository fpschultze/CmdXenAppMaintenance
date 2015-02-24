@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: CheckSessions.cmd
::
:: Funktion	: Setzt Errorlevel auf Anzahl der bestehenden Sitzungen
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED TMP_FILE EXIT /B 1
SETLOCAL

query.exe USER >%TMP_FILE% 2>&1

FOR /F %%i IN ('find.exe /C /V "" ^<%TMP_FILE%') DO SET /A SESSIONS = %%i - 1

CALL "%LIB%\Tee.cmd" Anzahl Sitzungen: %SESSIONS%

ENDLOCAL & EXIT /B %SESSIONS%
