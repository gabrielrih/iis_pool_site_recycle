:: Recycling web pool in IIS
@echo off

GOTO :CHECAPERMISSAO
GOTO :EXECUTAPROCESSO

:CHECAPERMISSAO
net session >nul 2>&1
if %errorLevel% EQU 0 (
	REM echo everything is fine
) else (
	echo ERRO: Run as administrator.
	echo.
	pause
	exit /B
)

:EXECUTAPROCESSO
C:
cd %windir%\System32\inetsrv
appcmd.exe recycle apppool /apppool.name:poolname
timeout 5