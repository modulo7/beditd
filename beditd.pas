PROGRAM bbbb;

{$MODE OBJFPC}{$H+}
Uses {$ifdef unix}clocale{$endif},sysutils,ncurses,math,Classes;
const cc:array[char] of string[3]=(#$E2#$88#$85,#$E2#$98#$BA,#$E2#$98#$BB,#$E2#$99#$A5,#$E2#$99#$A6,#$E2#$99#$A3,#$E2#$99#$A0,#$E2#$80#$A2,#$E2#$97#$98,#$E2#$97#$8B,#$E2#$97#$99,#$E2#$99#$82,#$E2#$99#$80,#$E2#$99#$AA,#$E2#$99#$AB,#$E2#$98#$BC,
                                    #$E2#$96#$BA,#$E2#$97#$84,#$E2#$86#$95,#$E2#$80#$BC,#$C2#$B6,#$C2#$A7,#$E2#$96#$AC,#$E2#$86#$A8,#$E2#$86#$91,#$E2#$86#$93,#$E2#$86#$92,#$E2#$86#$90,#$E2#$88#$9F,#$E2#$86#$94,#$E2#$96#$B2,#$E2#$96#$BC,
				    #$20,#$21,#$22,#$23,#$24,#$25,#$26,#$27,#$28,#$29,#$2A,#$2B,#$2C,#$2D,#$2E,#$2F,#$30,#$31,#$32,#$33,#$34,#$35,#$36,#$37,#$38,#$39,#$3A,#$3B,#$3C,#$3D,#$3E,#$3F,
				    #$40,#$41,#$42,#$43,#$44,#$45,#$46,#$47,#$48,#$49,#$4A,#$4B,#$4C,#$4D,#$4E,#$4F,#$50,#$51,#$52,#$53,#$54,#$55,#$56,#$57,#$58,#$59,#$5A,#$5B,#$5C,#$5D,#$5E,#$5F,
				    #$60,#$61,#$62,#$63,#$64,#$65,#$66,#$67,#$68,#$69,#$6A,#$6B,#$6C,#$6D,#$6E,#$6F,#$70,#$71,#$72,#$73,#$74,#$75,#$76,#$77,#$78,#$79,#$7A,#$7B,#$7C,#$7D,#$7E,#$E2#$8C#$82,
				    #$C3#$87,#$C3#$BC,#$C3#$A9,#$C3#$A2,#$C3#$A4,#$C3#$A0,#$C3#$A5,#$C3#$A7,#$C3#$AA,#$C3#$AB,#$C3#$A8,#$C3#$AF,#$C3#$AE,#$C3#$AC,#$C3#$84,#$C3#$85,
				    #$C3#$89,#$C3#$A6,#$C3#$86,#$C3#$B4,#$C3#$B6,#$C3#$B2,#$C3#$BB,#$C3#$B9,#$C3#$BF,#$C3#$96,#$C3#$9C,#$C2#$A2,#$C2#$A3,#$C2#$A5,#$E2#$82#$A7,#$C6#$92,
				    #$C3#$A1,#$C3#$AD,#$C3#$B3,#$C3#$BA,#$C3#$B1,#$C3#$91,#$C2#$AA,#$C2#$BA,#$C2#$BF,#$E2#$8C#$90,#$C2#$AC,#$C2#$BD,#$C2#$BC,#$C2#$A1,#$C2#$AB,#$C2#$BB,
				    #$E2#$96#$91,#$E2#$96#$92,#$E2#$96#$93,#$E2#$94#$82,#$E2#$94#$A4,#$E2#$95#$A1,#$E2#$95#$A2,#$E2#$95#$96,#$E2#$95#$95,#$E2#$95#$A3,#$E2#$95#$91,#$E2#$95#$97,#$E2#$95#$9D,#$E2#$95#$9C,#$E2#$95#$9B,#$E2#$94#$90,
				    #$E2#$94#$94,#$E2#$94#$B4,#$E2#$94#$AC,#$E2#$94#$9C,#$E2#$94#$80,#$E2#$94#$BC,#$E2#$95#$9E,#$E2#$95#$9F,#$E2#$95#$9A,#$E2#$95#$94,#$E2#$95#$A9,#$E2#$95#$A6,#$E2#$95#$A0,#$E2#$95#$90,#$E2#$95#$AC,#$E2#$95#$A7,
				    #$E2#$95#$A8,#$E2#$95#$A4,#$E2#$95#$A5,#$E2#$95#$99,#$E2#$95#$98,#$E2#$95#$92,#$E2#$95#$93,#$E2#$95#$AB,#$E2#$95#$AA,#$E2#$94#$98,#$E2#$94#$8C,#$E2#$96#$88,#$E2#$96#$84,#$E2#$96#$8C,#$E2#$96#$90,#$E2#$96#$80,
				    #$CE#$B1,#$CE#$B2,#$CE#$93,#$CF#$80,#$CE#$A3,#$CF#$83,#$CE#$BC,#$CF#$84,#$CE#$A6,#$CE#$98,#$CE#$A9,#$CE#$B4,#$E2#$88#$9E,#$CF#$86,#$CE#$B5,#$E2#$88#$A9,
				    #$E2#$89#$A1,#$C2#$B1,#$E2#$89#$A5,#$E2#$89#$A4,#$E2#$8C#$A0,#$E2#$8C#$A1,#$C3#$B7,#$E2#$89#$88,#$C2#$B0,#$E2#$88#$99,#$C2#$B7,#$E2#$88#$9A,#$E2#$81#$BF,#$C2#$B2,#$E2#$96#$A0,#$E2#$98#$85);
				    
    //  wcc:array[0..$FF] of word=($2205,$263A,$263B,$2665,$2666,$2663,$2660,$2022,$25D8,$25CB,$25D9,$2642,$2640,$266A,$266B,$263C,$25BA,$25C4,$2195,$203C,$00B6,$00A7,$25AC,$21A8,$2191,$2193,$2192,$2190,$221F,$2194,$25B2,$25BC,$0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027,$0028,$0029,$002A,$002B,$002C,$002D,$002E,$002F,$0030,$0031,$0032,$0033,$0034,$0035,$0036,$0037,$0038,$0039,$003A,$003B,$003C,$003D,$003E,$003F,$0040,$0041,$0042,$0043,$0044,$0045,$0046,$0047,$0048,$0049,$004A,$004B,$004C,$004D,$004E,$004F,$0050,$0051,$0052,$0053,$0054,$0055,$0056,$0057,$0058,$0059,$005A,$005B,$005C,$005D,$005E,$005F,$0060,$0061,$0062,$0063,$0064,$0065,$0066,$0067,$0068,$0069,$006A,$006B,$006C,$006D,$006E,$006F,$0070,$0071,$0072,$0073,$0074,$0075,$0076,$0077,$0078,$0079,$007A,$007B,$007C,$007D,$007E,$2302,$00C7,$00FC,$00E9,$00E2,$00E4,$00E0,$00E5,$00E7,$00EA,$00EB,$00E8,$00EF,$00EE,$00EC,$00C4,$00C5,$00C9,$00E6,$00C6,$00F4,$00F6,$00F2,$00FB,$00F9,$00FF,$00D6,$00DC,$00A2,$00A3,$00A5,$20A7,$0192,$00E1,$00ED,$00F3,$00FA,$00F1,$00D1,$00AA,$00BA,$00BF,$2310,$00AC,$00BD,$00BC,$00A1,$00AB,$00BB,$2591,$2592,$2593,$2502,$2524,$2561,$2562,$2556,$2555,$2563,$2551,$2557,$255D,$255C,$255B,$2510,$2514,$2534,$252C,$251C,$2500,$253C,$255E,$255F,$255A,$2554,$2569,$2566,$2560,$2550,$256C,$2567,$2568,$2564,$2565,$2559,$2558,$2552,$2553,$256B,$256A,$2518,$250C,$2588,$2584,$258C,$2590,$2580,$03B1,$03B2,$0393,$03C0,$03A3,$03C3,$03BC,$03C4,$03A6,$0398,$03A9,$03B4,$221E,$03C6,$03B5,$2229,$2261,$00B1,$2265,$2264,$2320,$2321,$00F7,$2248,$00B0,$2219,$00B7,$221A,$207F,$00B2,$25A0,$2605);
var c:word;
    w:word;
    x,y,wx,wy,cx,cy,lw:LongInt;
    s:string;
    wc:cchar_t;
    im:Boolean;
  sl:TStringList;
    ssx,ssy,sex,sey:LongInt;
    f:file;
Procedure rs;

Begin
   ssx:=cx;
   sex:=cx;
   ssy:=cy;
   sey:=cy;
end;
    
Procedure dl(s:string;o,w,hs,he:word);
var c:word;
Begin
   if (hs<=o)and (he>=o) then attrset(A_REVERSE);
   for c:=o to min(length(s),o+w) do Begin
       if c=hs then attrset(A_REVERSE);
       if c=he then attrset(A_NORMAL);
       addnstr(@cc[s[c]][1],ord(cc[s[c]][0]));
   end;
   attrset(A_NORMAL);
   if length(s)<o+w then addnstr(#$E2#$87#$A3,3);
end;
Procedure ac(c:char;x,y:word);
var s:string;
Begin
   s:=sl[y];
   if im or (x>length(s)-1) then
      s:=copy(s,0,x)+c+copy(s,x+1,length(s))
   else
      s[x+1]:=c;
   
   sl[y]:=s;
end;
Function gs(x,y,l:word):string;
var
  ch: chtype;
var s:string;
Begin
   echo();
   ch:=mvgetch(y,x);
   s:='';
   while ch in [chtype(#$20)..chtype(#$7F)] do Begin
      s:=s+char(ch);
      if length(s)>=l then Break;
      ch:=getch();
   end;
      //  mvaddstr(LINES - 1, 1,PChar(Format('name:%-14s code:%d', [ keyname(ch), ch ] )));
   gs:=s;
   noecho();
end;

var
  ch: chtype;
Begin
  try
  // writeln(#$E2#$98#$BA#$E2#$98#$BB);
 //  for c:=0 to high(cc) do write(cc[c]);
 //  writeln;
  { }
  // for c:=$20 to $7F do write('#$'+inttohex(c,2)+',');
 //  writeln;
   im:=true;
   sl:=TStringList.Create;
   if ParamCount =2 then Begin
      lw:=strtoint(ParamStr(2));
      Assign(f,ParamStr(1));
      setlength(s,lw);
      Reset(f,1);
      repeat 
         BlockRead(f,s[1],lw,w);
	 if w=0 then Break;
	 if w<>lw then setlength(s,w);
	 sl.add(s);
      until w<>lw;
      close(f);
   end else Begin
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\g');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   sl.add('gdfgfdf');
   sl.add('sdfhfg');
   sl.add('sea\ghhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhgggggggggggggggggggggffffffffffffhhhhhhhhhhhhhhhhhhhhhhhhhhhttttttttt');
   sl.add('a'#1#2#3#4#5#6#7#8#9#10'z');
   lw:=10;
   end;
   wx:=0;
   wy:=0;
   cx:=0;
   cy:=0;
   initscr();
   keypad(stdscr, TRUE);
   nonl();
   cbreak();
   noecho();
  // wc.chars[0]:=WideChar(wcc[$21]);
   //add_wch(@wc);
   //add_wchnstr(@wcc[0],2);
   
//   for c:=0 to high(cc) do addnstr(@cc[c][1],ord(cc[c][0]));
   getmaxyx(stdscr,y,x);
   //dl('abcdefg'#0#1#2#3'ftgdfgdfgdsqawwwwwwwtgggggggggdfddghdffghcghhgfhfdfedrtdfgdsfsdfhdfghfg',1,x-1);
   refresh();
   //getch();
    repeat
      x:=COLS;
      for c:=0 to min(sl.Count-1,LINES - 2) do Begin 
         if c+wy>sl.Count-1 then Break;  
         move(c,0);
         if (c+wy>=ssy) and (c+wy<=sey) then
	    if ssy=sey then
               dl(sl[c+wy],1+wx,x-1,ssx+1,sex+1)
	    else if c+wy=ssy then
               dl(sl[c+wy],1+wx,x-1,ssx+1,length(sl[c+wy])+2)
	    else if c+wy=sey then
               dl(sl[c+wy],1+wx,x-1,1,sex+1)
	    else
               dl(sl[c+wy],1+wx,x-1,1,length(sl[c+wy])+2)
         else
            dl(sl[c+wy],1+wx,x-1,0,0);
      end;
      if cx<length(sl[cy]) then
         mvaddstr(LINES - 1, 30,PChar(Format(' %3d  $%0:2.2x', [ord(sl[cy][1+cx]) ] )));
      if im then mvaddstr(LINES - 1, 40,'ins') else mvaddstr(LINES - 1, 40,'   ');
      move(cy-wy,cx-wx);
      refresh();
      ch := getch;
      //mvaddstr(LINES - 1, 1,'                                ');
      move(cy,cx);
      refresh();
      case ch of
        //ERR: mvaddstr(LINES - 1, 1,'timeout: 1 sec');
        {chtype('1'): cbreak();
        chtype('2'): raw();
        chtype('3'): halfdelay(10);}
	KEY_SLEFT:Begin
	 if (ssy=sey) then Begin
	   if sex=cx then Begin if ssx>0 then dec(ssx);end
	   else dec(sex);
	   if (ssx=sex) then Begin dec(ssx);dec(sex) end
	 end else if sey=cy then Begin if ssx>0 then dec(ssx);end
	   else if sex>0 then dec(sex);
	end;
	KEY_SRIGHT:Begin
	 if (ssy=sey) then Begin
	   if (ssx=sex) then Begin inc(ssx);inc(sex) end;
	   if sex=cx then inc(ssx)
	   else inc(sex)
	 end else if ssy=cy then inc(sex)
	   else inc(ssx);
	end;
	KEY_SR:Begin
	   if sey=cy then Begin if ssy>0 then dec(ssy);end
	   else dec(sey);
	   if (ssy=sey)and(ssx=sex) then Begin dec(ssx);dec(sex) end
	  // if ssx=sex then Begin dec(ssx);dec(sex) end;
	end;
	KEY_SF:Begin
	   if (ssy=sey)and(ssx=sex) then Begin inc(ssx);inc(sex) end;
	   if ssy<>cy then inc(ssy)
	   else inc(sey);
	end;
	KEY_UP:Begin
	   cy:=max(0,cy-1);
	   if cy<wy then dec(wy);
           erase();
	   rs;
	end;
	KEY_DOWN:Begin
	   cy:=min(cy+1,sl.Count-1);
	   if cy >wy+LINES - 2 then inc(wy);
           erase();
	   rs;
	end;
	KEY_LEFT:Begin
	   cx:=max(0,cx-1);
	   if cx<wx then dec(wx);
           erase();
	   rs;
	end;
	KEY_RIGHT:Begin
	   cx:=cx+1;
	   if cx-wx>x-1 then inc(wx);
           erase();
	   rs;
	end;
	chtype(#$20)..chtype(#$7F):Begin
	      ac(Char(ch),cx,cy);
	      inc(cx);
	      if cx-wx>x-1 then inc(wx);
              erase();
	      rs;
	   end;
	KEY_IC:im:=not im;
	KEY_F4:Begin
	      ac(Char(StrToInt('$'+gs(1,LINES - 1,2))),cx,cy);
	      inc(cx);
	      if cx-wx>x-1 then inc(wx);
              erase();
	      rs;
	   end;
	KEY_F5:Begin
	      ac(Char(StrToInt(gs(1,LINES - 1,3))),cx,cy);
	      inc(cx);
	      if cx-wx>x-1 then inc(wx);
              erase();
	      rs;
	   end;
	KEY_HOME:Begin
	   cx:=0;wx:=0;
              erase();
	      rs;
	end;
	KEY_END:Begin
	   cx:=length(sl[cy]);
	   if cx-wx>x-1 then wx:=cx-x+1;
	   if cx<wx then wx:=max(cx,0);
              erase();
	end;
	chtype(13):Begin
             s:=sl[cy];
   
	      sl[cy]:=copy(s,0,cx);
	      sl.Insert(cy+1,copy(s,cx+1,length(s)));
	      rs;
              erase();
	
	end;
	KEY_DC:Begin
             s:=sl[cy];
	      sl[cy]:=copy(s,0,cx)+copy(s,cx+2,length(s));
              erase();
	      rs;
	end;
	KEY_BACKSPACE:Begin
             s:=sl[cy];
	      sl[cy]:=copy(s,0,cx-1)+copy(s,cx+1,length(s));
	     cx:=max(0,cx-1);
	     if cx<wx then dec(wx);
              erase();
	      rs;
	end;
	KEY_F9:Begin
	   c:=0;
	   s:='';
	   while (c<sl.Count) do Begin
	      while length(s)<lw do Begin
	         s:=s+sl[c];
		 sl.Delete(c);
		 if c>=sl.Count then Break;
	      end;
	      sl.Insert(c,copy(s,0,lw));
	      s:=copy(s,lw+1,length(s));
	      c:=c+1;
	   end;
	   erase();
	   
	end;
	//KEY_F2:attrset(A_REVERSE);
	KEY_F12:Begin
           Assign(f,gs(1,LINES - 1,30));
	   Rewrite(f,1);
	   for c:=0 to sl.Count-1 do Begin
	      s:=sl[c];
	      BlockWrite(f,s[1],length(s));
	   end;
           close(f);
	end;
    KEY_RESIZE:Begin
         erase();
    end;
      else
        mvaddstr(LINES - 1, 1,PChar(Format('name:%-14s code:%d', [ keyname(ch), ch ] )));
      end;
    until (ch = chtype(27)) OR (ch = KEY_F(10));
  finally
    endwin();
  end;
   //writeln(x,' ',y);
 {  for c:=0 to high(cc) do Begin
      case length(cc[c]) of
         1:w:=ord(cc[c][1]);
         2:w:=(ord(cc[c][1]) and $1f) shl 6 +(ord(cc[c][2]) and $3f);
         3:w:=((ord(cc[c][1]) and $f) shl 12 +(ord(cc[c][2]) and $3f) shl 6+(ord(cc[c][3]) and $3f));
      end;
      write('$'+inttohex(w,4)+',');
      
   end;}
  { repeat
      readln(w);
      if w<$800 then writeln('#$'+inttohex($C0 or (w shr 6),2)+ '#$'+inttohex($80 or (w and $3F),2))
      else writeln('#$'+inttohex($E0 or (w shr 12),2)+ '#$'+inttohex($80 or ((w shr 6) and $3F),2)+ '#$'+inttohex($80 or (w and $3F),2));
   until w=0;}
end.
