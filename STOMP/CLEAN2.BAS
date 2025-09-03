1 OPEN "I",#1,"DRIVE.DAT":INPUT #1,DRI$:INPUT #1,A$:INPUT #1,A$:INPUT #1,COLR$:CLOSE #1
2 V=11:GOSUB 100:PRINT "                                CLEANING FILES"
10 OPEN "I",#1,"MESSAGE.DAT"
11 OPEN DRI$+"TEMP.DAT" FOR OUTPUT AS #2
12 IF EOF(1) THEN CLOSE #1:CLOSE #2:kill "message.dat":name "temp.dat" as "message.dat":SYSTEM
20 INPUT #1,A$
30 INPUT #1,b$
40 INPUT #1,C$
50 IF INSTR(A$,"(monst") then goto 12
60 print #2,a$:print #2,b$:print #2,c$
70 goto 12
100 IF COLR$="Y" THEN COLOR V,0
101 RETURN


