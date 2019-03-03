1 ONERROR GOTO 100000

7 REM ================================================
8 REM ---------------- VARIABLES -------------------
9 REM ================================================

10 REM ~==Number of files per type.==~
20 numberFilesChat    = 28
30 numberFilesGen     = 23
40 numberFilesWhistle = 3
50 numberFilesMad     = 10
60 numberFilesAlert   = 3
70 numberFilesScream  = 2
80 numberFilesSad     = 7
90 numberFilesLovey   = 5

100 REM ~==Activate the LINE OUT jack==~
110 @LINEIN=1

300 REM ~==Set the starting sound bank.==~
310 soundBank = 1

320 REM ~==Starting setting for random sounds (0=off, 1=on)==~
330 randomSounds = 0

340 REM ~==Starting volume for CFSound IV. (0-63)==~
350 @NSVOL=63

500 REM ================================================
501 REM ---------------- SPLASH TEXT -------------------
502 REM ================================================
501 REM The PRINT statements used throughout the program
502 REM are only seen when connected via the serial port.
503 REM They are mostly for debugging purposes.
510 PRINT "CFSOUND.BAS - A CFSound IV program written for R2-KT"
520 PRINT "v1.0 May 5, 2015"
530 PRINT "by Christopher M Moody (mrivorey on Astromech.Net)"
535 PRINT "support email: chris@tk394.com"
540 PRINT "Released under Creative Commons Attribution 3.0 United States License"
550 PRINT "Developed on a CFSound IV using firmware 1.2.10, running ASC BASIC v3.1.5."

600 REM ================================================
601 REM ----------------- BOOT SOUND -------------------
602 REM ================================================
610 @SOUND$="boot.wav"

700 REM ================================================
701 REM --------------- EVENT HANDLERS -----------------
702 REM ================================================
710 ONEVENT @CLOSURE[0], GOSUB 10000 : REM User Presseed Button #1
720 ONEVENT @CLOSURE[1], GOSUB 11000: REM User Presseed Button #2
730 ONEVENT @CLOSURE[2], GOSUB 12000: REM User Presseed Button #3
740 ONEVENT @CLOSURE[3], GOSUB 13000: REM User Presseed Button #4
750 ONEVENT @CLOSURE[4], GOSUB 14000: REM User Presseed Button #5
760 ONEVENT @CLOSURE[5], GOSUB 15000: REM User Presseed Button #6
770 ONEVENT @CLOSURE[6], GOSUB 16000: REM User Presseed Button #7
780 ONEVENT @CLOSURE[7], GOSUB 17000 : REM User Presseed Button #8
790 ONEVENT @CLOSURE[8], GOSUB 18000 : REM User Presseed Button #9
800 ONEVENT @CLOSURE[9], GOSUB 19000 : REM User Presseed Button #10
810 ONEVENT @CLOSURE[10], GOSUB 20000 : REM User Presseed Button #11
820 ONEVENT @CLOSURE[11], GOSUB 21000 : REM User Presseed Button #12
830 ONEVENT @CLOSURE[12], GOSUB 22000 : REM User Presseed Button #13
840 ONEVENT @CLOSURE[13], GOSUB 23000 : REM User Presseed Button #14
850 ONEVENT @CLOSURE[14], GOSUB 24000 : REM User Presseed Button #15
860 ONEVENT @CLOSURE[15], GOSUB 25000 : REM User Presseed Button #16
870 ONEVENT @CLOSURE[16], GOSUB 26000 : REM User Presseed Button #17
880 ONEVENT @CLOSURE[17], GOSUB 27000 : REM User Presseed Button #18
890 ONEVENT @CLOSURE[18], GOSUB 28000 : REM User Presseed Button #19
900 ONEVENT @CLOSURE[19], GOSUB 29000 : REM User Presseed Button #20
910 ONEVENT @CLOSURE[20], GOSUB 30000 : REM User Presseed Button #21
920 ONEVENT @CLOSURE[21], GOSUB 31000 : REM User Presseed Button #22
930 ONEVENT @CLOSURE[22], GOSUB 32000 : REM User Presseed Button #23
940 ONEVENT @CLOSURE[23], GOSUB 33000 : REM User Presseed Button #24

950 ONEVENT @TIMER[1], GOSUB 3000 : REM When the random sound timer finishes


1000 REM ================================================
1001 REM --------------- INFINITE LOOP ------------------
1002 REM ================================================
1003 REM This is normal. The event handlers above will
1004 REM interrupt the program regardless of where it is.
1010 GOTO 1010

2000 REM ================================================
2001 REM --------------- PLAY THE SOUND -----------------
2002 REM ================================================
2000 PRINT "Playing file:", filename$
2020 @SOUND$ = "" : REM This stops any sound that might already be playing.
2030 @SOUND$ = filename$
2099 RETURN

3000 REM ================================================
3001 REM ---------------- RANDOM SOUNDS -----------------
3002 REM ================================================
3010 REM -- Determine which sound bank will be used.
3020 randomBank = RND(20)+1
3030 IF randomBank <= 9 THEN GOSUB 10000 : REM Sound bank #1
3040 IF randomBank > 9 AND < 19 THEN GOSUB 11000 : REM Sound bank #2
3050 IF randomBank = 19 THEN GOSUB 12000 : REM Sound bank #3
3060 IF randomBank = 20 THEN GOSUB 13000 : REM Sound bank #4
3070 REM -- Reset the countdown timer.
3080 @TIMER[1] = RND(1000)
3090 PRINT "Counting down from ",randomTime," until next random sound."
3999 RETURN

10000 REM ================================================
10001 PRINT "USER PRESSED BUTTON/SWITCH #1 - CHATY"
10002 REM ================================================
10010 soundIndex = RND(numberFilesChat)+1
10020 filename$ = FMT$("chat-%u.wav", soundIndex)
10030 GOSUB 2000 : REM === PLAY THE SOUND ===
10999 RETURN

11000 REM ================================================
11001 PRINT "USER PRESSED BUTTON/SWITCH #2 - GENERIC"
11002 REM ================================================
11010 soundIndex = RND(numberFilesGen)+1
11020 filename$ = FMT$("gen-%u.wav", soundIndex)
11030 GOSUB 2000 : REM === PLAY THE SOUND ===
11999 RETURN

12000 REM ================================================
12001 PRINT "USER PRESSED BUTTON/SWITCH #3 - YES"
12002 REM ================================================
12020 filename$ = "yes.wav"
12030 GOSUB 2000 : REM === PLAY THE SOUND ===
12999 RETURN

13000 REM ================================================
13001 PRINT "USER PRESSED BUTTON/SWITCH #4 - LAUGH"
13002 REM ================================================
13020 filename$ = "laugh.wav"
13030 GOSUB 2000 : REM === PLAY THE SOUND ===
13999 RETURN

14000 REM ================================================
14001 PRINT "USER PRESSED BUTTON/SWITCH #5 - ATTENTION WHISTLE"
14002 REM ================================================
14010 soundIndex = RND(numberFilesWhistle)+1
14020 filename$ = FMT$("whist-%u.wav", soundIndex)
14030 GOSUB 2000 : REM === PLAY THE SOUND ===
14999 RETURN

15000 REM ================================================
15001 PRINT "USER PRESSED BUTTON/SWITCH #6 - NO"
15002 REM ================================================
15020 filename$ = "no.wav"
15030 GOSUB 2000 : REM === PLAY THE SOUND ===
15999 RETURN

16000 REM ================================================
16001 PRINT "USER PRESSED BUTTON/SWITCH #7 - MAD"
16002 REM ================================================
16010 soundIndex = RND(numberFilesMad)+1
16020 filename$ = FMT$("mad-%u.wav", soundIndex)
16030 GOSUB 2000 : REM === PLAY THE SOUND ===
16999 RETURN

17000 REM ================================================
17001 PRINT "USER PRESSED BUTTON/SWITCH #8 - ALERT"
17002 REM ================================================
17010 soundIndex = RND(numberFilesAlert)+1
17020 filename$ = FMT$("alert-%u.wav", soundIndex)
17030 GOSUB 2000 : REM === PLAY THE SOUND ===
17999 RETURN

18000 REM ================================================
18001 PRINT "USER PRESSED BUTTON/SWITCH #9 - SCREAM"
18002 REM ================================================
18010 soundIndex = RND(numberFilesScream)+1
18020 filename$ = FMT$("scream-%u.wav", soundIndex)
18030 GOSUB 2000 : REM === PLAY THE SOUND ===
18999 RETURN

19000 REM ================================================
19001 PRINT "USER PRESSED BUTTON/SWITCH #10 - SHORT CIRCUIT"
19002 REM ================================================
19010 filename$ = "short.wav"
19020 GOSUB 2000 : REM === PLAY THE SOUND ===
19999 RETURN

20000 REM ================================================
20001 PRINT "USER PRESSED BUTTON/SWITCH #11 - SAD"
20002 REM ================================================
20010 soundIndex = RND(numberFilesSad)+1
20020 filename$ = FMT$("sad-%u.wav", soundIndex)
20030 GOSUB 2000 : REM === PLAY THE SOUND ===
20999 RETURN

21000 REM ================================================
21001 PRINT "USER PRESSED BUTTON/SWITCH #12 - TOGGLE RANDOM"
21002 REM ================================================
21010 IF randomSounds = 0 THEN 21100
21020 REM ~== If Random Sounds was already on, turn it off. ==~
21030 randomSounds = 0
21040 @TIMER[1] = 0
21050 filename$ = "chirp-2.wav"
21060 GOSUB 2000 : REM === PLAY THE SOUND ===
21070 PRINT "Random Sounds: OFF"
21080 RETURN
21100 REM ~== If Random Sounds was already off, turn it on. ==~
21100 randomSounds = 1
21110 @TIMER[1] = 50
21120 filename$ = "chirp-1.wav"
21130 PRINT "Random Sounds: ON"
21999 RETURN

22000 REM ================================================
22001 PRINT "USER PRESSED BUTTON/SWITCH #13"
22002 REM ================================================
22010 IF soundBank = 1 THEN 22100
22020 IF soundBank = 2 THEN 22200
22030 GOSUB 31200 : REM How do you not have a soundBank??
22040 GOTO 22100
22100 filename$ = "cantina-r2.wav"
22110 GOSUB 2000 : REM === PLAY THE SOUND ===
22120 RETURN
22200 soundIndex = RND(numberFilesLovey)+1
22210 filename$ = FMT$("lovey-%u.wav", soundIndex)
22220 GOSUB 2000 : REM === PLAY THE SOUND ===
22230 RETURN

23000 REM ================================================
23001 PRINT "USER PRESSED BUTTON/SWITCH #14"
23002 REM ================================================
23010 IF soundBank = 1 THEN 23100
23020 IF soundBank = 2 THEN 23200
23030 GOSUB 31200 : REM How do you not have a soundBank??
23040 GOTO 23100
23100 filename$ = "cantina.wav"
23110 GOSUB 2000 : REM === PLAY THE SOUND ===
23120 RETURN
23200 filename$ = "inlove.wav"
23210 GOSUB 2000 : REM === PLAY THE SOUND ===
23220 RETURN

24000 REM ================================================
24001 PRINT "USER PRESSED BUTTON/SWITCH #15"
24002 REM ================================================
24010 IF soundBank = 1 THEN 24100
24020 IF soundBank = 2 THEN 24200
24030 GOSUB 31200 : REM How do you not have a soundBank??
24040 GOTO 24100
24100 filename$ = "thx.wav"
24110 GOSUB 2000 : REM === PLAY THE SOUND ===
24120 RETURN
24200 filename$ = "wolf.wav"
24210 GOSUB 2000 : REM === PLAY THE SOUND ===
24220 RETURN

25000 REM ================================================
25001 PRINT "USER PRESSED BUTTON/SWITCH #16"
25002 REM ================================================
25010 IF soundBank = 1 THEN 25100
25020 IF soundBank = 2 THEN 25200
25030 GOSUB 31200 : REM How do you not have a soundBank??
25040 GOTO 25100
25100 filename$ = "fox.wav"
25110 GOSUB 2000 : REM === PLAY THE SOUND ===
25120 RETURN
25200 soundIndex = RND(numberFilesMad)+1 : filename$ = FMT$("mad-%u.wav", soundIndex)
25210 GOSUB 2000 : REM === PLAY THE SOUND ===
25220 RETURN

26000 REM ================================================
26001 PRINT "USER PRESSED BUTTON/SWITCH #17"
26002 REM ================================================
26010 IF soundBank = 1 THEN 26100
26020 IF soundBank = 2 THEN 26200
26030 GOSUB 31200 : REM How do you not have a soundBank??
26040 GOTO 26100
26100 filename$ = "starwars.wav"
26110 GOSUB 2000 : REM === PLAY THE SOUND ===
26120 RETURN
26200 filename$ = "macho.wav"
26210 GOSUB 2000 : REM === PLAY THE SOUND ===
26220 RETURN

27000 REM ================================================
27001 PRINT "USER PRESSED BUTTON/SWITCH #18"
27002 REM ================================================
27010 IF soundBank = 1 THEN 27100
27020 IF soundBank = 2 THEN 27200
27030 GOSUB 31200 : REM How do you not have a soundBank??
27040 GOTO 27100
27100 filename$ = "imperial.wav"
27110 GOSUB 2000 : REM === PLAY THE SOUND ===
27120 RETURN
27200 filename$ = "scream-1.wav"
27210 GOSUB 2000 : REM === PLAY THE SOUND ===
27220 RETURN

28000 REM ================================================
28001 PRINT "USER PRESSED BUTTON/SWITCH #19"
28002 REM ================================================
28010 IF soundBank = 1 THEN 28100
28020 IF soundBank = 2 THEN 28200
28030 GOSUB 31200 : REM How do you not have a soundBank??
28040 GOTO 28100
28100 filename$ = "leiaS.wav"
28110 GOSUB 2000 : REM === PLAY THE SOUND ===
28120 RETURN
28200 filename$ = "bday.wav"
28210 GOSUB 2000 : REM === PLAY THE SOUND ===
28220 RETURN

29000 REM ================================================
29001 PRINT "USER PRESSED BUTTON/SWITCH #20"
29002 REM ================================================
29010 IF soundBank = 1 THEN 29100
29020 IF soundBank = 2 THEN 29200
29030 GOSUB 31200 : REM How do you not have a soundBank??
29040 GOTO 29100
29100 filename$ = "leiaL.wav"
29110 GOSUB 2000 : REM === PLAY THE SOUND ===
29120 RETURN
29200 filename$ = "muppet.wav"
29210 GOSUB 2000 : REM === PLAY THE SOUND ===
29220 RETURN

30000 REM ================================================
30001 PRINT "USER PRESSED BUTTON/SWITCH #21"
30002 REM ================================================
30010 IF soundBank = 1 THEN 30100
30020 IF soundBank = 2 THEN 30200
30030 GOSUB 31200 : REM How do you not have a soundBank??
30040 GOTO 30100
30100 filename$ = "sunsets.wav"
30110 GOSUB 2000 : REM === PLAY THE SOUND ===
30120 RETURN
30200 filename$ = "stayin.wav"
30210 GOSUB 2000 : REM === PLAY THE SOUND ===
30220 RETURN

31000 REM ================================================
31001 PRINT "USER PRESSED BUTTON/SWITCH #22 - SOUND BANK"
31002 REM ================================================
31010 @SOUND$=""
31020 IF soundBank = 1 THEN 31100
31030 IF soundBank = 2 THEN 31200
31040 GOTO 31200
31100 REM ~== Activate sound bank #2 ==~
31110 soundBank = 2
31120 PRINT "Sound bank #2 is now active."
31130 @SOUND$ = "chirp-2.wav"
31140 RETURN
31200 REM ~== Activate sound bank #1 ==~
31210 soundBank = 1
31220 PRINT "Sound bank #1 is now active."
31230 @SOUND$ = "chirp-1.wav"
31240 RETURN

32000 REM ================================================
32001 PRINT "USER PRESSED BUTTON/SWITCH #23 - VOLUME DOWN"
32002 REM ================================================
32010 IF @NSVOL > 4 THEN LET @NSVOL = @NSVOL - 5 ELSE @SOUND$ = "no.wav"
32020 @SOUND$="volume.wav"
32030 RETURN

33000 REM ================================================
33001 PRINT "USER PRESSED BUTTON/SWITCH #24 - VOLUME UP"
33002 REM ================================================
33010 IF @NSVOL < 59 THEN LET @NSVOL = @NSVOL + 5 ELSE @SOUND$ = "no.wav"
33020 @SOUND$="volume.wav"
33030 RETURN

100000 REM ================================================
100001 REM -------------- Error Handling ------------------
100002 REM ================================================
100010 PRINT "An error occurred: #", ERR()
100015 REM ~=== Log the error in a text file ===~
100020 OPEN #0, "error.log","a+w"
100030 PRINT #0, ERR$()
100040 CLOSE #0
100045 REM ~=== IF .WAV file was invalid, it's not fatal. Go back to the loop. ===~
100050 IF ERR()=23 THEN 1000
100055 REM ~=== Otherwise, play the short circuit sound, and kill the program.
100060 @SOUND$=""
100070 @SOUND$="short.wav"
100080 END
