PROGRAM bbbb;

{$MODE OBJFPC}{$H+}
Uses {$ifdef unix}clocale{$endif},sysutils,ncurses,math,Classes,iconvenc,ctypes;

type
  utf8char = string[3];

const cc:array[char] of utf8char= (#$E2#$88#$85,#$E2#$98#$BA,#$E2#$98#$BB,#$E2#$99#$A5,#$E2#$99#$A6,#$E2#$99#$A3,#$E2#$99#$A0,#$E2#$80#$A2,#$E2#$97#$98,#$E2#$97#$8B,#$E2#$97#$99,#$E2#$99#$82,#$E2#$99#$80,#$E2#$99#$AA,#$E2#$99#$AB,#$E2#$98#$BC,
                                   #$E2#$96#$BA,#$E2#$97#$84,#$E2#$86#$95,#$E2#$80#$BC,#$C2#$B6    ,#$C2#$A7    ,#$E2#$96#$AC,#$E2#$86#$A8,#$E2#$86#$91,#$E2#$86#$93,#$E2#$86#$92,#$E2#$86#$90,#$E2#$88#$9F,#$E2#$86#$94,#$E2#$96#$B2,#$E2#$96#$BC,
                                   #$20        ,#$21        ,#$22        ,#$23        ,#$24        ,#$25        ,#$26        ,#$27        ,#$28        ,#$29        ,#$2A        ,#$2B        ,#$2C        ,#$2D        ,#$2E        ,#$2F        ,
                                   #$30        ,#$31        ,#$32        ,#$33        ,#$34        ,#$35        ,#$36        ,#$37        ,#$38        ,#$39        ,#$3A        ,#$3B        ,#$3C        ,#$3D        ,#$3E        ,#$3F        ,
                                   #$40        ,#$41        ,#$42        ,#$43        ,#$44        ,#$45        ,#$46        ,#$47        ,#$48        ,#$49        ,#$4A        ,#$4B        ,#$4C        ,#$4D        ,#$4E        ,#$4F        ,
                                   #$50        ,#$51        ,#$52        ,#$53        ,#$54        ,#$55        ,#$56        ,#$57        ,#$58        ,#$59        ,#$5A        ,#$5B        ,#$5C        ,#$5D        ,#$5E        ,#$5F        ,
                                   #$60        ,#$61        ,#$62        ,#$63        ,#$64        ,#$65        ,#$66        ,#$67        ,#$68        ,#$69        ,#$6A        ,#$6B        ,#$6C        ,#$6D        ,#$6E        ,#$6F        ,
                                   #$70        ,#$71        ,#$72        ,#$73        ,#$74        ,#$75        ,#$76        ,#$77        ,#$78        ,#$79        ,#$7A        ,#$7B        ,#$7C        ,#$7D        ,#$7E        ,#$E2#$8C#$82,
                                   #$C3#$87    ,#$C3#$BC    ,#$C3#$A9    ,#$C3#$A2    ,#$C3#$A4    ,#$C3#$A0    ,#$C3#$A5    ,#$C3#$A7    ,#$C3#$AA    ,#$C3#$AB    ,#$C3#$A8    ,#$C3#$AF    ,#$C3#$AE    ,#$C3#$AC    ,#$C3#$84    ,#$C3#$85    ,
                                   #$C3#$89    ,#$C3#$A6    ,#$C3#$86    ,#$C3#$B4    ,#$C3#$B6    ,#$C3#$B2    ,#$C3#$BB    ,#$C3#$B9    ,#$C3#$BF    ,#$C3#$96    ,#$C3#$9C    ,#$C2#$A2    ,#$C2#$A3    ,#$C2#$A5    ,#$E2#$82#$A7,#$C6#$92    ,
                                   #$C3#$A1    ,#$C3#$AD    ,#$C3#$B3    ,#$C3#$BA    ,#$C3#$B1    ,#$C3#$91    ,#$C2#$AA    ,#$C2#$BA    ,#$C2#$BF    ,#$E2#$8C#$90,#$C2#$AC    ,#$C2#$BD    ,#$C2#$BC    ,#$C2#$A1    ,#$C2#$AB    ,#$C2#$BB    ,
                                   #$E2#$96#$91,#$E2#$96#$92,#$E2#$96#$93,#$E2#$94#$82,#$E2#$94#$A4,#$E2#$95#$A1,#$E2#$95#$A2,#$E2#$95#$96,#$E2#$95#$95,#$E2#$95#$A3,#$E2#$95#$91,#$E2#$95#$97,#$E2#$95#$9D,#$E2#$95#$9C,#$E2#$95#$9B,#$E2#$94#$90,
                                   #$E2#$94#$94,#$E2#$94#$B4,#$E2#$94#$AC,#$E2#$94#$9C,#$E2#$94#$80,#$E2#$94#$BC,#$E2#$95#$9E,#$E2#$95#$9F,#$E2#$95#$9A,#$E2#$95#$94,#$E2#$95#$A9,#$E2#$95#$A6,#$E2#$95#$A0,#$E2#$95#$90,#$E2#$95#$AC,#$E2#$95#$A7,
                                   #$E2#$95#$A8,#$E2#$95#$A4,#$E2#$95#$A5,#$E2#$95#$99,#$E2#$95#$98,#$E2#$95#$92,#$E2#$95#$93,#$E2#$95#$AB,#$E2#$95#$AA,#$E2#$94#$98,#$E2#$94#$8C,#$E2#$96#$88,#$E2#$96#$84,#$E2#$96#$8C,#$E2#$96#$90,#$E2#$96#$80,
                                   #$CE#$B1    ,#$CE#$B2    ,#$CE#$93    ,#$CF#$80    ,#$CE#$A3    ,#$CF#$83    ,#$CE#$BC    ,#$CF#$84    ,#$CE#$A6    ,#$CE#$98    ,#$CE#$A9    ,#$CE#$B4    ,#$E2#$88#$9E,#$CF#$86    ,#$CE#$B5    ,#$E2#$88#$A9,
                                   #$E2#$89#$A1,#$C2#$B1    ,#$E2#$89#$A5,#$E2#$89#$A4,#$E2#$8C#$A0,#$E2#$8C#$A1,#$C3#$B7    ,#$E2#$89#$88,#$C2#$B0    ,#$E2#$88#$99,#$C2#$B7    ,#$E2#$88#$9A,#$E2#$81#$BF,#$C2#$B2    ,#$E2#$96#$A0,#$E2#$98#$85);
                    
    //  wcc:array[0..$FF] of word=($2205,$263A,$263B,$2665,$2666,$2663,$2660,$2022,$25D8,$25CB,$25D9,$2642,$2640,$266A,$266B,$263C,$25BA,$25C4,$2195,$203C,$00B6,$00A7,$25AC,$21A8,$2191,$2193,$2192,$2190,$221F,$2194,$25B2,$25BC,$0020,$0021,$0022,$0023,$0024,$0025,$0026,$0027,$0028,$0029,$002A,$002B,$002C,$002D,$002E,$002F,$0030,$0031,$0032,$0033,$0034,$0035,$0036,$0037,$0038,$0039,$003A,$003B,$003C,$003D,$003E,$003F,$0040,$0041,$0042,$0043,$0044,$0045,$0046,$0047,$0048,$0049,$004A,$004B,$004C,$004D,$004E,$004F,$0050,$0051,$0052,$0053,$0054,$0055,$0056,$0057,$0058,$0059,$005A,$005B,$005C,$005D,$005E,$005F,$0060,$0061,$0062,$0063,$0064,$0065,$0066,$0067,$0068,$0069,$006A,$006B,$006C,$006D,$006E,$006F,$0070,$0071,$0072,$0073,$0074,$0075,$0076,$0077,$0078,$0079,$007A,$007B,$007C,$007D,$007E,$2302,$00C7,$00FC,$00E9,$00E2,$00E4,$00E0,$00E5,$00E7,$00EA,$00EB,$00E8,$00EF,$00EE,$00EC,$00C4,$00C5,$00C9,$00E6,$00C6,$00F4,$00F6,$00F2,$00FB,$00F9,$00FF,$00D6,$00DC,$00A2,$00A3,$00A5,$20A7,$0192,$00E1,$00ED,$00F3,$00FA,$00F1,$00D1,$00AA,$00BA,$00BF,$2310,$00AC,$00BD,$00BC,$00A1,$00AB,$00BB,$2591,$2592,$2593,$2502,$2524,$2561,$2562,$2556,$2555,$2563,$2551,$2557,$255D,$255C,$255B,$2510,$2514,$2534,$252C,$251C,$2500,$253C,$255E,$255F,$255A,$2554,$2569,$2566,$2560,$2550,$256C,$2567,$2568,$2564,$2565,$2559,$2558,$2552,$2553,$256B,$256A,$2518,$250C,$2588,$2584,$258C,$2590,$2580,$03B1,$03B2,$0393,$03C0,$03A3,$03C3,$03BC,$03C4,$03A6,$0398,$03A9,$03B4,$221E,$03C6,$03B5,$2229,$2261,$00B1,$2265,$2264,$2320,$2321,$00F7,$2248,$00B0,$2219,$00B7,$221A,$207F,$00B2,$25A0,$2605);

    enabledebugout = false;
    
    bottombarheight = 2;
var
  reverse : array[0..65535] of byte;
var c:word;
    w:word;
    x,viewleftx,viewtopy,cx,cy,lw,fileoffset:LongInt;
    s:string;
    insertmode:Boolean;
    sl:TStringList;
    ssx,ssy,sex,sey:LongInt;
    f:file;
    bottombarstart: longint;
    modified : boolean;

Procedure removeselection;

Begin
   ssx:=cx;
   sex:=cx;
   ssy:=cy;
   sey:=cy;
end;

function decodeutf8char(utf8 : utf8char) : longint;
begin
  result := -1;
  if length(utf8) = 1 then begin
    if ord(utf8[1]) <= $7F then result := ord(utf8[1]);
  end else if length(utf8) = 2 then begin
    if (ord(utf8[1]) in [194..223]) and (ord(utf8[2]) in [128..191]) then result := ((ord(utf8[1]) and $1F) shl 6) + (ord(utf8[2]) and $3F)
  end else if length(utf8) = 3 then begin
    if (ord(utf8[1]) in [224..239]) and (ord(utf8[2]) in [128..191]) and (ord(utf8[3]) in [128..191]) then result := ((ord(utf8[1]) and $0F) shl 12) + ((ord(utf8[2]) and $3F) shl 6) + (ord(utf8[3]) and $3F)
  end;
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

Procedure addchar(c:char;x,y:word);
var s:string;
Begin
   s:=sl[y];
   if insertmode or (x>length(s)-1) then
      s:=copy(s,0,x)+c+copy(s,x+1,length(s))
   else
      s[x+1]:=c;
   
   sl[y]:=s;
   modified := true;
   inc(fileoffset); //FIXME: this may be incorrect if inserting at locations other than the cursor or not moving the cursor.
end;

Function gs(x,y:word; prompt: string; l:longint):string;
var
  ch: chtype;
  s:string;
const
  validchars = [chtype(#$20)..chtype(#$7F)]; 
Begin
   echo();
   mvaddstr(y,x,pchar(prompt));
   x := x + length(prompt);
   ch:=mvgetch(y,x);
   s:='';
   while ch in validchars do Begin
      s:=s+char(ch);
      if length(s)>=l then Break;
      ch:=getch();
   end;
      //  mvaddstr(LINES - 1, 1,PChar(Format('name:%-14s code:%d', [ keyname(ch), ch ] )));
   if (ch = chtype(13)) or (ch in validchars) then begin
      gs:=s;
   end else begin
      raise einouterror.create('unexpected key $'+inttohex(ord(ch),8));
   end;
   noecho();
end;

procedure movetostartofline();
begin
   fileoffset := fileoffset - cx;
   cx:=0;viewleftx:=0;
end;

procedure movetoendofline();
var
  cxold : longint;
begin
   cxold := cx;
   cx:=length(sl[cy]);
   if cx-viewleftx>x-1 then viewleftx:=cx-x+1;
   if cx<viewleftx then viewleftx:=max(cx,0);
   fileoffset := fileoffset + (cx - cxold);
end;

procedure movedown(n : longint);
begin
  for c:=0 to n- 1 do Begin
     if cy<sl.Count-1 then inc(fileoffset,length(sl[cy]));
     cy:=min(cy+1,sl.Count-1);
     if cy >viewtopy+LINES -bottombarheight- 1 then inc(viewtopy);
  end;
end;

Procedure addcharatcursor(c:char);
begin
   if (x>length(s)-1) and (cy<sl.Count-1) and (not insertmode) then begin
      movetostartofline();
      movedown(1);
   end;
   addchar(c,cx,cy);
   inc(cx);
   if cx > length(sl[cy]) then begin
      movetoendofline();
   end else begin
      if cx-viewleftx>x-1 then inc(viewleftx);
   end;
end;

procedure showmessage(message:string);
begin
   erase();
   //uncomment line below to add messages to data buffer for debugging
   //sl.add(message);
   if length(message) > 29 then setlength(message,29);
   mvaddstr(bottombarstart, 0,PChar(message));
end;

procedure savefile(newfilename : string);
begin
   Assign(f,newfilename);
   Rewrite(f,1);
   for c:=0 to sl.Count-1 do Begin
      s:=sl[c];
      BlockWrite(f,s[1],length(s));
   end;
   close(f);
end;

procedure loadencoding(encoding : string);
var 
  icnv : iconv_t;
  inbuf,outbuf : pchar;
  inbytesleft, outbytesleft : csize_t;
  c : char;
  utf8c : utf8char;
  codepoint : longint;
  oldcodepoint : longint;
Begin
  icnv := iconv_open('UTF-8',pchar(encoding));
  for c := #0 to #255 do begin
    inbytesleft := 1;
    outbytesleft := 3;
    inbuf := @c;
    outbuf := @utf8c[1];
    iconv(icnv,@inbuf,@inbytesleft,@outbuf,@outbytesleft);
    setlength(utf8c,3-outbytesleft);
    codepoint := decodeutf8char(utf8c);
    if ((codepoint >= $20) and (codepoint <= $7E)) or ((codepoint >=$A1) and (codepoint <= $FFFF)) then begin
      //writeln('accepting codepoint ',codepoint);
      if cc[c] <> utf8c then begin
        oldcodepoint := decodeutf8char(cc[c]);
        if reverse[codepoint] = ord('A') then begin
          reverse[oldcodepoint] := ord('A');
        end else begin
          cc[char(reverse[codepoint])] := cc[c];
          reverse[oldcodepoint] := reverse[codepoint];          
        end;
        reverse[codepoint] := byte(c);
        cc[c] := utf8c;

      end;
    end else begin
      //writeln('rejecting codepoint ',codepoint);
    end
    //writeln(length(utf8c));
  end;
  iconv_close(icnv);
end;

var
  ch: chtype;
  t:word;
  debugfile:text;
  oldfilemode: byte;
  newfilename : string;
  filename : string;
  action: string;
  i : longint;
  codepoint : longint;
  utf8in : utf8char;
Begin

  fillchar(reverse,65536,'A');
  for i := 0 to 255 do begin
    codepoint := decodeutf8char(cc[char(i)]);
    if codepoint < 0 then begin
      writeln('could not decode utf-8 sequence');
      halt(1);
    end;
    reverse[codepoint] := i;
  end;
  
  loadencoding('WINDOWS-1252');

  for i := 0 to 255 do begin
    if reverse[decodeutf8char(cc[char(i)])] <> i then begin
      writeln('incompatible encoding, duplicate chars at positions ',i,' ',reverse[decodeutf8char(cc[char(i)])]);
      halt(1);
    end
  end;

  filename := '';
  modified := false;
  if enabledebugout then begin
    Assign(debugfile,'ttttt');
    Rewrite(debugfile);
  end;
  try
   insertmode:=true;
   fileoffset:=0;
   sl:=TStringList.Create;
   initscr();
   if ParamCount >=1 then Begin
      if paramcount >= 2 then begin
         lw:=strtoint(ParamStr(2));
      end else begin
         lw:=COLS;
      end;
      filename := ParamStr(1);
      Assign(f,filename);
      setlength(s,lw);
      oldfilemode := filemode;
      filemode := fmOpenRead;
      Reset(f,1);
      filemode := oldfilemode;
      repeat 
         BlockRead(f,s[1],lw,w);
         if w=0 then Break;
         if w<>lw then setlength(s,w);
         sl.add(s);
      until w<>lw;
      close(f);
      if sl.Count=0 then sl.add('');
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
       s:='';
       for c:=0 to 255 do Begin
          s:=s+char(c);
          if (c and $3F)=$3f then Begin
             sl.add(s);
             s:='';
          end;
       end;
       lw:=10;
   end;
   viewleftx:=0;
   viewtopy:=0;
   cx:=0;
   cy:=0;
   
   keypad(stdscr, TRUE);
   nonl();
   cbreak();
   noecho();
   refresh();
   //getch();
   repeat
      x:=COLS;
      for c:=0 to min(sl.Count-1,LINES - bottombarheight - 1) do Begin 
         if c+viewtopy>sl.Count-1 then Break;  
         move(c,0);
         if (c+viewtopy>=ssy) and (c+viewtopy<=sey) then
        if ssy=sey then
               dl(sl[c+viewtopy],1+viewleftx,x-1,ssx+1,sex+1)
        else if c+viewtopy=ssy then
               dl(sl[c+viewtopy],1+viewleftx,x-1,ssx+1,length(sl[c+viewtopy])+2)
        else if c+viewtopy=sey then
               dl(sl[c+viewtopy],1+viewleftx,x-1,1,sex+1)
        else
               dl(sl[c+viewtopy],1+viewleftx,x-1,1,length(sl[c+viewtopy])+2)
         else
            dl(sl[c+viewtopy],1+viewleftx,x-1,0,0);
      end;
      bottombarstart := LINES - bottombarheight;
      if cx<length(sl[cy]) then
         mvaddstr(bottombarstart, 30,PChar(Format(' %3d  $%0:2.2x', [ord(sl[cy][1+cx]) ] )));
      if insertmode then mvaddstr(bottombarstart, 40,'ins') else mvaddstr(bottombarstart, 40,'ovr');
      mvaddstr(bottombarstart, 45,PChar(Format(' %9d  $%0:8.8x', [fileoffset ] )));
      mvaddstr(bottombarstart+1, 0,'F2:save|F4:enter hex|F5:enter dec|F9:reshape|F10:quit|F12:save as');
      move(cy-viewtopy,cx-viewleftx);
      refresh();
      ch := getch;
      //mvaddstr(LINES - 1, 1,'                                ');
      move(cy,cx);
      refresh();
      case ch of
    
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
        KEY_PPAGE,
        KEY_UP:Begin
           if ch=KEY_PPAGE then t:=LINES -bottombarheight- 1 else t:=0;
           for c:=0 to t do Begin
              if cy>0 then dec(fileoffset,length(sl[cy-1]));
              cy:=max(0,cy-1);
              if cy<viewtopy then dec(viewtopy);
           end;
           erase();
           removeselection;
        end;
        KEY_NPAGE,
        KEY_DOWN:Begin
           if enabledebugout then writeln(debugfile,fileoffset,'--');
           if ch=KEY_NPAGE then t:=LINES -bottombarheight else t:=1;
           movedown(t);
           erase();
           removeselection;
           if enabledebugout then writeln(debugfile,fileoffset,'++');
        end;
        KEY_LEFT:Begin
           if cx>0 then dec(fileoffset);
           cx:=max(0,cx-1);
           if cx<viewleftx then dec(viewleftx);
           erase();
           removeselection;
        end;
        KEY_RIGHT:Begin
           inc(fileoffset);
           cx:=cx+1;
           if cx-viewleftx>x-1 then inc(viewleftx);
           erase();
           removeselection;
        end;
        chtype(#$20)..chtype(#$7F):Begin
           addcharatcursor(Char(ch));
           erase();
           removeselection;
        end;
        chtype(#$C2)..chtype(#$DF),chtype(#$E0)..chtype(#$EF):Begin
           if ch in [$C2 .. $DF] then setlength(utf8in,2) else setlength(utf8in,3);
           utf8in[1] := char(ch);
           ch := getch;
           if not (ch in [$80 .. $BF]) then ch := 0;
           utf8in[2] := char(ch);
           if (ch <> 0) and (length(utf8in) = 3) then begin
             ch := getch;
             if not (ch in [$80 .. $BF]) then ch := 0;
             utf8in[3] := char(ch);
           end;
           codepoint := decodeutf8char(utf8in);
           if codepoint < 0 then begin
             showmessage('unable to decode utf-8 ');
           end else begin
             ch := reverse[codepoint];
             if ch = ord('A') then begin
               showmessage('unable to reverse-map unicode');
             end else begin
               addcharatcursor(Char(ch));
               erase();
               removeselection;
             end
           end
        end;
        KEY_IC:insertmode:=not insertmode;
        KEY_F4,
        KEY_F5:Begin
           try
              if ch = KEY_F4 then begin
                 addcharatcursor(Char(StrToInt('$'+gs(0,bottombarstart,'enter hex:',2))));
              end else begin
                 addcharatcursor(Char(StrToInt(gs(0,bottombarstart,'enter dec:',3))));
              end;
              erase();
           except
              on E: Exception do begin
                 showmessage(e.message);
              end
           end;
           removeselection;
        end;
        KEY_HOME:Begin
           movetostartofline();
           erase();
           removeselection;
        end;
        KEY_END:Begin
           movetoendofline();
           erase();
        end;
        chtype(13):Begin
           s:=sl[cy];
       
           sl[cy]:=copy(s,0,cx);
           sl.Insert(cy+1,copy(s,cx+1,length(s)));
           removeselection;
           erase();
        
        end;
        KEY_DC:Begin
           if cx>=length(sl[cy])then Begin
              if cy<sl.Count-1 then Begin
                 sl[cy]:=sl[cy]+sl[cy+1];
                 sl.Delete(cy+1);
              end;
           end else Begin
              s:=sl[cy];
              sl[cy]:=copy(s,0,cx)+copy(s,cx+2,length(s));
              modified := true;
           end;
           erase();
           removeselection;
        end;
        KEY_BACKSPACE:Begin
           if cx=0 then Begin
              if cy>0 then Begin
                 dec(cy);
                 cx:=length(sl[cy]);
                 if cx-viewleftx>x-1 then viewleftx:=cx-x+1;
                 sl[cy]:=sl[cy]+sl[cy+1];
                 sl.Delete(cy+1);
              end;
           end else Begin
              s:=sl[cy];
              sl[cy]:=copy(s,0,cx-1)+copy(s,cx+1,length(s));
              modified := true;
              dec(fileoffset);
              cx:=max(0,cx-1);
              if cx<viewleftx then dec(viewleftx);
           end;
           erase();
           removeselection;
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
           cy := fileoffset div lw;
           cx := fileoffset mod lw;
           erase();
           
        end;
        KEY_F2,
        KEY_F12:Begin
           try
              if (ch = KEY_F12) or (filename = '') then begin
                 newfilename := gs(0,bottombarstart,'Filename:',maxlongint);
              end else begin
                 newfilename := filename;
              end;
              if newfilename = '' then raise exception.create('empty file name');
              if fileexists(newfilename) then begin
                 if not (upcase(gs(0,bottombarstart,newfilename + ' exits overwrite?',1)) = 'Y') then begin
                    raise exception.create('not overwriting');
                 end;
              end;
              savefile(newfilename);
              filename := newfilename;
              modified := false;
              showmessage('saved');
           except
              on E: Exception do begin
                 showmessage(e.message);
              end
           end;
        end;
        KEY_RESIZE:Begin
           erase();
        end;
        chtype(27),
        KEY_F10: begin
           try
              if not modified then break;
              action := upcase(gs(0,bottombarstart,filename + ' modified save? (Y/N/C)',1));
              if action = 'Y' then begin
                 savefile(filename);
                 break;
              end else if action = 'N' then break;
              showmessage('not quitting');
           except
              on E: Exception do begin
                 showmessage(e.message);
              end
           end;  
        end
        else begin
           showmessage(Format('unexpected key %d %-14s', [ ch , keyname(ch)  ] ));
        end;
      end;
   until false;
  finally
    endwin();
  end;
  if enabledebugout then close(debugfile);
  
end.
