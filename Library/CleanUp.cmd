@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: CleanUp.cmd
::
:: Funktion	: Aufraeumen und Log-Dateien ins Netz kopieren
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED FLAG_FILE EXIT /B 1
SETLOCAL

:: Aeltestes Log-Verzeichnis loeschen
FOR /F "TOKENS=*" %%i IN ('echo %LOG%') DO SET _=%%~dpi
SET _=%_:~,-1%
FOR /F "TOKENS=* SKIP=%KEEP_LOG_DIRS%" %%i IN ('DIR "%_%" /AD /O-D /B') DO RMDIR /S /Q "%_%\%%i"

:: Log-Verzeichnisse (inkl. des neuesten) ins Netz kopieren
FOR /F "TOKENS=2 DELIMS=;" %%i IN ('TYPE "%FLAG_FILE%"') DO CALL SET REMOTELOG=%%_:%ROOT%=%%i%%
robocopy.exe %_% %REMOTELOG% /MIR

DEL "%FLAG_FILE%"
IF EXIST "%TMP_FILE%" DEL "%TMP_FILE%"

ENDLOCAL
