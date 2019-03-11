 unit Lib1;
 interface
 uses Crt,Graph,Lib2,Hlp_Cnt;
 procedure Game;
 procedure Help;
 procedure Quit;
 var
    V,V1 : Char;
    C1 : Byte;
 implementation
 uses graphlib;
 procedure twindow(X1,Y1,X2,Y2:integer;Text:string);
 begin
    rising(X1,Y1,X2,Y2,15,7,8);
    deepening(X1+2,Y1+2,X2-2,Y2-2,15,0,8);
    rising(X1+4,Y1+4,X2-4,Y1+28,13,5,13);
    setcolor(15);
    settextstyle(4,HorizDir,3);
    X:=(((X2-X1) div 2)-(textwidth(Text)div 2))+X1;
    outtextxy(X,Y1,Text);
 end;
 procedure Game;
 begin
    setfillstyle(1,0);
    bar(105,140,240,190);
    settextstyle(7,HorizDir,2);
    setcolor(14);
    outtextxy(113,145,'New Game?');
    outtextxy(143,170,'[Y/N]');
    V:=readkey;
    if UpCase(V)='Y' then
       Play_Game;
 end;
 procedure Help;
 procedure About;
 begin
    setfillstyle(1,0);
    bar(0,0,639,480);
    setfillstyle(1,9);
    bar(0,0,639,480);
    twindow(150,75,490,415,'About fb');
    setcolor(15);
    settextstyle(4,HorizDir,4);
    outtextxy(290,170,'With');
    outtextxy(265,345,'Nobody');
    settextstyle(4,HorizDir,2);
    outtextxy(240,110,'You are Wellcome');
    outtextxy(180,145,'Programmed by : Ali Mazloom');
    outtextxy(250,260,'2000 - 2001');
    settextstyle(4,HorizDir,3);
    outtextxy(225,315,'Special Thanks to');
    outtextxy(235,225,'Pascal Language');
    outtextxy(409,315,':');

    readkey;
 end;
 begin
    setfillstyle(1,0);
    bar(395,140,535,200);
    settextstyle(7,HorizDir,3);
    setcolor(13);
    outtextxy(420,141,'Contents');
    outtextxy(420,167,'About');
    setcolor(11);
    C1:=1;
    outtextxy(403,119+25*C1,'*');
    repeat
        if C1=0 then
          C1:=1;
        V1:=ReadKey;
        if V1<>#0 then
        if (V1<>#80)and(V1<>#13) then
          exit;
        if V1=#80 then
        begin
           setcolor(0);
           if C1=2 then
           begin
              C1:=0;
              outtextxy(403,169,'*');
           end;
           if C1<>0 then
              outtextxy(403,119+25*C1,'*');
           setcolor(11);
           outtextxy(403,144+25*C1,'*');
           C1:=C1+1;
        end
    until (V1=#13);
    case C1 of
       1 : Help_Content_1;
       2 : About;
    end;
 end;
 procedure Quit;
 begin
    setfillstyle(1,0);
    bar(435,310,520,360);
    settextstyle(7,HorizDir,2);
    setcolor(11);
    outtextxy(419,305,'Already?');
    outtextxy(435,330,'[Y/N]');
    V:=readkey;
    if UpCase(V)='Y' then
    begin
       closegraph;
       halt(0);
    end;
 end;
 begin
 end.
