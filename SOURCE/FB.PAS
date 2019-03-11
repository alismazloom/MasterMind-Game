 program Fb;
 uses Crt,Graphlib,Lib1,Lib2;
 var
    t:Boolean;
 procedure Decision;
 begin
    t:=False;
    repeat
       Graphic;
       repeat
           V:=ReadKey;
       until (ord(V)<53)and(ord(V)>48);
       case V of
          '1': Game;
          '2': Help;
          '3': Level;
          '4': Quit;
       end;
    until t=True;
 end;
 begin
    Decision;
 end.
