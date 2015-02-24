@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: ActivateMaintenance.cmd
::
:: Funktion	: Schreibt das aktuelle Datum in die XenApp Maintenance Aktivierungs-Flagdatei
::            Erstellt geplanten Task zum Start der Maintenance
::
:: Author   : Frank Peter Schultze

IF NOT DEFINED FLAG_FILE EXIT /B 1
SETLOCAL

SET _=%ROOT%
FOR %%i IN (%_%) DO FOR /F "TOKENS=3" %%u IN ('net.exe USE ^| find.exe /I "%%~di"') DO (
	CALL SET _=%%_:%%~di=%%u%%
)
(ECHO %DATE%;%_%)>%FLAG_FILE%

SET _="%TEMP%\tmp.vbe"
ECHO c=#@~^^fAAAAA==	Um.bwDRbMo!h+	Yd`Z#lC1'?askD`mBElJ*)kPxJElwW.PbxF,KG~`AW;U9`Cm*lk'dLZ4D`vZdUovl^^`b#b^&U;Dv/S	o`m^^c!*#*#b)HnXYlU^^DbwO AmtG~kJSYAAA==^^#~@>%_%
FOR /F "TOKENS=*" %%i IN ('%SystemRoot%\system32\cscript.exe //Nologo %_% %SCHTASK_RP%') DO (
	@schtasks.exe /Create /RU %SCHTASK_RU% /RP %%i /SC %SCHTASK_SC% /TN %SCHTASK_TN% /TR %SCHTASK_TR% /F
)
DEL %_%

ENDLOCAL
