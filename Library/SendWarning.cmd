@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: SendWarning.cmd
::
:: Funktion	: Warnung an Sitzungen senden.
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED FIRST_WARNING_BEFORE_REBOOT EXIT /B
IF NOT DEFINED REMINDER_WARNING_INTERVAL EXIT /B

FOR /L %%i IN (%FIRST_WARNING_BEFORE_REBOOT%,-%REMINDER_WARNING_INTERVAL%,0) DO IF %%i GTR 0 CALL :InvokeMsg %%i
EXIT /B

:InvokeMsg
SETLOCAL

	CALL "%LIB%\CheckSessions.cmd"
	IF NOT ERRORLEVEL 1 GOTO :Exit_InvokeMsg

	SET REMAINING_MINUTES=%1
	CALL SET WARN_MESSAGE=%%WARN_MESSAGE:{m}=%REMAINING_MINUTES%%%
	SET /A WAIT_SECONDS = %REMINDER_WARNING_INTERVAL% * 60
	SET /A WARN_SECONDS = %WAIT_SECONDS% - 5

	CALL "%LIB%\Tee.cmd" Meldung an Sitzungen: %WARN_MESSAGE%
	msg.exe * /TIME:%WARN_SECONDS% /V %WARN_MESSAGE%

	CALL "%LIB%\Delay.cmd" %WAIT_SECONDS%

:Exit_InvokeMsg
ENDLOCAL
GOTO :EOF
