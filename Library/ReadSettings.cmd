@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: ReadSettings.cmd
::
:: Funktion	: Setzt die Settings aus den angegebenen INI-Dateien als Umgebungsvariablen
::
:: Author   : Frank Peter Schultze

FOR %%i IN (%*) DO IF EXIST %%i CALL :ProcessIniFile %%i
EXIT /B

:ProcessIniFile
FOR /F "TOKENS=1,2 DELIMS== EOL=;" %%i IN ('TYPE %1') DO CALL :SetEnvVar %%i "%%~j"
GOTO :EOF

:SetEnvVar
SET %1=%~2
GOTO :EOF
