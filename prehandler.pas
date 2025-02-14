unit prehandler;

interface

uses Classes, SysUtils;

type fileinfo=packed record
              filepath:string;
              filename:string;
              fileext:string;
              end;

procedure prehandler_handle_code(var content:string;includelist:TStringList;isinclude:boolean);

implementation

procedure prehandler_handle(var content:string);
var i,j,len:SizeInt;
begin
 {Delete the /**/ comments}
 i:=1; len:=length(content);
 while(i<=len)do
  begin
   if(content[i]='"') or (content[i]=#39) then
    begin
     j:=i+1;
     while(j<=len)do
      begin
       if(j>i+3) and (content[j-3]<>'\') and (content[j-2]='\') and
       (content[j-1]='\') and (content[j]=content[i]) then break
       else if(j>i+2) and (content[j-2]='\') and (content[j-1]='\') and
       (content[j]=content[i]) then break
       else if(j>i+1) and (content[j-1]<>'\') and (content[j]=content[i]) then break
       else if(j=i+1) and (content[j]=content[i]) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(Copy(content,i,2)='/*') then
    begin
     j:=i+1;
     while(j<=len-1) and (Copy(content,j,2)<>'*/') do inc(j);
     Delete(content,i,j-i+2); dec(len,j-i+2); continue;
    end;
   inc(i);
  end;
 {Delete the // comments}
 i:=1; len:=length(content);
 while(i<=len)do
  begin
   if(content[i]='"') or (content[i]=#39) then
    begin
     j:=i+1;
     while(j<=len)do
      begin
       if(j>i+3) and (content[j-3]<>'\') and (content[j-2]='\') and
       (content[j-1]='\') and (content[j]=content[i]) then break
       else if(j>i+2) and (content[j-2]='\') and (content[j-1]='\') and
       (content[j]=content[i]) then break
       else if(j>i+1) and (content[j-1]<>'\') and (content[j]=content[i]) then break
       else if(j=i+1) and (content[j]=content[i]) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(Copy(content,i,2)='//') then
    begin
     j:=i+2;
     while(j<=len) and (content[j]<>#10) do inc(j);
     Delete(content,i,j-i+1); dec(len,j-i+1); continue;
    end;
   inc(i);
  end;
 {Delete the \ endline}
 i:=1; len:=length(content);
 while(i<=len)do
  begin
   if(content[i]='"') or (content[i]=#39) then
    begin
     j:=i+1;
     while(j<=len)do
      begin
       if(j>i+3) and (content[j-3]<>'\') and (content[j-2]='\') and
       (content[j-1]='\') and (content[j]=content[i]) then break
       else if(j>i+2) and (content[j-2]='\') and (content[j-1]='\') and
       (content[j]=content[i]) then break
       else if(j>i+1) and (content[j-1]<>'\') and (content[j]=content[i]) then break
       else if(j=i+1) and (content[j]=content[i]) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(content[i]='\') then
    begin
     j:=i+1;
     while(j<=len) and (content[j]<>#10) do inc(j);
     Delete(content,i,j-i+1); dec(len,j-i+1); continue;
    end;
   inc(i);
  end;
 {Delete the Code Segment}
 i:=1; len:=length(content);
 while(i<=len)do
  begin
   if(content[i]='"') or (content[i]=#39) then
    begin
     j:=i+1;
     while(j<=len)do
      begin
       if(j>i+3) and (content[j-3]<>'\') and (content[j-2]='\') and
       (content[j-1]='\') and (content[j]=content[i]) then break
       else if(j>i+2) and (content[j-2]='\') and (content[j-1]='\') and
       (content[j]=content[i]) then break
       else if(j>i+1) and (content[j-1]<>'\') and (content[j]=content[i]) then break
       else if(j=i+1) and (content[j]=content[i]) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(Copy(content,i,12)='#CodeSegment') then
    begin
     Delete(content,i,12); dec(len,12); continue;
    end;
   inc(i);
  end;
end;
procedure prehandler_handle_include(var content:string);
var i,j,len:SizeInt;
    b1,b2,b3:boolean;
    endpos:SizeInt;
begin
 prehandler_handle(content);
 b1:=false; b2:=false; b3:=false;
 i:=1; len:=length(content); endpos:=0;
 while(i<=len) do
  begin
   len:=length(content);
   if(i>len) then break;
   if(content[i]='"') or (content[i]=#39) then
    begin
     j:=i+1;
     while(j<=len)do
      begin
       if(j>i+3) and (content[j-3]<>'\') and (content[j-2]='\') and
       (content[j-1]='\') and (content[j]=content[i]) then break
       else if(j>i+2) and (content[j-2]='\') and (content[j-1]='\') and
       (content[j]=content[i]) then break
       else if(j>i+1) and (content[j-1]<>'\') and (content[j]=content[i]) then break
       else if(j=i+1) and (content[j]=content[i]) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(Copy(content,i,7)='#ifndef') and (b1=false) then
    begin
     j:=i+7;
     while(j<=len) and (content[j]<>#10) do inc(j);
     Delete(content,i,j-i); b1:=true; continue;
    end
   else if(Copy(content,i,7)='#define') and (b2=false) then
    begin
     j:=i+7;
     while(j<=len) and (content[j]<>#10) do inc(j);
     Delete(content,i,j-i); b2:=true; continue;
    end
   else if(Copy(content,i,12)='#pragma once') and (b3=false) then
    begin
     Delete(content,i,12); b3:=true; continue;
    end
   else if(Copy(content,i,6)='#endif') then
    begin
     endpos:=i; inc(i,6); continue;
    end;
   inc(i);
  end;
 if(endpos>0) then
  begin
   Delete(content,endpos,6);
  end;
end;
function prehandler_obtain_fileinfo(filename:string):fileinfo;
var i,j,len:SizeInt;
    res:fileinfo;
begin
 len:=length(filename); i:=len;
 while(i>0) and (filename[i]<>'/') and (filename[i]<>'\') do dec(i);
 j:=i+1;
 while(j<=len) and (filename[j]<>'.') do inc(j);
 res.filepath:=Trim(Copy(filename,1,i-1));
 res.filename:=Trim(Copy(filename,i+1,j-i-1));
 res.fileext:=Trim(Copy(filename,j+1,len-j));
 prehandler_obtain_fileinfo:=res;
end;
procedure prehandler_handle_code(var content:string;includelist:TStringList;isinclude:boolean);
var i,j,k,len,len2:SizeInt;
    tempstr,tempstr2,detectfn,content2:string;
    bool,mybool:boolean;
    info:fileinfo;
    source,header:TStringList;
begin
 prehandler_handle(content);
 source:=TStringList.Create;
 i:=1; len:=length(content);
 while(i<=len) do
  begin
   if(content[i]='"') or (content[i]=#39) then
    begin
     j:=i+1;
     while(j<=len)do
      begin
       if(j>i+3) and (content[j-3]<>'\') and (content[j-2]='\') and
       (content[j-1]='\') and (content[j]=content[i]) then break
       else if(j>i+2) and (content[j-2]='\') and (content[j-1]='\') and
       (content[j]=content[i]) then break
       else if(j>i+1) and (content[j-1]<>'\') and (content[j]=content[i]) then break
       else if(j=i+1) and (content[j]=content[i]) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(Copy(content,i,8)='#include') then
    begin
     j:=i+8;
     while(j<=len) and (content[j]<>#10) and (content[j]<>'#') do inc(j);
     tempstr:=Trim(Copy(content,i+8,j-i-8)); len2:=length(tempstr);
     if(tempstr[1]='<') or (tempstr[1]='"') then tempstr:=Trim(Copy(tempstr,2,len2-2));
     info:=prehandler_obtain_fileinfo(tempstr);
     k:=1; bool:=false;
     while(k<=includelist.Count) do
      begin
       mybool:=false;
       detectfn:=includelist[k-1]+'/'+info.filename+'.c';
       if(FileExists(detectfn)) and (mybool=false) and (isinclude=false) then
        begin
         source.Add(detectfn); mybool:=true;
        end;
       detectfn:=includelist[k-1]+'/'+info.filename+'.cc';
       if(FileExists(detectfn)) and (mybool=false) and (isinclude=false) then
        begin
         source.Add(detectfn); mybool:=true;
        end;
       detectfn:=includelist[k-1]+'/'+info.filename+'.cpp';
       if(FileExists(detectfn)) and (mybool=false) and (isinclude=false) then
        begin
         source.Add(detectfn); mybool:=true;
        end;
       detectfn:=includelist[k-1]+'/'+info.filename+'.h';
       if(FileExists(detectfn)) then
        begin
         Delete(content,i,j-i);
         header:=TStringList.Create;
         header.LoadFromFile(detectfn);
         tempstr2:=header.Text;
         prehandler_handle_include(tempstr2);
         header.Free;
         Insert(#10+tempstr2,content,i);
         len:=length(content);
         bool:=true;
        end;
       detectfn:=includelist[k-1]+'/'+info.filename+'.hpp';
       if(FileExists(detectfn)) then
        begin
         Delete(content,i,j-i);
         header:=TStringList.Create;
         header.LoadFromFile(detectfn);
         tempstr2:=header.Text;
         prehandler_handle_include(tempstr2);
         header.Free;
         Insert(#10+tempstr2,content,i);
         len:=length(content);
         bool:=true;
        end;
       inc(k);
      end;
     if(bool=false) then i:=j+1;
     continue;
    end;
   inc(i);
  end;
 i:=1;
 content2:='';
 for i:=1 to source.Count do
  begin
   if(fileExists(Source[i-1])) then
    begin
     header:=TStringList.Create;
     header.LoadFromFile(Source[i-1]);
     tempstr2:=header.Text;
     prehandler_handle(tempstr2);
     content2:=content2+#10+tempstr2;
     header.Free;
    end;
  end;
 content:=content+content2;
 for i:=1 to length(content) do
  begin
   if(content[i]<=' ') and (content[i]<>#10) then content[i]:=' ';
  end;
 Source.Free;
end;

end.

