 unit GraphLib;
 interface
 uses Crt,Graph;
 procedure deepening(X1,Y1,X2,Y2:integer;Col1,Col2,Col3:byte);
 procedure rising(X1,Y1,X2,Y2:integer;Col1,Col2,Col3:Byte);
 procedure Graphic;
 var
  X,A,B:integer;
 implementation
 procedure rising(X1,Y1,X2,Y2:integer;Col1,Col2,Col3:Byte);
 begin
    setcolor(Col1);
    line(X1,Y1,X2,Y1);
    line(X1,Y1,X1,Y2);
    setfillstyle(1,Col2);
    bar(X1+1,Y1+1,X2-1,Y2-1);
    setcolor(Col3);
    line(X1,Y2,X2,Y2);
    line(X2,Y1,X2,Y2);
 end;
 procedure deepening(X1,Y1,X2,Y2:integer;Col1,Col2,Col3:byte);
 begin
    setcolor(Col1);
    line(X1,Y2,X2,Y2);
    line(X2,Y1,X2,Y2);
    setfillstyle(1,Col2);
    bar(X1+1,Y1+1,X2-1,Y2-1);
    setcolor(Col3);
    line(X1,Y1,X2,Y1);
    line(X1,Y1,X1,Y2-1);
 end;
 procedure twindow(X1,Y1,X2,Y2:integer;Text:string);
 begin
    rising(X1,Y1,X2,Y2,15,7,8);
    deepening(X1+2,Y1+2,X2-2,Y2-2,15,0,8);
    rising(X1+4,Y1+4,X2-4,Y1+28,13,4,13);
    setcolor(14);
    settextstyle(7,HorizDir,1);
    X:=(((X2-X1) div 2)-(textwidth(Text)div 2))+X1;
    outtextxy(X,Y1+5,Text);
    settextstyle(1,HorizDir,3);
 end;
 procedure sides;
 begin
    rising(3,3,635,475,15,7,8);
    deepening(5,5,633,473,15,0,8);
    setfillstyle(1,2);
    bar(7,7,632,472);
 end;
 procedure top;
 begin
    settextstyle(7,HorizDir,3);
    setcolor(15);
    outtextxy(249,40,'Main Menu');
 end;
 procedure Graphic;
 begin
    setfillstyle(1,0);
    bar(0,0,639,480);
    sides;
    top;
    twindow(100,107,250,207,'1');
    twindow(390,107,539,207,'2');
    twindow(100,270,250,370,'3');
    twindow(390,270,539,370,'4');
    setcolor(15);
    outtextxy(117,152,'NEW');
    outtextxy(173,152,'GAME');
    outtextxy(113,315,'DIFFICULTY');
    outtextxy(437,152,'HELP');
    outtextxy(439,315,'QUIT');
 end;
 begin
    A:=detect;
    initgraph(A,B,'');
 end.

