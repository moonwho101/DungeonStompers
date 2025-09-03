baud 1
if ERRORLEVEL 15 GOTO 9600
if ERRORLEVEL 13 GOTO 2400
if ERRORLEVEL 8  GOTO 1200
if ERRORLEVEL 7  GOTO  600
if ERRORLEVEL 6  GOTO  300
GOTO Local
:9600
ECHO 9600 >BAUD.DAT
goto end
:2400
ECHO  2400 >BAUD.DAT
goto end
:1200
ECHO 1200 >BAUD.DAT
goto end
:300
ECHO 300>BAUD.DAT
goto end
:Local
local2
GOTO STOP
:end
LOGON2.EXE
CD\BBS
EXIT
:STOP
cd\bbs
exit


  Note  If you are in com 2 .... use BAUD 2  instead of baud 1 (first line)



