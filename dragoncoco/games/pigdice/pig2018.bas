20CLEAR1000:DIMC$,D$,U:C$=STRING$(7,207)+CHR$(143)+STRING$(7,207):D$=CHR$(128):BL$=STRING$(32," "):BZ$=STRING$(255," "):BS$=STRING$(32,CHR$(153)):B=128:DC$=STRING$(224," ")
30OO$=STRING$(95,CHR$(255)):
40HS=0:GW=0:GD=0:GL=0:HR=0:GC=0:MA=12
50DX=RND(TIMER)
60CLS:GOSUB220
80 IF A$="I" THEN GOSUB 1000:A$="":GOTO60
85 IF A$="G" THEN GOSUB 9500:A$="":GOTO60
90 GOSUB 2000: REM START GAME
93 IF PS>HS THEN HS=PS:GOTO60
95 A$=INKEY$:IFA$=""THEN 95
96 GOTO 60
110 END
220 REM 
221 REM highscore
225 CLS:PRINT@32,BS$;:PRINT@448,BS$;:A$="":GOSUB9000
236 PRINT@327,"p TO START THE GAME"
237 PRINT@359,"i FOR INSTRUCTIONS"
238 PRINT@391,"g FOR GAME STATS"
239 IF HS>0 THEN PRINT@103 ,"high score " + STR$(HS)
240 REM
250 A$=INKEY$:IFA$="I"ORA$="P"ORA$="G" THEN RETURN ELSE 250
1000 CLS:PRINT "PIG IS A DICE GAME FOR 2"
1020 PRINT "PLAYERS. THE OBJECT IS TO GET"
1030 PRINT "THE HIGHEST SCORE. YOU SCORE"
1040 PRINT "POINTS BY ROLLING 2 DICE. THE"
1050 PRINT "RESULT IS ADDED TO A RUNNING"
1060 PRINT "TOTAL FOR THIS TURN.":PRINT
1070 PRINT "YOU CAN THEN CHOOSE TO ROLL"
1080 PRINT "AGAIN, OR TO PASS AND TAKE THE"
1090 PRINT "POINTS."
1100 PRINT "IF YOU PLAY AGAIN AND ROLL THE"
1110 PRINT "SAME VALUE AS YOUR FIRST ROLL"
1120 PRINT "OF THAT TURN, THEN YOU GAIN NO" 
1130 PRINT "POINTS AND THE OTHER PLAYER"
1140 PRINT "STARTS THEIR TURN."
1145 A$=INKEY$:IFA$=""THEN 1145
1150 CLS:PRINT "FOR EXAMPLE,":PRINT "PLAYER 1 ROLLS"
1160 PRINT "[4][3] 7 <- HAVE TO AVOID 7"
1170 PRINT "[5][1] 13"
1180 PRINT "PLAYER 1 DECIDES TO PASS"
1190 PRINT "PLAYER 1 BANKS 13 POINTS":PRINT
1200 PRINT "PLAYER 2 PLAYS"
1210 PRINT "[5][5] 10 <- HAVE TO AVOID 10"
1220 PRINT "[6][1] 17"
1230 PRINT "[6][4]  <- OH NO 10 AGAIN!"
1240 PRINT "PLAYER 2 BANKS 0 POINTS":PRINT
1250 PRINT "THIS CONTINUES OVER " + STR$(MA) + " TURNS"
1255 A$=INKEY$:IFA$=""THEN 1255
1260 RETURN
2000 PS=0 : REM player score
2040 CS=0 : REM dragon score
2050 RO=1 : REM round
2055 RS=0: REM score from current round.
2056 WH=RND(2): REM who plays first.
2057 RT=1: REM 1 IF PLAYER ROLLS
2065 AV = 0 : REM first roll value
2066 CR = 0 : REM current roll
2070 CLS8:PRINT@96, BZ$:PRINT@352, BL$;
2080 PRINT @1, "turn";
2090 PRINT @12, "you";
2100 PRINT @22, "dragon";
2101PRINT@5,STR$(RO);
2102PRINT@15,STR$(PS);
2103PRINT@28,STR$(CS);
2104PRINT@64,BS$;
2105PRINT@384,BS$;
2108 IF WH=1 THEN POKE 1045,255:POKE 1035,223 ELSE POKE 1035,255:POKE 1045,223
2110IFWH=1THENGOSUB5000ELSEGOSUB 6010
2180IFRT=1THENGOSUB3000
2280 IF RT=1 THEN2101
2290 REM ROUND OVER
2300 IF WH=1 THEN PS=PS+RS:WHO=2 ELSE CS=CS+RS:WH=1
2302 AV=0
2305 GOSUB7000
2310 FORD=0TO200:PRINT@352,BL$;
2990 RO = RO + 1: RS = 0: AV=0: IF RO<=MA THEN 2101
2994 GOSUB8000
2999 RETURN
3000 PLAY "O3T255ABCDEF"
3026 DX=1+RND(12):CR=0:GOSUB4000
3038 RS=RS+DD:CR=DD
3040 DX=DX+8
3042 GOSUB4000
3043 RS=RS+DD:CR=CR+DD
3045 IF AV=0 THEN AV = CR ELSE IF AV=CR THEN RT=2:RS=0:SOUND 40,7:PRINT@96, BL$+BL$+BL$+BL$+BL$:PRINT@256,BL$+BL$+BL$:GOSUB9000:FORDB=1TO99:NEXTDB
3999 RETURN
4000U=B+DX
4010IFCR>0THEN4030ELSEPRINT@128,DC$;
4020PRINT@U,C$;:PRINT@U+32,C$;:PRINT@U+64,C$;:PRINT@U+96,C$;:PRINT@U+128,C$;:PRINT@U+160,C$;:PRINT@U+192,C$;
4030DD=RND(6):GOSUB4500
4120RETURN
4500ON DD GOSUB4540,4550,4560,4570,4580,4590:RETURN
4540PRINT@U+99,D$;:RETURN
4550PRINT@U+37,D$;:PRINT@U+161,D$;:RETURN
4560PRINT@U+37,D$;:PRINT@U+99,D$;:PRINT@U+161,D$;:RETURN
4570PRINT@U+33,D$;:PRINT@U+37,D$;:PRINT@U+161,D$;:PRINT@U+165,D$;:RETURN
4580PRINT@U+99,D$;:PRINT@U+33,D$;:PRINT@U+37,D$;:PRINT@U+161,D$;:PRINT@U+165,D$;:RETURN
4590PRINT@U+97,D$;:PRINT@U+101,D$;:PRINT@U+33,D$;:PRINT@U+37,D$;:PRINT@U+161,D$;:PRINT@U+165,D$;:RETURN
4900REM----
5000PRINT@439,"total"+STR$(RSC);
5010IFAV=0THENPRINT@483,"r"+CHR$(255)+"TO"+CHR$(255)+"ROLL";:RT=3
5015IFAV>0THENPRINT@499,"b"+CHR$(255)+"TO"+CHR$(255)+"BANK";:PRINT@417,"avoid"+STR$(AV);
5020A$=INKEY$:IFA$=""THEN5020
5030IFA$="R"THENRT=1
5035IFAV>0ANDA$="B"THENRT=2:PLAY"O4T255ABCDEF"
5040IFRT=3THEN5020
5999RETURN
6000 REM  DRAGON
6010IFAV=0THENPRINT@416,OO$;:PRINT@439,"total";:PRINT@485,"the"+CHR$(255)+"dragon"+CHR$(255)+"is"+CHR$(255)+"playing";
6012PRINT@444,STR$(RSC);
6013IFAV>0THENPRINT@417,"avoid"+STR$(AV);
6015 FOR D=1TO200:NEXTD
6020 IF AV=0 THEN RT=1:RETURN
6023 IF CS=0 AND RS>15 THEN RT=2:RETURN
6025 IF RO=MA AND (CS+RS)>PS THEN RT=2:RETURN
6026 IF RO=MA AND CS<=PS THEN RT=1:RETURN
6028 IF RS>(46+RND(30)) THEN RT=2:RETURN
6030 IF AV<10 THEN RT=1:RETURN
6040 IF AV>4 AND AV<10 THEN RT=RND(2):RETURN ELSE RT=1:RETURN
6999 RETURN
7000 PLAY "O3T255BCDEBCDE"
7015 PRINT @417, STRING$(65,CHR$(255));
7016 PRINT @480,  STRING$(28,CHR$(255));
7018 IF WH=2 AND HR<RS THEN HR=RS
7019 IF WH=2 AND RS>100 THEN GC=GC+1:PLAY"DAG"
7020 IF WH=1 THEN PRINT @359, "dragon scored :" +STR$(RS);
7030 IF WH=2 THEN PRINT @360, "you scored :"+STR$(RS);
7040 FORD=0TO600:NEXTD:PRINT @480,  STRING$(28,CHR$(255));
7100 PLAY "O4T255BCDEBCDE"
7999 RETURN
8000 REM  END
8014 PLAY "O3T125BCDEBCDECDEBCDE"
8015 PRINT @416, STRING$(95,CHR$(255));
8020 IF PS>CS THEN RE$="you"+CHR$(255)+"are"+CHR$(255)+"the"+CHR$(255)+"winner":GW=GW+1
8030 IF CS>PS THEN RE$="the"+CHR$(255)+"dragon"+CHR$(255)+"is"+CHR$(255)+"the"+CHR$(255)+"winner":GL=GL+1
8040 IF CS=PS THEN RE$="you"+CHR$(255)+"and"+CHR$(255)+"the"+CHR$(255)+"dragon"+CHR$(255)+"tie!":GD=GD+1
8050 PRINT @15, STR$(PS); : PRINT @28, STR$(CS);
8150 FORD=0TO200:NEXTD:PRINT@480 + INT((31-LEN(RE$))/2), RE$;
8160 A$=INKEY$:IFA$=""THEN 8160
8999 RETURN
9000 PRINT@171, CHR$(239) + " " + CHR$(239);
9017 PRINT@203, CHR$(238) + CHR$(238) + STRING$(8,CHR$(239));
9018 PRINT@234, STRING$(12,CHR$(239));
9019 PRINT@269, STRING$(3,CHR$(239)) + "  " + STRING$(3,CHR$(239));
9060 RETURN
9500 CLS:PRINT:PRINT BS$
9535 PRINT
9540 PRINT TAB(2)+"GAMES WON     : " + STR$(GW) : PRINT
9550 PRINT TAB(2)+"GAMES LOST    : " + STR$(GL) : PRINT
9560 PRINT TAB(2)+"GAMES DRAWN   : " + STR$(GD) : PRINT
9570 PRINT TAB(2)+"HIGHEST ROLL  : " + STR$(HR) : PRINT
9580 PRINT TAB(2)+"CENTURY ROLLS : " + STR$(GC):PRINT:PRINT BS$;
9900 A$=INKEY$:IFA$=""THEN 9900
9930 RETURN
