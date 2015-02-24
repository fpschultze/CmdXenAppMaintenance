@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: LogoffSessions.cmd
::
:: Funktion	: Sitzungen abmelden
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED TMP_FILE EXIT /B 1

query.exe USER >%TMP_FILE% 2>&1
FOR /F %%i IN ('find.exe /C /V "" ^<%TMP_FILE%') DO IF %%i LEQ 1 GOTO :END
FOR /F "TOKENS=2,3 SKIP=1" %%i IN ('TYPE %TMP_FILE%') DO CALL :InvokeLogoff %%i %%j

:END
EXIT /B


:InvokeLogoff
SETLOCAL

	SET NAME=%1
	SET ID=%2

	IF /I NOT %SESSIONNAME%==%NAME% (
		CALL "%LIB%\Tee.cmd" Session wird abgemeldet - %NAME% [%ID%]
		START /MIN %ComSpec% /C logoff.exe %ID% /V
	)

ENDLOCAL
GOTO :EOF
