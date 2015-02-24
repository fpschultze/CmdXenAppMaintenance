@IF DEFINED DEBUG (ECHO %DEBUG%) ELSE (ECHO OFF)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: XenAppMaintenance.cmd
::
:: Funktion	: XenApp 6 Hotfix Installation Master Script
::
:: Author   : Frank Peter Schultze

SETLOCAL
PUSHD "%~dp0"

:: Framework-Verzeichnisse
SET ROOT=%CD%
SET LIB=%ROOT%\Library
SET CFG=%ROOT%\Config
SET SRC=%ROOT%\Source

:: Log- und Temp-Datei setzen
FOR /F "TOKENS=1-3 DELIMS=.-/" %%i IN ("%DATE%") DO SET _=%%k%%j%%i
SET LOG=%ROOT%\Log\%COMPUTERNAME%\%_%
SET LOG_FILE="%LOG%\%~n0_%_%.log"
SET TMP_FILE="%TEMP%\%~n0_%_%.tmp"

:: Einlesen der globalen Einstellungen aus Settings.ini und
:: optionalen, Terminalserver-spezifischen Einstellungen
SET INI="%CFG%\Settings.ini";"%CFG%\%COMPUTERNAME%.ini"
FOR %%i IN (%INI%) DO CALL "%LIB%\ReadSettings.cmd" %%i

IF /I "%~dpnx0"=="%FRAMEWORK_CACHE%\%~nx0" GOTO :CHECK_FLAG

	MD "%LOG%" 2>NUL
	CALL "%LIB%\Tee.cmd" %~n0 gestartet. Maintenance Mode wird vorbereitet...

	CALL "%LIB%\Tee.cmd" Deaktivierung weiterer Anmeldungen am Terminalserver.
	CALL "%LIB%\DisableLogon.cmd"

	CALL "%LIB%\Tee.cmd" Bestehende Sitzungen informieren.
	CALL "%LIB%\SendWarning.cmd"

	CALL "%LIB%\Tee.cmd" Bestehende Sitzungen abmelden.
	CALL "%LIB%\LogoffSessions.cmd"

	CALL "%LIB%\Tee.cmd" Lokale Kopie des Frameworks erstellen/aktualisieren.
	CALL "%LIB%\SyncFramework.cmd"

	CALL "%LIB%\Tee.cmd" Maintenance Mode aktivieren.
	CALL "%LIB%\ActivateMaintenance.cmd"

	CALL "%LIB%\Tee.cmd" Neustart.
	"%LIB%\Reboot.cmd"

GOTO :END
:CHECK_FLAG

	IF NOT EXIST "%FLAG_FILE%" GOTO :END

	FOR /F "TOKENS=1 DELIMS=;" %%i IN ('TYPE "%FLAG_FILE%"') DO SET _=%%i
	IF NOT %_%==%DATE% GOTO :END

	CALL "%LIB%\Tee.cmd" %~n0 im Maintenance Mode

	CALL "%LIB%\Tee.cmd" Deaktivierung von Anmeldungen am Terminalserver.
	CALL "%LIB%\DisableLogon.cmd"

	CALL "%LIB%\Tee.cmd" Abarbeiten des Source-Ordners.
	CALL "%LIB%\ProcessSourceFolder.cmd"

	CALL "%LIB%\Tee.cmd" Logs kopieren und aufraeumen.
	CALL "%LIB%\CleanUp.cmd"

	CALL "%LIB%\Tee.cmd" Maintenance Mode deaktivieren.
	CALL "%LIB%\DeactivateMaintenance.cmd"

	CALL "%LIB%\Tee.cmd" Fertig. Aktivierung von Anmeldungen am Terminalserver.
	CALL "%LIB%\EnableLogon.cmd"

GOTO :END


:END
POPD
ENDLOCAL
EXIT /B
