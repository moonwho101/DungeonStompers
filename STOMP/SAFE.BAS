1 COMMON SHARED CFA$,X1,Y1,STAT,SP$,ROOM$,PASS$,TI$,NAM$,CL$,RACE$,GOLD,TYP$,PROTECT,INV,CRE,HEA,LOCAT,TRA,SAR,DRI$,EVE$,EVE2$,PLA,BELL$,SY$,PLIK,RAZ,RUNEM,ANSI$,PPIT,NEKI,PLAYF$,PLAYL$,REMAIN,INI,TM$,ZT,QT,MD,FLG,MTR
2 INI=TIMER
3 OUT$="Time out for inactivity..."
4  ON ERROR GOTO 300:DIM RC$(300):OPEN"I",#1,"DRIVE.DAT":INPUT #1,DRI$:INPUT #1,CFA$:INPUT #1,MON$:INPUT #1,EVE$:INPUT #1,EVE2$:INPUT #1,PLA:INPUT #1,SY$:INPUT #1,STOG:CLOSE #1:M$=CHR$(13)
5 KEY 1, SY$:OPEN "I",#1,"macro.dat":I=0:ANSI$="N":BBS$="Caution: Unregistered Version, Ask your SysOp to register , April 25,1989."
6 I=I+1:INPUT #1,A$:KEY I+1,A$:IF I=9 THEN GOTO 8
7 GOTO 6
8  CLOSE #1:OPEN "I",#1,DRI$+"updat.dat":INPUT #1,AE:CLOSE #1:OPEN "I",#1,"BAUD.DAT":INPUT #1,BAUD$:CLOSE #1:IF RAZ=1 THEN BAUD$="1200"
9 IF BAUD$="0" THEN CHAIN "LOCAL"
10 IF BAUD$="300" THEN A=1
11 IF BAUD$="1200" THEN A=2
12 IF BAUD$="2400" THEN A=3
13 IF BAUD$="4800" THEN A=4
14 IF BAUD$="9600" THEN A=5
15 IF BAUD$="19200" THEN A=6
16 OPEN "I",#1,DRI$+"PIT.DAT":FOR I=1 TO A:INPUT #1,PPIT:NEXT I:CLOSE #1:OPEN DRI$+"time.dat" FOR INPUT AS #1:INPUT#1,TM$:CLOSE #1:GOSUB 371
17  AE=AE+1:IF AE>=STOG THEN RUNEM=1:AE=0
18  OPEN DRI$+"updat.dat" FOR OUTPUT AS #1:PRINT #1,AE:CLOSE #1:OPEN "I",#1,"COM.DAT":INPUT #1,C$:CLOSE #1
19  IF C$="COM1:" THEN MTR=0
20  IF C$="COM2:" THEN MTR=1
21 LOCATE,,1:MOW=21:IF RAZ=0 THEN OPEN C$+BAUD$+",N,8,,LF" AS #4 ELSE OPEN"O",#4,"NUL"
22 '
23 '
24 FIR=VAL(MID$(TIME$,1,2)):SEN=VAL(MID$(TIME$,4,2)):A$=INKEY$:IF A$=CHR$(19) THEN GOTO 29
25 'IF FIR=10 AND SEN>=55 THEN PRINT "System event...":SYSTEM
26 'IF FIR=22 AND SEN>=55 THEN PRINT "System event...":SYSTEM
27 COLOR 15
28 OPEN DRI$+"CALL.DAT" FOR INPUT AS #1:LINE INPUT #1,STEPH$:CLOSE #1:OPEN DRI$+"EVENT.DAT" FOR INPUT AS #1:INPUT #1,POI$:CLOSE #1
29 LOCATE 25,1:PRINT "                                                                               "
30 Q=0:OPEN DRI$+"MDM.DEF" FOR INPUT AS #1:INPUT #1,HANGER:CLOSE #1
31 OPEN "I",#1,DRI$+"BELL.DAT":INPUT #1,BELL$:CLOSE #1:LOCATE 25,1:PRINT"Press <<ESC>> to CHAT.":PRINT #4,CHR$(10)
32 '
33 PRINT:PRINT "===================================              To order a Copy:"
34 PRINT       "=        Dungeon Stompers         =              Write:  Dungeon Stompers"
35 PRINT       "=         By: Mark Longo          =                      72 Westbury Cres."
36 PRINT       "=          Copyright (C)          = Support Board:       Cambridge, ON"
37 PRINT       "=       -->  Ver 1.02  <--        = 1-519-658-6433       N3C 3G2"
38 PRINT       "===================================                      CANADA":PRINT
39 PRINT #4,M$:PRINT #4,"===================================              To order a Copy:"
40 PRINT #4,   "=        Dungeon Stompers         =              Write:  Dungeon Stompers"
41 PRINT #4,   "=         By: Mark Longo          =                      72 Westbury Cres."
42 PRINT #4,   "=          Copyright (C)          = Support Board:       Cambridge, ON"
43 PRINT  #4,  "=      -->  Ver 1.02  <--         = 1-519-658-6433       N3C 3G2"
44 PRINT #4,   "===================================                      CANADA"
45 MOW=0:PRINT #4,M$:PRINT BBS$:PRINT:PRINT #4,BBS$:PRINT #4,"":IF POI$="N" THEN GOTO 48
46 OPEN "I",#1,DRI$+"DATE.DAT":INPUT #1,A$:CLOSE #1:IF A$=DATE$ THEN GOTO 48
47 OPEN "O",#1,DRI$+"DATE.DAT":PRINT #1,DATE$:CLOSE #1:PRINT #4,"":PRINT #4, "Your are the first to play today, please wait...setting up.":PRINT #4,"":PRINT #4,"":PRINT:PRINT "You are the first to play today, please wait, setting up.":PRINT:GOTO 326
48 PRINT:PRINT "Please press <<RETURN>> to continue.  <S> Aborts Title Screen!";:PRINT #4,M$:PRINT #4,"Please press <<RETURN>> to continue.  <S> Aborts Title Screen!";:MOW=0:GOSUB 241:AQ1=0
49 '
50 IF ANSI$="Y" OR ANSI$="y" THEN ANSI$="Y" ELSE ANSI$="N"
51 IF ANSI$="N" THEN PRINT #4,CHR$(12):PRINT CHR$(12):TITL$="TITLE2.DAT":ANSI$="N":GOTO 53
52  IF ANSI$="Y" THEN TITL$="TITLE1.DAT"
53 MOW=0:V=15:GOSUB 307:OPEN"I",#1,DRI$+TITL$:OPEN "CONS:" FOR OUTPUT AS #3:IF ANSI$="Y" THEN PRINT #3,CHR$(27);"[H";:PRINT #3,CHR$(27);"[2J";:GOSUB 321
54 IF ANSI$="N" THEN PRINT #3,CHR$(27);"[H";:PRINT #3,CHR$(27);"[2J";:GOSUB 323
55 IF EOF(1) OR AQ1=1 THEN CLOSE #1:CLOSE #3:GOTO 63
56 IF RAZ=1 THEN GOTO 60
57 WHILE NOT EOF(4)
58 MA$=INPUT$(LOC(4),#4):IF MA$="S" OR MA$="s" THEN AQ1=1
59 WEND
60 MA$=INKEY$:IF MA$="S" OR MA$="s" THEN AQ1=1
61 LINE INPUT #1,A$:PRINT #4,A$:PRINT #3,A$:GOTO 55
62 GOTO 55
63 LOCATE 24,1:PRINT"<<PRESS RETURN>>";:PRINT #4,"<<PRESS RETURN>>";
64 GOSUB 241
65 IF ANSI$="Y" THEN GOSUB 321:PRINT CHR$(12);
66 IF ANSI$="N" THEN GOSUB 323:PRINT CHR$(12);
67 OPEN"I",#1,DRI$+"chron.dat"
68 IF EOF(1) THEN CLOSE #1:GOTO 70
69 LINE INPUT #1,A$:PRINT A$:PRINT #4,A$:GOTO 68
70 PRINT"<<PRESS RETURN>>";:PRINT #4,"<<PRESS RETURN>>";
71 GOSUB 241:PRINT #4,M$:V=13:GOSUB 307:MOW=21
72 IF ANSI$="Y" THEN GOSUB 321:PRINT CHR$(12);
73 IF ANSI$="N" THEN GOSUB 323:PRINT CHR$(12);
74 PRINT"********************************************************************************":PRINT #4,"********************************************************************************";:V=15:GOSUB 307:PRINT"Welcome to Dungeon Stompers (Ver 1.02)":PRINT
75 PRINT #4,"Welcome to Dungeon Stompers (Ver 1.02) ":PRINT #4,M$:PRINT"      An exciting adventure game...":PRINT:PRINT #4,"      An exciting adventure game...":PRINT #4,M$:PRINT"               By: Mark Longo "
76 PRINT #4,"               By: Mark Longo                     ":V=13:GOSUB 307:PRINT"********************************************************************************"
77 PRINT #4,"********************************************************************************":V=14:GOSUB 307
78 PRINT #4,M$:PRINT:PRINT:Q=0:GOSUB 328:PRINT "Connect "+BAUD$+" bps.   Current Time: "+FDT$+"   Last Player: "+STEPH$:PRINT:PRINT
79 PRINT #4,"Connect "+BAUD$+" bps.   Current Time: "+FDT$+"   Last Player: "+STEPH$:PRINT #4,"":PRINT #4,""
80 '
81 '
82 '
83 '
84 PRINT:PRINT "Searching the Dungeon...":PRINT #4,"":PRINT #4,"Searching the Dungeon...":P9$=A$:GOSUB 341:A$=NAM$:OPEN"I",#1,DRI$+"name.dat"
85 IF EOF(1) OR A$="" THEN CLOSE #1:GOTO 129
86 INPUT #1,NAM$:IF A$=NAM$ THEN GOTO 88
87 GOTO 85
88 V=12:GOSUB 307
89 CLOSE #1:GOSUB 337:PRINT:PRINT:PRINT"Welcome back ";NAM$:PRINT #4,M$:PRINT #4,"Welcome back ";NAM$:PRINT:PRINT"Please wait getting your character ...":PRINT #4,"":PRINT #4,"Please wait getting your character ...":OPEN"I",#1,DRI$+"location.dat"
90 IF EOF(1) THEN GOTO 179
91 INPUT #1,A$:INPUT #1,B:INPUT #1,C:INPUT #1,D:INPUT #1,E$:INPUT #1,F$:INPUT #1,G$:INPUT #1,H$:IF A$=NAM$ THEN CLOSE #1:GOTO 93
92 GOTO 90
93 X1=B:Y1=C:STAT=D:SP$=E$:SAR=VAL(F$):PASS$=G$:TI$=H$:OPEN"I",#1,DRI$+"chrtr.dat"
94 INPUT #1,A$:INPUT #1,B$:INPUT #1,C$:INPUT #1,D:INPUT #1,E:INPUT #1,F$:INPUT #1,G:INPUT #1,H:INPUT #1,I:INPUT #1,J:INPUT #1,K:INPUT #1,L:IF A$=NAM$ THEN GOTO 96
95 GOTO 94
96 CLOSE #1:CL$=B$:RACE$=C$:GOLD=D:TYP$=F$:PROTECT=G:INV=H:CRE=I:HEA=J:LOCAT=K:TRA=L:PLIK=E
97 V=10:GOSUB 307:PRINT:PRINT:PRINT"Press <RETURN> to continue.";:PRINT #4,"":PRINT #4,"":PRINT #4,"Press <<RETURN>> to continue.";:MOW=0:BIGT=1:GOSUB 241:BIGT=0:A$=RC$:MOW=21
98 'Q=Q+1:PRINT:PRINT:PRINT"That is not correct ...":PRINT #4,M$:PRINT #4,"That is not correct ... ":IF Q=3 THEN SYSTEM
99 'GOTO 90
100 IF VAL(TI$)<=0 AND PLIK>=PLA THEN PRINT:PRINT:PRINT"Your time is up for today! ":PRINT #4,M$:PRINT #4,"Your time is up for today! ":SYSTEM
101 V=12:GOSUB 307:PRINT:PRINT:PRINT"Player Character":PRINT:PRINT #4,M$:PRINT #4,"Player Character":PRINT #4,M$:V=14:GOSUB 307:PRINT"Name    : ";NAM$:PRINT"Race    : ";RACE$:PRINT"Class   : ";CL$:PRINT"Gold    :";GOLD:PRINT"Status  :";STAT
102 PRINT #4,"Name    : ";NAM$:PRINT #4,"Race    : ";RACE$:PRINT #4,"Class   : ";CL$:PRINT #4,"Gold    :";GOLD:PRINT #4,"Status  :";STAT:GOSUB 400
103 IF CL$="Magic-User" THEN GOSUB 219
104 IF SPECIAL$="I" OR SPECIAL$="P" THEN SPECIAL$="-"
105 V=12:GOSUB 307:PRINT:IF TYP$="B" THEN PRINT"You will be searching for Two handed Human Swords to gain STATUS."
106 PRINT #4,M$:IF TYP$="B" THEN PRINT #4,"You will be searching for Two handed Human Swords to gain STATUS."
107 IF TYP$="C" THEN PRINT"You will be searching for Elven Swords to gain STATUS."
108 IF TYP$="C" THEN PRINT #4,"You will be searching for Elven Swords to gain STATUS."
109 IF TYP$="D" THEN PRINT"You will be searching for Dwarvish War Hammers to gain STATUS."
110 IF TYP$="D" THEN PRINT #4,"You will be searching for Dwarvish War Hammers to gain STATUS."
111 IF TYP$="E" THEN PRINT"You will be searching for Halfling Short Swords to gain STATUS."
112 IF TYP$="E" THEN PRINT #4,"You will be searching for Halfling Short Swords to gain STATUS."
113 IF TYP$="F" THEN PRINT"You will be searching for Magic Human Staves to gain STATUS."
114 IF TYP$="F" THEN PRINT #4,"You will be searching for Magic Human Staves to gain STATUS."
115 IF TYP$="G" THEN PRINT"You will be searching for Magic Elven Stones to gain STATUS."
116 IF TYP$="G" THEN PRINT #4,"You will be searching for Magic Elven Stones to gain STATUS."
117 IF TYP$="H" THEN PRINT"You will be searching for Magic Dwarvish Gems to gain STATUS."
118 IF TYP$="H" THEN PRINT #4,"You will be searching for Magic Dwarvish Gems to gain STATUS."
119 IF TYP$="I" THEN PRINT"You will be searching for Magic Halfling cloaks to gain STATUS."
120 IF TYP$="I" THEN PRINT #4,"You will be searching for Magic Halfling cloaks to gain STATUS."
121 IF CL$="Magic-User" THEN PRINT:PRINT"You will also be searching for Magic Scrolls which contain SPELLS."
122 IF CL$="Magic-User" THEN PRINT #4,"":PRINT #4,"You will also be searching for Magic Scrolls which contain SPELLS."
123 PRINT:PRINT #4,"":IF X1=0 AND Y1=0 THEN NEKI=1:PRINT"Welcome new player!!":PRINT #4,"Welcome new player!":PRINT
124 '
125 PRINT "You can play";(PLA-PLIK-1);"more time(s) today.":PRINT:PRINT #4,"":PRINT #4,"You can play";(PLA-PLIK-1);"more time(s) today."
126 MOW=1:V=11:GOSUB 307:PRINT"Do you need instructions (Y/N) (N=START GAME): ";:PRINT #4,M$:PRINT #4,"Do you need instructions (Y/N) (N=START GAME): ";:GOSUB 241:J$=RC$:IF J$="y" OR J$="Y" THEN GOSUB 234:GOTO 126
127 '
128 V=14:GOSUB 307:PRINT:PRINT:PRINT"Please wait putting you in dungeon...":PRINT:PRINT #4,M$:PRINT #4,"Please wait putting you in dungeon...":PRINT #4,M$:GOSUB 375:CHAIN "STOMP"
129 IF USA=1 THEN GOSUB 401:IF USA=1 THEN GOTO 133
130 CLOSE #1:V=11:GOSUB 307:PRINT:PRINT:PRINT"Your name was not found in the Dungeon Stomper list.":PRINT #4,M$:PRINT #4,"Your name was not found in the Dungeon Stomper List."
131 GOSUB 349
132 '
133 V=14:GOSUB 307:PRINT:PRINT:PRINT"Welcome New Player!!":PRINT #4,M$:PRINT #4,"Welcome New Player!!"
134 'V=12:GOSUB 2870:PRINT:PRINT "Validation Information (Hey, that rhymes!)":PRINT
135 'PRINT #4,M$:PRINT #4,"Validation Information (Hey, that rhymes!)":PRINT #4,M$
136 'V=11:GOSUB 2870:PRINT "Real name: ";
137 'PRINT #4,"Real name: ";:GOSUB 2260:IF LEN(RC$)>=60 THEN PRINT:PRINT "Please don't write a book!":PRINT #4,M$:PRINT #4,"Please don't write a book!":GOTO 1220
138 'P1$=RC$:PRINT:PRINT #4,M$
139 'V=11:GOSUB 2870:PRINT "Voice Phone: ";
140 'PRINT #4,"Voice Phone: ";:GOSUB 2260:IF LEN(RC$)>=60 THEN PRINT:PRINT "Please don't write a book!":PRINT #4,M$:PRINT #4,"Please don't write a book!":GOTO 1250
141 'P2$=RC$:PRINT:PRINT #4,M$
142  'V=11:GOSUB 2870:PRINT "Computer Type: ";
143 'PRINT #4,"Computer Type: ";:GOSUB 2260:IF LEN(RC$)>=60 THEN PRINT:PRINT "Please don't write a book!":PRINT #4,M$:PRINT #4,"Please don't write a book!":GOTO 1280
144 'P3$=RC$:PRINT:PRINT #4,M$
145 'V=10:GOSUB 2870:PRINT:PRINT "Ok ... thank you ...":PRINT #4,M$:PRINT #4,"Ok ... thank you ..."
146 REM
147 V=14:GOSUB 307:PRINT:PRINT"Please choose one of the following classes: ":PRINT #4,M$:PRINT #4,"Please choose one of the following classes: ":PRINT:PRINT"1) Fighter":PRINT #4,M$:PRINT #4,"1) Fighter":PRINT"2) Magic-User":PRINT #4,"2) Magic-User"
148 PRINT:PRINT"Your choice is (1 or 2): ";:PRINT #4,M$:PRINT #4,"Your choice is (1 or 2): ";:MOW=1:GOSUB 241:MOW=21:G$=RC$:IF G$="1" OR G$="2" THEN GOTO 150
149 PRINT:PRINT"Enter 1 or 2!":PRINT #4,M$:PRINT #4,"Enter 1 or 2!":GOTO 147
150 PRINT:CL$="Fighter":HIC=9
151 PRINT #4,M$:IF G$="2" THEN CL$="Magic-User":HIC=7
152 V=13:GOSUB 307:PRINT:PRINT"Greetings ";CL$;"...":PRINT #4,"Greetings ";CL$;"..."
153 V=10:GOSUB 307:PRINT:PRINT"Please choose your race ":PRINT #4,M$:PRINT #4,"Please choose your race: ":PRINT #4,M$:PRINT #4,"1) Human":PRINT:PRINT"1) Human":PRINT"2) Elven":PRINT #4,"2) Elven":PRINT"3) Dwarvish":PRINT #4,"3) Dwarvish"
154 PRINT"4) Halfling":PRINT #4,"4) Halfling":PRINT:PRINT"Your choice is (1 2 3 4): ";:PRINT #4,M$:PRINT #4,"Your choice is (1 2 3 4): ";:MOW=1:GOSUB 241:MOW=21:G$=RC$:IF G$>="5" OR G$<="0" THEN PRINT"Choose 1 2 3 4!":PRINT #4,"Choose 1 2 3 4":GOTO 153
155 V=14:GOSUB 307
156 IF G$="2" THEN G$="Elven":GOTO 160
157 IF G$="3" THEN G$="Dwarvish":GOTO 160
158 IF G$="4" THEN G$="Halfling":GOTO 160
159 G$="Human"
160 PRINT:PRINT #4,M$:PRINT #4,M$:PRINT:PRINT"Player Character":PRINT:PRINT #4,M$:PRINT #4,"Player Character":V=12:GOSUB 307:PRINT #4,M$:PRINT"Name   : ";:PRINT A$
161 PRINT #4,"Name   : ";A$:PRINT"Class  : ";:PRINT CL$:PRINT #4,"Class  : ";CL$:PRINT"Race   : ";:PRINT G$:GOSUB 324
162 '
163 'BIGT=0:IF LEN(PAS$)>6 OR LEN(PAS$)<2 THEN PRINT:PRINT:PRINT"That is not a good password, RE-ENTER!":PRINT #4,M$:PRINT #4,"That is not a good password Re-enter!":GOTO 1470
164 PRINT:PRINT:PRINT"Is everything correct (Y/N): ";:PRINT #4,M$:PRINT #4,"Is everything correct (Y/N): ";:GOSUB 241:O$=RC$:IF O$="n" OR O$="N" THEN PRINT:PRINT:GOTO 78
165 PRINT:IF G$="Human" AND CL$="Fighter" THEN TYP$="B"
166 IF G$="Elven" AND CL$="Fighter" THEN TYP$="C"
167 IF G$="Dwarvish" AND CL$="Fighter" THEN TYP$="D"
168 IF G$="Halfling" AND CL$="Fighter" THEN TYP$="E"
169 IF G$="Human" AND CL$="Magic-User" THEN TYP$="F"
170 IF G$="Elven" AND CL$="Magic-User" THEN TYP$="G"
171 IF G$="Dwarvish" AND CL$="Magic-User" THEN TYP$="H"
172 IF G$="Halfling" AND CL$="Magic-User" THEN TYP$="I"
173 V=11:GOSUB 307:PRINT:PRINT"Please wait, saving your character...":PRINT #4,M$:PRINT #4,"Please wait, saving your character...":OPEN DRI$+"name.dat" FOR APPEND AS 1:PRINT #1,A$:CLOSE #1:OPEN DRI$+"chrtr.dat" FOR APPEND AS 1:PRINT #1,A$:PRINT #1,CL$
174 PRINT #1,G$:PRINT #1,MON$:PRINT #1,0:PRINT #1,TYP$:IF CL$="Magic-User" THEN PRINT #1,1:GOTO 176
175 PRINT #1,0
176 PRINT #1,0:PRINT #1,0:PRINT #1,0:PRINT #1,0:PRINT #1,0:CLOSE #1:OPEN DRI$+"location.dat" FOR APPEND AS 1:PRINT #1,A$:PRINT #1,0:PRINT #1,0:PRINT #1,8:PRINT #1,"-":GOSUB 305:PRINT #1,"OFF":PRINT #1,CFA$:CLOSE #1
177 GOSUB 360
178 V=10:GOSUB 307:PRINT:PRINT"Ok. Your character has been saved.":PRINT:PRINT"Please Relog on.":PRINT:PRINT:PRINT #4,M$:PRINT #4,"Ok. Your character has been saved.":PRINT#4,M$:PRINT #4,"Please Relog on.":PRINT #4,M$:PRINT #4,M$:V=13:GOSUB 307:GOTO 74
179 CLOSE #1:OPEN"i",1,DRI$+"DEAD.DAT"
180 INPUT #1,A$:INPUT #1,B$:IF A$=NAM$ THEN CLOSE #1:GOTO 182
181 GOTO 180
182 'PRINT:PRINT:PRINT"         [------]":PRINT #4,M$:PRINT #4,M$:PRINT #4,"         [------]"
183 'PRINT"Password: ";:PRINT #4,"Password: ";:MOW=6:BIGT=1:GOSUB 232:BIGT=0:MOW=21:C$=RC$:IF C$=B$ THEN GOTO 178
184 'Q=Q+1:PRINT:PRINT:PRINT"That is not correct ...":PRINT #4,M$:PRINT #4,"That is not correct ..."
185 'IF Q=3 THEN SYSTEM
186 'GOTO 173
187 PRINT:PRINT A$;" has been killed by another player.":PRINT #4,M$:PRINT #4,A$;" has been killed by another player.":PRINT:PRINT"Press <<RETURN>> to read final messages."
188 PRINT #4,M$:PRINT #4,"Press <<RETURN>> to read final messages."
189 GOSUB 241:PRINT:PRINT #4,M$:OPEN"I",#1,DRI$+"message.dat":LALT$="":B$="":C$=""
190 PRINT:PRINT"Press <<SPACE>> to PAUSE and <<S>> to STOP.":PRINT:PRINT#4,M$:PRINT #4,"Press <<SPACE>> to PAUSE."::PRINT #4,M$
191 IF EOF(1) THEN CLOSE #1:GOTO 203
192 INPUT #1,LALT$:LINE INPUT #1,B$:LINE INPUT #1,C$:GOSUB 266:IF HEP=1  THEN GOSUB 274:HEP=0
193 IF LALT$=NAM$ THEN GOSUB 196
194 REM
195 LALT$="":GOTO 191
196 V=11:GOSUB 307:PRINT    "********************************************************************************":PRINT #4,"********************************************************************************";
197 V=10:GOSUB 319:PRINT"To: ";LALT$:V=14:GOSUB 319:PRINT"From: ";B$:V=15:GOSUB 319:PRINT:PRINT C$:A=A+1
198 V=10:GOSUB 307:PRINT #4,"To: ";LALT$:V=14:GOSUB 307:PRINT #4,"From: ";B$:V=15:PRINT #4,"":GOSUB 307:PRINT #4,C$:A=A+1
199 V=11:GOSUB 307:PRINT "********************************************************************************":PRINT
200 PRINT #4,"********************************************************************************":PRINT #4,M$:RETURN
201 S$=INKEY$:IF S$="" THEN GOTO 201
202 RETURN
203 OPEN"I",#1,DRI$+"chrtr.dat":V=15:GOSUB 307:PRINT"Please wait updating characters...":OPEN DRI$+"temp.dat" FOR OUTPUT AS #2:PRINT #4,M$:PRINT #4,"Please wait, updating characters..."
204 IF EOF(1) THEN CLOSE #1:CLOSE #2:KILL DRI$+"chrtr.dat":NAME DRI$+"temp.dat" AS DRI$+"chrtr.dat":GOTO 207
205 INPUT #1,A$:INPUT #1,B$:INPUT #1,C$:INPUT #1,D:INPUT #1,E:INPUT #1,F$:INPUT #1,G:INPUT #1,H:INPUT #1,I:INPUT #1,J:INPUT #1,K:INPUT #1,L:IF A$=NAM$ THEN GOTO 204
206 PRINT #2,A$:PRINT #2,B$:PRINT #2,C$:PRINT #2,D:PRINT #2,E:PRINT #2,F$:PRINT #2,G:PRINT #2,H:PRINT #2,I:PRINT #2,J:PRINT #2,K:PRINT #2,L:GOTO 204
207 OPEN"I",#1,DRI$+"NAME.DAT":OPEN DRI$+"TEMP.DAT" FOR OUTPUT AS #2:PRINT "Please wait still updating...":PRINT #4,"Please wait still updating..."
208 IF EOF(1) THEN CLOSE #1:CLOSE #2:KILL DRI$+"NAME.DAT":NAME DRI$+"TEMP.DAT" AS DRI$+"NAME.DAT":GOTO 211
209 INPUT #1,A$:IF A$=NAM$ THEN GOTO 208
210 PRINT #2,A$:GOTO 208
211 OPEN"I",#1,DRI$+"MESSAGE.DAT":OPEN DRI$+"TEMP.DAT" FOR OUTPUT AS #2:PRINT "Almost done...":PRINT #4,"Almost done...":PRINT #4,"":PRINT:V=13:GOSUB 307
212 IF EOF (1) THEN CLOSE #1:CLOSE #2:KILL DRI$+"MESSAGE.DAT":NAME DRI$+"TEMP.DAT" AS DRI$+"MESSAGE.DAT":GOTO 215
213 INPUT #1,A$:LINE INPUT #1,B$:LINE INPUT #1,C$:IF A$=NAM$ THEN GOTO 212
214 PRINT #2,A$:PRINT #2,B$:PRINT #2,C$:GOTO 212
215 OPEN"I",#1,DRI$+"DEAD.DAT":OPEN DRI$+"TEMP.DAT" FOR OUTPUT AS #2
216 IF EOF (1) THEN CLOSE #1:CLOSE #2:KILL DRI$+"DEAD.DAT":NAME DRI$+"TEMP.DAT" AS DRI$+"DEAD.DAT":GOTO 74
217 INPUT #1,A$:INPUT #1,B$:IF A$=NAM$ THEN GOTO 216
218 PRINT #2,A$:PRINT #2,B$:GOTO 216
219 V=10:GOSUB 307:PRINT:PRINT"Spells:":PRINT:PRINT #4,"":PRINT #4,"Spells:":PRINT #4,""::V=14:GOSUB 307:A=0:IF PROTECT>0 THEN A=A+1:PRINT A;")";PROTECT;"Protect Spell(s)"
220 IF PROTECT>0 THEN PRINT #4,A;")";PROTECT;"Protect Spell(s)"
221 IF INV>0 THEN A=A+1:PRINT A;")";INV;"Invisibility Spell(s)"
222 IF INV>0 THEN PRINT #4,A;")";INV;"Invisibility Spell(s)"
223 IF CRE>0 THEN A=A+1:PRINT A;")";CRE;"Create Gold Spell(s)"
224 IF CRE>0 THEN PRINT #4,A;")";CRE;"Create Gold Spell(s)"
225 IF HEA>0 THEN A=A+1:PRINT A;")";HEA;"Healing Spell(s)"
226 IF HEA>0 THEN PRINT #4,A;")";HEA;"Healing Spell(s)"
227 IF LOCAT>0 THEN A=A+1:PRINT A;")";LOCAT;"Locate User Spell(s)"
228 IF LOCAT>0 THEN PRINT #4,A;")";LOCAT;"Locate User Spell(s)"
229 IF TRA>0 THEN A=A+1:PRINT A;")";TRA;"Controlled Transport Spell(s)"
230 IF TRA>0 THEN PRINT #4,A;")";TRA;"Controlled Transport Spell(s)"
231 IF A=0 THEN PRINT:PRINT"You have none.":PRINT
232 IF A=0 THEN PRINT #4,M$:PRINT #4,"You have none.":PRINT #4,M$
233 RETURN
234 PRINT:PRINT #4,M$:OPEN "I",#1,DRI$+"INSTRUCT.DAT"
235 Q=0:PRINT:PRINT #4,"":PRINT"<<PRESS RETURN>> AFTER EACH PAGE.":PRINT #4,"<<PRESS RETURN>> AFTER EACH PAGE."
236 IF EOF(1) THEN CLOSE #1:RETURN
237 LINE INPUT #1, A$
238 Q=Q+1:IF Q=23 THEN LOCATE 24,1:MOW=0:GOSUB 241:MOW=21:Q=0
239 PRINT A$:PRINT #4,A$
240 GOTO 236
241 V=15:GOSUB 307:RC=0:RC$="":PULL$=""
242 IF RC<=0 THEN RC=0
243 TRAK=TRAK+1:GOSUB 292:IF PULL$=CHR$(13) THEN RETURN
244 CHAT=0:CHAT2=0:KB$=INKEY$:IF KB$=CHR$(27) AND RAZ=0 THEN GOSUB 279:KB$=""
245 IF KB$<>"" THEN PULL$=KB$:TRAK=0:GOSUB 250:GOTO 242
246 IF RAZ=1 THEN GOTO 249
247 WHILE NOT EOF(4):PULL$=INPUT$(LOC(4),#4):TRAK=0:GOSUB 250:IF PULL$=CHR$(13) THEN RETURN
248 WEND
249 GOTO 242
250 PULL$=MID$(PULL$,1,1):IF PULL$=CHR$(8) THEN RC=RC-1:GOSUB 264:RETURN
251 IF PULL$=CHR$(13) THEN FOR I=1 TO RC:RC$=RC$+RC$(I):NEXT I:RC=0:RETURN
252 IF RC>=MOW THEN RETURN
253 IF PULL$<" " OR PULL$>="{" THEN PULL$="":RETURN
254 IF PULL$="," THEN PULL$="-"
255 IF PULL$=CHR$(34) THEN PULL$="`"
256 IF PULL$>=CHR$(123) OR PULL$<=CHR$(31) THEN PULL$=""
257 RC=RC+1:PRINT PULL$;:PRINT #4,PULL$;
258 IF BIGT=1 AND PULL$<="z" AND PULL$>="a" THEN  PULL$=CHR$(ASC(PULL$)-32)
259 RC$(RC)=PULL$:IF KB$<>"" THEN RETURN
260 RETURN
261 V=POS(0):V=V-1:P=CSRLIN:IF V<=0 THEN G=0:RETURN
262 G=1:LOCATE P,V:PRINT" ";:LOCATE P,V:PRINT #4,CHR$(8);
263 RETURN
264 IF RC<0 THEN RC=0:RETURN
265 CHAT2=1:GOSUB 261:CHAT2=0:RETURN
266 KB$=INKEY$:IF KB$=" " OR KB$="S" OR KB$="s" THEN RC$=KB$:GOTO 271
267 IF RAZ=1 THEN GOTO 270
268 WHILE NOT EOF(4):RC$=INPUT$(LOC(4),#4):TRAK=0:IF RC$=" " OR RC$="s" OR RC$="S" THEN GOTO 271
269 WEND
270 RETURN
271 HEP=1:RETURN
272 RETURN
273 REM
274 A$=INKEY$:TRAK=TRAK+1:GOSUB 292:IF A$<>"" THEN TRAK=0:RETURN
275 IF RAZ=1 THEN GOTO 278
276 WHILE NOT EOF(4):RC$=INPUT$(LOC(4),#4):TRAK=0:RETURN
277 WEND
278 GOTO 274
279 GOSUB 328:DI=1:V=14:GOSUB 307:PRINT:PRINT:PRINT #4,M$:PRINT "[------ "+SY$+" is on-line at "+FDT$+" ------]":PRINT #4,"[------ "+SY$+" is on line at "+FDT$+" ------]":PRINT #4,M$:PRINT:CHAT=1
280 DEF SEG=0:POKE 1050,PEEK(1052)
281 TRAK=1:GOSUB 295:AQE$=INKEY$:IF AQE$=CHR$(27) THEN AQE$="":V=14:GOSUB 307:PRINT:GOSUB 328:PRINT #4,M$:PRINT"[------ Chat Mode ended at "+FDT$+" ------]":PRINT:PRINT #4,"[------ Chat Mode ended at "+FDT$+" ------]":PRINT #4,M$:PRINT:CHAT=0:RETURN
282 IF AQE$<>"" AND DI=1 THEN V=11:GOSUB 307:DI=0
283 IF AQE$=CHR$(19) THEN V=14:GOSUB 307:PRINT:PRINT SY$+" has shelled to dos ... please wait...":PRINT #4,SY$+" has shelled to dos ... please wait...":SHELL :AQE$="":GOSUB 302
284 IF AQE$=CHR$(8) THEN GOSUB 261:AQE$="":GOTO 281
285 IF G=1 THEN PRINT #4,AQE$;:G=0:GOTO 280
286 IF AQE$<>"" THEN PRINT AQE$;:PRINT #4,AQE$;
287 IF EOF(4) THEN 281
288 IF DI=0 THEN V=12:GOSUB 307:DI=1
289 S$=INPUT$(LOC(4),#4):IF S$=CHR$(8) THEN GOSUB 261:GOTO 281
290 IF S$=CHR$(13) THEN PRINT
291 PRINT S$;:PRINT #4,S$;:GOTO 281:CLOSE #1:SYSTEM
292 'FIR=VAL(MID$(TIME$,1,2)):SEN=VAL(MID$(TIME$,4,2))
293 'IF FIR=EVE-1 AND SEN>=55 THEN  GOSUB 257
294 'IF FIR=EVE2-1 AND SEN>=55 THEN GOSUB 257
295 IF TM$="Y" THEN GOSUB 394
296 IF TRAK>=VAL(EVE2$) THEN PRINT:PRINT OUT$:PRINT #4,M$:PRINT #4,OUT$:SYSTEM
297 IF RAZ=0 AND HANGER>0 AND MTR=0 THEN KYM=INP(&H3FE):IF KYM<127 THEN SYSTEM
298 IF RAZ=0 AND HANGER>0 AND MTR=1 THEN KYM=INP(&H2FE):IF KYM<127 THEN SYSTEM
299 RETURN
300 IF ERR=57 THEN RESUME
301 PRINT ERR,ERL:CLOSE #1:CLOSE #2:CLOSE #3:OPEN "ERROR.LOG" FOR APPEND AS #1:PRINT:PRINT #1,"Dungeon Stomper error number ";ERR;" at line ";ERL:CLOSE #1:PRINT "Dungeon Stomper error number ";ERR;" at line ";ERL:SYSTEM
302 PRINT SY$+" is back from dos...":PRINT #4,SY$+" is back from dos...":RETURN
303 PRINT:PRINT:PRINT "Sorry, disconnecting for Dungeon Stomper Events...":PRINT:PRINT #4,M$:PRINT #4,"Sorry, disconnecting for Dungeon Stomper Events...":CLOSE #1,#2,#3,#4:SYSTEM
304 END
305 IF CL$="Magic-User" THEN PRINT #1,"7":RETURN
306 PRINT #1,"9":RETURN
307 IF EVE$="Y" THEN COLOR V
308 IF RAZ=1 THEN RETURN
309 IF ANSI$="N" THEN RETURN
310 IF V=12 THEN V$="31"
311 IF V=10 THEN V$="32"
312 IF V=14 THEN V$="33"
313 IF V=9 THEN V$="34"
314 IF V=13 THEN V$="35"
315 IF V=11 THEN V$="36"
316 IF V=15 THEN V$="37"
317 PRINT #4,CHR$(27)+"[0;1;"+V$+"m";
318 RETURN
319 IF EVE$="Y" THEN COLOR V
320 RETURN
321 PRINT #4,CHR$(27);"[H";:PRINT #4,CHR$(27);"[2J";
322 RETURN
323 PRINT #4,CHR$(12);:RETURN
324 PRINT #4,"Race   : ";G$:PRINT"Gold   : ";MON$:PRINT #4,"Gold   : ";MON$:PRINT"Status : 8":PRINT #4,"Status : 8":PRINT "Armour :";HIC:PRINT #4,"Armour :";HIC
325 RETURN
326 PRINT:SHELL "EVENTS.BAT"
327 GOTO 48
328 SAX$=MID$(TIME$,1,2):SAX=VAL(SAX$)
329 IF SAX=12 THEN GOSUB 336:RETURN
330 IF SAX>12 OR SAX=0 THEN GOSUB 332:RETURN
331 FDT$=" "+SAX$+":"+MID$(TIME$,4,2)+" am":RETURN
332 IF SAX=0 THEN FDT$=" 12:"+MID$(TIME$,4,2)+" am":RETURN
333 SAX=SAX-12
334 FDT$=STR$(SAX)+":"+MID$(TIME$,4,2)+" pm"
335 RETURN
336 FDT$=STR$(SAX)+":"+MID$(TIME$,4,2)+" pm":RETURN
337 OPEN DRI$+"CALL.DAT" FOR OUTPUT AS #1
338 PRINT #1,NAM$
339 CLOSE #1
340 RETURN
341 OPEN DRI$+"PLAY.DAT" FOR INPUT AS #1
342 IF EOF(1) THEN CLOSE #1:NAM$="":RETURN
343 INPUT #1,A$
344 INPUT #1,B$
345 INPUT #1,T$:INPUT #1,NAM$
346 INPUT #1,RESERVE$
347 IF A$=PLAYF$ AND B$=PLAYL$ THEN USA=1:CLOSE #1:RETURN
348 GOTO 342
349 V=12:GOSUB 307:PRINT:PRINT:PRINT "Please enter the alias you would like: ";:PRINT #4,"":PRINT #4,"Please enter the alias you would like: ";:BIGT=1:MOW=21:GOSUB 241:A$=RC$:MOW=21:BIG=0
350 IF A$="" THEN GOTO 349
351 V=10:GOSUB 307:PRINT:PRINT:PRINT "Your alias is "+A$:PRINT:PRINT #4,"":PRINT #4,"":PRINT #4,"Your alias is "+A$:PRINT #4,""
352 PRINT "Is this correct (Y/N): ";::PRINT #4,"Is this correct (Y/N): ";:MOW=1:GOSUB 241:A4$=RC$:MOW=21
353 IF A4$="n" OR A4$="N" THEN GOTO 349
354 V=12:GOSUB 307:PRINT:PRINT:PRINT "Please wait, checking users...":PRINT:PRINT #4,"":PRINT #4,"Please wait, checking users...":PRINT #4,""
355 OPEN DRI$+"PLAY.DAT" FOR INPUT AS #1
356 IF EOF(1) THEN CLOSE #1:GOSUB 368:RETURN
357 INPUT #1,Q$:INPUT #1,Q$:INPUT #1,Q$:INPUT #1,JJQ$:INPUT #1,Q$
358 IF JJQ$=A$ THEN V=10:GOSUB 307:PRINT:PRINT:PRINT A$+" is already in use, choose another...":CLOSE #1:PRINT #4,"":PRINT #4,A$+" is already in use, choose another...":GOTO 349
359 GOTO 356
360 CLOSE #1:IF USA=1 THEN RETURN
361 OPEN DRI$+"PLAY.DAT" FOR APPEND AS #1:PRINT #1,PLAYF$
362 PRINT #1,PLAYL$
363 PRINT #1,"0"
364 PRINT #1,A$
365 PRINT #1,""
366 CLOSE #1
367 RETURN
368 V=11:GOSUB 307:PRINT:PRINT "Adding name to users list...":PRINT "If you don't play within 30 days you will be deleted...":PRINT
369 PRINT #4,"":PRINT #4,"":PRINT #4,"Adding name to users list...":PRINT #4,"If you don't play within 30 days you will be deleted...":PRINT #4,""
370 RETURN
371 OPEN DRI$+"DS.DEF" FOR INPUT AS #1
372 INPUT #1,PLAYF$
373 INPUT #1,PLAYL$:INPUT #1,ANSI$:IF TM$="Y" THEN INPUT #1,REMAIN
374 CLOSE #1:RETURN
375 CLOSE #1:CLOSE #2:OPEN DRI$+"PLAY.DAT" FOR INPUT AS #1
376 OPEN DRI$+"TEMP.DAT" FOR OUTPUT AS #2
377 IF EOF(1) THEN CLOSE #2:CLOSE #1:KILL DRI$+"PLAY.DAT": NAME DRI$+"TEMP.DAT" AS "PLAY.DAT":RETURN
378 INPUT #1,A$
379 INPUT #1,B$
380 INPUT #1,C$
381 INPUT #1,D$
382 INPUT #1,E$
383 IF D$=NAM$ THEN C$="0"
384 PRINT #2,A$
385 PRINT #2,B$
386 PRINT #2,C$
387 PRINT #2,D$
388 PRINT #2,E$
389 GOTO 377
390 PRINT:OPEN DRI$+"PLAY.DAT" FOR INPUT AS #1
391 IF EOF(1) THEN CLOSE #1:RETURN
392 INPUT #1,A$:PRINT #4,A$
393 GOTO 391
394 '
395 IF TIMER<INI THEN INI=0:FLG=1:MD=ZT
396 ZT=(TIMER-INI):IF FLG=1 THEN ZT=ZT+MD
397 QT=REMAIN-INT(ZT/60)
398 IF QT<=0 THEN QT=0:TRAK=VAL(EVE2$)+10:OUT$="Sorry, your time is up on the BBS."
399 RETURN
400 PRINT"Position: (";X1;",";Y1;")":PRINT #4,"Position: (";X1;",";Y1;")":PRINT "Armour  :";SAR:PRINT #4,"Armour  :";SAR:RETURN
401 V=10:GOSUB 307:PRINT:PRINT "Your character has been killed recently...":PRINT #4,"Your character has been killed recently..."
402 V=12:GOSUB 307:PRINT:PRINT #4,"":PRINT "Do you wish to change your alias (Y/N): ";:PRINT #4, "Do you wish to change your alias (Y/N): ";:MOW=1:BIGT=1:GOSUB 241:BIGT=0
403 IF RC$="Y" OR RC$="y" THEN GOTO 405
404 RETURN
405 PRINT:PRINT "":PRINT #4,"":PRINT #4,"":V=10:GOSUB 307:PRINT "Please wait...":PRINT #4,"Please wait..."
406 OPEN DRI$+"PLAY.DAT" FOR INPUT AS #1:USA=0
407 OPEN DRI$+"TEMP.DAT" FOR OUTPUT AS #2
408 IF EOF(1) THEN CLOSE #1:CLOSE #2:KILL DRI$+"PLAY.DAT":NAME "TEMP.DAT" AS "PLAY.DAT":RETURN
409 INPUT #1,A$:INPUT #1,B$
412 input #1,C$
413 INPUT #1,D$
414 INPUT #1,E$
415 IF A$=PLAYF$ AND B$=PLAYL$ THEN GOTO 408
416 PRINT #2,A$:PRINT #2,B$
417 PRINT #2,C$:PRINT #2,D$
418 PRINT #2,E$
419 GOTO 408
