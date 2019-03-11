 unit Hlp_Cnt;
 interface
 uses Crt,Graph;
 procedure Help_Content_1;
 implementation
 uses Graphlib;
 var
    Ch:Char;
 procedure Help_Content_2;
 begin
    setfillstyle(1,0);
    bar(0,0,639,480);
    setcolor(14);
    settextstyle(1,0,2);
    outtextxy(222,0,'Rules of the Game');
    outtextxy(35,370,'A Black peg is shown.');
    outtextxy(35,418,'A White peg is displayed.');
    setcolor(12);
    outtextxy(35,25,'FB');
    outtextxy(35,113,'FB');
    outtextxy(7,132,'Beginner:');
    outtextxy(7,175,'Intermediate:');
    outtextxy(7,215,'Expert:');
    settextstyle(1,0,1);
    setcolor(15);
    outtextxy(60,25,' is a single player Game.Your goal is to break the secret code');
    outtextxy(20,48,'Created by the Computer.The Code is made of 5 slots that each');
    outtextxy(20,69,'slot is contained of a Colored ball and its color is a random color');
    outtextxy(20,89,'Among 8 Colors.');
    outtextxy(60,113,' offers You 3 Levels :');
    outtextxy(10,155,'Computer fills all slots with balls and each ball has its own color');
    outtextxy(10,197,'Computer fills all slots and several balls may share the same color');
    outtextxy(10,238,'Computer may leave empty one or several slots and several balls');
    outtextxy(20,258,'may share the same Color.');
    outtextxy(10,285,'You have up to 12 guesses to break the code.if You fail to break');
    outtextxy(10,307,'the code,Computer will display it.After You filled all slots in a row,');
    outtextxy(10,327,'Computer gives You the following Information :');
    outtextxy(10,349,'Any time a perfect match exists for a slot(Same Color,Same place),');
    outtextxy(10,395,'Any time a match exists for a slot(Same Color),');
    setfillstyle(1,1);
    bar(350,428,610,475);
    setcolor(13);
    settextstyle(1,0,2);
    outtextxy(353,425,'<Any Key>');
    outtextxy(353,450,'<Page Up>');
    setcolor(15);
    outtextxy(440,425,'   Main Menu');
    outtextxy(460,450,' Previous Page');
    Ch:=readkey;
    if Ch=#0 then
    begin
       Ch:=readkey;
       if Ch=#73 then
         Help_content_1;
    end;
 end;
 procedure Help_Content_1;
 begin
    setfillstyle(1,0);
    bar(0,0,639,480);
    setcolor(14);
    settextstyle(1,0,2);
    outtextxy(247,0,'How to Play?');
    outtextxy(20,350,'Comments :');
    setcolor(12);
    outtextxy(20,30,'New Game ');outtextxy(20,95,'Help');outtextxy(20,177,'Difficulty');
    outtextxy(20,325,'Quit');outtextxy(505,150,'Fb');outtextxy(20,375,'1.');
    outtextxy(20,400,'2.');
    setcolor(15);
    outtextxy(137,30,'Pressing <Y> restarts a New Game.');
    outtextxy(80,60,'A Help window has prepared during the Game.');
    outtextxy(80,95,'Contains of 2 Parts,');
    outtextxy(100,120,'2a) Contents : This Help Screen.');
    outtextxy(100,150,'2b) About : General Information about');
    outtextxy(125,177,'Contains of 3 Levels.');
    outtextxy(45,202,'Choose them by Pressing <down ward Cursor> Key,and');
    outtextxy(20,227,'Confirm Your Selection by Pressing <Enter>.');
    outtextxy(100,250,'3a) Beginner Level');
    outtextxy(100,275,'3b) Intermediate Level');
    outtextxy(100,300,'3c) Expert Level');
    outtextxy(80,325,'Pressing <Y> will Terminate the Game.');
    settextstyle(1,0,1);
    outtextxy(40,377,'To select a Menu in Main Menu,Press the number on top of it.');
    outtextxy(40,402,'Pressing <Esc> will Return you to the Main Menu ,');
    outtextxy(50,425,'in every position.');
    setfillstyle(1,1);
    bar(350,428,610,475);
    setcolor(13);
    settextstyle(1,0,2);
    outtextxy(365,425,'<Any Key>');
    outtextxy(353,450,'<Page Down>');
    setcolor(15);
    outtextxy(490,425,'Main Menu');
    outtextxy(497,450,'Next Page');
    Ch:=readkey;
    if Ch=#0 then
    begin
       Ch:=readkey;
       if Ch=#81 then
         Help_content_2;
    end;
 end;
 begin
 end.