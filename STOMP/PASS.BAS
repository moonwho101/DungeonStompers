10 ' OPEN THE BBS DOOR FILE ... ALTER FOR YOUR BSS
20 '
30 '  file I used looks like
40 '
50 '    BBS NAME
60 '    SYSOP-FIRST NAME
70 '    SYSOP-SECOND NAME
80 '    COM1
90 '    1200,N,8,1    --->   NOTE: reads in 1200 into baud$, puts N,8,1
100 '    0                          into REST$ ...  INPUT #1,  will STOP
110 '    PLAYER-FIRST NAME          at a comma .. if you don't know the
120 '    PLAYER-SECOND NAME         difference between LINE INPUT and
130 '    CITY                       INPUT find out!!!
140 '    GRAPHICS
150 '
160 '
170 '
180 '
190 '
200 '
210 '
220 OPEN "BBSDEF" FOR INPUT AS #1
230 LINE INPUT #1,BBS$
240 LINE INPUT #1,SYSOPF$
250 LINE INPUT #1,SYSOPL$
260 LINE INPUT #1,COMX$
270 INPUT #1,BAUD$
280 I=0:Q$="":A$=""
290 I=I+1:A$=MID$(BAUD$,I,1):IF A$=" "  THEN GOTO 320
300 Q$=Q$+A$
310 GOTO 290
320 BAUD$=Q$:LINE INPUT #1,REST$
330 LINE INPUT #1,A$
340 LINE INPUT #1,PLAYF$
350 LINE INPUT #1,PLAYL$
360 LINE INPUT #1,CITY$
370 LINE INPUT #1,ANSI$
371 LINE INPUT #1,a$:line input #1,vv$
380 CLOSE #1
390 '
400 ' You MUST echo ... PLAYERS FIRST NAME, LAST NAME and ANSI to
410 ' DS.DEF .. in that format!!
420 '  (as below)
430 '
440 '
450 '
460 OPEN "DS.DEF" FOR OUTPUT AS #1
470 PRINT #1,PLAYF$
480 PRINT #1,PLAYL$
490 IF ANSI$="0" THEN ANSI$="N"   ' DS uses ansi="Y" or "N" CAPS!!!!!!!!!!
500 IF ANSI$="1" THEN ANSI$="Y"
510 PRINT #1,ANSI$:PRINT #1,VV$
520 CLOSE #1
530 '
540 '
550 '  Echo baud rate into baud.dat
560 '
570 OPEN "BAUD.DAT" FOR OUTPUT AS #1
580 PRINT #1,BAUD$
590 CLOSE #1
600 '
610 '  echo com?  into com.dat
620 '
630 OPEN "COM.DAT" FOR OUTPUT AS #1
640 PRINT #1,COMX$+":"
650 CLOSE #1
