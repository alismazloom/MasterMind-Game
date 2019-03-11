 unit Lib2;
 interface
 procedure Level;
 procedure Play_Game;
 var
    I, J, K, M, C, R: Byte;
    Gd, Gm : Integer;
    text: string;
    Ch, V: char;
    Test: boolean;
    guess, magic, result: array[0..5] of byte;
 implementation
 uses
 Crt,Graph,Graph3,Graphlib;
 procedure Level;
 begin
    setfillstyle(1,0);
    bar(105,310,240,360);
    settextstyle(7,HorizDir,1);
    setcolor(10);
    outtextxy(120,302,'Beginner');
    outtextxy(120,322,'Intermediate');
    outtextxy(120,342,'Expert');
    setcolor(13);
    if C = 0 then
      C:=1;
    outtextxy(110,303+20*(C-1),'*');
    repeat
        V:=ReadKey;
        if V=#80 then
        begin
           setcolor(0);
           if C=3 then
           begin
              C:=0;
              outtextxy(110,343,'*');
           end;
           if C<>0 then
             outtextxy(110,303+20*(C-1),'*');
           setcolor(13);
           outtextxy(110,303+20*C,'*');
           C:=C+1;
        end;
    until V=#13;
    R:=10;
 end;
 procedure Read_Array(j:byte);
 begin
    for k:=1 to 5 do
       guess[k]:=200;
    for k:=1 to 5 do
    begin
       repeat
          repeat
             Ch:=Readkey;
             if Ch=#13 then
               Continue;
             if Ch=#27 then
               exit;
             guess[k]:=Ord(ch)-48;
          until (guess[k] >= 0) and (guess[k]<9);
          setcolor(7);
          if(guess[k]>0) and (guess[k]<5) then
            setfillstyle(1,guess[k]-1);
          if(guess[k]>4) then
            setfillstyle(1,guess[k]+7);
          fillellipse(210+26*k,383-25*j,10,10);
          setcolor(15);
          setfillstyle(1,15);
          fillellipse(206+26*k,379-25*j,1,1);
          if guess[k] = 0 then
          begin
             setcolor(7);
             setfillstyle(1,7);
             fillellipse(210+26*k,383-25*j,10,10);
             setfillstyle(1,0);
             fillellipse(210+26*k,383-25*j,4,4);
          end;
       until Ch=#13;
    end;
 end;
 procedure Magic_Maker;
 begin
    Randomize;
    for k:=1 to 5 do
    begin
       test:=true;
       while test do
       begin
          if C = 3 then
             magic[k]:=random(16)+1
          else
             magic[k]:=random(15)+1;
          if magic[k] = 16 then
             magic[k]:=0;
          if magic[k] > 11  then
             magic[k]:=magic[k]-7
          else if(magic[k]>4) and (magic[k]<12) then
             Continue;
          if k=1 then
             break;
          if R<>10 then
             C:=1;
          if C = 1 then
             for m:=2 to k do
                if magic[m-1] = magic[k] then
                begin
                   m:=10;
                   break;
                end;
          if m = 10 then
             continue;
          test:=false;
       end;
    end;
 end;
 procedure Compare;
 begin
    for k:=1 to 5 do
      for m:=1 to 5 do
      begin
         if guess[m] = magic[m] then
         begin
            setcolor(0);
            setfillstyle(1,0);
            fillellipse(369+20*m,383-25*j,4,4);
         end
         else if (guess[m] = magic[k]) then
         begin
            setcolor(15);
            setfillstyle(1,15);
            fillellipse(369+20*m,383-25*j,4,4);
         end;
      end;
      guess[0]:=0;
      for i:=1 to 5 do
        if (guess[i] = magic[i]) then
           guess[i]:=10;
      for i:=1 to 5 do
        guess[i]:=guess[i]+guess[i-1];
 end;
 procedure Board_Maker;
 begin
    setfillstyle(1,7);
    Bar(150,60,490,380);
    setfillstyle(1,8);
    Bar(371,65,485,65);
    Bar(371,65,371,375);
    setfillstyle(1,15);
    Bar(486,66,486,376);
    Bar(372,376,486,376);
    setfillstyle(1,8);
    Bar(211,65,365,65);
    Bar(211,65,211,375);
    setfillstyle(1,15);
    Bar(366,66,366,375);
    Bar(212,376,366,376);
    setfillstyle(1,8);
    Bar(155,65,200,65);
    Bar(155,65,155,375);
    setfillstyle(1,15);
    Bar(201,66,201,375);
    Bar(156,376,201,376);
    setfillstyle(1,0);
    for i:=1 to 5 do
      for j:=1 to 12 do
      begin
         setcolor(7);
         fillellipse(210+26*i,58+25*j,4,4);
         fillellipse(369+20*i,58+25*j,2,2);
      end;
    for i:=0 to 3 do
    begin
       setfillstyle(1,i);
       fillellipse(187,112+35*i,10,10);
    end;
    for i:=12 to 15 do
    begin
       setfillstyle(1,i);
       fillellipse(187,-168+35*i,10,10);
    end;
    setfillstyle(1,15);
    for i:=1 to 8 do
    begin
       setcolor(15);
       fillellipse(183,73+35*i,1,1);
       str(i,text);
       settextstyle(1,horizdir,2);
       setcolor(15);
       outtextxy(159,63+35*i,text+'');
    end;
    outtextxy(159,70,'0');
 end;
 procedure Show_Magic;
 begin
    setfillstyle(1,7);
    Bar(208,0,370,60);
    setfillstyle(1,8);
    Bar(213,5,366,5);
    Bar(213,5,213,58);
    setfillstyle(1,15);
    Bar(214,59,366,59);
    Bar(366,5,366,59);
    for i:=1 to 5 do
    begin
       setcolor(7);
       if magic[i] = 0 then
          Continue;
       if magic[i] < 5 then
          setfillstyle(1,magic[i]-1)
       else
          setfillstyle(1,magic[i]+7);
       fillellipse(210+26*i,32,10,11);
       setfillstyle(1,15);
       setcolor(15);
       fillellipse(206+26*i,28,1,1);
    end;
 end;
 procedure Dialog_Box;
 begin
    rising(150,388,490,475,15,7,8);
    deepening(152,390,488,473,15,0,8);
    settextstyle(1,horizdir,2);
    setcolor(15);
    outtextxy(240,392,'Change Color');
    outtextxy(240,417,'Confirm Color');
    outtextxy(240,442,'Return to Main Menu');
    setcolor(14);
    outtextxy(170,392,'0..8');
    outtextxy(170,417,'Enter');
    outtextxy(170,442,'Esc');
 end;
 procedure Won_Game;
 begin
    setfillstyle(1,0);
    bar(155,392,480,470);
    setcolor(15);
    outtextxy(280,442,'Main Menu');
    setcolor(14);
    outtextxy(170,442,'ANY KEY');
    repeat
       setcolor(13);
       outtextxy(170,409,'Welldone Baby,You Won !');
       delay(500);
       setcolor(0);
       outtextxy(170,409,'Welldone Baby,You Won !');
       delay(500);
    until keypressed;
 end;
 procedure Lost_Game;
 begin
    setfillstyle(1,0);
    bar(155,392,480,440);
    setcolor(9);
    outtextxy(170,409,'Sorry Baby,You lost !');
 end;
 procedure Play_Game;
 begin
    setfillstyle(1,0);
    bar(0,0,639,500);
    Dialog_Box;
    Board_Maker;
    Magic_Maker;
    j:=1;
   while (j<13) do
   begin
      if ch=#27 then
      begin
         Ch:=#37;
         exit;
      end;
      Read_Array(j);
      Compare;
      if guess[5]=50 then
      begin
         Show_Magic;
         Won_Game;
         exit;
      end;
      j:=j+1;
      if j = 13 then
      begin
         Show_Magic;
         Lost_Game;
         repeat
            ch:=readkey;
         until ch=#27;
         ch:=#37;
      end;
   end;
 end;
 begin
 end.



