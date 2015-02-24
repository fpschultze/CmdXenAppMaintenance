@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: ProcessSourceFolder.cmd
::
:: Funktion	: Abarbeiten der Unterverzeichnisse im Source-Ordner
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED SRC EXIT /B 1

FOR /F %%i IN ('DIR %SRC% /AD /ON /B') DO CALL :ProcessSubDir "%%~i"
EXIT /B

:ProcessSubDir
SETLOCAL

	SET FOLDER=%~1

	FOR /F "TOKENS=2 DELIMS=_" %%i IN ("%FOLDER%") DO CALL :InvokeAction %%i "%SRC%\%FOLDER%"

ENDLOCAL
GOTO :EOF

:InvokeAction
SETLOCAL

	SET ACTION=%LIB%\%1.cmd
	SET FOLDER=%~2

	IF EXIST "%ACTION%" (
		CALL "%ACTION%" "%FOLDER%"
		IF DEFINED RESTART_REQUIRED "%LIB%\Reboot.cmd"
	) ELSE (
		CALL "%LIB%\Tee.cmd" Datei existiert nicht - %ACTION%
	)

ENDLOCAL
GOTO :EOF
