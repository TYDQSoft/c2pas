program c2pas;

uses prehandler,fileutil,sysutils,classes,converter;

procedure c2pas_convert(inputname:string;includepath:array of string;outputtype:byte;
outputname:string;needreference:boolean;debug:boolean;plize:boolean);
var ii,jj,kk:SizeInt;
    tempstr:string;
    source,totallist,partlist:TStringList;
    content:string;
    ctree:Pc_tree;
    pastree,pastree2:Ppas_tree;
    reffile,pasfile:Text;
begin
 {Loading the include file searching path}
 ii:=1; plizefunc:=plize;
 totallist:=TStringList.Create;
 while(ii<=length(includepath))do
  begin
   partlist:=FindAllDirectories(includepath[ii-1]);
   for jj:=1 to partlist.Count do
    begin
     totallist.Add(partlist[jj-1]);
    end;
   partlist.Free;
   inc(ii);
  end;
 {Loading the solo original file}
 source:=TStringList.Create;
 source.LoadFromFile(inputname);
 content:=source.Text;
 source.Free;
 {Prehandle the original file}
 prehandler_handle_code(content,totallist,(ExtractFileExt(inputname)='.h')
 or (ExtractFileExt(inputname)='.hpp'));
 {Specifying the output type}
 species:=outputtype;
 {Specifying the output file name}
 codename:=ExtractFileName(inputname);
 kk:=Pos('.',codename);
 codename:=Trim(Copy(codename,1,kk-1));
 {If you need reference file,open reference switch to enable it}
 if(needreference=true) and ((ExtractFileExt(inputname)='.h') or (ExtractFileExt(inputname)='.hpp')) then
  begin
   tempstr:=ExtractFilePath(outputname)+codename+'.h';
   AssignFile(reffile,tempstr);
   Rewrite(reffile);
   writeln(reffile,content);
   CloseFile(reffile);
  end
 else if(needreference=true) then
  begin
   tempstr:=ExtractFilePath(outputname)+codename+'.c';
   AssignFile(reffile,tempstr);
   Rewrite(reffile);
   writeln(reffile,content);
   CloseFile(reffile);
  end;
 {Translate the C code to C tree}
 ctree:=construct_c_tree(content);
 if(debug=true) then
  begin
   writeln('Total C code root tree Node Count:',ctree^.count);
  end;
 {Clear the original convert}
 content:='';
 {Translate the C tree to pascal tree}
 pastree:=convert_c_tree_to_pas_tree(ctree);
 if(debug=true) then
  begin
   writeln('Total Initial Pascal code root tree Node Count:',pastree^.count);
  end;
 {Destroy the C code tree}
 destruct_c_tree(ctree);
 {Reconstruct the pascal tree}
 pastree2:=nil;
 pas_tree_reconstruct(pastree,pastree2);
 if(debug=true) then
  begin
   writeln('Total Handled Pascal code root tree Node Count:',pastree2^.count);
  end;
 {Destroy the initial Pascal code tree}
 destruct_pas_tree(pastree);
 {Output the pascal code file}
 content:=convert_pas_tree_to_string(pastree2,0);
 AssignFile(pasfile,outputname);
 Rewrite(pasfile);
 writeln(pasfile,content);
 CloseFile(pasfile);
 {Destroy the handled pascal code tree}
 destruct_pas_tree(pastree2);
 {Hint that the convertion is done}
 writeln('Convertion is done!');
 writeln('You can find the file in path '+ExpandFileName(outputname));
 writeln('Press Enter to exit the program,you can use it as a assitant to code translation.');
 writeln('Convertion cannot be 100 percent correct,you should edit the converted code manually.');
 readln;
end;
var i,j:SizeInt;
    tempstr:string;
    p1:string='';
    p2:array of string;
    p3:byte=1;
    p4:string='';
    p5:boolean=false;
    p6:boolean=false;
    p7:boolean=false;
    total:SizeInt;
label label1,label2,label3,label4;
begin
 {Handle the external commands}
 if(ParamCount>=1) then
  begin
   i:=1; j:=0;
   while(i<=ParamCount)do
    begin
     tempstr:=ParamStr(i);
     if(Copy(tempstr,1,2)='-i') or (Copy(tempstr,1,2)='-I') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:File Path is empty.');
         readln; exit;
        end
       else if(FileExists(tempstr)=false) then
        begin
         writeln('ERROR:File '+tempstr+ 'does not exist.');
         readln; exit;
        end;
       if(p1='') then
        begin
         p1:=tempstr;
        end
       else
        begin
         writeln('ERROR:Multiple input file is not allowed.');
         readln; exit;
        end;
      end
     else if(LowerCase(Copy(tempstr,1,7))='--input') then
      begin
       tempstr:=Copy(tempstr,8,length(tempstr)-7);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:File Path is empty.');
         readln; exit;
        end
       else if(FileExists(tempstr)=false) then
        begin
         writeln('ERROR:File '+tempstr+ 'does not exist.');
         readln; exit;
        end;
       if(p1='') then
        begin
         p1:=tempstr;
        end
       else
        begin
         writeln('ERROR:Multiple input file is not allowed.');
         readln; exit;
        end;
      end
     else if(Copy(tempstr,1,2)='-o') or (Copy(tempstr,1,2)='-O') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(p4='') then
        begin
         p4:=tempstr;
        end
       else
        begin
         writeln('ERROR:Multiple output file is not allowed.');
         readln; exit;
        end;
      end
     else if(LowerCase(Copy(tempstr,1,8))='--output') then
      begin
       tempstr:=Copy(tempstr,9,length(tempstr)-8);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(p4='') then
        begin
         p4:=tempstr;
        end
       else
        begin
         writeln('ERROR:Multiple output file is not allowed.');
         readln; exit;
        end;
      end
     else if(Copy(tempstr,1,2)='-l') or (Copy(tempstr,1,2)='-L') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:Directory Path is empty.');
         readln; exit;
        end
       else if(DirectoryExists(tempstr)) then
        begin
         inc(j);
         SetLength(p2,j);
         p2[j-1]:=tempstr;
        end
       else
        begin
         writeln('ERROR:Directory '+tempstr+' does not exist.');
         readln; exit;
        end;
      end
     else if(LowerCase(Copy(tempstr,1,9))='--include') then
      begin
       tempstr:=Copy(tempstr,10,length(tempstr)-9);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:Directory Path is empty.');
         readln; exit;
        end
       else if(DirectoryExists(tempstr)) then
        begin
         inc(j);
         SetLength(p2,j);
         p2[j-1]:=tempstr;
        end
       else
        begin
         writeln('ERROR:Directory '+tempstr+' does not exist.');
         readln; exit;
        end;
      end
     else if(Copy(tempstr,1,2)='-r') or (Copy(tempstr,1,2)='-R') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(LowerCase(tempstr)='on') then
        begin
         p5:=true;
        end
       else if(LowerCase(tempstr)='off') then
        begin
         p5:=false;
        end
       else if(tempstr<>'') then
        begin
         writeln('ERROR:unknown reference switch mode '+tempstr+'.');
         readln; exit;
        end
       else
        begin
         writeln('ERROR:switch mode is empty.');
         readln; exit;
        end;
      end
     else if(LowerCase(Copy(tempstr,1,12))='--reference') then
      begin
       tempstr:=Copy(tempstr,13,length(tempstr)-12);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(LowerCase(tempstr)='on') then
        begin
         p5:=true;
        end
       else if(LowerCase(tempstr)='off') then
        begin
         p5:=false;
        end
       else if(tempstr<>'') then
        begin
         writeln('ERROR:unknown reference switch mode '+tempstr+'.');
         readln; exit;
        end
       else
        begin
         writeln('ERROR:reference switch mode is empty.');
         readln; exit;
        end;
      end
     else if(Copy(tempstr,1,2)='-d') or (Copy(tempstr,1,2)='-D') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:Switch mode empty.');
         readln; exit;
        end
       else if(LowerCase(tempstr)='on') then
        begin
         p6:=true;
        end
       else if(LowerCase(tempstr)='off') then
        begin
         p6:=false;
        end
       else if(tempstr='') then
        begin
         writeln('ERROR:debug switch mode is empty.');
         readln; exit;
        end
       else
        begin
         writeln('ERROR:unknown debug switch mode '+tempstr+'.');
         readln; exit;
        end;
      end
     else if(LowerCase(Copy(tempstr,1,7))='--debug') then
      begin
       tempstr:=Copy(tempstr,8,length(tempstr)-7);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:Switch mode empty.');
         readln; exit;
        end
       else if(LowerCase(tempstr)='on') then
        begin
         p6:=true;
        end
       else if(LowerCase(tempstr)='off') then
        begin
         p6:=false;
        end
       else if(tempstr='') then
        begin
         writeln('ERROR:debug switch mode is empty.');
         readln; exit;
        end
       else
        begin
         writeln('ERROR:unknown debug switch mode '+tempstr+'.');
         readln; exit;
        end;
      end
     else if(Copy(tempstr,1,2)='-t') or (Copy(tempstr,1,2)='-T') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:output file type empty.');
         readln; exit;
        end
       else if(LowerCase(tempstr)='u') or (LowerCase(tempstr)='unit') then
        begin
         p3:=1;
        end
       else if(LowerCase(tempstr)='p') or (LowerCase(tempstr)='program') then
        begin
         p3:=0;
        end
       else if(LowerCase(tempstr)='l') or (LowerCase(tempstr)='library') then
        begin
         p3:=2;
        end
       else if(tempstr<>'') then
        begin
         writeln('ERROR:pascal code file type is empty.');
         readln; exit;
        end
       else
        begin
         writeln('ERROR:unknown pascal code file type  '+tempstr+'.');
         readln; exit;
        end;
      end
     else if(LowerCase(Copy(tempstr,1,2))='--type') then
      begin
       tempstr:=Copy(tempstr,3,length(tempstr)-2);
       if(tempstr[1]='"') or (tempstr[1]=#39) then
        begin
         tempstr:=Copy(tempstr,2,length(tempstr)-1);
        end;
       if(tempstr[length(tempstr)]='"') or (tempstr[length(tempstr)]=#39) then
        begin
         tempstr:=Copy(tempstr,1,length(tempstr)-1);
        end;
       if(tempstr='') then
        begin
         writeln('ERROR:output file type empty.');
         readln; exit;
        end
       else if(LowerCase(tempstr)='u') or (LowerCase(tempstr)='unit') then
        begin
         p3:=1;
        end
       else if(LowerCase(tempstr)='p') or (LowerCase(tempstr)='program') then
        begin
         p3:=0;
        end
       else if(LowerCase(tempstr)='l') or (LowerCase(tempstr)='library') then
        begin
         p3:=2;
        end
       else if(tempstr<>'') then
        begin
         writeln('ERROR:pascal code file type is empty.');
         readln; exit;
        end
       else
        begin
         writeln('ERROR:unknown pascal code file type '+tempstr+'.');
         readln; exit;
        end;
      end
     else if(tempstr='-p') or (tempstr='-P') or (LowerCase(Copy(tempstr,1,11))='--pascalize') then
      begin
       p7:=true;
      end
     else if(Copy(tempstr,1,2)='-h') or (Copy(tempstr,1,2)='-H')
     or (LowerCase(Copy(tempstr,1,6))='--help') then
      begin
       writeln('Template:c2pas <commands>');
       writeln('         Tips:It will delete all comments in code to prevent it for errors');
       writeln('         These are available codes below:');
       writeln('         -i/-I/--input means input file path(must be only one).');
       writeln('         -i/-I/--input<input file path>');
       writeln('         Example:(Windows)-i/-I"D:\binutils-2.43\gas\app.c"');
       writeln('                 (Linux/Unix)-i/-I"home/tydq/binutils-2.43/gas/app.c"');
       writeln('         -o/-O/--output means output file path(must be only one).');
       writeln('         -o/-O/--output<output file path>');
       writeln('         Example:(Windows)-i/-I"D:\binutils-2.43\gas\out.pas"');
       writeln('                 (Linux/Unix)-i/-I"home/tydq/binutils-2.43/gas/out.pas"');
       writeln('         -l/-L/--include means include file path(can be multiple).');
       writeln('         -l/-L/--include<include file path>');
       writeln('         Example:(Windows)-l/-L"D:\binutils-2.43"');
       writeln('                 (Linux/Unix)-l/-L"home/tydq/binutils-2.43"');
       writeln('         -t/-T/--type means your pascal code file type(must be only one)(unit is default).');
       writeln('         -t/-T/--type<program/unit/library>/<p/u/l>');
       writeln('         Example:-t/-T/--typeunit');
       writeln('         -r/-R/--reference means whether you need reference c code file or not(must be only one).');
       writeln('         -r/-R/--reference<On/Off>');
       writeln('         Example:-r/-R/--referenceOn');
       writeln('         -d/-D/--debug means debug mode switch(On is open,off is close)(must be only one).');
       writeln('         -d/-D/--debug<On/Off>');
       writeln('         Example:-d/-D/--debugOn');
       writeln('         -h/-H/--help means you need the help manual for this program(must be only one).');
       writeln('         Example:-h/-H/--help');
       writeln('         Warning:-p/-P/--pascalize is obsolete');
       writeln('         -p/-P/--pascalize means enable pascalize standard function(Default is disabled).');
       writeln('         Example:-p/-P/--pascalize');
       writeln('         Total Example:c2pas -Iout.c -oout.pas -Linclude -Roff -Doff -Tunit -P');
       writeln('         Warning:Any path must be convert with "",or you will get an Access Violation Error!');
       writeln('         You can press enter to exit the help manual.');
       readln; exit;
      end
     else
      begin
       writeln('ERROR:Unknown command:'+ParamStr(i));
       readln; exit;
      end;
     inc(i);
    end;
   if(p1='') then
    begin
     writeln('ERROR:no input file,program terminated.');
     readln; exit;
    end;
   if(p4='') then
    begin
     writeln('no output file name,use out.pas as default.');
     readln; exit;
    end;
   c2pas_convert(p1,p2,p3,p4,p5,p6,p7);
  end
 else if(ParamCount=0) then
  begin
   writeln('No Command,Show the help manual.');
   writeln('Do you want to enter Console I/O mode(Y/yes can continue)?');
   readln(tempstr);
   if(LowerCase(tempstr)<>'y') and (LowerCase(tempstr)<>'yes') then
    begin
     writeln('Template:c2pas <commands>');
       writeln('         Tips:It will delete all comments in code to prevent it for errors');
       writeln('         These are available codes below:');
       writeln('         -i/-I/--input means input file path(must be only one).');
       writeln('         -i/-I/--input<input file path>');
       writeln('         Example:(Windows)-i/-I"D:\binutils-2.43\gas\app.c"');
       writeln('                 (Linux/Unix)-i/-I"home/tydq/binutils-2.43/gas/app.c"');
       writeln('         -o/-O/--output means output file path(must be only one).');
       writeln('         -o/-O/--output<output file path>');
       writeln('         Example:(Windows)-i/-I"D:\binutils-2.43\gas\out.pas"');
       writeln('                 (Linux/Unix)-i/-I"home/tydq/binutils-2.43/gas/out.pas"');
       writeln('         -l/-L/--include means include file path(can be multiple).');
       writeln('         -l/-L/--include<include file path>');
       writeln('         Example:(Windows)-l/-L"D:\binutils-2.43"');
       writeln('                 (Linux/Unix)-l/-L"home/tydq/binutils-2.43"');
       writeln('         -t/-T/--type means your pascal code file type(must be only one)(unit is default).');
       writeln('         -t/-T/--type<program/unit/library>/<p/u/l>');
       writeln('         Example:-t/-T/--typeunit');
       writeln('         -r/-R/--reference means whether you need reference c code file or not(must be only one).');
       writeln('         -r/-R/--reference<On/Off>');
       writeln('         Example:-r/-R/--referenceOn');
       writeln('         -d/-D/--debug means debug mode switch(On is open,off is close)(must be only one).');
       writeln('         -d/-D/--debug<On/Off>');
       writeln('         Example:-d/-D/--debugOn');
       writeln('         -h/-H/--help means you need the help manual for this program(must be only one).');
       writeln('         Example:-h/-H/--help');
       writeln('         Warning:-p/-P/--pascalize is obsolete');
       writeln('         -p/-P/--pascalize means enable pascalize standard function(Default is disabled).');
       writeln('         Example:-p/-P/--pascalize');
       writeln('         Total Example:c2pas -Iout.c -oout.pas -Linclude -Roff -Doff -Tunit -P');
       writeln('         Warning:Any path must be convert with "",or you will get an Access Violation Error!');
       writeln('         You can press enter to exit the help manual.');
     readln; exit;
    end;
   writeln('Input the include path number:');
   readln(total); i:=0;
   while(i<total)do
    begin
     writeln('Input the include path ',i+1,':');
     readln(tempstr);
     if(length(tempstr)>=2) and ((tempstr[1]='"') or (tempstr[1]=#39)) then
      begin
       if(tempstr[length(tempstr)]='"') or (tempstr[1]=#39) then
       tempstr:=Copy(tempstr,2,length(tempstr)-2)
       else
       tempstr:=Copy(tempstr,2,length(tempstr)-1)
      end;
     if(tempstr='') then
      begin
       writeln('ERROR:Directory path empty.');
       continue;
      end
     else if(DirectoryExists(tempstr)) then
      begin
       inc(i);
       SetLength(p2,i);
       p2[i-1]:=tempstr;
      end
     else
      begin
       writeln('ERROR:Directory '+tempstr+' does not exists.');
       continue;
      end;
    end;
   label1:
   writeln('Input the input file name:');
   readln(tempstr);
   if(length(tempstr)>=2) and ((tempstr[1]='"') or (tempstr[1]=#39)) then
    begin
     if(tempstr[length(tempstr)]='"') or (tempstr[1]=#39) then
     tempstr:=Copy(tempstr,2,length(tempstr)-2)
     else
     tempstr:=Copy(tempstr,2,length(tempstr)-1)
    end;
   if(FileExists(tempstr)) then
    begin
     p1:=tempstr;
    end
   else if(tempstr<>'') then
    begin
     writeln('ERROR:File '+tempstr+' does not exist.');
     goto label1;
    end
   else
    begin
     writeln('ERROR:File path empty.');
     goto label1;
    end;
   label2:
   writeln('Input the output file type(l/library or p/program or u/unit):');
   readln(tempstr);
   if(LowerCase(tempstr)='l') or (LowerCase(tempstr)='library') then
    begin
     p3:=2;
    end
   else if(LowerCase(tempstr)='p') or (LowerCase(tempstr)='program') then
    begin
     p3:=0;
    end
   else if(LowerCase(tempstr)='u') or (LowerCase(tempstr)='unit') then
    begin
     p3:=1;
    end
   else if(tempstr<>'') then
    begin
     writeln('ERROR:Output file type empty.');
     goto label2;
    end
   else
    begin
     writeln('ERROR:Output file type '+tempstr+'does not exist.');
     goto label2;
    end;
   writeln('Input the output file name:');
   readln(tempstr);
   p4:=tempstr;
   label3:
   writeln('Input Yes/No to open the switch of reference c code:');
   readln(tempstr);
   if(LowerCase(tempstr)='yes') or (LowerCase(tempstr)='y') then
    begin
     p5:=true;
    end
   else if(LowerCase(tempstr)='no') or (LowerCase(tempstr)='n') then
    begin
     p5:=false;
    end
   else
    begin
     writeln('ERROR:unknown switch mode '+tempstr+'.');
     goto label3;
    end;
   label4:
   writeln('Input Yes/No to open the switch of debugging code:');
   readln(tempstr);
   if(LowerCase(tempstr)='yes') or (LowerCase(tempstr)='y') then
    begin
     p6:=true;
    end
   else if(LowerCase(tempstr)='no') or (LowerCase(tempstr)='n') then
    begin
     p6:=false;
    end
   else
    begin
     writeln('ERROR:unknown switch mode '+tempstr+'.');
     goto label4;
    end;
   writeln('Do you want to pascalize the standard function(Input y/yes to enable,other is disable)?');
   readln(tempstr);
   if(LowerCase(tempstr)='yes') or (LowerCase(tempstr)='y') then p7:=true else p7:=false;
   c2pas_convert(p1,p2,p3,p4,p5,p6,p7);
  end;
end.

