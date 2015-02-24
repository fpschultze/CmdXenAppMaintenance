@IF /I "%DEBUG%"=="ON" (@ECHO Start %~nx0: & @PAUSE)

:: XenApp 6 Hotfix Installation Framework
:: ======================================
::
:: Name		: InstallMsi.cmd
::
:: Funktion	: Installation einer MSI-Datei
::
:: Author   : Frank Peter Schultze

SETLOCAL
PUSHD "%~1"

SET RESTART_REQUIRED=

FOR %%i IN (*.msi) DO (
	SET MSISOURCE_FullName=%%~fi
	SET MSISOURCE_Name=%%~ni
)

IF NOT DEFINED MSISOURCE_FullName (
	CALL "%LIB%\Tee.cmd" Keine MSI-Datei gefunden in %CD%
	GOTO :END
)

SET MSILOG=%LOG%\%MSISOURCE_Name%.log

IF EXIST "%MSILOG%" (
	CALL "%LIB%\Tee.cmd" Schon installiert - %MSISOURCE_Name%
	GOTO :END
)

:: Optionale Settings aus InstallMsi.ini lesen (setzt TRANSFORMS und PARAMETERS)
FOR %%i IN (%~n0.ini) DO CALL "%LIB%\ReadSettings.cmd" %%i

FOR %%i IN (%TRANSFORMS%) DO SET TRANSFORMS=TRANSFORMS="%%~fi"

SET ARGUMENTLIST=/i "%MSISOURCE_FullName%" %TRANSFORMS% %PARAMETERS% /QN REBOOT=ReallySuppress /liewa "%MSILOG%"

CALL "%LIB%\Tee.cmd" msiexec wird gestartet mit %ARGUMENTLIST%
START /WAIT msiexec.exe %ARGUMENTLIST%
SET MSIEXIT=%ERRORLEVEL%

CALL "%LIB%\Tee.cmd" %MSISOURCE_Name%: Exitcode %MSIEXIT%
IF %MSIEXIT%==0 (
	CALL "%LIB%\Tee.cmd" Installation successfull.
	GOTO :END
)
IF %MSIEXIT%==3010 (
	CALL "%LIB%\Tee.cmd" A restart is required to complete the install.
	SET RESTART_REQUIRED=1
	GOTO :END
)
IF %MSIEXIT%==1601 (
	CALL "%LIB%\Tee.cmd" The Windows Installer service could not be accessed. Contact your support personnel to verify that the Windows Installer service is properly registered.
	GOTO :END
)
IF %MSIEXIT%==1602 (
	CALL "%LIB%\Tee.cmd" User cancel installation.
	GOTO :END
)
IF %MSIEXIT%==1603 (
	CALL "%LIB%\Tee.cmd" Fatal error during installation.
	GOTO :END
)
IF %MSIEXIT%==1604 (
	CALL "%LIB%\Tee.cmd" Installation suspended, incomplete.
	GOTO :END
)
IF %MSIEXIT%==1605 (
	CALL "%LIB%\Tee.cmd" This action is only valid for products that are currently installed.
	GOTO :END
)
IF %MSIEXIT%==1606 (
	CALL "%LIB%\Tee.cmd" Feature ID not registered.
	GOTO :END
)
IF %MSIEXIT%==1607 (
	CALL "%LIB%\Tee.cmd" Component ID not registered.
	GOTO :END
)
IF %MSIEXIT%==1608 (
	CALL "%LIB%\Tee.cmd" Unknown property.
	GOTO :END
)
IF %MSIEXIT%==1609 (
	CALL "%LIB%\Tee.cmd" Handle is in an invalid state.
	GOTO :END
)
IF %MSIEXIT%==1610 (
	CALL "%LIB%\Tee.cmd" The configuration data for this product is corrupt. Contact your support personnel.
	GOTO :END
)
IF %MSIEXIT%==1611 (
	CALL "%LIB%\Tee.cmd" Component qualifier not present.
	GOTO :END
)
IF %MSIEXIT%==1612 (
	CALL "%LIB%\Tee.cmd" The installation source for this product is not available. Verify that the source exists and that you can access it.
	GOTO :END
)
IF %MSIEXIT%==1613 (
	CALL "%LIB%\Tee.cmd" This installation package cannot be installed by the Windows Installer service. You must install a Windows service pack that contains a newer version of the Windows Installer service.
	GOTO :END
)
IF %MSIEXIT%==1614 (
	CALL "%LIB%\Tee.cmd" Product is uninstalled.
	GOTO :END
)
IF %MSIEXIT%==1615 (
	CALL "%LIB%\Tee.cmd" SQL query syntax invalid or unsupported.
	GOTO :END
)
IF %MSIEXIT%==1616 (
	CALL "%LIB%\Tee.cmd" Record field does not exist.
	GOTO :END
)
IF %MSIEXIT%==1618 (
	CALL "%LIB%\Tee.cmd" Another installation is already in progress. Complete that installation before proceeding with this install.
	GOTO :END
)
IF %MSIEXIT%==1619 (
	CALL "%LIB%\Tee.cmd" This installation package could not be opened. Verify that the package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer package.
	GOTO :END
)
IF %MSIEXIT%==1620 (
	CALL "%LIB%\Tee.cmd" This installation package could not be opened. Contact the application vendor to verify that this is a valid Windows Installer package.
	GOTO :END
)
IF %MSIEXIT%==1621 (
	CALL "%LIB%\Tee.cmd" There was an error starting the Windows Installer service user interface. Contact your support personnel.
	GOTO :END
)
IF %MSIEXIT%==1622 (
	CALL "%LIB%\Tee.cmd" Error opening installation log file. Verify that the specified log file location exists and is writable.
	GOTO :END
)
IF %MSIEXIT%==1623 (
	CALL "%LIB%\Tee.cmd" This language of this installation package is not supported by your system.
	GOTO :END
)
IF %MSIEXIT%==1624 (
	CALL "%LIB%\Tee.cmd" Error applying transforms. Verify that the specified transform paths are valid.
	GOTO :END
)
IF %MSIEXIT%==1625 (
	CALL "%LIB%\Tee.cmd" This installation is forbidden by system policy. Contact your system administrator.
	GOTO :END
)
IF %MSIEXIT%==1626 (
	CALL "%LIB%\Tee.cmd" Function could not be executed.
	GOTO :END
)
IF %MSIEXIT%==1627 (
	CALL "%LIB%\Tee.cmd" Function failed during execution.
	GOTO :END
)
IF %MSIEXIT%==1628 (
	CALL "%LIB%\Tee.cmd" Invalid or unknown table specified.
	GOTO :END
)
IF %MSIEXIT%==1629 (
	CALL "%LIB%\Tee.cmd" Data supplied is of wrong type.
	GOTO :END
)
IF %MSIEXIT%==1630 (
	CALL "%LIB%\Tee.cmd" Data of this type is not supported.
	GOTO :END
)
IF %MSIEXIT%==1631 (
	CALL "%LIB%\Tee.cmd" The Windows Installer service failed to start. Contact your support personnel.
	GOTO :END
)
IF %MSIEXIT%==1632 (
	CALL "%LIB%\Tee.cmd" The temp folder is either full or inaccessible. Verify that the temp folder exists and that you can write to it.
	GOTO :END
)
IF %MSIEXIT%==1633 (
	CALL "%LIB%\Tee.cmd" This installation package is not supported on this platform. Contact your application vendor.
	GOTO :END
)
IF %MSIEXIT%==1634 (
	CALL "%LIB%\Tee.cmd" Component not used on this machine.
	GOTO :END
)
IF %MSIEXIT%==1635 (
	CALL "%LIB%\Tee.cmd" This patch package could not be opened. Verify that the patch package exists and that you can access it, or contact the application vendor to verify that this is a valid Windows Installer patch package.
	GOTO :END
)
IF %MSIEXIT%==1636 (
	CALL "%LIB%\Tee.cmd" This patch package could not be opened. Contact the application vendor to verify that this is a valid Windows Installer patch package.
	GOTO :END
)
IF %MSIEXIT%==1637 (
	CALL "%LIB%\Tee.cmd" This patch package cannot be processed by the Windows Installer service. You must install a Windows service pack that contains a newer version of the Windows Installer service.
	GOTO :END
)
IF %MSIEXIT%==1638 (
	CALL "%LIB%\Tee.cmd" Another version of this product is already installed. Installation of this version cannot continue. To configure or remove the existing version of this product, use Add/Remove Programs on the Control Panel.
	GOTO :END
)
IF %MSIEXIT%==1639 (
	CALL "%LIB%\Tee.cmd" Invalid command line argument. Consult the Windows Installer SDK for detailed command line help.
	GOTO :END
)
CALL "%LIB%\Tee.cmd" Unknown return code.
GOTO :END


:END
POPD
ENDLOCAL & SET RESTART_REQUIRED=%RESTART_REQUIRED%
