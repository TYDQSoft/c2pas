unit converter;

interface

uses classes,sysutils,math;

const c_node_none=0;
      c_node_expression=1;
      c_node_statement=2;
      c_node_struct=3;
      c_node_member=4;
      c_node_enum=5;
      c_node_if_statement=6;
      c_node_loop_statement=7;
      c_node_switch=8;
      c_node_switch_case=9;
      c_node_pragma=10;
      c_node_define=11;
      c_node_function=12;
      c_node_ifdef=13;
      c_node_typedef=14;
      c_node_return=15;
      c_node_extern=16;
      c_node_asm=17;
      c_node_const=18;
      c_node_include=19;
      c_node_class_member=20;
      c_node_class_function=21;
      c_node_class=22;
      c_node_code_signal=23;
      c_node_goto_or_label=24;
      c_node_asm_code=25;
      c_node_class_tag=26;
      c_node_namespace=27;
      c_node_extern_c=28;
      c_node_operator=29;
      c_node_using_namespace=30;
      c_node_lambda_expression=31;
      c_node_constexpr_function=32;
      c_node_unhandled=33;
      c_node_root=34;
      c_node_if_if=0;
      c_node_if_elseif=1;
      c_node_if_else=2;
      c_node_loop_for=0;
      c_node_loop_while=1;
      c_node_loop_do_while=2;
      c_node_ifdef_ifdef=0;
      c_node_ifdef_ifndef=1;
      c_node_ifdef_if=2;
      c_node_ifdef_elif=3;
      c_node_ifdef_else=4;
      c_node_ifdef_endif=5;
      c_node_class_public=0;
      c_node_class_private=1;
      c_node_class_protected=2;
      pas_node_none=0;
      pas_node_expression=1;
      pas_node_variable=2;
      pas_node_const=3;
      pas_node_member=4;
      pas_node_record=5;
      pas_node_type=6;
      pas_node_enum=7;
      pas_node_function=8;
      pas_node_class_function=9;
      pas_node_operator=10;
      pas_node_return=11;
      pas_node_if_statement=12;
      pas_node_loop_statement=13;
      pas_node_case_of_statement=14;
      pas_node_case_of_sub_statement=15;
      pas_node_define=16;
      pas_node_ifdef=17;
      pas_node_goto_or_label=18;
      pas_node_asm=19;
      pas_node_asm_code=20;
      pas_node_uses=21;
      pas_node_class=22;
      pas_node_class_tag=23;
      pas_node_label_declare=24;
      pas_node_root=25;
      pas_node_if_if=0;
      pas_node_if_elseif=1;
      pas_node_if_else=2;
      pas_node_loop_for=0;
      pas_node_loop_while=1;
      pas_node_loop_repeat=2;
      pas_node_ifdef_ifdef=0;
      pas_node_ifdef_ifndef=1;
      pas_node_ifdef_if=2;
      pas_node_ifdef_elif=3;
      pas_node_ifdef_else=4;
      pas_node_ifdef_endif=5;
      pas_node_class_public=0;
      pas_node_class_protected=1;
      pas_node_class_private=2;

type c_string=packed record
              item:array of string;
              status:array of byte;
              count:SizeInt;
              end;
     c_string_list=packed record
                   item:array of c_string;
                   count:SizeInt;
                   end;
     c_expression=packed record
                  content:c_string;
                  end;
     Pc_expression=^c_expression;
     c_statement=packed record
                 isstatic:boolean;
                 statetype:string;
                 varname:array of c_string;
                 varbool:array of boolean;
                 varvalue:array of c_string;
                 varcount:SizeInt;
                 atpos:array of string;
                 align:array of string;
                 atsec:array of string;
                 end;
     Pc_statement=^c_statement;
     c_struct=packed record
              generichave:boolean;
              genericitem:array of c_string;
              genericspec:array of c_string;
              genericspeccount:SizeInt;
              genericcount:SizeInt;
              istypedef:boolean;
              pack:byte;
              align:string;
              section:string;
              structtype:boolean;
              structtname:string;
              structdefname:array of c_string;
              structdefnamecount:SizeInt;
              structalign:array of string;
              structat:array of string;
              structsec:array of string;
              varname:array of c_string;
              varcount:SizeInt;
              varhavevalue:array of boolean;
              varvalue:array of c_string;
              end;
     Pc_struct=^c_struct;
     c_member=packed record
              memisstatic:boolean;
              membername:array of c_string;
              membertype:string;
              memberbit:array of byte;
              membercount:SizeInt;
              end;
     Pc_member=^c_member;
     c_enum=packed record
            istypedef:boolean;
            enumtype:string;
            enumdefname:array of c_string;
            enumdefnamecount:SizeInt;
            enumcontent:array of c_string;
            enumdep:array of boolean;
            enumuna:array of boolean;
            enumcount:SizeInt;
            enumat:array of string;
            enumsec:array of string;
            enumalign:array of string;
            varname:array of c_string;
            varcount:SizeInt;
            varhavevalue:array of boolean;
            varvalue:array of c_string;
            end;
     Pc_enum=^c_enum;
     c_if_statement=packed record
                    iftype:byte;
                    condition:c_string;
                    haveprev:boolean;
                    end;
     Pc_if_statement=^c_if_statement;
     c_loop_statement=packed record
                      looptype:byte;
                      haveinit:boolean;
                      init:c_string;
                      condition:c_string;
                      havestep:boolean;
                      step:c_string;
                      end;
     Pc_loop_statement=^c_loop_statement;
     c_switch=packed record
              exp:c_string;
              end;
     Pc_switch=^c_switch;
     c_switch_case=packed record
                   constexp:c_string;
                   end;
     Pc_switch_case=^c_switch_case;
     c_pragma=packed record
              havepack:boolean;
              pack:byte;
              once:boolean;
              end;
     Pc_pragma=^c_pragma;
     c_define=packed record
              defstate:boolean;
              defname:c_string;
              defhavevalue:boolean;
              defvalue:c_string;
              end;
     Pc_define=^c_define;
     c_function=packed record
                generichave:boolean;
                genericitem:array of c_string;
                genericspec:array of c_string;
                genericspeccount:SizeInt;
                genericcount:SizeInt;
                funcalias:string;
                funcstatic:boolean;
                funcsec:string;
                funcat:string;
                funcname:string;
                funcinline:boolean;
                funcalign:string;
                funcabi:string;
                funcconv:string;
                param:array of c_string;
                paramcount:SizeInt;
                resulttype:string;
                isasm:boolean;
                end;
     Pc_function=^c_function;
     c_constexpr_function=packed record
                          funcname:string;
                          funcparam:array of c_string;
                          funccount:SizeInt;
                          functype:string;
                          end;
     Pc_constexpr_function=^c_constexpr_function;
     c_ifdef=packed record
             deftype:byte;
             condition:c_string;
             end;
     Pc_ifdef=^c_ifdef;
     c_typedef=packed record
               newvalue:c_string;
               oldvalue:c_string;
               align:byte;
               end;
     Pc_typedef=^c_typedef;
     c_return=packed record
              retvalue:c_string;
              end;
     Pc_return=^c_return;
     c_extern=packed record
              static:boolean;
              exttype:string;
              extvar:array of c_string;
              extvarcount:SizeInt;
              end;
     Pc_extern=^c_extern;
     c_extern_c=packed record
                extc:boolean;
                end;
     Pc_extern_c=^c_extern_c;
     c_asm=packed record
           asmisvolatile:boolean;
           asmcode:c_string;
           asmoutput:c_string;
           asminput:c_string;
           asmdes:c_string;
           end;
     Pc_asm=^c_asm;
     c_const=packed record
             cconstexpr:boolean;
             cstatic:boolean;
             ctype:string;
             cname:array of c_string;
             chavevalue:array of boolean;
             cvalue:array of c_string;
             calign:array of string;
             cat:array of string;
             csec:array of string;
             ccount:SizeInt;
             end;
     Pc_const=^c_const;
     c_include=packed record
               incname:c_string;
               end;
     Pc_include=^c_include;
     c_class_member=packed record
                    memisstatic:boolean;
                    membername:array of c_string;
                    memberhavevalue:array of boolean;
                    membervalue:array of c_string;
                    membertype:string;
                    memberbit:array of byte;
                    membercount:SizeInt;
                    end;
     Pc_class_member=^c_class_member;
     c_class_function=packed record
                      generichave:boolean;
                      genericitem:array of c_string;
                      genericspec:array of c_string;
                      genericspeccount:SizeInt;
                      genericcount:SizeInt;
                      funchaveinit:boolean;
                      funcinit:array of c_string;
                      funcinitcount:SizeInt;
                      funcalias:string;
                      isstatic:boolean;
                      isconstructor:boolean;
                      isdestructor:boolean;
                      hostclassname:string;
                      isvirtual:boolean;
                      isoverride:boolean;
                      isabstract:boolean;
                      funcname:string;
                      funcinline:boolean;
                      funcalign:string;
                      funcsec:string;
                      funcabi:string;
                      funcconv:string;
                      funcat:string;
                      param:array of c_string;
                      paramcount:SizeInt;
                      resulttype:string;
                      isasm:boolean;
                      end;
     Pc_class_function=^c_class_function;
     c_class_tag=packed record
                 tagtype:byte;
                 end;
     Pc_class_tag=^c_class_tag;
     c_class=packed record
             generichave:boolean;
             genericitem:array of c_string;
             genericcount:SizeInt;
             genericspec:array of c_string;
             genericspeccount:SizeInt;
             inheritclass:array of string;
             inheritbyte:array of byte;
             inheritcount:SizeInt;
             classname:string;
             end;
     Pc_class=^c_class;
     c_namespace=packed record
                 spacename:string;
                 end;
     Pc_namespace=^c_namespace;
     c_goto_or_label=packed record
                     islabel:boolean;
                     name:string;
                     end;
     Pc_goto_or_label=^c_goto_or_label;
     c_code_seg=packed record
                divide:boolean;
                end;
     Pc_code_seg=^c_code_seg;
     c_asm_code=packed record
                asmcode:c_string;
                end;
     Pc_asm_code=^c_asm_code;
     c_operator=packed record
                generichave:boolean;
                genericitem:array of c_string;
                genericcount:SizeInt;
                genericspec:array of c_string;
                genericspeccount:SizeInt;
                opealias:string;
                isoverride:boolean;
                isstatic:boolean;
                isvirtual:boolean;
                isinline:boolean;
                atpos:string;
                section:string;
                align:string;
                abi:string;
                conv:string;
                operestype:string;
                opesign:string;
                opeparam:array of c_string;
                opeparamcount:SizeInt;
                isasm:boolean;
                end;
     Pc_operator=^c_operator;
     c_using_namespace=packed record
                       namespace:string;
                       end;
     Pc_using_namespace=^c_using_namespace;
     c_lambda_expression=packed record
                         funcname:string;
                         captureitem:array of c_string;
                         capturecount:SizeInt;
                         parameteritem:array of c_string;
                         parametercount:SizeInt;
                         rettype:string;
                         end;
     Pc_lambda_expression=^c_lambda_expression;
     c_unhandled=packed record
                 content:c_string;
                 end;
     Pc_unhandled=^c_unhandled;
     c_tree=packed record
            parent:^c_tree;
            codeseg:boolean;
            treetype:byte;
            content:Pointer;
            child:^c_tree;
            count:SizeInt;
            end;
     Pc_tree=^c_tree;
     c_define_list=packed record
                   define:array of c_define;
                   count:SizeInt;
                   end;
     pas_expression=packed record
                    content:c_string;
                    end;
     Ppas_expression=^pas_expression;
     pas_variable=packed record
                  varspec:boolean;
                  varname:string;
                  vartype:string;
                  vararrayd:array of c_string;
                  vararrayc:byte;
                  varhavevalue:boolean;
                  varvalue:c_string;
                  varext:boolean;
                  end;
     Ppas_variable=^pas_variable;
     pas_const=packed record
               constname:string;
               consttype:string;
               constarray:array of c_string;
               constcount:byte;
               consthavevalue:boolean;
               constvalue:c_string;
               end;
     Ppas_const=^pas_const;
     pas_member=packed record
                memclass:string;
                memname:string;
                memarray:array of c_string;
                memarraycount:byte;
                memtype:string;
                end;
     Ppas_member=^pas_member;
     pas_record=packed record
                isgeneric:boolean;
                generictype:array of string;
                genericcount:SizeInt;
                recordname:string;
                recordtype:byte;
                recordunion:boolean;
                end;
     Ppas_record=^pas_record;
     pas_type=packed record
              newname:string;
              oldname:c_string;
              end;
     Ppas_type=^pas_type;
     pas_enum=packed record
              enumname:string;
              enumcontent:array of c_string;
              enumcount:SizeInt;
              end;
     Ppas_enum=^pas_enum;
     pas_function=packed record
                  islambda:boolean;
                  paramcaptureindex:SizeInt;
                  isgeneric:boolean;
                  generictype:array of string;
                  genericcount:SizeInt;
                  funcname:string;
                  param:array of c_string;
                  paramcount:SizeInt;
                  resulttype:string;
                  abi:string;
                  align:string;
                  conv:string;
                  funcalias:string;
                  funcinline:boolean;
                  isasm:boolean;
                  ext:boolean;
                  end;
     Ppas_function=^pas_function;
     pas_class_function=packed record
                        isgeneric:boolean;
                        generictype:array of string;
                        genericcount:SizeInt;
                        hostname:string;
                        funcname:string;
                        param:array of c_string;
                        paramcount:SizeInt;
                        resulttype:string;
                        abi:string;
                        align:string;
                        conv:string;
                        ext:boolean;
                        funcalias:string;
                        isinline:boolean;
                        isasm:boolean;
                        isconstructor:boolean;
                        isdestructor:boolean;
                        isvirtual:boolean;
                        isabstract:boolean;
                        isoverride:boolean;
                        end;
     Ppas_class_function=^pas_class_function;
     pas_operator=packed record
                  isgeneric:boolean;
                  generictype:array of string;
                  genericcount:SizeInt;
                  signname:string;
                  param:array of c_string;
                  paramcount:SizeInt;
                  resultname:string;
                  resulttype:string;
                  abi:string;
                  align:string;
                  alias:string;
                  ext:boolean;
                  conv:string;
                  isinline:boolean;
                  isoverride:boolean;
                  isvirtual:boolean;
                  end;
     Ppas_operator=^pas_operator;
     pas_return=packed record
                retvalue:c_string;
                end;
     Ppas_return=^pas_return;
     pas_if_statement=packed record
                      iftype:byte;
                      condition:c_string;
                      havenext:boolean;
                      end;
     Ppas_if_statement=^pas_if_statement;
     pas_loop_statement=packed record
                        looptype:byte;
                        condition:c_string;
                        end;
     Ppas_loop_statement=^pas_loop_statement;
     pas_case_of_statement=packed record
                           exp:c_string;
                           end;
     Ppas_case_of_statement=^pas_case_of_statement;
     pas_case_of_sub_statement=packed record
                               cexp:array of c_string;
                               ccount:SizeInt;
                               end;
     Ppas_case_of_sub_statement=^pas_case_of_sub_statement;
     pas_define=packed record
                deftype:byte;
                defname:c_string;
                end;
     Ppas_define=^pas_define;
     pas_ifdef=packed record
               deftype:byte;
               condition:c_string;
               end;
     Ppas_ifdef=^pas_ifdef;
     pas_goto_or_label=packed record
                       islabel:boolean;
                       name:string;
                       end;
     Ppas_goto_or_label=^pas_goto_or_label;
     pas_label_declare=packed record
                       name:string;
                       end;
     Ppas_label_declare=^pas_label_declare;
     pas_asm=packed record
             code:array of c_string;
             count:SizeInt;
             end;
     Ppas_asm=^pas_asm;
     pas_asm_code=packed record
                  code:c_string;
                  end;
     Ppas_asm_code=^pas_asm_code;
     pas_uses=packed record
              usesname:string;
              end;
     Ppas_uses=^pas_uses;
     pas_class=packed record
               isgeneric:boolean;
               generictype:array of string;
               genericcount:SizeInt;
               inheritclass:array of string;
               inheritcount:byte;
               classname:string;
               end;
     Ppas_class=^pas_class;
     pas_class_tag=packed record
                   tagtype:byte;
                   end;
     Ppas_class_tag=^pas_class_tag;
     pas_tree=packed record
              parent:^pas_tree;
              part:boolean;
              treetype:byte;
              content:Pointer;
              child:^pas_tree;
              count:SizeInt;
              end;
     Ppas_tree=^pas_tree;
     cov_ifdef=packed record
               condition:array of c_string;
               count:SizeInt;
               end;
     pas_tree_list=packed record
                   tree:array of Ppas_tree;
                   ifdef:array of cov_ifdef;
                   count:SizeInt;
                   end;
     pas_temp=packed record
              temptype:array of pas_type;
              temptypecount:SizeInt;
              tempvar:array of pas_variable;
              tempvarcount:SizeInt;
              formerexp:array of c_string;
              formercount:SizeInt;
              exp:c_string;
              latterexp:array of c_string;
              lattercount:SizeInt;
              end;
     cov_stack=packed record
               left:array of SizeInt;
               right:array of SizeInt;
               vaild:array of boolean;
               index:array of SizeInt;
               count:SizeInt;
               end;
     cov_item=packed record
              covtype:byte;
              covcontent:Pointer;
              end;
     cov_asm=packed record
             asmreg:array of string;
             asmcount:byte;
             end;
     cov_type=packed record
              ctype:string;
              clayer:Byte;
              end;
     cov_io_param=packed record
                  item:array of c_string;
                  count:SizeInt;
                  end;
     cov_param=packed record
               isconst:boolean;
               isquoted:boolean;
               ptype:string;
               pname:string;
               parrc:byte;
               parrd:array of c_string;
               phavevalue:boolean;
               pvalue:c_string;
               end;
     cov_array=packed record
               arrc:byte;
               arrd:array of c_string;
               end;
     cov_func=packed record
              layer:byte;
              isinline:boolean;
              abi:string;
              alias:string;
              conv:string;
              isasm:boolean;
              name:string;
              param:array of c_string;
              count:SizeInt;
              resulttype:string;
              end;
     cov_array_dimension=packed record
                         arrc:byte;
                         arrd:array of SizeInt;
                         end;
     cov_func_param=packed record
                    funcname:string;
                    param:array of c_string;
                    count:SizeInt;
                    end;
     cov_pos_list=packed record
                  item:array of SizeInt;
                  count:SizeInt;
                  end;

function construct_c_tree(content:string):Pc_tree;
function convert_c_tree_to_pas_tree(ctree:Pc_tree;pastree:Ppas_tree=nil):Ppas_tree;
procedure destruct_c_tree(var ctree:Pc_tree);
procedure destruct_pas_tree(var pastree:Ppas_tree);
procedure pas_tree_reconstruct(const orgtree:Ppas_tree;var desttree:Ppas_tree);
function convert_pas_tree_to_string(pastree:Ppas_tree;blankcount:SizeInt=0):string;
{Setting the new type variable}
var newtypeindex:SizeUInt=0;
    newrecindex:SizeUInt=0;
    newclassindex:SizeUint=0;
    newenumindex:SizeUInt=0;
    newfuncindex:SizeUInt=0;
    newarrayindex:SizeUInt=0;
    newvarindex:SizeUInt=0;
    newgenindex:SizeUint=0;
    debugindex:SizeUInt=0;
    gcodelist:c_define_list;
{Setting the output file type}
    codenoifdef:boolean=false;
    species:byte=0;
    codename:string='';
    plizefunc:boolean=false;
{Setting the global searching}
    glopastree:Ppas_tree=nil;

implementation

function Pointer_vaild(const ptr:Pointer):boolean;
begin
 if(Ptr=nil) then pointer_vaild:=false else pointer_vaild:=true;
end;
procedure c_string_write(const code:c_string);
var i:SizeInt;
begin
 for i:=1 to code.Count do write(code.item[i-1],' ');
end;
function tydq_get_character(const content:string;i:SizeInt):Char;
begin
 if(i>length(content)) or (i<=0) then tydq_get_character:=#0 else tydq_get_character:=content[i];
end;
function c_string_divide_type_and_name(exp:c_string;specindex:byte=0):SizeInt;
var j,layer:SizeInt;
    flag:boolean;
begin
 if(exp.count>=3) and ((exp.item[0]='unsigned') or (exp.item[0]='signed'))
 and (exp.item[1]='long') and (exp.item[2]='long') and (exp.item[3]='int') then
  begin
   j:=5;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=3) and ((exp.item[0]='unsigned') or (exp.item[0]='signed'))
 and (exp.item[1]='long') and (exp.item[2]='long') then
  begin
   j:=4;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=3) and (exp.item[0]='long') and (exp.item[1]='long') and (exp.item[2]='int') then
  begin
   j:=3;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=2) and (exp.item[0]='long') and (exp.item[1]='long') then
  begin
   j:=3;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=2) and ((exp.item[0]='signed') or (exp.item[0]='unsigned'))
 and ((exp.item[1]='char') or (exp.item[1]='short') or (exp.item[1]='long')
 or (exp.item[1]='int')) then
  begin
   j:=3;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=2) and (exp.item[0]='enum') then
  begin
   j:=3;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=2) and ((exp.item[0]='struct') or (exp.item[0]='union')) then
  begin
   j:=2; layer:=0; flag:=false;
   while(j<=exp.count) do
    begin
     if(exp.item[j-1]='<') then
      begin
       inc(layer); flag:=true;
      end;
     if(exp.item[j-1]='>') then dec(layer);
     if(exp.item[j-1]='>>') then dec(layer,2);
     if(layer=0) and (j<exp.count) and (exp.item[j]='::') then
      begin
       inc(j,2); continue;
      end
     else if(layer=0) then
      begin
       if(flag=true) then inc(j);
       break;
      end;
     inc(j);
    end;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else if(exp.count>=2) and (exp.item[0]='class') then
  begin
   j:=2; layer:=0; flag:=false;
   while(j<=exp.count) do
    begin
     if(exp.item[j-1]='<') then
      begin
       inc(layer); flag:=true;
      end;
     if(exp.item[j-1]='>') then dec(layer);
     if(exp.item[j-1]='>>') then dec(layer,2);
     if(layer=0) and (j<exp.count) and (exp.item[j]='::') then
      begin
       inc(j,2); continue;
      end
     else if(layer=0) then
      begin
       if(flag=true) then inc(j);
       break;
      end;
     inc(j);
    end;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end
 else
  begin;
   j:=2; layer:=0; flag:=false;
   while(j<=exp.count) do
    begin
     if(exp.item[j-1]='<') then
      begin
       inc(layer); flag:=true;
      end;
     if(exp.item[j-1]='>') then dec(layer);
     if(exp.item[j-1]='>>') then dec(layer,2);
     if(layer=0) and (j<exp.count) and (exp.item[j]='::') then
      begin
       inc(j,2); continue;
      end
     else if(layer=0) then
      begin
       if(flag=true) then inc(j);
       break;
      end;
     inc(j);
    end;
   if(specindex=0) then while(j<=exp.count) and (exp.item[j-1]='*') do inc(j);
  end;
 dec(j);
 if(j<=exp.count) and (exp.item[j-1]='(') then dec(j);
 if(j<exp.count) and (exp.item[j]='=') then dec(j);
 c_string_divide_type_and_name:=j;
end;
procedure c_string_insert_item(const content:string;var str:c_string;const insindex:SizeInt);
var i,index:SizeInt;
begin
 SetLength(str.item,str.count+1);
 SetLength(str.status,str.count+1);
 if(insindex>str.count+1) then index:=str.count+1
 else if(insindex=0) then index:=1
 else index:=insindex;
 for i:=str.count downto index do
  begin
   str.item[i]:=str.item[i-1];
   str.status[i]:=str.status[i-1];
  end;
 inc(str.count);
 if(length(content)>0) and (tydq_get_character(content,length(content))=' ')
 then str.status[index-1]:=1
 else if(length(content)>0) and (tydq_get_character(content,length(content))=#10)
 then str.status[index-1]:=2
 else str.status[index-1]:=0;
 str.item[index-1]:=Trim(content);
end;
procedure c_string_insert_string(const content:c_string;var str:c_string;const insindex:SizeInt);
var i,count,index:SizeInt;
begin
 if(length(content.item)<>content.count) then exit;
 count:=content.count;
 if(insindex>str.count+1) then index:=str.count+1
 else if(insindex=0) then index:=1
 else index:=insindex;
 SetLength(str.item,str.count+count);
 SetLength(str.status,str.count+count);
 for i:=str.count downto index do
  begin
   str.item[i-1+count]:=str.item[i-1];
   str.status[i-1+count]:=str.status[i-1];
  end;
 for i:=index to index+count-1 do
  begin
   str.item[i-1]:=content.item[i-index];
   str.status[i-1]:=content.status[i-index];
  end;
 inc(str.count,count);
end;
procedure c_string_delete_item(var str:c_string;const left,count:SizeInt);
begin
 Delete(str.item,left-1,count);
 Delete(str.status,left-1,count);
 str.count:=length(str.item);
end;
function c_string_copy_item(const str:c_string;const left,count:SizeInt):c_string;
var res:c_string;
    i,mleft,mright:SizeInt;
begin
 if(str.count<=0) or (count<=0) then
  begin
   res.count:=0; SetLength(res.item,0); SetLength(res.status,0); exit(res);
  end;
 if(left>0) and (left<=str.count) then mleft:=left
 else if(left>0) then mleft:=str.count else mleft:=1;
 if(mleft+count-1>str.count) then mright:=str.count else mright:=mleft+count-1;
 res.count:=mright-mleft+1;
 SetLength(res.item,res.count);
 SetLength(res.status,res.count);
 i:=mleft;
 while(i<=mright)do
  begin
   res.item[i-mleft]:=str.item[i-1];
   res.status[i-mleft]:=str.status[i-1];
   inc(i);
  end;
 c_string_copy_item:=res;
end;
function c_string_copy_all(const str:c_string):c_string;
var i:SizeInt;
    res:c_string;
begin
 if(str.count<=0) then
  begin
   res.count:=0; SetLength(res.item,0); SetLength(res.status,0); exit(res);
  end;
 res.count:=str.count;
 SetLength(res.item,res.count);
 SetLength(res.status,res.count);
 for i:=1 to str.count do
  begin
   res.item[i-1]:=str.item[i-1];
   res.status[i-1]:=str.status[i-1];
  end;
 c_string_copy_all:=str;
end;
function c_string_is_hex(const ch:char):boolean;
const hex1:string='0123456789abcdef';
      hex2:string='0123456789ABCDEF';
var i:SizeInt;
begin
 for i:=1 to 16 do
  begin
   if(ch=hex1[i]) then exit(true);
   if(ch=hex2[i]) then exit(true);
  end;
 c_string_is_hex:=false;
end;
function c_string_is_operator(const sign:string;pas:boolean=false):byte;
const ope:array[1..43] of string=('<<=','>>=','...','++','--','::','->','==','!=','>=','<=',
'&&','||','<<','>>','+=','-=','*=','/=','%=','&=','^=','|=','##','+','-','*','/','%','<','>','!','&','|',
'^','~','=','?',',',':','#',';','.');
      opepas:array[1..20] of string=('<>',
'<=','>=',':=','..','+','-','*','/','^','@','.',',','#','$',':',';','=','>','<');
var i:SizeInt;
begin
 i:=1;
 if(pas=false) then
  begin
   while(i<=43)do
    begin
     if(sign=ope[i]) then break;
     inc(i);
    end;
   if(i>43) then c_string_is_operator:=0 else c_string_is_operator:=i;
  end
 else
  begin
   while(i<=20)do
    begin
     if(sign=opepas[i]) then break;
     inc(i);
    end;
   if(i>20) then c_string_is_operator:=0 else c_string_is_operator:=i;
  end;
end;
function c_string_is_bracket(const ch:char):boolean;
const brac:string='(){}[]';
var i:SizeInt;
begin
 i:=1;
 while(i<=6) do
  begin
   if(ch=brac[i]) then break;
   inc(i);
  end;
 if(i>6) then c_string_is_bracket:=false else c_string_is_bracket:=true;
end;
function c_string_is_vaild_char(const ch:char):boolean;
begin
 if((ch>='a') and (ch<='z')) or (ch='_') or ((ch>='A') and
 (ch<='Z')) or ((ch>='0') and (ch<='9')) then c_string_is_vaild_char:=true
 else c_string_is_vaild_char:=false;
end;
function c_string_is_bracket_string(const str:string):boolean;
const brac:string='(){}[]';
var i:SizeInt;
begin
 i:=1;
 while(i<=6)do
  begin
   if(str=Copy(brac,i,1)) then break;
   inc(i);
  end;
 if(i>6) then c_string_is_bracket_string:=false else c_string_is_bracket_string:=true;
end;
function c_string_is_vaild_string(const str:string):boolean;
var i:SizeInt;
begin
 i:=1;
 while(i<=length(str)) do
  begin
   if(c_string_is_vaild_char(str[i])=false) then exit(false);
   inc(i);
  end;
 c_string_is_vaild_string:=true;
end;
function c_string_is_vaild_value(const str:string):boolean;
var i,len:SizeInt;
    b1,b2,b3:boolean;
    ishex:boolean;
begin
 i:=1; ishex:=false; len:=length(str);
 if(tydq_get_character(str,i)='-') then inc(i,1);
 if(copy(str,i,2)='0x') or (copy(str,i,2)='0X') then
  begin
   inc(i,2); ishex:=true;
  end
 else if(copy(str,i,2)='0b') or (copy(str,i,2)='0B') then
  begin
   inc(i,2);
  end;
 while(i<=len)do
  begin
   if(ishex=false) then
    begin
     b1:=(tydq_get_character(str,i)>='0') and (tydq_get_character(str,i)<='9');
    end
   else
    begin
     b1:=((tydq_get_character(str,i)>='0') and (tydq_get_character(str,i)<='9')) or
     ((tydq_get_character(str,i)>='A') and (tydq_get_character(str,i)<='F'))
     or ((tydq_get_character(str,i)>='a') and (tydq_get_character(str,i)<='f'));
    end;
   b2:=tydq_get_character(str,i)='.';
   if(i<len) then
    begin
     b3:=((str[i]='E') or (str[i]='e')) and ((str[i+1]='-') or (str[i+1]='+'));
     if(b3=true) then
      begin
       inc(i,2); continue;
      end;
    end
   else b3:=false;
   if(b1=false) and (b2=false) then break;
   inc(i);
  end;
 if(i<=len) then c_string_is_vaild_value:=false else c_string_is_vaild_value:=true;
end;
function c_number_to_number(const num:string):byte;
const hex1:string='0123456789abcdef';
      hex2:string='0123456789ABCDEF';
var tempstr:string;
    i,j,tempnum:SizeInt;
begin
 tempstr:=num;
 if(copy(tempstr,1,2)='0x') or (copy(tempstr,1,2)='0X') then
  begin
   i:=3; tempnum:=0;
   while(i<=length(num))do
    begin
     j:=1;
     while(j<=16)do
      begin
       if(hex1[j]=tydq_get_character(tempstr,i)) then break;
       if(hex2[j]=tydq_get_character(tempstr,i)) then break;
       inc(j);
      end;
     if(j<=16) then tempnum:=tempnum*16+j;
     inc(i);
    end;
   c_number_to_number:=tempnum;
  end
 else
  begin
   c_number_to_number:=StrToInt(tempstr);
  end;
end;
function c_float_to_pas_float(const flo:string):string;
var i:SizeInt;
    res:string;
begin
 res:=flo;
 i:=Pos('+',res);
 if(i>0) then delete(res,i,1);
 c_float_to_pas_float:=res;
end;
function c_string_generate_from_string(const str:string;pas:boolean=false):c_string;
var i,j,k,m,len:SizeInt;
    res:c_string;
    bool:boolean;
    gtempstr1,gtempstr2,gtempstr3:string;
begin
 i:=1; len:=length(str); bool:=false;
 gtempstr1:=''; gtempstr2:=''; gtempstr3:='';
 res.count:=0; SetLength(res.item,0); SetLength(res.status,0);
 while(i<=len) do
  begin
   if(pas) then
    begin
     if(tydq_get_character(str,i)=#39) or (tydq_get_character(str,i)='#') then
      begin
       j:=i;
       while(j<=len)do
        begin
         if(copy(str,j,2)='#$') then
          begin
           k:=j+2;
           while(k<=len) and (c_string_is_hex(tydq_get_character(str,k))) and (k-j<=5) do inc(k);
           j:=k+1; continue;
          end
         else if(tydq_get_character(str,j)='#') then
          begin
           k:=j+1;
           while(k<=len) and (tydq_get_character(str,k)>='0') and (tydq_get_character(str,k)<='9') and (k-j<=5) do inc(k);
           j:=k+1; continue;
          end
         else if(tydq_get_character(str,j)=#39) then
          begin
           k:=j+1;
           while(k<=len) and (tydq_get_character(str,k)<>#39) do inc(k);
           j:=k+1; continue;
          end
         else break;
        end;
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=copy(str,i,j-i+1);
       i:=j+1; inc(j); m:=i;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>m) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       bool:=false;
       continue;
      end;
    end
   else
    begin
     if(tydq_get_character(str,i)=#39) or (tydq_get_character(str,i)='"')
     or((i<len) and (tydq_get_character(str,i)='L')
     and ((tydq_get_character(str,i+1)=#39) or (tydq_get_character(str,i+1)='"'))) then
      begin
       if((i<len) and (tydq_get_character(str,i)='L')
       and((tydq_get_character(str,i+1)=#39) or (tydq_get_character(str,i+1)='"'))) then
        begin
         inc(i);
        end;
       j:=i+1;
       while(j<=len) do
        begin
         if(j>i+3) and (tydq_get_character(str,j-3)<>'\') and (tydq_get_character(str,j-2)='\')
         and (tydq_get_character(str,j-1)='\')
         and (tydq_get_character(str,i)=tydq_get_character(str,j)) then break
         else if(j>i+2) and (tydq_get_character(str,j-2)='\') and (tydq_get_character(str,j-1)='\')
         and (tydq_get_character(str,i)=tydq_get_character(str,j)) then break
         else if(j>i+1) and (tydq_get_character(str,j-1)<>'\')
         and (tydq_get_character(str,i)=tydq_get_character(str,j)) then break
         else if(j=i+1) and (tydq_get_character(str,i)=tydq_get_character(str,j)) then break;
         inc(j);
        end;
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=copy(str,i,j-i+1);
       i:=j+1; inc(j); m:=i;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>m) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       bool:=false;
       continue;
      end;
    end;
   gtempstr1:=copy(str,i,3);
   gtempstr2:=copy(str,i,2);
   gtempstr3:=copy(str,i,1);
   if(i>len) then break;
   if(pas=false) then
    begin
     if(i<=len-2) and (c_string_is_operator(gtempstr1)>0) then
      begin
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr1;
       j:=i+3;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>i+3) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       inc(i,3); bool:=false; continue;
      end
     else if(i<=len-1) and (c_string_is_operator(gtempstr2)>0) then
      begin
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr2;
       j:=i+2;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>i+2) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       inc(i,2); bool:=false; continue;
      end
     else if(c_string_is_operator(gtempstr3)>0) or (c_string_is_bracket(tydq_get_character(str,i))) then
      begin
       if((res.count>0) and
       ((c_string_is_vaild_string(res.item[res.count-1])=false)
       or (c_string_is_bracket_string(res.item[res.count-1])))
       and (tydq_get_character(str,i)='-')) or ((tydq_get_character(str,i)='-') and (res.count=0)) then
        begin
         inc(res.count);
         SetLength(res.item,res.count);
         res.item[res.count-1]:=gtempstr3;
         inc(i);
         while(i<len) and ((str[i]=' ') or (str[i]=#10)) do inc(i);
         bool:=true; continue;
        end
       else if(res.count>0) and (c_string_is_vaild_value(res.item[res.count-1])=true)
       and (not (c_string_is_bracket_string(res.item[res.count-1])))
       and (tydq_get_character(str,i)='.') then
        begin
         res.item[res.count-1]:=res.item[res.count-1]+gtempstr3;
         inc(i); bool:=true; continue;
        end
       else if(res.count>0) and (c_string_is_vaild_value(res.item[res.count-1])=true)
       and (length(res.item[res.count-1])>0) and
       (not (c_string_is_bracket_string(res.item[res.count-1])))
       and (tydq_get_character(str,i)='+')
       and ((tydq_get_character(res.item[res.count-1],length(res.item[res.count-1]))='E')
       or (tydq_get_character(res.item[res.count-1],length(res.item[res.count-1]))='e')) then
        begin
         res.item[res.count-1]:=res.item[res.count-1]+gtempstr3;
         inc(i); bool:=true; continue;
        end;
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr3;
       j:=i+1;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>i+1) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       inc(i); bool:=false; continue;
      end;
    end
   else
    begin
     if(i<=len-2) and (c_string_is_operator(gtempstr1,true)>0) and (bool=false) then
      begin
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr1;
       j:=i+3;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>i+3) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       inc(i,3); bool:=false; continue;
      end
     else if(i<=len-1) and (c_string_is_operator(gtempstr2,true)>0) and (bool=false) then
      begin
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr2;
       j:=i+2;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>i+2) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       inc(i,2); bool:=false; continue;
      end
     else if(c_string_is_operator(gtempstr3,true)>0) or
     (c_string_is_bracket(tydq_get_character(str,i))) then
      begin
       if((res.count>0) and
       ((c_string_is_vaild_string(res.item[res.count-1])=false) or
       (c_string_is_bracket_string(res.item[res.count-1])))
       and (tydq_get_character(str,i)='-')) or ((tydq_get_character(str,i)='-') and (res.count=0)) then
        begin
         inc(res.count);
         SetLength(res.item,res.count);
         res.item[res.count-1]:=gtempstr3;
         inc(i);
         while(i<len) and ((str[i]=' ') or (str[i]=#10)) do inc(i);
         bool:=true; continue;
        end
       else if(res.count>0) and (c_string_is_vaild_value(res.item[res.count-1])=true)
       and (tydq_get_character(str,i)='.')
       and (not (c_string_is_bracket_string(res.item[res.count-1]))) then
        begin
         res.item[res.count-1]:=res.item[res.count-1]+gtempstr3;
         inc(i); bool:=true; continue;
        end;
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr3;
       j:=i+1;
       while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
       if(j<=len) and (tydq_get_character(str,j)=#10) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=2;
        end
       else if(j<=len) and (j>i+1) then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=1;
        end
       else if(j>len) or (tydq_get_character(str,j)>' ') then
        begin
         SetLength(res.status,res.count);
         res.status[res.count-1]:=0;
        end;
       inc(i); bool:=false; continue;
      end;
    end;
   if(i>len) then break;
   if(c_string_is_vaild_char(tydq_get_character(str,i))) then
    begin
     if(bool=false) then
      begin
       inc(res.count);
       SetLength(res.item,res.count);
       res.item[res.count-1]:=gtempstr3;
       bool:=true;
      end
     else
      begin
       res.item[res.count-1]:=res.item[res.count-1]+gtempstr3;
      end;
     if(i=len) then
      begin
       SetLength(res.status,res.count);
       res.status[res.count-1]:=0;
      end;
     inc(i); continue;
    end
   else if(c_string_is_vaild_char(tydq_get_character(str,i))=false) and (bool=true) then
    begin
     j:=i;
     while(j<=len) and (tydq_get_character(str,j)=' ') do inc(j);
     if(j<=len) and (tydq_get_character(str,j)=#10) then
      begin
       SetLength(res.status,res.count);
       res.status[res.count-1]:=2;
      end
     else if(j<=len) and (j>i) then
      begin
       SetLength(res.status,res.count);
       res.status[res.count-1]:=1;
      end
     else if(j>len) then
      begin
       SetLength(res.status,res.count);
       res.status[res.count-1]:=0;
      end;
     bool:=false; inc(i); continue;
    end;
   inc(i);
  end;
 c_string_generate_from_string:=res;
end;
function c_string_to_string(const cstr:c_string;pas:boolean=true):string;
var i:SizeInt;
    res:string;
begin
 i:=1; res:='';
 while(i<=cstr.count)do
  begin
   res:=res+cstr.item[i-1];
   if(i<cstr.count) and (c_string_is_operator(cstr.item[i-1],pas)=0)
   and (c_string_is_operator(cstr.item[i],pas)=0)
   and (c_string_is_bracket_string(cstr.item[i-1])=false)
   and (c_string_is_bracket_string(cstr.item[i])=false) then res:=res+' ';
   inc(i);
  end;
 c_string_to_string:=res;
end;
function c_string_delete_unnecessary_bracket(var code:c_string;pas:boolean=false):SizeInt;
var i,j:SizeInt;
    stack:cov_stack;
    res:SizeInt;
begin
 i:=1; stack.count:=0; res:=0;
 if(code.count=1) then
  begin
   exit(0);
  end;
 if(length(code.item)<=1) then
  begin
   code.count:=0; exit(0);
  end;
 while(i<=code.count) do
  begin
   if(code.item[i-1]='(') then
    begin
     inc(stack.count);
     SetLength(stack.left,stack.count);
     SetLength(stack.right,stack.count);
     stack.left[stack.count-1]:=i;
     stack.right[stack.count-1]:=0;
    end
   else if(code.item[i-1]=')') then
    begin
     j:=stack.count;
     while(j>0)do
      begin
       if(stack.right[j-1]=0) then break;
       dec(j);
      end;
     if(j>0) then stack.right[j-1]:=i else code.item[i-1]:='';
    end;
   inc(i);
  end;
 i:=1;
 while(i<=stack.count)do
  begin
   if(stack.left[i-1]>1) and (code.item[stack.left[i-1]-2]='__attribute__') and (pas=false) then
    begin
     inc(i); continue;
    end
   else if(stack.left[i-1]>2) and (code.item[stack.left[i-1]-3]='__attribute__') and (pas=false) then
    begin
     inc(i); continue;
    end
   else if(stack.left[i-1]>1) and (c_string_is_operator(code.item[stack.left[i-1]-2],pas)=0)
   and (c_string_is_bracket_string(code.item[stack.left[i-1]-2])=false) then
    begin
     inc(i); continue;
    end
   else if(stack.left[i-1]>1) and ((code.item[stack.left[i-1]-2]='!')
   or (code.item[stack.left[i-1]-2]='~') or (code.item[stack.left[i-1]-2]='>')
   or (code.item[stack.left[i-1]-2]=')') or (code.item[stack.left[i-1]-2]=']')) then
    begin
     inc(i); continue;
    end;
   if(i<stack.count) and (stack.left[i-1]+1=stack.left[i]) and (stack.right[i-1]-1=stack.right[i]) then
    begin
     code.item[stack.left[i-1]-1]:='';
     code.item[stack.right[i-1]-1]:='';
    end
   else if(stack.left[i-1]=1) and (stack.right[i-1]<code.count) and
   (code.item[stack.right[i-1]]<>'^') and (pas=true) then
    begin
     code.item[stack.left[i-1]-1]:='';
     code.item[stack.right[i-1]-1]:='';
    end
   else if(stack.left[i-1]>1) and (stack.right[i-1]=code.count) and
   (code.item[stack.left[i-1]-2]<>'*') and (pas=false) then
    begin
     code.item[stack.left[i-1]-1]:='';
     code.item[stack.right[i-1]-1]:='';
    end
   else if(stack.left[i-1]+1=stack.right[i-1]-1) and (stack.right[i-1]<code.count) and
   ((c_string_is_operator(code.item[stack.right[i-1]],pas)<>0)
   and (c_string_is_bracket_string(code.item[stack.right[i-1]])=false)) then
    begin
     code.item[stack.left[i-1]-1]:='';
     code.item[stack.right[i-1]-1]:='';
    end
   else if(stack.left[i-1]=1) and (stack.right[i-1]=code.count) then
    begin
     code.item[stack.left[i-1]-1]:='';
     code.item[stack.right[i-1]-1]:='';
    end
   else if(stack.left[i-1]=stack.right[i-1]-1) then
    begin
     code.item[stack.left[i-1]-1]:='';
     code.item[stack.right[i-1]-1]:='';
    end;
   inc(i);
  end;
 i:=1;
 SetLength(stack.left,0); SetLength(stack.right,0);
 while(i<=code.count)do
  begin
   if(code.item[i-1]='') then
    begin
     Delete(code.item,i-1,1); Delete(code.status,i-1,1); dec(code.count); inc(res); break;
    end;
   inc(i);
  end;
 stack.count:=0;
 c_string_delete_unnecessary_bracket:=res;
end;
function c_string_search_for_keyword(const code:c_string;keyword:string;offset:SizeInt=1):SizeInt;
var i:SizeInt;
begin
 i:=offset;
 while(i<=code.count) do
  begin
   if(code.item[i-1]=keyword) then break;
   inc(i);
  end;
 if(i>code.count) then c_string_search_for_keyword:=0 else c_string_search_for_keyword:=i;
end;
function c_string_search_for_keyword(code:c_string;keyword:c_string;offset:SizeInt=1):SizeInt;
var i,j:SizeInt;
begin
 i:=offset;
 if(keyword.count<=0) then exit(0);
 while(i<=code.count) do
  begin
   if(code.item[i-1]=keyword.item[0]) then
    begin
     j:=1;
     while(j<=keyword.Count) and (code.item[i+j-2]=keyword.item[j-1]) do inc(j);
     if(j>keyword.count) then break;
    end;
   inc(i);
  end;
 if(i>code.count) then c_string_search_for_keyword:=0 else c_string_search_for_keyword:=i;
end;
function c_string_detect_class(const code:c_string):boolean;
var i,layer:SizeInt;
begin
 i:=1; layer:=0;
 while(i<=code.count)do
  begin
   if(code.item[i-1]='<') then inc(layer);
   if(code.item[i-1]='>') then dec(layer);
   if(layer=0) and (code.item[i-1]='class') then exit(true);
   if(layer=0) and ((c_string_is_operator(code.item[i-1])>0) or
   (c_string_is_bracket_string(code.item[i-1])=true))
   and (code.item[i-1]<>':') then exit(false);
   inc(i);
  end;
 c_string_detect_class:=false;
end;
function c_string_detect_lambda(const code:c_string):boolean;
var i,layer,count:SizeInt;
    bool:boolean;
begin
 i:=1; count:=0; layer:=0; bool:=false;
 while(i<=code.count)do
  begin
   if(code.item[i-1]='[') or (code.item[i-1]='(')
   or (code.item[i-1]='<') then inc(layer);
   if(code.item[i-1]=']') or (code.item[i-1]=')')
   or (code.item[i-1]='>') then dec(layer);
   if(layer=0) and (code.item[i-1]='=') and (bool=false) then
    begin
     inc(i); bool:=true; continue;
    end
   else if(bool=true) and (count=0) then
    begin
     if(layer=0) and (code.item[i-1]<>'[') then break;
     if(layer>=2) and (code.item[i-1]='>>') then dec(layer,2);
     if(layer=0) and (code.item[i-1]=']') then inc(count);
    end
   else if(bool=true) and (count=1) then
    begin
     if(layer=0) and (code.item[i-1]='->') then break;
     if(layer=0) and (code.item[i-1]<>'(') then break;
     if(layer=0) and (code.item[i-1]='{') then break;
     if(layer>=2) and (code.item[i-1]='>>') then dec(layer,2);
     if(layer=0) and (code.item[i-1]=')') then inc(count);
    end;
   inc(i);
  end;
 if(count>=1) then exit(true)
 else if(i<=code.count) and (code.item[i-1]='->') then exit(true);
 c_string_detect_lambda:=false;
end;
function c_string_check_operator(code:c_string):boolean;
var i,j,layer,layer2:SizeInt;
begin
 i:=1; layer:=0; layer2:=0;
 while(i<=code.Count) do
  begin
   if(layer=0) and (code.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer2:=0;
     while(j<=code.count)do
      begin
       if(code.item[j-1]='(') then inc(layer2);
       if(code.item[j-1]=')') then dec(layer2);
       if(layer2=0) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(code.item[i-1]='(') then inc(layer);
   if(code.item[i-1]=')') then dec(layer);
   if(code.item[i-1]='<') then inc(layer2);
   if(code.item[i-1]='>') then dec(layer2);
   if(code.item[i-1]='>>') then dec(layer2,2);
   if(code.item[i-1]='{') then exit(false);
   if(layer=0) and (layer2=0) and (code.item[i-1]='operator') then break;
   inc(i);
  end;
 if(i>code.Count) then c_string_check_operator:=false else c_string_check_operator:=true;
end;
function c_string_check_const(code:c_string):boolean;
var i,j,layer,layer2:SizeInt;
begin
 i:=1; layer:=0;
 while(i<=code.count)do
  begin
   if(layer=0) and (code.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer2:=0;
     while(j<=code.count)do
      begin
       if(code.item[j-1]='(') then inc(layer2);
       if(code.item[j-1]=')') then dec(layer2);
       if(layer2=0) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(code.item[i-1]='(') then inc(layer);
   if(code.item[i-1]=')') then dec(layer);
   if(layer=0) and ((code.item[i-1]='const') or (code.item[i-1]='constexpr')) then break;
   inc(i);
  end;
 if(i<=code.count) then c_string_check_const:=true else c_string_check_const:=false;
end;
function c_string_check_param_statement(code:c_string):boolean;
var i,count,layer,layer2,layer3:SizeInt;
begin
 i:=1; count:=0; layer:=0; layer2:=0; layer3:=0;
 if(code.count>=1) and (code.item[0]='(') then exit(false);
 if(code.count>=1) and (code.item[0]='*') then exit(false);
 if(code.count>=1) and (code.item[0]='&') then exit(false);
 if(code.count=1) and (code.item[0]='...') then exit(true);
 while(i<=code.count)do
  begin
   if(code.item[i-1]='(') then inc(layer);
   if(code.item[i-1]=')') then dec(layer);
   if(code.item[i-1]='[') then inc(layer3);
   if(code.item[i-1]=']') then dec(layer3);
   if(code.item[i-1]='<') then inc(layer2);
   if(code.item[i-1]='>') then dec(layer2);
   if(code.item[i-1]='>>') then dec(layer2,2);
   if(layer=0) and (code.item[i-1]=')') then
    begin
     inc(count); inc(i); continue;
    end;
   if(layer=0) and (layer2=0) and (layer3=0) and (count>0) and (code.item[i-1]<>'(') then break;
   if(count<1) and (layer=0) and (layer2=0) and (layer3=0)
   and (code.item[i-1]='=') then exit(false);
   if(layer=0) and (layer2=0) and (layer3=0) and (code.item[i-1]='==') then exit(false);
   if(layer=0) and (layer2=0) and (layer3=0) and (code.item[i-1]='||') then exit(false);
   if(layer=0) and (layer2=0) and (layer3=0) and (code.item[i-1]='&&') then exit(false);
   if(layer=0) and (layer2=0) and (layer3=0) and (c_string_is_operator(code.item[i-1])>0)
   and (code.item[i-1]<>'*') and (code.item[i-1]<>'=') and (code.item[i-1]<>'...')
   and (code.item[i-1]<>'&') and (code.item[i-1]<>'<') and (code.item[i-1]<>'::')
   and (code.item[i-1]<>'>') and (code.item[i-1]<>'>>') then exit(false);
   if(layer3=0) and (c_string_is_vaild_value(code.item[i-1])=true) then exit(false);
   if(layer=0) and (code.item[i-1]=',') then exit(false);
   inc(i);
  end;
 if(layer2<>0) then c_string_check_param_statement:=false
 else if(count>=2) or (count<1) then c_string_check_param_statement:=true
 else c_string_check_param_statement:=false;
end;
function c_string_check_function(code:c_string):boolean;
var i,j,k,layer,layer2,layer3,count:SizeInt;
    tempcstr:c_string;
begin
 i:=1;
 layer:=0; layer3:=0; count:=0;
 if(code.count>=1) and (code.item[0]='(') then
  begin
   exit(false);
  end
 else if(code.count>=1) and (code.item[0]='{') then
  begin
   exit(false);
  end
 else if(code.count>=1) and (code.item[0]='*') then
  begin
   exit(false);
  end;
 while(i<=code.Count) do
  begin
   if(layer=0) and (code.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer2:=0;
     while(j<=code.count)do
      begin
       if(code.item[j-1]='(') then inc(layer2);
       if(code.item[j-1]=')') then dec(layer2);
       if(layer2=0) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(code.item[i-1]='(') then
    begin
     inc(layer);
     if(layer=1) then k:=i+1;
    end;
   if(code.item[i-1]=')') then dec(layer);
   if(code.item[i-1]=')') and (layer=0) then inc(count);
   if(code.item[i-1]='<') then inc(layer3);
   if(code.item[i-1]='>') then dec(layer3);
   if(Pos('=',code.item[i-1])>0) and (layer=0) and (count<1) then break;
   if(layer3=0) and ((layer=1) and (code.item[i-1]=',')) or ((layer=0) and (code.item[i-1]=')'))then
    begin
     tempcstr:=c_string_copy_item(code,k,i-k);
     if(c_string_check_param_statement(tempcstr)=false) then break;
     k:=i+1;
    end;
   if(layer=0) and (code.item[i-1]=':') then break;
   if(layer=0) and (code.item[i-1]='constexpr') then break;
   if(layer=0) and (code.item[i-1]='{') then
    begin
     exit(false);
    end;
   inc(i);
  end;
 if(i<=code.count) then c_string_check_function:=false
 else if(count>1) or (count=0) then c_string_check_function:=false
 else c_string_check_function:=true;
end;
function c_string_check_class_function(code:c_string):boolean;
var i,j,k,layer,layer2,layer3,count:SizeInt;
    bool:boolean;
    tempcstr:c_string;
begin
 i:=1; layer:=0; layer3:=0; count:=0; bool:=false;
 if(code.count>=1) and (code.item[0]='(') then
  begin
   exit(false);
  end
 else if(code.count>=1) and (code.item[0]='{') then
  begin
   exit(false);
  end
 else if(code.count>=1) and (code.item[0]='::') then
  begin
   exit(false);
  end;
 while(i<=code.Count) do
  begin
   if(layer=0) and (code.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer2:=0;
     while(j<=code.count)do
      begin
       if(code.item[j-1]='(') then inc(layer2);
       if(code.item[j-1]=')') then dec(layer2);
       if(layer2=0) then break;
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(code.item[i-1]='(') then
    begin
     inc(layer);
     if(layer=1) then k:=i+1;
    end;
   if(code.item[i-1]=')') then dec(layer);
   if(code.item[i-1]=')') and (layer=0) then inc(count);
   if(code.item[i-1]='<') then inc(layer3);
   if(code.item[i-1]='>') then dec(layer3);
   if(layer=0) and (Pos('=',code.item[i-1])>0) and (count<1) then exit(false);
   if(layer=0) and (count=1) and (code.item[i-1]='=') then
    begin
     exit(true);
    end;
   if(layer3=0) and ((layer=1) and (code.item[i-1]=',')) or ((layer=0) and (code.item[i-1]=')')) then
    begin
     tempcstr:=c_string_copy_item(code,k,i-k);
     if(c_string_check_param_statement(tempcstr)=false) then break;
     k:=i+1;
    end;
   if(layer=0) and (layer3=0) and (code.item[i-1]='::') then
    begin
     bool:=true;
    end
   else if(layer=0) and (layer3=0) and (code.item[i-1]=':') then
    begin
     exit(true);
    end;
   if(layer=0) and (code.item[i-1]='constexpr') then
    begin
     exit(false);
    end
   else if(layer=0) and (code.item[i-1]='{') then
    begin
     exit(false);
    end;
   inc(i);
  end;
 if(i>code.Count) and (count=1) and (bool=true) then c_string_check_class_function:=true
 else c_string_check_class_function:=false;
end;
function c_string_check_constexpr_function(code:c_string):boolean;
var i,layer:SizeInt;
    res:boolean;
begin
 i:=1; layer:=0;
 while(i<=code.count)do
  begin
   if(code.item[i-1]='(') and (i=1) then exit(false);
   if(code.item[i-1]='(') then inc(layer);
   if(code.item[i-1]=')') then dec(layer);
   if(layer=0) and (code.item[i-1]='constexpr') then break;
   inc(i);
  end;
 if(i>code.count) then c_string_check_constexpr_function:=false
 else c_string_check_constexpr_function:=true;
end;
function c_string_check_statement(state:c_string):boolean;
var i,layer:SizeInt;
    res:boolean;
begin
 if(state.count>=2) then
  begin
   i:=1; layer:=0;
   while(i<=state.count)do
    begin
     if(state.item[i-1]='<') then inc(layer);
     if(state.item[i-1]='>') then dec(layer);
     if(layer>1) and (state.item[i-1]='>>') then dec(layer,2);
     if(layer=0) and (c_string_is_operator(state.item[i-1])>0) and (state.item[i-1]<>'::') then break
     else if(layer=0) and (c_string_is_bracket_string(state.item[i-1])) then break;
     inc(i);
    end;
   if(i<=state.count) and (state.item[i-1]<>'<') and (state.item[i-1]<>'>') and
   (c_string_is_operator(state.item[i-1])>0) and (state.item[i-1]<>'*')
   and (state.item[i-1]<>'::') then dec(i)
   else if(i<=state.count) and (c_string_is_bracket_string(state.item[i-1])) then dec(i);
   if(i>=2) then res:=true else res:=false;
  end
 else res:=false;
 c_string_check_statement:=res;
end;
function c_string_convert_integer(const str:string):SizeInt;
const hexc1:string='0123456789ABCDEF';
      hexc2:string='0123456789abcdef';
var i,j,res:SizeInt;
    ishex,isbin:boolean;
    isneg:boolean;
begin
 i:=1; isneg:=false; res:=0; ishex:=false; isbin:=false; isneg:=false;
 if(Copy(str,1,3)='-0x') or (Copy(str,1,3)='-0X') then
  begin
   ishex:=true; isneg:=true; i:=4;
  end
 else if(Copy(str,1,2)='0x') or (Copy(str,1,2)='0X') then
  begin
   ishex:=true; isneg:=false; i:=3;
  end
 else if(Copy(str,1,3)='-0b') or (Copy(str,1,3)='-0B') then
  begin
   isbin:=true; isneg:=true; i:=4;
  end
 else if(Copy(str,1,2)='0b') or (Copy(str,1,2)='0B') then
  begin
   isbin:=true; isneg:=false; i:=3;
  end
 else if(length(str)>=1) and (str[1]='-') then
  begin
   isbin:=false; ishex:=false; isneg:=true; i:=2;
  end
 else if(length(str)<=0) then
  begin
   exit(-1);
  end;
 while(i<=length(str)) do
  begin
   if(ishex=true) then
    begin
     j:=1;
     while(j<=16)do
      begin
       if(hexc1[j]=str[i]) then break;
       if(hexc2[j]=str[i]) then break;
       inc(j);
      end;
     if(j<=16) then res:=res*16+j-1 else exit(-1);
    end
   else if(isbin=true) then
    begin
     res:=res*2+Byte(str[i])-Byte('0');
    end
   else if(str[i]>='0') and (str[i]<='9') then
    begin
     res:=res*10+Byte(str[i])-Byte('0');
    end
   else exit(-1);
   inc(i);
  end;
 c_string_convert_integer:=res;
end;
function c_string_compare(const cstr1,cstr2:c_string;spec:byte=0):boolean;
var i,len:SizeInt;
    res:boolean;
begin
 i:=1; res:=true;
 if(spec=1) and (cstr1.count<>cstr2.count) then exit(false);
 if(cstr1.count=0) and (cstr2.count=0) then exit(true);
 len:=Min(cstr1.count,cstr2.count);
 while(i<=len) and (res=true) do
  begin
   if(cstr1.item[i-1]<>cstr2.item[i-1]) then break;
   inc(i);
  end;
 if(i<=len) then res:=false;
 c_string_compare:=res;
end;
function constant_is_type(const str:string):byte;
var i,len:SizeInt;
begin
 if(Copy(str,1,2)='0x') or (Copy(str,1,2)='0X') then
  begin
   exit(1);
  end
 else if(Copy(str,1,2)='-0x') or (Copy(str,1,2)='-0X') then
  begin
   exit(1);
  end
 else if(Copy(str,1,2)='0b') or (Copy(str,1,2)='0B') then
  begin
   exit(1);
  end
 else if(Copy(str,1,2)='-0b') or (Copy(str,1,2)='-0B') then
  begin
   exit(1);
  end
 else if(Copy(str,1,1)='L') and ((Copy(str,1,2)='L"') or (Copy(str,1,2)='L'#39)) then
  begin
   if(Copy(str,2,1)=#39) then
    begin
     exit(3);
    end
   else if(Copy(str,2,1)='"') then
    begin
     exit(4);
    end;
  end
 else if(Copy(str,1,1)=#39) then
  begin
   exit(3);
  end
 else if(Copy(str,1,1)='"') then
  begin
   exit(4);
  end
 else if(str='') then
  begin
   exit(5);
  end
 else if(c_string_is_bracket(str[1])) then
  begin
   exit(7);
  end
 else if(c_string_is_vaild_value(str)) then
  begin
   i:=1; len:=length(str);
   while(i<=len)do
    begin
     if(str[i]>'F') and (str[i]<='Z') then exit(7);
     if(str[i]>'f') and (str[i]<='z') then exit(7);
     if(str[i]='_') then exit(7);
     if(str[i]='E') or (str[i]='e') then exit(2);
     if(str[i]='.') then exit(2);
     inc(i);
    end;
   if(i>len) then exit(0) else exit(7);
  end
 else exit(7);
end;
function HexToInt(str:string):SizeInt;
const hex1:string='0123456789ABCDEF';
      hex2:string='0123456789abcdef';
var i,j,len:SizeInt;
    res:Sizeint;
    isbinary:boolean;
    bool:boolean;
begin
 isbinary:=false;
 if(Copy(str,1,3)='-0x') or (Copy(str,1,3)='-0X') then
  begin
   i:=4;
  end
 else if(Copy(str,1,2)='0x') or (Copy(str,1,2)='0X') then
  begin
   i:=3;
  end
 else if(Copy(str,1,3)='-0b') or (Copy(str,1,3)='-0B') then
  begin
   i:=4; isbinary:=true;
  end
 else if(Copy(str,1,2)='0b') or (Copy(str,1,2)='0B') then
  begin
   i:=3; isbinary:=true;
  end
 else if(Copy(str,1,1)='-') then i:=2 else i:=1;
 if(i mod 2=0) then bool:=true else bool:=false;
 len:=length(str); res:=0;
 while(i<=len)do
  begin
   j:=1;
   if(isbinary=false) then
    begin
     while(j<=16)do
      begin
       if(str[i]=hex1[j]) then break;
       if(str[i]=hex2[j]) then break;
       inc(j);
      end;
     if(j<=16) then res:=res*16+j-1;
    end
   else
    begin
     res:=res*2+Byte(str[i])-Byte('0');
    end;
   inc(i);
  end;
 if(bool=true) then HexToInt:=-res else HexToInt:=res;
end;
function StrToExtended(str:string):extended;
var i,len:SizeInt;
    tempnum1,res:extended;
    tempnum2:SizeInt;
begin
 i:=1; len:=length(str); res:=0;
 while(i<=len)do
  begin
   if((str[i]='E') or (str[i]='e')) and ((str[i]='+') or (str[i]='-')) then
    begin
     tempnum1:=StrToFloat(Copy(str,1,i-1));
     tempnum2:=StrToInt(Copy(str,i+2,len-i-1));
     res:=IntPower(tempnum1,tempnum2);
     break;
    end;
   if(i=1) and (str[i]='.') then
    begin
     tempnum1:=StrToFloat('0'+Copy(str,1,len));
     res:=tempnum1;
     break;
    end;
   inc(i);
  end;
 if(i>len) then res:=StrToFloat(Copy(str,1,len));
 StrToExtended:=res;
end;
function c_char_to_c_number(const str:string):Dword;
var tempstr:string;
    bool:boolean;
    res,i:dword;
begin
 tempstr:=str;
 if(tempstr[1]='L') then delete(tempstr,1,1);
 if(tempstr[1]='"') or (tempstr[1]=#39) then
 tempstr:=Copy(tempstr,2,length(tempstr)-2);
 if(tempstr='\0') then
  begin
   c_char_to_c_number:=0;
  end
 else if(tempstr='\a') then
  begin
   c_char_to_c_number:=7;
  end
 else if(tempstr='\b') then
  begin
   c_char_to_c_number:=8;
  end
 else if(tempstr='\f') then
  begin
   c_char_to_c_number:=12;
  end
 else if(tempstr='\n') then
  begin
   c_char_to_c_number:=10;
  end
 else if(tempstr='\r') then
  begin
   c_char_to_c_number:=13;
  end
 else if(tempstr='\t') then
  begin
   c_char_to_c_number:=9;
  end
 else if(tempstr='\\') then
  begin
   c_char_to_c_number:=Byte('\');
  end
 else if(tempstr='\'#39) then
  begin
   c_char_to_c_number:=39;
  end
 else if(tempstr='\"') then
  begin
   c_char_to_c_number:=Byte('"');
  end
 else if(tempstr='\?') then
  begin
   c_char_to_c_number:=Byte('?');
  end
 else if(tempstr='\0') then
  begin
   c_char_to_c_number:=0;
  end
 else if(Copy(tempstr,1,1)='\') then
  begin
   i:=2; res:=0;
   while(i<=length(tempstr)) do
    begin
     res:=res*8+Byte(tempstr[i])-Byte('0');
     inc(i);
    end;
   c_char_to_c_number:=res;
  end
 else if(Copy(tempstr,1,2)='\x') or (Copy(tempstr,1,2)='\X') then
  begin
   i:=3; tempstr:=Copy(str,3,length(tempstr)-2);
   res:=HexToInt(tempstr);
   c_char_to_c_number:=res;
  end
 else
  begin
   c_char_to_c_number:=Byte(tempstr[1]);
  end;
end;
function c_number_to_c_char(num:word):string;
var ii:Byte;
begin
 if(num>255) then
  begin
   c_number_to_c_char:=WideChar(num);
  end
 else
  begin
   ii:=num;
   if(ii<=32) or (ii=127) then
   c_number_to_c_char:='\x'+IntToHex(ii,2)
   else
   c_number_to_c_char:=Char(ii);
  end;
end;
function constant_string_compare(const str1,str2:string;specindex:byte=0):boolean;
var i,j,ii:SizeInt;
    tempstr1,tempstr2,tempstr3,tempstr4:string;
    islstr1,islstr2:boolean;
begin
 i:=1; j:=1; islstr1:=false; islstr2:=false; tempstr1:=str1; tempstr2:=str2;
 if(length(tempstr1)>2) and (tempstr1[1]='L') and ((tempstr1[2]='"') or (tempstr1[2]=#39)) then
  begin
   Delete(tempstr1,1,1); islstr1:=true;
  end;
 if(length(tempstr1)>2) and (tempstr2[1]='L') and ((tempstr1[2]='"') or (tempstr1[2]=#39)) then
  begin
   Delete(tempstr2,1,1); islstr2:=true;
  end;
 if(length(tempstr1)>=2) and ((tempstr1[1]='"') or (tempstr1[1]=#39)) then
 tempstr1:=Copy(tempstr1,2,length(tempstr1)-2);
 tempstr3:='';
 if(length(tempstr1)>=2) and ((tempstr2[1]='"') or (tempstr2[1]=#39)) then
 tempstr2:=Copy(tempstr2,2,length(tempstr2)-2);
 tempstr4:='';
 i:=1;
 while(i<=length(tempstr1))do
  begin
   if(tempstr1[i]='\') and (islstr1) then
    begin
     if(tempstr1[i+1]>='0') and (tempstr1[i+1]<='7')
     and (tempstr1[i+2]>='0') and (tempstr1[i+2]<='7') then
      begin
       ii:=2;
       while(i+ii<length(tempstr1)) and (tempstr1[i+ii]>='0')
       and (tempstr1[i+ii]<='7') and (ii<5) do inc(ii);
       tempstr3:=tempstr3+WideChar(c_char_to_c_number(Copy(tempstr1,i,ii+2))); inc(i,ii+1); continue;
      end
     else if(tempstr1[i+1]='x') or (tempstr1[i+1]='X') then
      begin
       ii:=1;
       while(i+ii+1<length(tempstr1)) and (c_string_is_hex(tempstr1[i+ii+1]))
       and (ii<4) do inc(ii);
       if(c_string_is_hex(tempstr1[i+2])=false) then dec(ii);
       tempstr3:=tempstr3+WideChar(HexToInt(Copy(tempstr1,i+2,ii))); inc(i,ii+2); continue;
      end
     else
      begin
       tempstr3:=tempstr3+WideChar(c_char_to_c_number(Copy(tempstr1,i,2))); inc(i,2); continue;
      end;
    end
   else if(str1[i]='\') and (islstr1=false) then
    begin
     if(tempstr1[i+1]>='0') and (tempstr1[i+1]<='7')
     and (tempstr1[i+2]>='0') and (tempstr1[i+2]<='7') then
      begin
       ii:=2;
       while(i+ii<length(tempstr1)) and (tempstr1[i+ii]>='0')
       and (tempstr1[i+ii]<='7') and (ii<3) do inc(ii);
       tempstr3:=tempstr3+Char(c_char_to_c_number(Copy(tempstr1,i,ii+2))); inc(i,ii+1); continue;
      end
     else if(tempstr1[i+1]='x') or (tempstr1[i+1]='X') then
      begin
       ii:=1;
       while(i+ii+1<length(tempstr1)) and (c_string_is_hex(tempstr1[i+ii+1]))
       and (ii<2) do inc(ii);
       if(c_string_is_hex(tempstr1[i+2])=false) then dec(ii);
       tempstr3:=tempstr3+Char(HexToInt(Copy(tempstr1,i+2,ii))); inc(i,ii+2); continue;
      end
     else
      begin
       tempstr3:=tempstr3+Char(c_char_to_c_number(Copy(tempstr1,i,2))); inc(i,2); continue;
      end;
    end
   else
    begin
     tempstr3:=tempstr3+tempstr1[i];
    end;
   inc(i);
  end;
 i:=1;
 while(i<=length(tempstr2))do
  begin
   if(tempstr2[i]='\') and (islstr2) then
    begin
     if(tempstr2[i+1]>='0') and (tempstr2[i+1]<='7')
     and (tempstr2[i+2]>='0') and (tempstr2[i+2]<='7') then
      begin
       ii:=2;
       while(i+ii<length(tempstr2)) and (tempstr2[i+ii]>='0')
       and (tempstr2[i+ii]<='7') and (ii<5) do inc(ii);
       tempstr4:=tempstr4+WideChar(c_char_to_c_number(Copy(tempstr2,i,ii+2))); inc(i,ii+1); continue;
      end
     else if(tempstr2[i+1]='x') or (tempstr2[i+1]='X') then
      begin
       ii:=1;
       while(i+ii+1<length(tempstr2)) and (c_string_is_hex(tempstr2[i+ii+1]))
       and (ii<4) do inc(ii);
       if(c_string_is_hex(tempstr2[i+2])=false) then dec(ii);
       tempstr4:=tempstr4+WideChar(HexToInt(Copy(tempstr2,i+2,ii))); inc(i,ii+2); continue;
      end
     else
      begin
       tempstr4:=tempstr4+WideChar(c_char_to_c_number(Copy(tempstr2,i,2))); inc(i,2); continue;
      end;
    end
   else if(tempstr2[i]='\') and (islstr2=false) then
    begin
     if(tempstr2[i+1]>='0') and (tempstr2[i+1]<='7')
     and (tempstr2[i+2]>='0') and (tempstr2[i+2]<='7') then
      begin
       ii:=2;
       while(i+ii<length(tempstr2)) and (tempstr2[i+ii]>='0')
       and (tempstr2[i+ii]<='7') and (ii<3) do inc(ii);
       tempstr4:=tempstr4+Char(c_char_to_c_number(Copy(tempstr2,i,ii+2))); inc(i,ii+1); continue;
      end
     else if(tempstr2[i+1]='x') or (tempstr2[i+1]='X') then
      begin
       ii:=1;
       while(i+ii+1<length(tempstr2)) and (c_string_is_hex(tempstr2[i+ii+1]))
       and (ii<2) do inc(ii);
       if(c_string_is_hex(tempstr2[i+2])=false) then dec(ii);
       tempstr4:=tempstr4+Char(HexToInt(Copy(tempstr2,i+2,ii))); inc(i,ii+2); continue;
      end
     else
      begin
       tempstr4:=tempstr4+Char(c_char_to_c_number(Copy(tempstr2,i,2))); inc(i,2); continue;
      end;
    end
   else
    begin
     tempstr4:=tempstr4+tempstr2[i];
    end;
   inc(i);
  end;
 if(specindex=0) then
  begin
   if(tempstr3<tempstr4) then exit(true) else exit(false);
  end
 else if(specindex=1) then
  begin
   if(tempstr3<=tempstr4) then exit(true) else exit(false);
  end
 else if(specindex=2) then
  begin
   if(tempstr3>tempstr4) then exit(true) else exit(false);
  end
 else if(specindex=3) then
  begin
   if(tempstr3>=tempstr4) then exit(true) else exit(false);
  end
 else if(specindex=4) then
  begin
   if(tempstr3=tempstr4) then exit(true) else exit(false);
  end
 else if(specindex=5) then
  begin
   if(tempstr3<>tempstr4) then exit(true) else exit(false);
  end
 else exit(false);
end;
function constant_operate(const str1,str2:string;spec:byte=0):string;
var t1,t2:byte;
    num1,num2:SizeInt;
    unum1,unum2:Sizeint;
    flo1,flo2:extended;
    tempstr1,tempstr2:string;
begin
 t1:=constant_is_type(str1); t2:=constant_is_type(str2);
 tempstr1:=str1; tempstr2:=str2;
 if(t1=3) and (t2=0) then
  begin
   num1:=c_char_to_c_number(str1); num2:=StrToInt(str2);
   if(spec=0) then constant_operate:=c_number_to_c_char(num1+num2)
   else if(spec=1) then constant_operate:=c_number_to_c_char(num1-num2)
   else if(spec=2) then constant_operate:=c_number_to_c_char(num1*num2)
   else if(spec=3) then constant_operate:=c_number_to_c_char(num1 div num2)
   else if(spec=4) then constant_operate:=c_number_to_c_char(num1 mod num2)
   else if(spec=5) then constant_operate:=c_number_to_c_char(num1 or num2)
   else if(spec=6) then constant_operate:=c_number_to_c_char(num1 and num2)
   else if(spec=7) then constant_operate:=c_number_to_c_char(num1 xor num2)
   else if(spec=10) then
    begin
     if(num1<num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(num1<=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(num1>num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(num1>=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(num1=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(num1<>num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=c_number_to_c_char(num1 shl num2)
   else if(spec=17) then constant_operate:=c_number_to_c_char(num1 shr num2)
   else if(spec=18) then
    begin
     if(num1<>0) or (num2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(num1<>0) and (num2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=3) and (t2=1) then
  begin
   num1:=c_char_to_c_number(str1); unum1:=HexToInt(str2);
   if(spec=0) then constant_operate:=c_number_to_c_char(num1+unum1)
   else if(spec=1) then constant_operate:=c_number_to_c_char(num1-unum1)
   else if(spec=2) then constant_operate:=c_number_to_c_char(num1*unum1)
   else if(spec=3) then constant_operate:=c_number_to_c_char(num1 div unum1)
   else if(spec=4) then constant_operate:=c_number_to_c_char(num1 mod unum1)
   else if(spec=5) then constant_operate:=c_number_to_c_char(num1 or unum1)
   else if(spec=6) then constant_operate:=c_number_to_c_char(num1 and unum1)
   else if(spec=7) then constant_operate:=c_number_to_c_char(num1 xor unum1)
   else if(spec=10) then
    begin
     if(num1<unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(num1<=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(num1>unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(num1>=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(num1=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(num1<>unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=c_number_to_c_char(num1 shl unum1)
   else if(spec=17) then constant_operate:=c_number_to_c_char(num1 shr unum1)
   else if(spec=18) then
    begin
     if(num1<>0) or (unum1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(num1<>0) and (unum1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=0) and (t2=3) then
  begin
   num1:=StrToInt(str1); num2:=c_char_to_c_number(str2);
   if(spec=0) then constant_operate:=c_number_to_c_char(num1+num2)
   else if(spec=1) then constant_operate:=c_number_to_c_char(num1-num2)
   else if(spec=2) then constant_operate:=c_number_to_c_char(num1*num2)
   else if(spec=3) then constant_operate:=c_number_to_c_char(num1 div num2)
   else if(spec=4) then constant_operate:=c_number_to_c_char(num1 mod num2)
   else if(spec=5) then constant_operate:=c_number_to_c_char(num1 or num2)
   else if(spec=6) then constant_operate:=c_number_to_c_char(num1 and num2)
   else if(spec=7) then constant_operate:=c_number_to_c_char(num1 xor num2)
   else if(spec=10) then
    begin
     if(num1<num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(num1<=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(num1>num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(num1>=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(num1=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(num1<>num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=c_number_to_c_char(num1 shl num2)
   else if(spec=17) then constant_operate:=c_number_to_c_char(num1 shr num2)
   else if(spec=18) then
    begin
     if(num1<>0) or (num2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(num1<>0) and (num2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=1) and (t2=3) then
  begin
   unum1:=HexToInt(str1); num1:=c_char_to_c_number(str2);
   if(spec=0) then constant_operate:=c_number_to_c_char(unum1+num1)
   else if(spec=1) then constant_operate:=c_number_to_c_char(unum1-num1)
   else if(spec=2) then constant_operate:=c_number_to_c_char(unum1*num1)
   else if(spec=3) then constant_operate:=c_number_to_c_char(unum1 div num1)
   else if(spec=4) then constant_operate:=c_number_to_c_char(unum1 mod num1)
   else if(spec=5) then constant_operate:=c_number_to_c_char(unum1 or num1)
   else if(spec=6) then constant_operate:=c_number_to_c_char(unum1 and num1)
   else if(spec=7) then constant_operate:=c_number_to_c_char(unum1 xor num1)
   else if(spec=10) then
    begin
     if(unum1<num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(unum1<=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(unum1>num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(unum1>=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(unum1=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(unum1<>num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=c_number_to_c_char(unum1 shl num1)
   else if(spec=17) then constant_operate:=c_number_to_c_char(unum1 shr num1)
   else if(spec=18) then
    begin
     if(unum1<>0) or (num1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(unum1<>0) and (num1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=0) and (t2=0) then
  begin
   num1:=StrToInt(str1); num2:=StrToInt(str2);
   if(spec=0) then constant_operate:=IntToStr(num1+num2)
   else if(spec=1) then constant_operate:=IntToStr(num1-num2)
   else if(spec=2) then constant_operate:=IntToStr(num1*num2)
   else if(spec=3) then constant_operate:=IntToStr(num1 div num2)
   else if(spec=4) then constant_operate:=IntToStr(num1 mod num2)
   else if(spec=5) then constant_operate:=IntToStr(num1 or num2)
   else if(spec=6) then constant_operate:=IntToStr(num1 and num2)
   else if(spec=7) then constant_operate:=IntToStr(num1 xor num2)
   else if(spec=10) then
    begin
     if(num1<num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(num1<=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(num1>num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(num1>=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(num1=num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(num1<>num2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=IntToStr(num1 shl num2)
   else if(spec=17) then constant_operate:=IntToStr(num1 shr num2)
   else if(spec=18) then
    begin
     if(num1<>0) or (num2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(num1<>0) and (num2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=1) and (t2=0) then
  begin
   unum1:=HexToInt(str1); num1:=StrToInt(str2);
   if(spec=0) then constant_operate:=IntToStr(unum1+num1)
   else if(spec=1) then constant_operate:=IntToStr(unum1-num1)
   else if(spec=2) then constant_operate:=IntToStr(unum1*num1)
   else if(spec=3) then constant_operate:=IntToStr(unum1 div num1)
   else if(spec=4) then constant_operate:=IntToStr(unum1 mod num1)
   else if(spec=5) then constant_operate:=IntToStr(unum1 or num1)
   else if(spec=6) then constant_operate:=IntToStr(unum1 and num1)
   else if(spec=7) then constant_operate:=IntToStr(unum1 xor num1)
   else if(spec=10) then
    begin
     if(unum1<num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(unum1<=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(unum1>num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(unum1>=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(unum1=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(unum1<>num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=IntToStr(unum1 shl num1)
   else if(spec=17) then constant_operate:=IntToStr(unum1 shr num1)
   else if(spec=18) then
    begin
     if(unum1<>0) or (num1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(unum1<>0) and (num1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=0) and (t2=1) then
  begin
   num1:=StrToInt(str1); unum1:=HexToInt(str2);
   if(spec=0) then constant_operate:=IntToStr(num1+unum1)
   else if(spec=1) then constant_operate:=IntToStr(num1-unum1)
   else if(spec=2) then constant_operate:=IntToStr(num1*unum1)
   else if(spec=3) then constant_operate:=IntToStr(num1 div unum1)
   else if(spec=4) then constant_operate:=IntToStr(num1 mod unum1)
   else if(spec=5) then constant_operate:=IntToStr(num1 or unum1)
   else if(spec=6) then constant_operate:=IntToStr(num1 and unum1)
   else if(spec=7) then constant_operate:=IntToStr(num1 xor unum1)
   else if(spec=10) then
    begin
     if(num1<unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(num1<=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(num1>unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(num1>=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(num1=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(num1<>unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=IntToStr(num1 shl unum1)
   else if(spec=17) then constant_operate:=IntToStr(num1 shr unum1)
   else if(spec=18) then
    begin
     if(num1<>0) or (unum1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(num1<>0) and (unum1<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=1) and (t2=1) then
  begin
   unum1:=HexToInt(str1); unum2:=HexToInt(str2);
   if(spec=0) then constant_operate:=IntToStr(unum1+unum2)
   else if(spec=1) then constant_operate:=IntToStr(unum1-unum2)
   else if(spec=2) then constant_operate:=IntToStr(unum1*unum2)
   else if(spec=3) then constant_operate:=IntToStr(unum1 div unum2)
   else if(spec=4) then constant_operate:=IntToStr(unum1 mod unum2)
   else if(spec=5) then constant_operate:=IntToStr(unum1 or unum2)
   else if(spec=6) then constant_operate:=IntToStr(unum1 and unum2)
   else if(spec=7) then constant_operate:=IntToStr(unum1 xor unum2)
   else if(spec=10) then
    begin
     if(unum1<unum2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(unum1<=unum2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(unum1>unum2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(unum1>=unum2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(unum1=unum2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(unum1<>unum2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=16) then constant_operate:=IntToStr(unum1 shl unum2)
   else if(spec=17) then constant_operate:=IntToStr(unum1 shr unum2)
   else if(spec=18) then
    begin
     if(unum1<>0) or (unum2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=19) then
    begin
     if(unum1<>0) and (unum2<>0) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=0) and (t2=2) then
  begin
   num1:=StrToInt(str1); flo1:=StrToExtended(str2);
   if(spec=0) then constant_operate:=FloatToStr(num1+flo1)
   else if(spec=1) then constant_operate:=FloatToStr(num1-flo1)
   else if(spec=2) then constant_operate:=FloatToStr(num1*flo1)
   else if(spec=3) then constant_operate:=FloatToStr(num1/flo1)
   else if(spec=10) then
    begin
     if(num1<flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(num1<=flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(num1>flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(num1>=flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(num1=flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(num1<>flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=1) and (t2=2) then
  begin
   unum1:=HexToInt(str1); flo1:=StrToExtended(str2);
   if(spec=0) then constant_operate:=FloatToStr(unum1+flo1)
   else if(spec=1) then constant_operate:=FloatToStr(unum1-flo1)
   else if(spec=2) then constant_operate:=FloatToStr(unum1*flo1)
   else if(spec=3) then constant_operate:=FloatToStr(unum1/flo1)
   else if(spec=10) then
    begin
     if(unum1<flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(unum1<=flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(unum1>flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(unum1>=flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(unum1=flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(unum1<>flo1) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=2) and (t2=0) then
  begin
   flo1:=StrToExtended(str1); num1:=StrToInt(str2);
   if(spec=0) then constant_operate:=FloatToStr(flo1+num1)
   else if(spec=1) then constant_operate:=FloatToStr(flo1-num1)
   else if(spec=2) then constant_operate:=FloatToStr(flo1*num1)
   else if(spec=3) then constant_operate:=FloatToStr(flo1/num1)
   else if(spec=10) then
    begin
     if(flo1<num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(flo1<=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(flo1>num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(flo1>=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(flo1=num1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(flo1<>num1) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=2) and (t2=1) then
  begin
   flo1:=StrToExtended(str1); unum1:=HexToInt(str2);
   if(spec=0) then constant_operate:=FloatToStr(flo1+unum1)
   else if(spec=1) then constant_operate:=FloatToStr(flo1-unum1)
   else if(spec=2) then constant_operate:=FloatToStr(flo1*unum1)
   else if(spec=3) then constant_operate:=FloatToStr(flo1/unum1)
   else if(spec=10) then
    begin
     if(flo1<unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(flo1<=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(flo1>unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(flo1>=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(flo1=unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(flo1<>unum1) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=2) and (t2=2) then
  begin
   flo1:=StrToExtended(str1); flo2:=StrToExtended(str2);
   if(spec=0) then constant_operate:=FloatToStr(flo1+flo2)
   else if(spec=1) then constant_operate:=FloatToStr(flo1-flo2)
   else if(spec=2) then constant_operate:=FloatToStr(flo1*flo2)
   else if(spec=3) then constant_operate:=FloatToStr(flo1/flo2)
   else if(spec=10) then
    begin
     if(flo1<flo2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(flo1<=flo2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(flo1>flo2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(flo1>=flo2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(flo1=flo2) then constant_operate:='1' else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(flo1<>flo2) then constant_operate:='1' else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=3) and (t2=4) then
  begin
   tempstr1:=Copy(str1,2,length(tempstr1)-2);
   tempstr2:=Copy(str2,2,length(tempstr2)-2);
   if(spec=0) then constant_operate:='"'+tempstr1+tempstr2+'"'
   else if(spec=9) then constant_operate:='"'+tempstr1+tempstr2+'"'
   else if(spec=10) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,0)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,1)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,2)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,3)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,4)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,5)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=4) and (t2=3) then
  begin
   tempstr1:=Copy(str1,2,length(tempstr1)-2);
   tempstr2:=Copy(str2,2,length(tempstr2)-2);
   if(spec=0) then constant_operate:='"'+tempstr1+tempstr2+'"'
   else if(spec=9) then constant_operate:='"'+tempstr1+tempstr2+'"'
   else if(spec=10) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,0)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,1)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,2)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,3)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,4)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,5)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=4) and (t2=4) then
  begin
   tempstr1:=Copy(str1,2,length(tempstr1)-2);
   tempstr2:=Copy(str2,2,length(tempstr2)-2);
   if(spec=0) then constant_operate:='"'+tempstr1+tempstr2+'"'
   else if(spec=9) then constant_operate:='"'+tempstr1+tempstr2+'"'
   else if(spec=10) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,0)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=11) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,1)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=12) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,2)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=13) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,3)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=14) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,4)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else if(spec=15) then
    begin
     if(constant_string_compare(tempstr1,tempstr2,5)) then constant_operate:='1'
     else constant_operate:='0';
    end
   else constant_operate:='';
  end
 else if(t1=0) then
  begin
   num1:=StrToInt(str1);
   if(spec=8) then constant_operate:=IntToStr(not num1)
   else constant_operate:='';
  end
 else if(t1=1) then
  begin
   unum1:=StrToInt(str1);
   if(spec=8) then constant_operate:=IntToStr(not unum1)
   else constant_operate:='';
  end
 else
  begin
   constant_operate:='';
  end;
end;
function calculate_constant_expression(const exp:c_string):c_string;
var i,j,k,m,n,ii1,ii2,layer,layer2:SizeInt;
    tempstr:string;
    tempcstr,tempcstr1,tempcstr2,tempcstr3:c_string;
    tempexp:c_string;
begin
 i:=1; tempexp:=exp;
 while(i<=tempexp.count)do
  begin
   if(tempexp.item[i-1]='+') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],0);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='-') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],1);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='*') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],2);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='/') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],3);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='%') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],4);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='|') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],5);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='&') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],6);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='^') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],7);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='~') and (i>1) then
    begin
     tempstr:=constant_operate(tempexp.item[i],'',8);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i,2);
       c_string_insert_item(tempstr,tempexp,i);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='!') and (i>1) then
    begin
     tempstr:=constant_operate(tempexp.item[i],'',18);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i,2);
       c_string_insert_item(tempstr,tempexp,i);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='##') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],9);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='<') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],10);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='<=') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],11);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='>') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],12);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='>=') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],13);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='==') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],14);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='!=') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],15);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='<<') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],16);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='||') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],18);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='&&') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],19);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='>>') and (i>1) and (i<tempexp.count) then
    begin
     tempstr:=constant_operate(tempexp.item[i-2],tempexp.item[i],17);
     if(tempstr<>'') then
      begin
       c_string_delete_item(tempexp,i-1,3);
       c_string_insert_item(tempstr,tempexp,i-1);
       dec(i); continue;
      end
     else
      begin
       inc(i,2); continue;
      end;
    end
   else if(tempexp.item[i-1]='?') then
    begin
     j:=i+1; layer:=0; layer2:=0;
     while(j<=tempexp.count)do
      begin
       if(tempexp.item[j-1]='(') then inc(layer);
       if(tempexp.item[j-1]=')') then dec(layer);
       if(tempexp.item[j-1]='[') then inc(layer2);
       if(tempexp.item[j-1]=']') then dec(layer2);
       if(layer=0) and (layer2=0) and (tempexp.item[j-1]=':') then break;
       inc(j);
      end;
     k:=j+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[j-1]='[') then inc(layer2);
       if(tempexp.item[j-1]=']') then dec(layer2);
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]=')') then break;
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]=']') then break;
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]=';') then break;
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]=',') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     m:=i-1; layer:=0; layer2:=0;
     while(m>0)do
      begin
       if(tempexp.item[m-1]=')') then inc(layer);
       if(tempexp.item[m-1]='(') then dec(layer);
       if(tempexp.item[m-1]=']') then inc(layer2);
       if(tempexp.item[m-1]='[') then dec(layer2);
       if(layer=0) and (layer2=0) and (m>1) and (tempexp.item[m-2]='(') then break;
       if(layer=0) and (layer2=0) and (m>1) and (tempexp.item[m-2]='[') then break;
       if(layer=0) and (layer2=0) and (m>1) and (c_string_is_operator(tempexp.item[m-2])>0)
       and ((tempexp.item[m-2]=',') or (Pos('=',tempexp.item[m-2])>0))
       and (tempexp.item[m-2]<>'==') and (tempexp.item[m-2]<>'!=')
       then break;
       if(m=1) then break;
       dec(m);
      end;
     tempcstr:=c_string_copy_item(tempexp,m,k-m+1);
     c_string_delete_item(tempexp,m,k-m+1);
     ii1:=i-m+1; ii2:=j-m+1;
     tempcstr1:=c_string_copy_item(tempcstr,1,ii1-1);
     tempcstr2:=c_string_copy_item(tempcstr,ii1+1,ii2-ii1-1);
     tempcstr3:=c_string_copy_item(tempcstr,ii2+1,tempcstr.count-ii2);
     if(tempcstr1.count=1) and (tempcstr1.item[0]<>'0') then
      begin
       c_string_insert_string(tempcstr2,tempexp,m);
      end
     else
      begin
       c_string_insert_string(tempcstr3,tempexp,m);
      end;
     i:=m;
    end;
   i:=i-c_string_delete_unnecessary_bracket(tempexp)+1;
  end;
 calculate_constant_expression:=tempexp;
end;
function construct_c_expression(var exp:c_string;const codelist:c_define_list;testing:boolean=false):boolean;
var i,j,k,m,n,l,r,ii1,ii2,layer,layer2,start:SizeInt;
    bool,bool2,retbool,isfunc:boolean;
    tempcstr,tempcstr1,tempcstr2,tempcstr3,tempcstr4,tempcstr5,tempcstr6:c_string;
    deflist:c_define_list;
    param1,param2:array of c_string;
    paramcount1,paramcount2:SizeInt;
begin
 SetLength(param1,0); SetLength(param2,0);
 i:=1; deflist.count:=0; retbool:=false;
 while(i<=exp.count)do
  begin
   if(exp.item[i-1]='__extension__') then
    begin
     c_string_delete_item(exp,i,1); continue;
    end
   else if(exp.item[i-1]='#') then
    begin
     j:=i+2; bool:=false; bool2:=false;
     while(j<=exp.count) do
      begin
       if(exp.status[j-1]=2) then break;
       inc(j);
      end;
     tempcstr:=c_string_copy_item(exp,i+2,j-i-1);
     if(exp.item[i]='undef') then bool:=true;
     if(exp.item[i]<>'define') and (exp.item[i]<>'undef') then bool2:=true;
     if(bool2=false) then
      begin
       c_string_delete_item(exp,i,j-i+1); dec(i);
      end
     else
      begin
       i:=j+1; continue;
      end;
     if(bool) then continue;
     if(tempcstr.Count<=1) then continue;
     if(tempcstr.status[0]>0) then
      begin
       inc(deflist.count);
       SetLength(deflist.define,deflist.count);
       deflist.define[deflist.count-1].defname:=c_string_copy_item(tempcstr,1,1);
       deflist.define[deflist.count-1].defhavevalue:=true;
       deflist.define[deflist.count-1].defvalue:=c_string_copy_item(tempcstr,2,tempcstr.count-1);
      end
     else if(tempcstr.status[0]=0) then
      begin
       inc(deflist.count);
       SetLength(deflist.define,deflist.count);
       k:=2; layer:=0;
       while(k<=tempcstr.count)do
        begin
         if(tempcstr.item[k-1]='(') then inc(layer);
         if(tempcstr.item[k-1]=')') then dec(layer);
         if(layer=0) then break;
         inc(k);
        end;
       if(k>tempcstr.count) then continue;
       deflist.define[deflist.count-1].defname:=c_string_copy_item(tempcstr,1,k);
       deflist.define[deflist.count-1].defhavevalue:=true;
       deflist.define[deflist.count-1].defvalue:=c_string_copy_item(tempcstr,k+1,tempcstr.count-k);
      end;
    end;
   inc(i);
  end;
 if(deflist.count>0) then
  begin
   for i:=deflist.count downto 1 do
    begin
     start:=1;
     tempcstr1:=deflist.define[i-1].defname;
     repeat
      j:=c_string_search_for_keyword(exp,tempcstr1.item[0],start);
      if(j>0) and (codelist.define[i-1].defhavevalue=false) then
       begin
        c_string_delete_item(exp,j,1); continue;
       end
      else if(codelist.define[i-1].defhavevalue=false) then
       begin
        break;
       end;
      tempcstr2:=deflist.define[i-1].defvalue;
      if(j=0) then break;
      if(tempcstr1.Count=1) then
       begin
        c_string_delete_item(exp,j,1);
        c_string_insert_string(tempcstr2,exp,j);
        start:=1;
       end
      else
       begin
        paramcount1:=0; paramcount2:=0;
        m:=j+1; n:=j+2; layer:=0;
        if(j+1>exp.count) then
         begin
          start:=j+1; continue;
         end
        else if(exp.item[j]='[') then
         begin
          start:=j+1; continue;
         end;
        while(m<=exp.count)do
         begin
          if(exp.item[m-1]='(') then inc(layer);
          if(exp.item[m-1]=')') then dec(layer);
          if(layer=1) and (exp.item[m-1]=',') then
           begin
            inc(paramcount1);
            SetLength(param1,paramcount1);
            param1[paramcount1-1]:=c_string_copy_item(exp,n,m-n);
            n:=m+1;
           end
          else if(layer=0) and (exp.item[m-1]=')') then
           begin
            inc(paramcount1);
            SetLength(param1,paramcount1);
            param1[paramcount1-1]:=c_string_copy_item(exp,n,m-n);
            break;
           end;
          inc(m);
         end;
        l:=m;
        m:=2; n:=3; layer:=0;
        while(m<=tempcstr1.count)do
         begin
          if(tempcstr1.item[m-1]='(') then inc(layer);
          if(tempcstr1.item[m-1]=')') then dec(layer);
          if(layer=1) and (tempcstr1.item[m-1]=',')then
           begin
            inc(paramcount2);
            SetLength(param2,paramcount2);
            param2[paramcount2-1]:=c_string_copy_item(tempcstr1,n,m-n);
            n:=m+1;
           end
          else if(layer=0) and (tempcstr1.item[m-1]=')')then
           begin
            inc(paramcount2);
            SetLength(param2,paramcount2);
            param2[paramcount2-1]:=c_string_copy_item(tempcstr1,n,m-n);
            n:=m+1;
           end;
          inc(m);
         end;
        if(paramcount1<>paramcount2) then
         begin
          start:=l+1; continue;
         end
        else start:=1;
        for r:=1 to paramcount2 do
         begin
          repeat
           begin
            n:=c_string_search_for_keyword(tempcstr2,param2[r-1]);
            if(n=0) then break;
            c_string_delete_item(tempcstr2,n,param2[r-1].count);
            c_string_insert_string(param1[r-1],tempcstr2,n);
           end;
          until(n=0);
         end;
        c_string_delete_item(exp,j,l-j+1);
        tempcstr2:=calculate_constant_expression(tempcstr2);
        c_string_insert_string(tempcstr2,exp,j);
       end;
     until(j=0);
    end;
  end;
 if(codelist.count>0) then
  begin
   for i:=codelist.count downto 1 do
    begin
     start:=1;
     tempcstr1:=codelist.define[i-1].defname;
     repeat
      j:=c_string_search_for_keyword(exp,tempcstr1.item[0],start);
      if(j>0) and (codelist.define[i-1].defhavevalue=false) then
       begin
        c_string_delete_item(exp,j,1); continue;
       end
      else if(codelist.define[i-1].defhavevalue=false) then
       begin
        break;
       end;
      tempcstr2:=codelist.define[i-1].defvalue;
      if(j=0) then break;
      if(tempcstr1.Count=1) then
       begin
        c_string_delete_item(exp,j,1);
        c_string_insert_string(tempcstr2,exp,j);
        start:=1;
       end
      else
       begin
        paramcount1:=0; paramcount2:=0;
        if(j+1>exp.count) then
         begin
          start:=j+1; continue;
         end
        else if(exp.item[j]='[') then
         begin
          start:=j+1; continue;
         end;
        m:=j+1; n:=j+2; layer:=0;
        while(m<=exp.count)do
         begin
          if(exp.item[m-1]='(') then inc(layer);
          if(exp.item[m-1]=')') then dec(layer);
          if(layer=1) and (exp.item[m-1]=',') then
           begin
            inc(paramcount1);
            SetLength(param1,paramcount1);
            param1[paramcount1-1]:=c_string_copy_item(exp,n,m-n);
            n:=m+1;
           end
          else if(layer=0) and (exp.item[m-1]=')') then
           begin
            inc(paramcount1);
            SetLength(param1,paramcount1);
            param1[paramcount1-1]:=c_string_copy_item(exp,n,m-n);
            break;
           end;
          inc(m);
         end;
        l:=m;
        m:=2; n:=3; layer:=0;
        while(m<=tempcstr1.count)do
         begin
          if(tempcstr1.item[m-1]='(') then inc(layer);
          if(tempcstr1.item[m-1]=')') then dec(layer);
          if(layer=1) and (tempcstr1.item[m-1]=',')then
           begin
            inc(paramcount2);
            SetLength(param2,paramcount2);
            param2[paramcount2-1]:=c_string_copy_item(tempcstr1,n,m-n);
            n:=m+1;
           end
          else if(layer=0) and (tempcstr1.item[m-1]=')')then
           begin
            inc(paramcount2);
            SetLength(param2,paramcount2);
            param2[paramcount2-1]:=c_string_copy_item(tempcstr1,n,m-n);
            break;
           end;
          inc(m);
         end;
        if(paramcount1<>paramcount2) then
         begin
          start:=l+1; continue;
         end
        else start:=1;
        for r:=1 to paramcount2 do
         begin
          repeat
           begin
            n:=c_string_search_for_keyword(tempcstr2,param2[r-1]);
            if(n=0) then break;
            if(c_string_compare(param1[r-1],param2[r-1])=true) then break;
            c_string_delete_item(tempcstr2,n,param2[r-1].count);
            c_string_insert_string(param1[r-1],tempcstr2,n);
           end;
          until(n=0);
         end;
        c_string_delete_item(exp,j,l-j+1);
        tempcstr2:=calculate_constant_expression(tempcstr2);
        c_string_insert_string(tempcstr2,exp,j);
      end;
     until(j=0);
    end;
  end;
 {Handle the condition expression}
 if(testing=true) then exit;
 exp:=calculate_constant_expression(exp);
 i:=1; layer:=0; layer2:=0; retbool:=false;
 while(i<=exp.count)do
  begin
   if(exp.item[i-1]='?') then
    begin
     j:=i+1; layer2:=0;
     while(j<=exp.count)do
      begin
       if(exp.item[j-1]='(') then inc(layer2);
       if(exp.item[j-1]=')') then dec(layer2);
       if(layer2=0) and (exp.item[j-1]=':') then break;
       inc(j);
      end;
     k:=j+1; layer2:=0;
     while(k<=exp.count)do
      begin
       if(exp.item[k-1]='(') then inc(layer2);
       if(exp.item[k-1]=')') then dec(layer2);
       if(layer2=0) and (k<exp.count) and (exp.item[k]=')') then break;
       if(layer2=0) and (k<exp.count) and (exp.item[k]=';') then break;
       if(layer2=0) and (k<exp.count) and (exp.item[k]=',') then break;
       if(k=exp.count) then break;
       inc(k);
      end;
     m:=i-1; layer2:=0;
     while(m>0)do
      begin
       if(exp.item[m-1]=')') then inc(layer2);
       if(exp.item[m-1]='(') then dec(layer2);
       if(layer2=0) and (m>1) and (exp.item[m-2]='(') then break;
       if(layer2=0) and (m>1) and (c_string_is_operator(exp.item[m-2])>0)
       and ((exp.item[m-2]=',') or (Pos('=',exp.item[m-2])>0))
       and (exp.item[m-2]<>'==') and (exp.item[m-2]<>'!=')
       then break;
       if(m=1) then break;
       dec(m);
      end;
     tempcstr:=c_string_copy_item(exp,m,k-m+1);
     ii1:=i-m+1; ii2:=j-m+1;
     tempcstr1:=c_string_copy_item(tempcstr,1,ii1-1);
     tempcstr2:=c_string_copy_item(tempcstr,ii1+1,ii2-ii1-1);
     tempcstr3:=c_string_copy_item(tempcstr,ii2+1,tempcstr.count-ii2);
     tempcstr4:=c_string_copy_all(exp);
     c_string_delete_item(tempcstr4,m,k-m+1);
     c_string_insert_string(tempcstr2,tempcstr4,m);
     tempcstr5:=c_string_copy_all(exp);
     c_string_delete_item(tempcstr5,m,k-m+1);
     c_string_insert_string(tempcstr3,tempcstr5,m);
     tempcstr6:=c_string_generate_from_string('if(){}else{}',false);
     c_string_insert_string(tempcstr5,tempcstr6,8);
     c_string_insert_string(tempcstr4,tempcstr6,5);
     c_string_insert_string(tempcstr1,tempcstr6,3);
     exp:=tempcstr6; retbool:=true;
     break;
    end;
   inc(i);
  end;
 {Handle the comma expression}
 if(retbool=false) then
  begin
   i:=1; layer:=0; bool:=false; isfunc:=false;
   while(i<=exp.count) do
    begin
     if(exp.item[i-1]=',') and (bool=false) and (isfunc=false) then
      begin
       j:=i; layer:=0; layer2:=0;
       while(j>0)do
        begin
         if(exp.item[j-1]=')') then inc(layer);
         if(exp.item[j-1]='(') then dec(layer);
         if(exp.item[j-1]='}') then inc(layer2);
         if(exp.item[j-1]='{') then dec(layer2);
         if(layer=0) and (layer2=0) and (j>1) and (exp.item[j-2]='(') then break;
         if(layer=0) and (layer2=0) and (j>1) and (exp.item[j-2]='{') then break;
         if(j=1) then break;
         dec(j);
        end;
       if(j>1) and (exp.item[j-2]='(') then
        begin
         if(j>2) and ((c_string_is_operator(exp.item[j-3])=0) or (exp.item[j-3]='*')
         or (exp.item[j-3]='>') or (exp.item[j-3]='(')) then
          begin
           inc(i); continue;
          end
         else
          begin
           tempcstr:=c_string_copy_item(exp,j,i-j);
           c_string_delete_item(exp,j,i-j+1);
           c_string_insert_item(';',tempcstr,tempcstr.count+1);
           c_string_insert_string(tempcstr,exp,1);
           inc(i); retbool:=true; continue;
          end;
        end
       else if(j=1) then
        begin
         tempcstr:=c_string_copy_item(exp,j,i-j);
         c_string_delete_item(exp,j,i-j+1);
         c_string_insert_item(';',tempcstr,tempcstr.count+1);
         c_string_insert_string(tempcstr,exp,1);
         inc(i); retbool:=true; continue;
        end;
      end;
     inc(i);
    end;
  end;
 {Finalize the handle}
 c_string_delete_unnecessary_bracket(exp);
 construct_c_expression:=retbool;
end;
function construct_c_item(incode,inextcode:c_string;codelist:c_define_list;
specindex:byte=0;specindex2:byte=0;pack:byte=0):cov_item;
var i,j,k,m,n,l,r,layer,layer2,layer3,count,len:SizeInt;
    code,extcode,tempcstr,tempcstr2,tempcstr3,tempcstr4,tempcstr5,tempcstr6:c_string;
    bool,bool2,retbool:boolean;
    tempstr1,tempstr2,tempstr3:string;
    ifstate:Pc_if_statement;
    switchstate:Pc_switch;
    casestate:Pc_switch_case;
    loopstate:Pc_loop_statement;
    codestate:Pc_code_seg;
    defstate:Pc_define;
    ifdefstate:Pc_ifdef;
    pragmastate:Pc_pragma;
    res:cov_item;
    classstate:Pc_class;
    gotostate:Pc_goto_or_label;
    structstate:Pc_struct;
    enumstate:Pc_enum;
    tdefstate:Pc_typedef;
    classfuncstate:Pc_class_function;
    classmemstate:Pc_class_member;
    classtagstate:Pc_class_tag;
    namespacestate:Pc_namespace;
    extstate:Pc_extern;
    extcstate:Pc_extern_c;
    funcstate:Pc_function;
    memstate:Pc_member;
    state:Pc_statement;
    expstate:Pc_expression;
    asmstate:Pc_asm;
    asmcodestate:Pc_asm_code;
    conststate:Pc_const;
    includestate:Pc_include;
    returnstate:Pc_return;
    opestate:Pc_operator;
    unsstate:Pc_using_namespace;
    unstrstate:Pc_unhandled;
    cexprstate:Pc_constexpr_function;
    lambdastate:Pc_lambda_expression;
begin
 {Handle the paramaters}
 retbool:=false; bool:=false; bool2:=false;
 if(incode.Count>0) then
  begin
   code:=incode;
   if(code.item[0]<>'#') then
    begin
     retbool:=construct_c_expression(code,codelist);
    end;
   if(code.count>0) and (code.item[code.count-1]=';') and (retbool=false) then
    begin
     code:=c_string_copy_item(code,1,code.count-1); bool:=true;
    end;
  end
 else code.Count:=0;
 if(inextcode.count>0) then
  begin
   extcode:=inextcode;
   if(extcode.item[0]<>'#') then
    begin
     construct_c_expression(extcode,codelist);
    end;
   if(extcode.count>0) and (extcode.item[extcode.count-1]=';') then
    begin
     extcode:=c_string_copy_item(extcode,1,extcode.count-1); bool2:=true;
    end;
  end
 else extcode.Count:=0;
 {Convert the parameters to C code item}
 if(Code.Count<=0) then
  begin
   res.covtype:=c_node_none;
   res.covcontent:=nil;
   construct_c_item:=res;
  end
 else if(retbool) then
  begin
   New(unstrstate);
   unstrstate^.content:=code;
   res.covtype:=c_node_unhandled;
   res.covcontent:=unstrstate;
   construct_c_item:=res;
  end
 else if(specindex=2) then
  begin
   New(asmcodestate);
   asmcodestate^.asmcode:=c_string_copy_all(code);
   res.covtype:=c_node_asm_code;
   res.covcontent:=asmcodestate;
   construct_c_item:=res;
  end
 else if(code.item[0]='namespace') then
  begin
   New(namespacestate);
   if(code.count>=2) then
   namespacestate^.spacename:=code.item[1]
   else
   namespacestate^.spacename:='';
   res.covtype:=c_node_namespace;
   res.covcontent:=namespacestate;
   construct_c_item:=res;
  end
 else if(code.item[0]='using') and (code.item[1]='namespace') then
  begin
   New(unsstate);
   unsstate^.namespace:=code.item[2];
   res.covtype:=c_node_using_namespace;
   res.covcontent:=unsstate;
   construct_c_item:=res;
  end
 else if(c_string_search_for_keyword(code,'using')>0) then
  begin
   i:=2;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='const') or (code.item[i-1]='CONST') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='template') then
      begin
       j:=i+1; layer:=0;
       while(j<code.count)do
        begin
         if(code.item[i-1]='<') then inc(layer);
         if(code.item[i-1]='>') then dec(layer);
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else if(code.item[i-1]='<') then
      begin
       j:=i; layer:=0;
       while(j<code.count)do
        begin
         if(code.item[i-1]='<') then inc(layer);
         if(code.item[i-1]='>') then dec(layer);
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else if(code.item[i-1]='static') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__extension__') then
      begin
       c_string_delete_item(code,i,1); continue;
      end;
     if(code.item[i-1]='=') then break;
     inc(i);
    end;
   tempcstr:=c_string_copy_item(code,2,i-1);
   tempcstr2:=c_string_copy_item(code,i+1,code.count-i);
   i:=1;
   while(i<=tempcstr2.count)do
    begin
     if(i<tempcstr2.count) and (tempcstr2.item[i-1]='*') and (tempcstr2.item[i]=')') then
      begin
       c_string_insert_string(tempcstr,tempcstr2,i+1); break;
      end;
     inc(i);
    end;
   i:=1;
   while(i<=tempcstr2.count)do
    begin
     if(i<tempcstr2.count) and (tempcstr2.item[i]='(') then break;
     inc(i);
    end;
   New(tdefstate);
   tdefstate^.oldvalue:=c_string_copy_item(tempcstr2,1,i);
   tdefstate^.newvalue:=c_string_copy_item(tempcstr2,i+1,tempcstr2.count-i);
   tdefstate^.align:=0;
   res.covtype:=c_node_typedef;
   res.covcontent:=tdefstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='if') then
  begin
   i:=2; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='constexpr') then
      begin
       c_string_delete_item(code,i,1); continue;
      end;
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=0) then break;
     inc(i);
    end;
   if(i<code.count) then
    begin
     New(unstrstate);
     c_string_insert_item(';',code,code.count+1);
     unstrstate^.content:=code;
     res.covtype:=c_node_unhandled;
     res.covcontent:=unstrstate;
     exit(res);
    end;
   New(ifstate);
   if(code.item[code.count-1]=')') then
   ifstate^.condition:=c_string_copy_item(code,3,code.count-3)
   else
   ifstate^.condition:=c_string_copy_item(code,2,code.count-1);
   ifstate^.iftype:=c_node_if_if;
   ifstate^.haveprev:=false;
   res.covtype:=c_node_if_statement;
   res.covcontent:=ifstate;
   construct_c_item:=res;
  end
 else if(code.count>1) and (code.item[0]='else') and (code.item[1]='if') then
  begin
   i:=3; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='constexpr') then
      begin
       c_string_delete_item(code,i,1); continue;
      end;
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=0) then break;
     inc(i);
    end;
   if(i<code.count) then
    begin
     New(unstrstate);
     c_string_insert_item(';',code,code.count+1);
     unstrstate^.content:=code;
     res.covtype:=c_node_unhandled;
     res.covcontent:=unstrstate;
     exit(res);
    end;
   New(ifstate);
   if(code.item[code.count-1]=')') then
   ifstate^.condition:=c_string_copy_item(code,4,code.count-4)
   else
   ifstate^.condition:=c_string_copy_item(code,3,code.count-2);
   ifstate^.iftype:=c_node_if_elseif;
   ifstate^.haveprev:=true;
   res.covtype:=c_node_if_statement;
   res.covcontent:=ifstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='else') then
  begin
   New(ifstate);
   ifstate^.condition.count:=0;
   ifstate^.iftype:=c_node_if_else;
   ifstate^.haveprev:=true;
   res.covtype:=c_node_if_statement;
   res.covcontent:=ifstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='switch') then
  begin
   New(switchstate);
   switchstate^.exp:=c_string_copy_item(code,2,code.count-1);
   res.covtype:=c_node_switch;
   res.covcontent:=switchstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='case') or (code.item[0]='default') then
  begin
   New(casestate);
   if(code.item[0]='case') then
    begin
     casestate^.constexp:=c_string_copy_item(code,2,code.count-2);
    end
   else
   casestate^.constexp.count:=0;
   res.covtype:=c_node_switch_case;
   res.covcontent:=casestate;
   construct_c_item:=res;
  end
 else if(code.item[0]='for') then
  begin
   i:=2; layer:=0; count:=0; bool:=true;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=1) and (code.item[i-1]=';') then inc(count);
     if(layer=0) then break;
     inc(i);
    end;
   if(i<code.count) or (bool=false) then
    begin
     New(unstrstate);
     unstrstate^.content:=code;
     res.covtype:=c_node_unhandled;
     res.covcontent:=unstrstate;
     exit(res);
    end;
   if(count=2) then
    begin
     New(loopstate);
     loopstate^.looptype:=c_node_loop_for;
     tempcstr:=c_string_copy_item(code,3,code.count-3);
     j:=1;
     while(j<=tempcstr.count)do
      begin
       if(tempcstr.item[j-1]=';') then break;
       inc(j);
      end;
     loopstate^.init:=c_string_copy_item(tempcstr,1,j-1);
     c_string_delete_item(tempcstr,1,j);
     loopstate^.haveinit:=true;
     j:=1;
     while(j<=tempcstr.count)do
      begin
       if(tempcstr.item[j-1]=';') then break;
       inc(j);
      end;
     loopstate^.condition:=c_string_copy_item(tempcstr,1,j-1);
     c_string_delete_item(tempcstr,1,j);
     i:=j+1;
     loopstate^.step:=tempcstr;
     loopstate^.havestep:=true;
     res.covtype:=c_node_loop_statement;
     res.covcontent:=loopstate;
     construct_c_item:=res;
    end
   else if(count<2) then
    begin
     New(loopstate);
     loopstate^.looptype:=c_node_loop_for;
     tempcstr:=c_string_copy_item(code,3,code.count-3);
     i:=1;
     while(i<=tempcstr.count)do
      begin
       if(tempcstr.item[i-1]=':') then break;
       inc(i);
      end;
     tempcstr2:=c_string_copy_item(tempcstr,1,i-1);
     tempcstr3:=c_string_copy_item(tempcstr,i+1,code.count);
     tempcstr4:=c_string_generate_from_string('=.begin()',false);
     c_string_insert_string(tempcstr3,tempcstr4,2);
     tempcstr5:=c_string_generate_from_string('=.end()',false);
     c_string_insert_string(tempcstr3,tempcstr5,2);
     tempcstr6:=c_string_generate_from_string('++',false);
     c_string_insert_string(tempcstr2,tempcstr5,1);
     loopstate^.init:=tempcstr4;
     loopstate^.haveinit:=true;
     loopstate^.condition:=tempcstr5;
     loopstate^.step:=tempcstr6;
     loopstate^.havestep:=true;
     res.covtype:=c_node_loop_statement;
     res.covcontent:=loopstate;
     construct_c_item:=res;
    end;
  end
 else if(code.item[0]='while') then
  begin
   i:=2; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=0) then break;
     inc(i);
    end;
   if(i<code.count) then
    begin
     New(unstrstate);
     c_string_insert_item(';',code,code.count+1);
     unstrstate^.content:=code;
     res.covtype:=c_node_unhandled;
     res.covcontent:=unstrstate;
     exit(res);
    end;
   New(loopstate);
   loopstate^.looptype:=c_node_loop_while;
   loopstate^.condition:=c_string_copy_item(code,2,code.count-1);
   loopstate^.havestep:=false; loopstate^.haveinit:=false;
   res.covtype:=c_node_loop_statement;
   res.covcontent:=loopstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='do') then
  begin
   New(loopstate);
   loopstate^.looptype:=c_node_loop_do_while;
   loopstate^.condition:=c_string_copy_item(extcode,2,extcode.count-1);
   loopstate^.havestep:=false; loopstate^.haveinit:=false;
   res.covtype:=c_node_loop_statement;
   res.covcontent:=loopstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='#') then
  begin
   if(code.item[1]='define') then
    begin
     New(defstate);
     defstate^.defstate:=true;
     if(code.status[2]=0) then
      begin
       j:=4; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(layer=0) then break;
         inc(j);
        end;
       if(j>code.count) then
        begin
         defstate^.defname:=c_string_copy_item(code,3,code.count-2);
         defstate^.defhavevalue:=false;
        end
       else
        begin
         defstate^.defname:=c_string_copy_item(code,3,j-2);
         defstate^.defhavevalue:=true;
         defstate^.defvalue:=c_string_copy_item(code,j+1,code.count-j);
         if(defstate^.defvalue.Count=0) then defstate^.defhavevalue:=false;
        end;
       res.covtype:=c_node_define;
       res.covcontent:=defstate;
       construct_c_item:=res;
      end
     else if(code.status[2]>0) then
      begin
       if(code.count>3) then
        begin
         defstate^.defname:=c_string_copy_item(code,3,1);
         defstate^.defhavevalue:=true;
         defstate^.defvalue:=c_string_copy_item(code,4,code.count-3);
        end
       else
        begin
         defstate^.defname:=c_string_copy_item(code,3,1);
         defstate^.defhavevalue:=false;
        end;
      end;
     res.covtype:=c_node_define;
     res.covcontent:=defstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='undef') then
    begin
     New(defstate);
     defstate^.defstate:=false;
     defstate^.defname:=c_string_copy_item(code,3,code.count-2);
     res.covtype:=c_node_define;
     res.covcontent:=defstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='ifdef') then
    begin
     New(ifdefstate);
     ifdefstate^.deftype:=c_node_ifdef_ifdef;
     ifdefstate^.condition:=c_string_copy_item(code,3,code.count-2);
     res.covtype:=c_node_ifdef;
     res.covcontent:=ifdefstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='ifndef') then
    begin
     New(ifdefstate);
     ifdefstate^.deftype:=c_node_ifdef_ifndef;
     ifdefstate^.condition:=c_string_copy_item(code,3,code.count-2);
     res.covtype:=c_node_ifdef;
     res.covcontent:=ifdefstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='if') then
    begin
     New(ifdefstate);
     ifdefstate^.deftype:=c_node_ifdef_if;
     ifdefstate^.condition:=c_string_copy_item(code,3,code.count-2);
     res.covtype:=c_node_ifdef;
     res.covcontent:=ifdefstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='elif') then
    begin
     New(ifdefstate);
     ifdefstate^.deftype:=c_node_ifdef_elif;
     ifdefstate^.condition:=c_string_copy_item(code,3,code.count-2);
     res.covtype:=c_node_ifdef;
     res.covcontent:=ifdefstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='else') then
    begin
     New(ifdefstate);
     ifdefstate^.deftype:=c_node_ifdef_else;
     ifdefstate^.condition.count:=0;
     res.covtype:=c_node_ifdef;
     res.covcontent:=ifdefstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='endif') then
    begin
     New(ifdefstate);
     ifdefstate^.deftype:=c_node_ifdef_endif;
     ifdefstate^.condition.count:=0;
     res.covtype:=c_node_ifdef;
     res.covcontent:=ifdefstate;
     construct_c_item:=res;
    end
   else if(code.item[1]='pragma') then
    begin
     New(pragmastate);
     if(code.item[2]='pack') then
      begin
       pragmastate^.once:=false;
       if(code.item[3]='(') and (code.item[4]=')') then
        begin
         pragmastate^.havepack:=true;
         pragmastate^.pack:=0;
        end
       else
        begin
         pragmastate^.havepack:=true;
         pragmastate^.pack:=StrToInt(code.item[4]);
        end;
      end
     else if(code.item[2]='once') then
      begin
       pragmastate^.once:=true;
       pragmastate^.havepack:=false;
      end;
     res.covtype:=c_node_pragma;
     res.covcontent:=pragmastate;
     construct_c_item:=res;
    end
   else if(code.item[1]='CodeSegment') then
    begin
     New(codestate);
     codestate^.divide:=true;
     res.covtype:=c_node_code_signal;
     res.covcontent:=codestate;
     construct_c_item:=res;
    end
   else if(code.item[1]='include') then
    begin
     New(includestate);
     if(code.item[2]='<') then
      begin
       includestate^.incname:=c_string_copy_item(code,4,code.Count-4);
      end
     else
      begin
       tempstr1:=code.item[2];
       if(tydq_get_character(tempstr1,1)='"') or (tydq_get_character(tempstr1,1)=#39) then
        begin
         tempstr1:=Trim(copy(tempstr1,2,length(tempstr1)-2));
        end;
       i:=length(tempstr1);
       while(i>0) and (tempstr1[i]<>'\') and (tempstr1[i]<>'/') do dec(i);
       if(i=0) then i:=1 else tempstr1:=Copy(tempstr1,i+1,length(tempstr1)-i);
       includestate^.incname:=c_string_generate_from_string(tempstr1);
      end;
     res.covtype:=c_node_include;
     res.covcontent:=includestate;
     construct_c_item:=res;
    end;
  end
 else if(code.item[0]='return') then
  begin
   New(returnstate);
   tempcstr:=c_string_copy_item(code,2,code.count-1);
   returnstate^.retvalue:=tempcstr;
   res.covtype:=c_node_return;
   res.covcontent:=returnstate;
   construct_c_item:=res;
  end
 else if(c_string_detect_class(code)) then
  begin
   New(classstate);
   classstate^.classname:=code.item[1];
   classstate^.inheritcount:=0;
   classstate^.generichave:=false;
   classstate^.genericcount:=0;
   classstate^.genericspeccount:=0;
   i:=1; j:=1;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='template') then
      begin
       classstate^.generichave:=true;
       j:=i+1; k:=i+2; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(classstate^.genericcount);
           SetLength(classstate^.genericitem,classstate^.genericcount);
           classstate^.genericitem[classstate^.genericcount-1]:=
           c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='<') then
      begin
       j:=i; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(classstate^.genericspeccount);
           SetLength(classstate^.genericspec,classstate^.genericspeccount);
           classstate^.genericspec[classstate^.genericspeccount-1]:=c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='class') then
      begin
       classstate^.classname:=code.item[i];
       c_string_delete_item(code,i,2); continue;
      end
     else if(code.item[i-1]=':') then
      begin
       j:=i+1; k:=i+1;
       while(j<=code.count)do
        begin
         if(code.item[j-1]=',') or (j=code.count) then
          begin
           if(j=code.count) then tempcstr:=c_string_copy_item(code,k,j-k+1)
           else tempcstr:=c_string_copy_item(code,k,j-k);
           inc(classstate^.inheritcount);
           SetLength(classstate^.inheritbyte,classstate^.inheritcount);
           SetLength(classstate^.inheritclass,classstate^.inheritcount);
           if(tempcstr.item[0]='public') then
            begin
             classstate^.inheritbyte[classstate^.inheritcount-1]:=c_node_class_public;
             classstate^.inheritclass[classstate^.inheritcount-1]:=tempcstr.item[1];
            end
           else if(tempcstr.item[0]='private') then
            begin
             classstate^.inheritbyte[classstate^.inheritcount-1]:=c_node_class_private;
             classstate^.inheritclass[classstate^.inheritcount-1]:=tempcstr.item[1];
            end
           else if(tempcstr.item[0]='protected') then
            begin
             classstate^.inheritbyte[classstate^.inheritcount-1]:=c_node_class_protected;
             classstate^.inheritclass[classstate^.inheritcount-1]:=tempcstr.item[1];
            end;
           k:=j+1;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end;
     inc(i);
    end;
   res.covtype:=c_node_class;
   res.covcontent:=classstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='typedef') then
  begin
   if((c_string_search_for_keyword(code,'struct')>0) or (c_string_search_for_keyword(code,'union')>0))
   and (specindex=1) and (bool=false) then
    begin
     New(structstate);
     structstate^.istypedef:=true;
     structstate^.pack:=pack;
     structstate^.varcount:=0;
     structstate^.generichave:=false;
     structstate^.structdefnamecount:=0;
     i:=2; j:=2;
     while(i<=code.Count)do
      begin
       if(code.item[i-1]='struct') then
        begin
         structstate^.structtype:=false; c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='union') then
        begin
         structstate^.structtype:=true; c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='const') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='static') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='PACKED') then
        begin
         structstate^.pack:=1; c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='__attribute__') then
        begin
         j:=i+1; k:=i+1; layer:=0;
         while(j<=code.count)do
          begin
           if(code.item[j-1]='(') then inc(layer);
           if(code.item[j-1]=')') then dec(layer);
           if(layer=2) and (code.item[j-1]='(') then
            begin
             k:=j+1;
            end
           else if(layer=2) and (code.item[j-1]=',') then
            begin
             tempcstr:=c_string_copy_item(code,j,k-j);
             if(tempcstr.item[0]='packed') then
              begin
               structstate^.pack:=c_number_to_number(tempcstr.item[2]);
              end
             else if(tempcstr.item[0]='align') then
              begin
               structstate^.align:=tempcstr.item[2];
              end
             else if(tempcstr.item[0]='section') then
              begin
               structstate^.section:=tempcstr.item[2];
              end;
             k:=j+1;
            end
           else if(layer=2) and (code.item[j-1]=')') then
            begin
             tempcstr:=c_string_copy_item(code,j,k-j);
             if(tempcstr.item[0]='packed') then
              begin
               structstate^.pack:=c_number_to_number(tempcstr.item[2]);
              end
             else if(tempcstr.item[0]='align') then
              begin
               structstate^.align:=tempcstr.item[2];
              end
             else if(tempcstr.item[0]='section') then
              begin
               structstate^.section:=tempcstr.item[2];
              end;
             k:=j+1;
            end;
           inc(j);
          end;
         c_string_delete_item(code,i,j-i+1); continue;
        end
       else
        begin
         structstate^.structtname:=code.item[i-1];
         c_string_delete_item(code,i,1); continue;
        end;
       inc(i);
      end;
     i:=1; j:=1; m:=1;
     while(i<=extcode.count)do
      begin
       if(extcode.item[i-1]='__attribute__') then
        begin
         j:=i+1; k:=i+1; layer:=0;
         while(j<=extcode.count)do
          begin
           if(extcode.item[j-1]='(') then inc(layer);
           if(extcode.item[j-1]=')') then dec(layer);
           if(layer=2) and (extcode.item[j-1]='(') then
            begin
             k:=j+1;
            end
           else if(layer=2) and (extcode.item[j-1]=',') then
            begin
             tempcstr:=c_string_copy_item(code,j,k-j);
             if(tempcstr.item[0]='packed') then
              begin
               structstate^.pack:=c_number_to_number(tempcstr.item[2]);
              end
             else if(tempcstr.item[0]='align') then
              begin
               structstate^.align:=tempcstr.item[2];
              end
             else if(tempcstr.item[0]='section') then
              begin
               structstate^.section:=tempcstr.item[2];
              end;
             k:=j+1;
            end
           else if(layer=2) and (extcode.item[j-1]=')') then
            begin
             tempcstr:=c_string_copy_item(code,j,k-j);
             if(tempcstr.item[0]='packed') then
              begin
               structstate^.pack:=c_number_to_number(tempcstr.item[2]);
              end
             else if(tempcstr.item[0]='align') then
              begin
               structstate^.align:=tempcstr.item[2];
              end
             else if(tempcstr.item[0]='section') then
              begin
               structstate^.section:=tempcstr.item[2];
              end;
             k:=j+1;
            end;
           inc(j);
          end;
         c_string_delete_item(extcode,i,j-i+1); continue;
        end
       else if(extcode.item[i-1]=',') then
        begin
         inc(structstate^.structdefnamecount);
         SetLength(structstate^.structdefname,structstate^.structdefnamecount);
         structstate^.structdefname[structstate^.structdefnamecount-1]:=
         c_string_copy_item(extcode,m,i-m);
         c_string_delete_item(extcode,m,i-m+1);
         continue;
        end
       else if(i=extcode.count) then
        begin
         inc(structstate^.structdefnamecount);
         SetLength(structstate^.structdefname,structstate^.structdefnamecount);
         structstate^.structdefname[structstate^.structdefnamecount-1]:=
         c_string_copy_item(extcode,m,i-m+1);
         c_string_delete_item(extcode,m,i-m+1);
         continue;
        end;
       inc(i);
      end;
     res.covtype:=c_node_struct;
     res.covcontent:=structstate;
     construct_c_item:=res;
    end
   else if(c_string_search_for_keyword(code,'enum')>0) and (specindex=1)
   and (c_string_search_for_keyword(code,'{')>0) then
    begin
     New(enumstate);
     enumstate^.istypedef:=true;
     enumstate^.enumtype:='';
     enumstate^.varcount:=0;
     enumstate^.enumcount:=0;
     enumstate^.enumdefnamecount:=0;
     c_string_delete_item(code,1,1);
     i:=1; j:=1;
     while(i<=code.count)do
      begin
       if(code.item[i-1]='enum') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='const') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='static') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='{') then
        begin
         c_string_delete_item(code,i,1);
         break;
        end
       else
        begin
         enumstate^.enumtype:=code.item[i-1];
         c_string_delete_item(code,i,1); continue;
        end;
       inc(i);
      end;
     k:=1; m:=1;
     while(k<=code.count) do
      begin
       if(code.item[k-1]='}') then
        begin
         inc(enumstate^.enumcount);
         SetLength(enumstate^.enumcontent,enumstate^.enumcount);
         SetLength(enumstate^.enumdep,enumstate^.enumcount);
         SetLength(enumstate^.enumuna,enumstate^.enumcount);
         tempcstr:=c_string_copy_item(code,m,k-m);
         n:=1;
         while(n<=tempcstr.Count) do
          begin
           if(tempcstr.item[n-1]='__attribute__') then
            begin
             l:=1; r:=1; layer:=0;
             while(l<=tempcstr.count)do
              begin
               if(tempcstr.item[l-1]='(') then inc(layer);
               if(tempcstr.item[l-1]=')') then dec(layer);
               if(tempcstr.item[l-1]='(') and (layer=2) then
                begin
                 r:=n+1;
                end
               else if(tempcstr.item[l-1]=',') and (layer=2) then
                begin
                 tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
                 if(tempcstr2.item[0]='deprecated') then
                  begin
                   enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                  end
                 else if(tempcstr2.item[0]='unavailable') then
                  begin
                   enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                  end;
                 r:=n+1;
                end
               else if(tempcstr.item[l-1]=')') and (layer=1) then
                begin
                 tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
                 if(tempcstr2.item[0]='deprecated') then
                  begin
                   enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                  end
                 else if(tempcstr2.item[0]='unavailable') then
                  begin
                   enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                  end;
                 inc(l); break;
                end;
               inc(l);
              end;
             c_string_delete_item(tempcstr,n,l-n+1);
            end;
           inc(n);
          end;
         enumstate^.enumcontent[enumstate^.enumcount-1]:=tempcstr;
         c_string_delete_item(code,m,k-m+1); k:=m;
         break;
        end
       else if(code.item[k-1]=',') then
        begin
         inc(enumstate^.enumcount);
         SetLength(enumstate^.enumcontent,enumstate^.enumcount);
         SetLength(enumstate^.enumdep,enumstate^.enumcount);
         SetLength(enumstate^.enumuna,enumstate^.enumcount);
         enumstate^.enumdep[enumstate^.enumcount-1]:=false;
         enumstate^.enumuna[enumstate^.enumcount-1]:=false;
         tempcstr:=c_string_copy_item(code,m,k-m);
         n:=1;
         while(n<=tempcstr.Count) do
          begin
           if(tempcstr.item[n-1]='__attribute__') then
            begin
             l:=1; r:=1; layer:=0;
             while(l<=tempcstr.count)do
              begin
               if(tempcstr.item[l-1]='(') then inc(layer);
               if(tempcstr.item[l-1]=')') then dec(layer);
               if(tempcstr.item[l-1]='(') and (layer=2) then
                begin
                 r:=n+1;
                end
               else if(tempcstr.item[l-1]=',') and (layer=2) then
                begin
                 tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
                 if(tempcstr2.item[0]='deprecated') then
                  begin
                   enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                  end
                 else if(tempcstr2.item[0]='unavailable') then
                  begin
                   enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                  end;
                 r:=n+1;
                end
               else if(tempcstr.item[l-1]=')') and (layer=1) then
                begin
                 tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
                 if(tempcstr2.item[0]='deprecated') then
                  begin
                   enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                  end
                 else if(tempcstr2.item[0]='unavailable') then
                  begin
                   enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                  end;
                 inc(l); break;
                end;
               inc(l);
              end;
             c_string_delete_item(tempcstr,n,l-n+1);
            end;
           inc(n);
          end;
         enumstate^.enumcontent[enumstate^.enumcount-1]:=tempcstr;
         c_string_delete_item(code,m,k-m+1); k:=m; continue;
        end;
       inc(k);
      end;
     i:=1; j:=1;
     while(i<=code.count)do
      begin
       if(code.item[i-1]=',') then
        begin
         inc(enumstate^.enumdefnamecount);
         SetLength(enumstate^.enumdefname,enumstate^.enumdefnamecount);
         enumstate^.enumdefname[enumstate^.enumdefnamecount-1]:=c_string_copy_item(code,j,i-j);
         c_string_delete_item(code,j,i-j+1);
         continue;
        end
       else if(i=code.count) then
        begin
         inc(enumstate^.enumdefnamecount);
         SetLength(enumstate^.enumdefname,enumstate^.enumdefnamecount);
         enumstate^.enumdefname[enumstate^.enumdefnamecount-1]:=c_string_copy_item(code,j,i-j+1);
         c_string_delete_item(code,j,i-j+1);
         continue;
        end;
       inc(i);
      end;
     res.covtype:=c_node_enum;
     res.covcontent:=enumstate;
     construct_c_item:=res;
    end
   else
    begin
     New(tdefstate);
     tdefstate^.align:=0;
     i:=2; layer:=0; layer2:=0;
     while(i<=code.count)do
      begin
       if(code.item[i-1]='(') then inc(layer);
       if(code.item[i-1]=')') then dec(layer);
       if(layer=0) and ((code.item[i-1]='const') or (code.item[i-1]='CONST')) then
        begin
         c_string_delete_item(code,i,1); continue;
        end;
       if(layer=0) and (code.item[i-1]='__attribute__') then
        begin
         j:=i+1; k:=i+1;
         while(j<=code.count)do
          begin
           if(code.item[j-1]='(') then inc(layer2);
           if(code.item[j-1]=')') then dec(layer2);
           if(layer2=2) and (code.item[j-1]='(') then
            begin
             k:=j+1;
            end
           else if(layer2=2) and (code.item[j-1]=',') then
            begin
             tempcstr2:=c_string_copy_item(code,k,j-k);
             if(tempcstr2.item[0]='align') then
              begin
               tdefstate^.align:=c_number_to_number(tempcstr2.item[2]);
              end;
             k:=j+1;
            end
           else if(layer2=1) and (code.item[j-1]=')') then
            begin
             tempcstr2:=c_string_copy_item(code,k,j-k);
             if(tempcstr2.item[0]='align') then
              begin
               tdefstate^.align:=c_number_to_number(tempcstr2.item[2]);
              end;
             inc(j); continue;
            end;
           inc(j);
          end;
         c_string_delete_item(code,i,j-i+1);
         continue;
        end;
       inc(i);
      end;
     i:=code.count; layer:=0;
     while(i>0)do
      begin
       if(code.item[i-1]=')') then inc(layer);
       if(code.item[i-1]='(') then dec(layer);
       if(layer=0) and (code.item[i-1]<>'(') then break;
       dec(i);
      end;
     tdefstate^.oldvalue:=c_string_copy_item(code,2,i-2);
     tdefstate^.newvalue:=c_string_copy_item(code,i,code.count-i+1);
     res.covtype:=c_node_typedef;
     res.covcontent:=tdefstate;
     construct_c_item:=res;
    end;
  end
 else if(code.item[0]='extern') and (code.Count>=2) and
 ((code.item[1]='"C"') or (code.item[1]=#39'C'#39)) then
  begin
   New(extcstate);
   extcstate^.extc:=true;
   res.covtype:=c_node_extern_c;
   res.covcontent:=extcstate;
   construct_c_item:=res;
  end
 else if(c_string_search_for_keyword(code,'extern')>0) then
  begin
   New(extstate);
   extstate^.extvarcount:=0;
   extstate^.exttype:='';
   extstate^.static:=false;
   c_string_delete_item(code,1,1);
   i:=1;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='ATTRIBUTE_NONNULL') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NORETURN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end;
     inc(i);
    end;
   i:=1;
   while(i<=code.Count)do
    begin
     if(code.item[i-1]='static') then
      begin
       extstate^.static:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='*') then
      begin
       break;
      end
     else break;
     inc(i);
    end;
   i:=1; k:=c_string_divide_type_and_name(code,1);
   while(i<=k)do
    begin
     extstate^.exttype:=extstate^.exttype+code.item[i-1];
     if(i<k) and (code.item[i-1]<>'*') and (code.item[i]<>'*') then
     extstate^.exttype:=extstate^.exttype+' ';
     inc(i);
    end;
   c_string_delete_item(code,1,k);
   i:=1; j:=1; layer:=0;
   while(i<=code.Count) do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if((code.item[i-1]=',') and (layer=0)) or (i=code.count) then
      begin
       if(i=code.count) then tempcstr:=c_string_copy_item(code,j,i-j+1)
       else tempcstr:=c_string_copy_item(code,j,i-j);
       inc(extstate^.extvarcount);
       SetLength(extstate^.extvar,extstate^.extvarcount);
       extstate^.extvar[extstate^.extvarcount-1]:=tempcstr;
       j:=i+1;
      end;
     inc(i);
    end;
   res.covtype:=c_node_extern;
   res.covcontent:=extstate;
   construct_c_item:=res;
  end
 else if(specindex2>=1) and (code.count=2) and ((code.item[0]='public') or
 (code.item[0]='private') or (code.item[0]='protected')) and (code.item[1]=':') then
  begin
   New(classtagstate);
   if(code.item[0]='public') then classtagstate^.tagtype:=0
   else if(code.item[0]='private') then classtagstate^.tagtype:=1
   else if(code.item[0]='protected') then classtagstate^.tagtype:=2;
   res.covtype:=c_node_class_tag;
   res.covcontent:=classtagstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='goto') and (code.count=2) then
  begin
   New(gotostate);
   gotostate^.islabel:=false;
   gotostate^.name:=code.item[1];
   res.covtype:=c_node_goto_or_label;
   res.covcontent:=gotostate;
   construct_c_item:=res;
  end
 else if(code.count=2) and (code.item[0]<>'') and (code.item[1]=':') then
  begin
   New(gotostate);
   gotostate^.islabel:=true;
   gotostate^.name:=code.item[0];
   res.covtype:=c_node_goto_or_label;
   res.covcontent:=gotostate;
   construct_c_item:=res;
  end
 else if(c_string_check_constexpr_function(code)) and (c_string_check_function(code))
 and (bool=false) then
  begin
   New(cexprstate);
   cexprstate^.funcname:='';
   cexprstate^.funccount:=0;
   cexprstate^.functype:='';
   i:=1; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='constexpr') or (code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='(') then
      begin
       cexprstate^.funcname:=code.item[i-2];
       j:=i+1; k:=i+1; layer:=1;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if((layer=1) and (code.item[j-1]=',')) and ((layer=0) and (code.item[j-1]=')')) then
          begin
           inc(cexprstate^.funccount);
           SetLength(cexprstate^.funcparam,cexprstate^.funccount);
           cexprstate^.funcparam[cexprstate^.funccount-1]:=c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i-1,j-i+2);
      end;
     inc(i);
    end;
   i:=1;
   while(i<=code.count)do
    begin
     cexprstate^.functype:=cexprstate^.functype+code.item[i-1];
     if(i<code.count) and (code.item[i-1]<>'*') and (code.item[i]<>'*')
     then cexprstate^.functype:=cexprstate^.functype+' ';
    end;
   res.covcontent:=cexprstate;
   res.covtype:=c_node_constexpr_function;
   construct_c_item:=res;
  end
 else if(c_string_check_operator(code)) then
  begin
   New(opestate);
   opestate^.isvirtual:=false;
   opestate^.isoverride:=false;
   opestate^.isstatic:=false;
   opestate^.isinline:=false;
   opestate^.opesign:='';
   opestate^.operestype:='';
   opestate^.align:='';
   opestate^.section:='';
   opestate^.atpos:='';
   opestate^.abi:='';
   opestate^.conv:='cdecl';
   opestate^.opeparamcount:=0;
   opestate^.operestype:='';
   opestate^.isasm:=false;
   opestate^.generichave:=false;
   opestate^.genericcount:=0;
   opestate^.genericspeccount:=0;
   i:=1; layer:=0;
   while(i<=code.count) do
    begin
     if(code.item[i-1]='template') then
      begin
       opestate^.generichave:=true;
       j:=i+1; k:=i+2; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(opestate^.genericcount);
           SetLength(opestate^.genericitem,opestate^.genericcount);
           opestate^.genericitem[opestate^.genericcount-1]:=
           c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='<') then
      begin
       j:=i; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(opestate^.genericspeccount);
           SetLength(opestate^.genericspec,opestate^.genericspeccount);
           opestate^.genericspec[opestate^.genericspeccount-1]:=c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='__cdecl') then
      begin
       opestate^.conv:='cdecl';
      end
     else if(code.item[i-1]='__pascal') then
      begin
       opestate^.conv:='pascal';
      end
     else if(code.item[i-1]='__stdcall') then
      begin
       opestate^.conv:='stdcall';
      end
      else if(code.item[i-1]='__fastcall') then
      begin
       opestate^.conv:='fastcall';
      end
     else if(code.item[i-1]='__thiscall') then
      begin
       opestate^.conv:='thiscall';
      end
     else if(code.item[i-1]='virtual') then
      begin
       opestate^.isvirtual:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EXTERN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='override') then
      begin
       opestate^.isoverride:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='static') then
      begin
       opestate^.isstatic:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='inline') then
      begin
       opestate^.isinline:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       opestate^.conv:='register'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='friend') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EFIAPI') or (code.item[i-1]='efiapi') then
      begin
       opestate^.abi:='efiapi'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='WINAPI') or (code.item[i-1]='winapi') then
      begin
       opestate^.conv:='winapi'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='constexpr') or (code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NO_RETURN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NONNULL') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__asm') then
      begin
       opestate^.isasm:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__attribute__') then
      begin
       j:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then inc(layer);
         if(code.item[j-1]='(') and (layer=2) then
          begin
           k:=j+1;
          end
         else if(code.item[j-1]=',') and (layer=2) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           if(tempcstr.item[0]='align') then
            begin
             opestate^.align:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='alias') then
            begin
             opestate^.opealias:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='at') then
            begin
             opestate^.atpos:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='section') then
            begin
             opestate^.section:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='__ms_abi__') then
            begin
             opestate^.abi:='ms_abi';
            end
           else if(tempcstr.item[0]='__sysv_abi__') then
            begin
             opestate^.abi:='sysv_abi';
            end;
           k:=j+1;
          end
         else if(code.item[j-1]=')') and (layer=1) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           if(tempcstr.item[0]='align') then
            begin
             opestate^.align:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='alias') then
            begin
             opestate^.opealias:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='at') then
            begin
             opestate^.atpos:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='section') then
            begin
             opestate^.section:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='__ms_abi__') then
            begin
             opestate^.abi:='ms_abi';
            end
           else if(tempcstr.item[0]='__sysv_abi__') then
            begin
             opestate^.abi:='sysv_abi';
            end;
           inc(j,1); break;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else if(code.item[i-1]='(') then
      begin
       j:=i+1; layer:=1;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(layer=0) then
          begin
           inc(j,1); break;
          end;
         inc(j,1);
        end;
       i:=j; continue;
      end;
     inc(i);
    end;
   i:=1; layer:=0;
   while(i<=code.Count)do
    begin
     if(code.item[i-1]='(') and (i<code.count) and (code.item[i]<>')') then
      begin
       j:=i+1; k:=i+1; layer:=1;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(code.item[j-1]=',') and (layer=1) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           inc(opestate^.opeparamcount);
           SetLength(opestate^.opeparam,opestate^.opeparamcount);
           opestate^.opeparam[opestate^.opeparamcount-1]:=tempcstr;
          end;
         if(code.item[j-1]=')') and (layer=0) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           inc(opestate^.opeparamcount);
           SetLength(opestate^.opeparam,opestate^.opeparamcount);
           opestate^.opeparam[opestate^.opeparamcount-1]:=tempcstr;
           break;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else if(code.item[i-1]='&') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(i<code.count) and (code.item[i-1]='operator') then
      begin
       if(i<code.count-1) and (code.item[i]='(') then
        begin
         opestate^.opesign:=code.item[i]+code.item[i+1];
         c_string_delete_item(code,i,3); continue;
        end
       else if(i<code.count-1) and (code.item[i]='[') then
        begin
         opestate^.opesign:=code.item[i]+code.item[i+1];
         c_string_delete_item(code,i,3); continue;
        end
       else
        begin
         opestate^.opesign:=code.item[i];
         c_string_delete_item(code,i,2); continue;
        end;
      end;
     inc(i);
    end;
   i:=1; j:=c_string_divide_type_and_name(code,0);
   while(i<=j)do
    begin
     opestate^.operestype:=opestate^.operestype+code.item[i-1];
     if(i<j) and (code.item[i-1]<>'*') and (code.item[i]<>'*') then
     opestate^.operestype:=opestate^.operestype+' ';
     inc(i);
    end;
   c_string_delete_item(code,1,j);
   res.covtype:=c_node_operator;
   res.covcontent:=opestate;
   construct_c_item:=res;
  end
 else if(specindex2>=1) and (c_string_check_class_function(code))
 and (c_string_check_function(code)) and (bool=true) then
  begin
   New(classfuncstate);
   classfuncstate^.isabstract:=true;
   i:=1; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=0) and (code.item[i-1]='=') then break;
     inc(i);
    end;
   len:=i-1;
   classfuncstate^.isconstructor:=false;
   classfuncstate^.isdestructor:=false;
   classfuncstate^.isoverride:=false;
   classfuncstate^.isabstract:=false;
   classfuncstate^.funcinline:=false;
   classfuncstate^.isstatic:=false;
   classfuncstate^.resulttype:='';
   classfuncstate^.funcabi:='';
   classfuncstate^.funcalias:='';
   classfuncstate^.funcalign:='';
   classfuncstate^.funcat:='';
   classfuncstate^.funcconv:='cdecl';
   classfuncstate^.paramcount:=0;
   classfuncstate^.generichave:=false;
   classfuncstate^.genericcount:=0;
   classfuncstate^.genericspeccount:=0;
   classfuncstate^.funchaveinit:=false;
   classfuncstate^.hostclassname:='';
   if(code.item[1]='(') then
    begin
     classfuncstate^.isconstructor:=true;
     classfuncstate^.isdestructor:=false;
    end;
   i:=1;
   while(i<=len) do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=0) and (code.item[i-1]='=') then break;
     if(layer=0) then
      begin
       if(code.item[i-1]='virtual') then classfuncstate^.isvirtual:=true
       else if(code.item[i-1]='override') then classfuncstate^.isoverride:=true
       else if(code.item[i-1]='inline') then classfuncstate^.funcinline:=true
       else if(code.item[i-1]='~') then classfuncstate^.isdestructor:=true
       else if(code.item[i-1]='static') then classfuncstate^.isstatic:=true
       else classfuncstate^.funcname:=code.item[i-1];
      end;
     inc(i);
    end;
   if(classfuncstate^.isabstract=false) and (classfuncstate^.isvirtual=true)
   and (i<len) and (code.item[i]='0') then
    begin
     classfuncstate^.isabstract:=true;
    end;
   res.covtype:=c_node_class_function;
   res.covcontent:=classfuncstate;
   construct_c_item:=res;
  end
 else if((c_string_check_class_function(code)) and (specindex2=0) and (bool=false)) or
 (((c_string_check_function(code)) or (c_string_check_class_function(code))) and (specindex2>=1)) then
  begin
   New(classfuncstate);
   classfuncstate^.isstatic:=false;
   classfuncstate^.funcinline:=false;
   classfuncstate^.isvirtual:=false;
   classfuncstate^.hostclassname:='';
   classfuncstate^.paramcount:=0;
   classfuncstate^.funcat:='';
   classfuncstate^.funcsec:='';
   classfuncstate^.funcalign:='';
   classfuncstate^.funcconv:='';
   classfuncstate^.funcabi:='';
   classfuncstate^.funcname:='';
   classfuncstate^.resulttype:='';
   classfuncstate^.funcinline:=false;
   classfuncstate^.isconstructor:=false;
   classfuncstate^.isdestructor:=false;
   classfuncstate^.isoverride:=false;
   classfuncstate^.isvirtual:=false;
   classfuncstate^.isabstract:=false;
   classfuncstate^.isasm:=false;
   classfuncstate^.generichave:=false;
   classfuncstate^.genericcount:=0;
   classfuncstate^.genericspeccount:=0;
   classfuncstate^.funchaveinit:=false;
   i:=1;
   while(i<=code.count)do
    begin
     if(code.item[i-1]=':') then
      begin
       classfuncstate^.funchaveinit:=true;
       classfuncstate^.funcinitcount:=0;
       j:=i+1; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if((layer=0) and (code.item[j-1]=',')) or (j=code.count) or
         ((j<code.count) and (code.item[j-1]='{')) then
          begin
           inc(classfuncstate^.funcinitcount);
           SetLength(classfuncstate^.funcinit,classfuncstate^.funcinitcount);
           tempcstr:=c_string_generate_from_string('this->');
           if(j=code.count) then tempcstr2:=c_string_copy_item(code,k,j-k+1)
           else tempcstr2:=c_string_copy_item(code,k,j-k);
           c_string_insert_item('=',tempcstr2,2);
           c_string_insert_string(tempcstr,tempcstr2,1);
           construct_c_expression(tempcstr2,codelist,false);
           classfuncstate^.funcinit[classfuncstate^.funcinitcount-1]:=tempcstr2;
           k:=j+1;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,code.count-i+1); continue;
      end
     else if(code.item[i-1]='template') then
      begin
       classfuncstate^.generichave:=true;
       j:=i+1; k:=i+2; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(classfuncstate^.genericcount);
           SetLength(classfuncstate^.genericitem,classfuncstate^.genericcount);
           classfuncstate^.genericitem[classfuncstate^.genericcount-1]:=
           c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='<') then
      begin
       j:=i; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(classfuncstate^.genericspeccount);
           SetLength(classfuncstate^.genericspec,classfuncstate^.genericspeccount);
           classfuncstate^.genericspec[classfuncstate^.genericspeccount-1]:=c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='friend') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='static') then
      begin
       classfuncstate^.isstatic:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       classfuncstate^.funcconv:='register'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EXTERN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='inline') then
      begin
       classfuncstate^.funcinline:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='virtual') then
      begin
       classfuncstate^.isvirtual:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='override') then
      begin
       classfuncstate^.isoverride:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='~') then
      begin
       classfuncstate^.isdestructor:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__asm') then
      begin
       classfuncstate^.isasm:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__cdecl') then
      begin
       classfuncstate^.funcconv:='cdecl'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__pascal') then
      begin
       classfuncstate^.funcconv:='pascal'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__stdcall') then
      begin
       classfuncstate^.funcconv:='stdcall'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__fastcall') then
      begin
       classfuncstate^.funcconv:='fastcall'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__thiscall') then
      begin
       classfuncstate^.funcconv:='thiscall'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EFIAPI') or (code.item[i-1]='efiapi') then
      begin
       classfuncstate^.funcabi:='efiapi'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='WINAPI') or (code.item[i-1]='winapi') then
      begin
       classfuncstate^.funcconv:='winapi'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NO_RETURN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NONNULL') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__attribute__') then
      begin
       j:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then inc(layer);
         if(code.item[j-1]='(') and (layer=2) then
          begin
           k:=j+1;
          end
         else if(code.item[j-1]=',') and (layer=2) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           if(tempcstr.item[0]='align') then
            begin
             classfuncstate^.funcalign:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='alias') then
            begin
             classfuncstate^.funcalias:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='at') then
            begin
             classfuncstate^.funcat:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='section') then
            begin
             classfuncstate^.funcsec:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='__ms_abi__') then
            begin
             classfuncstate^.funcabi:='ms_abi';
            end
           else if(tempcstr.item[0]='__sysv_abi__') then
            begin
             classfuncstate^.funcabi:='sysv_abi';
            end;
           k:=j+1;
          end
         else if(code.item[j-1]=')') and (layer=1) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           if(tempcstr.item[0]='align') then
            begin
             classfuncstate^.funcalign:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='alias') then
            begin
             classfuncstate^.funcalias:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='at') then
            begin
             classfuncstate^.funcat:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='section') then
            begin
             classfuncstate^.funcsec:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='__ms_abi__') then
            begin
             classfuncstate^.funcabi:='ms_abi';
            end
           else if(tempcstr.item[0]='__sysv_abi__') then
            begin
             classfuncstate^.funcabi:='sysv_abi';
            end;
           inc(j,1); break;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else if(code.item[i-1]='(') then
      begin
       j:=i+1; layer:=1;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(layer=0) then
          begin
           inc(j,1); break;
          end;
         inc(j,1);
        end;
       i:=j; continue;
      end;
     inc(i);
    end;
   i:=1;
   while(i<=code.Count) do
    begin
     if(i<code.count) and (code.item[i]='::') then
      begin
       if(i=1) then
        begin
         classfuncstate^.isconstructor:=true;
        end;
       classfuncstate^.hostclassname:=code.item[i-1];
       classfuncstate^.funcname:=code.item[i+1];
       c_string_delete_item(code,i,3);
       continue;
      end
     else if(code.item[i-1]='(') then
      begin
       j:=i+1; k:=i+1; layer:=1;
       while(j<=code.count) do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer=1) and (code.item[j-1]=',') then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           inc(classfuncstate^.paramcount);
           SetLength(classfuncstate^.param,classfuncstate^.paramcount);
           classfuncstate^.param[classfuncstate^.paramcount-1]:=tempcstr;
           k:=j+1;
          end
         else if(layer=0) and (code.item[j-1]=')') then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           inc(classfuncstate^.paramcount);
           SetLength(classfuncstate^.param,classfuncstate^.paramcount);
           classfuncstate^.param[classfuncstate^.paramcount-1]:=tempcstr;
           break;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end;
     inc(i);
    end;
   if(code.count>0) then
    begin
     i:=1; j:=c_string_divide_type_and_name(code,0);
     while(i<=j)do
      begin
       classfuncstate^.resulttype:=classfuncstate^.resulttype+code.item[i-1];
       if(i<code.count) and (code.item[i]<>'*') and (code.item[i-1]<>'*') then
       classfuncstate^.resulttype:=classfuncstate^.resulttype+' ';
       inc(i); continue;
      end;
     c_string_delete_item(code,1,j);
    end;
   if(classfuncstate^.funcname<>'') and (code.count>=1) then
    begin
     classfuncstate^.funcname:=code.item[0];
    end;
   res.covtype:=c_node_class_function;
   res.covcontent:=classfuncstate;
   construct_c_item:=res;
  end
 else if(c_string_check_function(code)) and (bool=false) and (specindex2<2) then
  begin
   New(funcstate);
   funcstate^.funcinline:=false;
   funcstate^.funcstatic:=false;
   funcstate^.funcinline:=false;
   funcstate^.isasm:=false;
   funcstate^.funcat:='';
   funcstate^.funcsec:='';
   funcstate^.funcalign:='';
   funcstate^.funcconv:='cdecl';
   funcstate^.funcname:='';
   funcstate^.funcalias:='';
   funcstate^.funcabi:='';
   funcstate^.paramcount:=0;
   funcstate^.generichave:=false;
   funcstate^.genericcount:=0;
   funcstate^.genericspeccount:=0;
   i:=1;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='template') then
      begin
       funcstate^.generichave:=true;
       j:=i+1; k:=i+2; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(funcstate^.genericcount);
           SetLength(funcstate^.genericitem,funcstate^.genericcount);
           funcstate^.genericitem[funcstate^.genericcount-1]:=
           c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='<') then
      begin
       j:=i; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(funcstate^.genericspeccount);
           SetLength(funcstate^.genericspec,funcstate^.genericspeccount);
           funcstate^.genericspec[funcstate^.genericspeccount-1]:=c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='friend') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='static') then
      begin
       funcstate^.funcstatic:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EXTERN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='inline') then
      begin
       funcstate^.funcinline:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       funcstate^.funcconv:='register'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__asm') then
      begin
       funcstate^.isasm:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__cdecl') then
      begin
       funcstate^.funcconv:='cdecl'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__pascal') then
      begin
       funcstate^.funcconv:='pascal'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__stdcall') then
      begin
       funcstate^.funcconv:='stdcall'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__fastcall') then
      begin
       funcstate^.funcconv:='fastcall'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__thiscall') then
      begin
       funcstate^.funcconv:='thiscall'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EFIAPI') or (code.item[i-1]='efiapi') then
      begin
       funcstate^.funcabi:='efiapi'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='WINAPI') or (code.item[i-1]='winapi') then
      begin
       funcstate^.funcabi:='efiapi'; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NO_RETURN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='ATTRIBUTE_NONNULL') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__attribute__') then
      begin
       j:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then inc(layer);
         if(code.item[j-1]='(') and (layer=2) then
          begin
           k:=j+1;
          end
         else if(code.item[j-1]=',') and (layer=2) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           if(tempcstr.item[0]='align') then
            begin
             funcstate^.funcalign:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='alias') then
            begin
             funcstate^.funcalias:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='at') then
            begin
             funcstate^.funcat:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='section') then
            begin
             funcstate^.funcsec:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='__ms_abi__') then
            begin
             funcstate^.funcabi:='ms_abi';
            end
           else if(tempcstr.item[0]='__sysv_abi__') then
            begin
             funcstate^.funcabi:='sysv_abi';
            end;
           k:=j+1;
          end
         else if(code.item[j-1]=')') and (layer=1) then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           if(tempcstr.item[0]='align') then
            begin
             funcstate^.funcalign:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='alias') then
            begin
             funcstate^.funcalias:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='at') then
            begin
             funcstate^.funcat:=tempcstr.item[2];
            end
           else if(tempcstr.item[0]='section') then
            begin
             funcstate^.funcsec:=copy(tempcstr.item[2],2,length(tempcstr.item[2])-2);
            end
           else if(tempcstr.item[0]='__ms_abi__') then
            begin
             funcstate^.funcabi:='ms_abi';
            end
           else if(tempcstr.item[0]='__sysv_abi__') then
            begin
             funcstate^.funcabi:='sysv_abi';
            end;
           inc(j,1); break;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else if(code.item[i-1]='(') then
      begin
       j:=i+1; layer:=1;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(layer=0) then
          begin
           inc(j,1); break;
          end;
         inc(j,1);
        end;
       i:=j; continue;
      end;
     inc(i);
    end;
   i:=1;
   funcstate^.resulttype:='';
   while(i<=code.Count) do
    begin
     if(i<code.Count) and (code.item[i]='(') then
      begin
       if(funcstate^.funcname='') then funcstate^.funcname:=code.item[i-1];
       j:=i+1; k:=i+2; layer:=0;
       while(j<=code.count) do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(layer=1) and (code.item[j-1]=',') then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           inc(funcstate^.paramcount);
           SetLength(funcstate^.param,funcstate^.paramcount);
           funcstate^.param[funcstate^.paramcount-1]:=tempcstr;
           k:=j+1;
          end
         else if(layer=0) and (code.item[j-1]=')') then
          begin
           tempcstr:=c_string_copy_item(code,k,j-k);
           inc(funcstate^.paramcount);
           SetLength(funcstate^.param,funcstate^.paramcount);
           funcstate^.param[funcstate^.paramcount-1]:=tempcstr;
           break;
          end;
         inc(j);
        end;
       i:=j+1; continue;
      end
     else
      begin
       funcstate^.resulttype:=funcstate^.resulttype+code.item[i-1];
       if(i<code.count) and (code.item[i]<>'*') and (code.item[i-1]<>'*') then
       funcstate^.resulttype:=funcstate^.resulttype+' ';
       inc(i); continue;
      end;
     inc(i);
    end;
   res.covtype:=c_node_function;
   res.covcontent:=funcstate;
   construct_c_item:=res;
  end
 else if(c_string_check_function(code)=false) and (c_string_check_const(code)) and (specindex2=0) then
  begin
   New(conststate);
   conststate^.cconstexpr:=false;
   conststate^.cstatic:=false;
   conststate^.ctype:='';
   conststate^.ccount:=0;
   i:=1; layer:=0;
   while(i<=code.Count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(layer=0) and (code.item[i-1]='static') then
      begin
       c_string_delete_item(code,i,1); conststate^.cstatic:=true; continue;
      end
     else if(layer=0) and (code.item[i-1]='constexpr') then
      begin
       c_string_delete_item(code,i,1); conststate^.cconstexpr:=true; continue;
      end
     else if(layer=0) and (code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(layer=0) and (code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(layer=0) and (code.item[i-1]='inline') then
      begin
       c_string_delete_item(code,i,1); continue;
      end;
     inc(i);
    end;
   i:=1; layer:=0; j:=c_string_divide_type_and_name(code,1);
   while(i<=j)do
    begin
     conststate^.ctype:=conststate^.ctype+code.item[i-1];
     if(i<code.count) and (code.item[i]='*') then break
     else if(i<code.count-1) and (code.item[i+1]='[') then break
     else if(i<code.count) then conststate^.ctype:=conststate^.ctype+' ';
     inc(i);
    end;
   if(i>j) then c_string_delete_item(code,1,j) else c_string_delete_item(code,1,i);
   i:=1; j:=1; layer:=0; layer3:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(code.item[i-1]='{') then inc(layer3);
     if(code.item[i-1]='}') then dec(layer3);
     if(layer=0) and (layer3=0) and ((code.item[i-1]=',') or (i=code.count)) then
      begin
       if(i=code.count) then tempcstr:=c_string_copy_item(code,j,i-j+1)
       else tempcstr:=c_string_copy_item(code,j,i-j);
       inc(conststate^.ccount);
       SetLength(conststate^.calign,conststate^.ccount);
       SetLength(conststate^.cat,conststate^.ccount);
       SetLength(conststate^.csec,conststate^.ccount);
       SetLength(conststate^.chavevalue,conststate^.ccount);
       SetLength(conststate^.cname,conststate^.ccount);
       SetLength(conststate^.cvalue,conststate^.ccount);
       conststate^.calign[conststate^.ccount-1]:='';
       conststate^.cat[conststate^.ccount-1]:='';
       conststate^.csec[conststate^.ccount-1]:='';
       conststate^.chavevalue[conststate^.ccount-1]:=false;
       conststate^.cname[conststate^.ccount-1].Count:=0;
       conststate^.cvalue[conststate^.ccount-1].Count:=0;
       k:=1; m:=1;
       while(k<=tempcstr.Count)do
        begin
         if(tempcstr.item[k-1]='__attribute__') then
          begin
           m:=k+1; n:=k+1; layer2:=0;
           while(m<=tempcstr.count)do
            begin
             if(tempcstr.item[m-1]='(') then inc(layer2);
             if(tempcstr.item[m-1]=')') then dec(layer2);
             if(tempcstr.item[m-1]='(') and (layer2=2) then
              begin
               n:=m+1;
              end;
             if(layer2=2) and (tempcstr.item[m-1]=',') then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,n,m-n);
               if(tempcstr2.item[0]='at') then
                begin
                 conststate^.cat[conststate^.ccount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='align') then
                begin
                 conststate^.calign[conststate^.ccount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='section') then
                begin
                 conststate^.csec[conststate^.ccount-1]:=tempcstr2.item[2];
                end;
               n:=m+1;
              end
             else if(layer2=1) and (tempcstr.item[m-1]=')') then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,n,m-n);
               if(tempcstr2.item[0]='at') then
                begin
                 conststate^.cat[conststate^.ccount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='align') then
                begin
                 conststate^.calign[conststate^.ccount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='section') then
                begin
                 conststate^.csec[conststate^.ccount-1]:=tempcstr2.item[2];
                end;
               inc(m);
               break;
              end;
             inc(m);
            end;
           c_string_delete_item(tempcstr,k,m-k+1);
           k:=m+1;
          end;
         inc(k);
        end;
       k:=1; layer2:=0;
       while(k<=tempcstr.Count)do
        begin
         if(tempcstr.item[k-1]='(') then inc(layer2);
         if(tempcstr.item[k-1]=')') then dec(layer2);
         if(tempcstr.item[k-1]='=') and (layer2=0) then break;
         inc(k);
        end;
       if(k>tempcstr.count) then
        begin
         conststate^.chavevalue[conststate^.ccount-1]:=false;
         conststate^.cname[conststate^.ccount-1]:=tempcstr;
         conststate^.cvalue[conststate^.ccount-1].Count:=0;
        end
       else
        begin
         conststate^.chavevalue[conststate^.ccount-1]:=true;
         conststate^.cname[conststate^.ccount-1]:=c_string_copy_item(tempcstr,1,k-1);
         conststate^.cvalue[conststate^.ccount-1]:=c_string_copy_item(tempcstr,k+1,
         tempcstr.Count-k);
        end;
       j:=i+1;
      end;
     inc(i);
    end;
   res.covtype:=c_node_const;
   res.covcontent:=conststate;
   construct_c_item:=res;
  end
 else if(code.item[0]='__asm') and (code.count>=2) and (specindex=2) then
  begin
   New(asmcodestate);
   asmcodestate^.asmcode:=c_string_copy_item(code,2,code.Count-1);
   res.covtype:=c_node_asm_code;
   res.covcontent:=asmcodestate;
   construct_c_item:=res;
  end
 else if(code.item[0]='__asm__') or (code.item[0]='asm') then
  begin
   if(code.Count>=2) and
   ((code.item[1]='__volatile__') or (code.item[1]='volatile')) then k:=3 else k:=2;
   i:=k+1; j:=k+1; len:=Code.Count-2; layer:=0;
   New(asmstate);
   asmstate^.asmisvolatile:=k=3;
   asmstate^.asmcode.Count:=0;
   asmstate^.asminput.Count:=0;
   asmstate^.asmoutput.Count:=0;
   asmstate^.asmdes.Count:=0;
   while(i<=len) do
    begin
     if(code.item[i-1]=':') or (i=len) then
      begin
       if(i=len) then i:=len+1;
       if(asmstate^.asmcode.Count=0) then
        begin
         asmstate^.asmcode:=c_string_copy_item(code,j,i-j);
        end
       else if(asmstate^.asminput.Count=0) then
        begin
         asmstate^.asmcode:=c_string_copy_item(code,j,i-j);
        end
       else if(asmstate^.asmoutput.Count=0) then
        begin
         asmstate^.asmcode:=c_string_copy_item(code,j,i-j);
        end
       else if(asmstate^.asmdes.Count=0) then
        begin
         asmstate^.asmcode:=c_string_copy_item(code,j,i-j);
        end;
       j:=i+1;
      end;
     inc(i);
    end;
   res.covtype:=c_node_asm;
   res.covcontent:=asmstate;
   construct_c_item:=res;
  end
 else if((c_string_search_for_keyword(code,'struct')>0) or
 (c_string_search_for_keyword(code,'union')>0)) and (c_string_search_for_keyword(code,'=')=0)
 and (c_string_check_function(code)=false) and (bool=false) and (bool2=true) then
  begin
   New(structstate);
   structstate^.structtype:=false;
   structstate^.structtname:='';
   structstate^.pack:=pack;
   structstate^.generichave:=false;
   structstate^.genericcount:=0;
   structstate^.genericspeccount:=0;
   structstate^.istypedef:=false;
   structstate^.structdefnamecount:=0;
   i:=1; j:=1; layer:=0;
   while(i<=code.Count)do
    begin
     if(code.item[i-1]='template') then
      begin
       structstate^.generichave:=true;
       j:=i+1; k:=i+2; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(structstate^.genericcount);
           SetLength(structstate^.genericitem,structstate^.genericcount);
           structstate^.genericitem[structstate^.genericcount-1]:=
           c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='<') then
      begin
       j:=i; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='<') then inc(layer);
         if(code.item[j-1]='>') then dec(layer);
         if(layer>=2) and (code.item[j-1]='>>') then
          begin
           code.item[j-1]:='>'; c_string_insert_item('>',code,j+1);
           continue;
          end;
         if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]='>')) then
          begin
           inc(structstate^.genericspeccount);
           SetLength(structstate^.genericspec,structstate^.genericspeccount);
           structstate^.genericspec[structstate^.genericspeccount-1]:=c_string_copy_item(code,k,j-k);
           k:=j+1;
          end;
         if(layer=0) then break;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1);
       continue;
      end
     else if(code.item[i-1]='struct') then
      begin
       structstate^.structtype:=false; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='union') then
      begin
       structstate^.structtype:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='static') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='PACKED') then
      begin
       structstate^.pack:=1; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='__attribute__') then
      begin
       j:=i+1; k:=i+1; layer:=0;
       while(j<=code.count)do
        begin
         if(code.item[j-1]='(') then inc(layer);
         if(code.item[j-1]=')') then dec(layer);
         if(code.item[j-1]='(') and (layer=2) then
          begin
           k:=j+1;
          end
         else if(code.item[j-1]=',') and (layer=2) then
          begin
           tempcstr2:=c_string_copy_item(code,k,j-k);
           if(tempcstr2.item[0]='packed') then
            begin
             structstate^.pack:=c_number_to_number(tempcstr2.item[2]);
            end
           else if(tempcstr2.item[0]='align') then
            begin
             structstate^.align:=tempcstr2.item[2];
            end
           else if(tempcstr2.item[0]='section') then
            begin
             structstate^.section:=tempcstr.item[2];
            end;
           k:=j+1;
          end
         else if(code.item[j-1]=')') and (layer=1) then
          begin
           tempcstr2:=c_string_copy_item(code,k,j-k);
           inc(j,1); break;
          end;
         inc(j);
        end;
       c_string_delete_item(code,i,j-i+1); continue;
      end
     else
      begin
       inc(structstate^.structdefnamecount);
       SetLength(structstate^.structdefname,structstate^.structdefnamecount);
       structstate^.structdefname[structstate^.structdefnamecount-1]:=
       c_string_copy_item(code,i,1);
       c_string_delete_item(code,i,1); continue;
      end;
     inc(i);
    end;
   i:=1; j:=1; layer:=0;
   structstate^.varcount:=0;
   while(i<=extcode.count)do
    begin
     if(extcode.item[i-1]='(') then inc(layer);
     if(extcode.item[i-1]=')') then dec(layer);
     if((layer=0) and (extcode.item[i-1]=',')) or (i=extcode.count) then
      begin
       if(i=extcode.count) then tempcstr:=c_string_copy_item(extcode,j,i-j+1)
       else tempcstr:=c_string_copy_item(extcode,j,i-j);
       inc(structstate^.varcount);
       SetLength(structstate^.varname,structstate^.varcount);
       SetLength(structstate^.varvalue,structstate^.varcount);
       SetLength(structstate^.varhavevalue,structstate^.varcount);
       SetLength(structstate^.structalign,structstate^.varcount);
       SetLength(structstate^.structat,structstate^.varcount);
       SetLength(structstate^.structsec,structstate^.varcount);
       structstate^.structat[structstate^.varcount-1]:='';
       structstate^.structalign[structstate^.varcount-1]:='';
       structstate^.structsec[structstate^.varcount-1]:='';
       k:=1; m:=1; n:=1; layer2:=0;
       while(k<=tempcstr.count)do
        begin
         if(tempcstr.item[k-1]='__attribute__') then
          begin
           m:=k+1; n:=k+1;
           while(m<=tempcstr.count)do
            begin
             if(tempcstr2.item[m-1]='(') then inc(layer2);
             if(tempcstr2.item[m-1]=')') then dec(layer2);
             if(layer2=2) and (tempcstr.item[m-1]='(') then
              begin
               n:=m+1;
              end
             else if(layer2=2) and (tempcstr.item[m-1]=',') then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,m,n-m);
               if(tempcstr2.item[0]='at') then
                begin
                 structstate^.structat[structstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='align') then
                begin
                 structstate^.structalign[structstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='section') then
                begin
                 structstate^.structsec[structstate^.varcount-1]:=tempcstr2.item[2];
                end;
               n:=m+1;
              end
             else if(layer2=1) and (tempcstr.item[m-1]=')') then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,m,n-m);
               if(tempcstr2.item[0]='at') then
                begin
                 structstate^.structat[structstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='align') then
                begin
                 structstate^.structalign[structstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='section') then
                begin
                 structstate^.structsec[structstate^.varcount-1]:=tempcstr2.item[2];
                end;
               inc(m); break;
              end;
             inc(m);
            end;
           c_string_delete_item(tempcstr,k,m-k+1);
           continue;
          end;
         inc(k);
        end;
       m:=1; layer:=0;
       while(m<=tempcstr.count)do
        begin
         if(tempcstr.item[m-1]='(') then inc(layer);
         if(tempcstr.item[m-1]=')') then dec(layer);
         if(layer=0) and (tempcstr.item[m-1]='=') then break;
         inc(m);
        end;
       if(m<=tempcstr.count) then
        begin
         structstate^.varname[structstate^.varcount-1]:=
         c_string_copy_item(tempcstr,1,m-1);
         structstate^.varhavevalue[structstate^.varcount-1]:=true;
         structstate^.varvalue[structstate^.varcount-1]:=
         c_string_copy_item(tempcstr,m+1,tempcstr.count-m);
        end
       else
        begin
         structstate^.varname[structstate^.varcount-1]:=tempcstr;
         structstate^.varhavevalue[structstate^.varcount-1]:=false;
         structstate^.varvalue[structstate^.varcount-1].count:=0;
        end;
      end;
     inc(i);
    end;
   res.covtype:=c_node_struct;
   res.covcontent:=structstate;
   construct_c_item:=res;
  end
 else if(c_string_search_for_keyword(code,'enum')>0)
 and (c_string_search_for_keyword(code,'{')>0)
 and (c_string_check_function(code)=false) and (bool=true) and (specindex=1) then
  begin
   New(enumstate);
   enumstate^.enumtype:='';
   enumstate^.varcount:=0;
   enumstate^.enumcount:=0;
   enumstate^.enumdefnamecount:=0;
   i:=1; j:=1;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='enum') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='static') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='{') then
      begin
       c_string_delete_item(code,i,1);
       break;
      end
     else
      begin
       enumstate^.enumtype:=code.item[i-1];
       c_string_delete_item(code,i,1); continue;
      end;
     inc(i);
    end;
   k:=1; m:=1;
   while(k<=code.count) do
    begin
     if(code.item[k-1]='}') then
      begin
       inc(enumstate^.enumcount);
       SetLength(enumstate^.enumcontent,enumstate^.enumcount);
       SetLength(enumstate^.enumdep,enumstate^.enumcount);
       SetLength(enumstate^.enumuna,enumstate^.enumcount);
       tempcstr:=c_string_copy_item(code,m,k-m);
       n:=1;
       while(n<=tempcstr.Count) do
        begin
         if(tempcstr.item[n-1]='__attribute__') then
          begin
           l:=1; r:=1; layer:=0;
             while(l<=tempcstr.count)do
              begin
               if(tempcstr.item[l-1]='(') then inc(layer);
               if(tempcstr.item[l-1]=')') then dec(layer);
               if(tempcstr.item[l-1]='(') and (layer=2) then
                begin
                 r:=n+1;
                end
               else if(tempcstr.item[l-1]=',') and (layer=2) then
                begin
                 tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
                 if(tempcstr2.item[0]='deprecated') then
                  begin
                   enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                  end
                 else if(tempcstr2.item[0]='unavailable') then
                  begin
                   enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                  end;
                 r:=n+1;
                end
               else if(tempcstr.item[l-1]=')') and (layer=1) then
                begin
                 tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
                 if(tempcstr2.item[0]='deprecated') then
                  begin
                   enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                  end
                 else if(tempcstr2.item[0]='unavailable') then
                  begin
                   enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                  end;
                 inc(l); break;
                end;
               inc(l);
              end;
             c_string_delete_item(tempcstr,n,l-n+1);
            end;
           inc(n);
          end;
       enumstate^.enumcontent[enumstate^.enumcount-1]:=tempcstr;
       c_string_delete_item(code,m,k-m+1); k:=m;
       break;
      end
     else if(code.item[k-1]=',') then
      begin
       inc(enumstate^.enumcount);
       SetLength(enumstate^.enumcontent,enumstate^.enumcount);
       SetLength(enumstate^.enumdep,enumstate^.enumcount);
       SetLength(enumstate^.enumuna,enumstate^.enumcount);
       enumstate^.enumdep[enumstate^.enumcount-1]:=false;
       enumstate^.enumuna[enumstate^.enumcount-1]:=false;
       tempcstr:=c_string_copy_item(code,m,k-m);
       n:=1;
       while(n<=tempcstr.Count) do
        begin
         if(tempcstr.item[n-1]='__attribute__') then
          begin
           l:=1; r:=1; layer:=0;
           while(l<=tempcstr.count)do
            begin
             if(tempcstr.item[l-1]='(') then inc(layer);
             if(tempcstr.item[l-1]=')') then dec(layer);
             if(tempcstr.item[l-1]='(') and (layer=2) then
              begin
               r:=n+1;
              end
             else if(tempcstr.item[l-1]=',') and (layer=2) then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
               if(tempcstr2.item[0]='deprecated') then
                begin
                 enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                end
               else if(tempcstr2.item[0]='unavailable') then
                begin
                 enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                end;
               r:=n+1;
              end
             else if(tempcstr.item[l-1]=')') and (layer=1) then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,r,l-n);
               if(tempcstr2.item[0]='deprecated') then
                begin
                 enumstate^.enumdep[enumstate^.enumcount-1]:=true;
                end
               else if(tempcstr2.item[0]='unavailable') then
                begin
                 enumstate^.enumuna[enumstate^.enumcount-1]:=true;
                end;
               inc(l); break;
              end;
            inc(l);
           end;
          c_string_delete_item(tempcstr,n,l-n+1);
         end;
        inc(n);
       end;
       enumstate^.enumcontent[enumstate^.enumcount-1]:=tempcstr;
       c_string_delete_item(code,m,k-m+1); k:=m; continue;
      end;
     inc(k);
    end;
   i:=1; j:=1;
   enumstate^.varcount:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if((layer=0) and (code.item[i-1]=',')) or (i=code.count) then
      begin
       if(i=code.count) then tempcstr:=c_string_copy_item(code,j,i-j+1)
       else tempcstr:=c_string_copy_item(code,j,i-j);
       inc(enumstate^.varcount);
       SetLength(enumstate^.varname,enumstate^.varcount);
       SetLength(enumstate^.varhavevalue,enumstate^.varcount);
       SetLength(enumstate^.varvalue,enumstate^.varcount);
       SetLength(enumstate^.enumalign,enumstate^.varcount);
       SetLength(enumstate^.enumat,enumstate^.varcount);
       SetLength(enumstate^.enumsec,enumstate^.varcount);
       enumstate^.enumat[enumstate^.varcount-1]:='';
       enumstate^.enumalign[enumstate^.varcount-1]:='';
       enumstate^.enumsec[enumstate^.varcount-1]:='';
       k:=1; m:=1; n:=1; layer2:=0;
       while(k<=tempcstr.count)do
        begin
         if(tempcstr.item[k-1]='__attribute__') then
          begin
           m:=k+1; n:=k+1;
           while(m<=tempcstr.count)do
            begin
             if(tempcstr2.item[m-1]='(') then inc(layer2);
             if(tempcstr2.item[m-1]=')') then dec(layer2);
             if(layer2=2) and (tempcstr.item[m-1]='(') then
              begin
               n:=m+1;
              end
             else if(layer2=2) and (tempcstr.item[m-1]=',') then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,m,n-m);
               if(tempcstr2.item[0]='at') then
                begin
                 enumstate^.enumat[enumstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='align') then
                begin
                 enumstate^.enumalign[enumstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='section') then
                begin
                 enumstate^.enumsec[enumstate^.varcount-1]:=tempcstr2.item[2];
                end;
               n:=m+1;
              end
             else if(layer2=1) and (tempcstr.item[m-1]=')') then
              begin
               tempcstr2:=c_string_copy_item(tempcstr,m,n-m);
               if(tempcstr2.item[0]='at') then
                begin
                 enumstate^.enumat[enumstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='align') then
                begin
                 enumstate^.enumalign[enumstate^.varcount-1]:=tempcstr2.item[2];
                end
               else if(tempcstr2.item[0]='section') then
                begin
                 enumstate^.enumsec[enumstate^.varcount-1]:=tempcstr2.item[2];
                end;
               inc(m); break;
              end;
             inc(m);
            end;
           c_string_delete_item(tempcstr,k,m-k+1);
           continue;
          end;
         inc(k);
        end;
       m:=1; layer:=0;
       while(m<=tempcstr.count)do
        begin
         if(tempcstr.item[m-1]='(') then inc(layer);
         if(tempcstr.item[m-1]=')') then dec(layer);
         if(layer=0) and (tempcstr.item[m-1]='=') then break;
         inc(m);
        end;
       if(m<=tempcstr.count) then
        begin
         enumstate^.varname[enumstate^.varcount-1]:=
         c_string_copy_item(tempcstr,1,m-1);
         enumstate^.varhavevalue[enumstate^.varcount-1]:=true;
         enumstate^.varvalue[enumstate^.varcount-1]:=
         c_string_copy_item(tempcstr,m+1,tempcstr.count-m);
        end
       else
        begin
         enumstate^.varname[enumstate^.varcount-1]:=tempcstr;
         enumstate^.varhavevalue[enumstate^.varcount-1]:=false;
         enumstate^.varvalue[enumstate^.varcount-1].count:=0;
        end;
      end;
     inc(i);
    end;
   res.covtype:=c_node_enum;
   res.covcontent:=enumstate;
   construct_c_item:=res;
  end
 else if(code.item[0]='__attribute__') then
  begin
   res.covtype:=c_node_none;
   res.covcontent:=nil;
   construct_c_item:=res;
  end
 else if(specindex2=0) then
  begin
   i:=c_string_search_for_keyword(code,';');
   if(i=0) and (c_string_detect_lambda(code)) then
    begin
     New(lambdastate);
     lambdastate^.funcname:='';
     lambdastate^.capturecount:=0;
     lambdastate^.rettype:='';
     lambdastate^.parametercount:=0;
     i:=1;
     while(i<=code.count)do
      begin
       if(code.item[i-1]='static') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='const') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='register') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='=') then
        begin
         lambdastate^.funcname:=code.item[i-2];
         break;
        end;
       inc(i);
      end;
     j:=i+1; k:=i+2; layer:=0;
     while(j<=code.count)do
      begin
       if(code.item[j-1]='[') then inc(layer);
       if(code.item[j-1]=']') then dec(layer);
       if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]=']')) then
        begin
         inc(lambdastate^.capturecount);
         SetLength(lambdastate^.captureitem,lambdastate^.capturecount);
         lambdastate^.captureitem[lambdastate^.capturecount-1]:=
         c_string_copy_item(code,k,j-k);
         k:=j+1;
        end;
       if(layer=0) then break;
       inc(j);
      end;
     c_string_delete_item(code,i+1,j-i);
     j:=i+1; k:=i+2; layer:=0;
     while(j<=code.count)do
      begin
       if(code.item[j-1]='(') then inc(layer);
       if(code.item[j-1]=')') then dec(layer);
       if((layer=1) and (code.item[j-1]=',')) or ((layer=0) and (code.item[j-1]=']')) then
        begin
         inc(lambdastate^.parametercount);
         SetLength(lambdastate^.parameteritem,lambdastate^.parametercount);
         lambdastate^.parameteritem[lambdastate^.parametercount-1]:=
         c_string_copy_item(code,k,j-k);
         k:=j+1;
        end;
       if(layer=0) then break;
       inc(j);
      end;
     c_string_delete_item(code,i+1,j-i);
     j:=i+2; layer:=0;
     while(j<=code.count)do
      begin
       lambdastate^.rettype:=lambdastate^.rettype+code.item[j-1];
       if(j<code.count) and ((code.item[j-1]<>'*') or (code.item[j]<>'*')) then
       lambdastate^.rettype:=lambdastate^.rettype+' ';
       inc(j);
      end;
     res.covcontent:=lambdastate;
     res.covtype:=c_node_lambda_expression;
     construct_c_item:=res;
    end
   else if(i=0) and (c_string_check_statement(code)) then
    begin
     New(state);
     state^.statetype:='';
     state^.varcount:=0;
     state^.isstatic:=false;
     i:=1; j:=1;
     while(i<=code.count) do
      begin
       if(code.item[i-1]='static') then
        begin
         state^.isstatic:=true; c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='const') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='register') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='constexpr') then
        begin
         c_string_delete_item(code,i,1); continue;
        end
       else if(code.item[i-1]='*') then
        begin
         break;
        end
       else if(code.item[i-1]='(') then
        begin
         break;
        end;
       inc(i);
      end;
     i:=1; k:=c_string_divide_type_and_name(code,1); bool:=false;
     while(i<=k)do
      begin
       state^.statetype:=state^.statetype+code.item[i-1];
       if(i<k) and (c_string_is_operator(code.item[i-1])=0) and
       (c_string_is_operator(code.item[i-1])=0) then
       state^.statetype:=state^.statetype+' ';
       if(code.item[i-1]='<') then bool:=true;
       inc(i);
      end;
     c_string_delete_item(code,1,k);
     i:=1; j:=1; layer2:=0;
     while(i<=code.count) do
      begin
       if(code.item[i-1]='(') or (code.item[i-1]='{') then inc(layer2);
       if(code.item[i-1]=')') or (code.item[i-1]='}') then dec(layer2);
       if(layer2=0) and ((code.item[i-1]=',') or (code.item[i-1]=';') or (i=code.count)) then
        begin
         if(code.item[i-1]=',') or (code.item[i-1]=';') then tempcstr:=c_string_copy_item(code,j,i-j)
         else tempcstr:=c_string_copy_item(code,j,i-j+1);
         m:=1; n:=1; layer:=0; tempstr1:=''; tempstr2:=''; tempstr3:='';
         while(m<=tempcstr.count) do
          begin
           if(tempcstr.item[m-1]='__attribute__') then
            begin
             n:=m; inc(m,3); inc(layer,2);
             while(m<=tempcstr.count)do
              begin
               if(tempcstr.item[m-1]='at') or (tempcstr.item[m-1]='__at__') then
                begin
                 if(tempcstr.item[m]='(') and (tempcstr.item[m+2]=')') then tempstr1:=tempcstr.item[m+1]
                 else tempstr1:='';
                 inc(m,3);
                end
               else if(tempcstr.item[m-1]='align') or (tempcstr.item[m-1]='__align__') then
                begin
                 if(tempcstr.item[m]='(') and (tempcstr.item[m+2]=')') then tempstr2:=tempcstr.item[m+1]
                 else tempstr2:='';
                 inc(m,3);
                end
               else if(tempcstr.item[m-1]='section') or (tempcstr.item[m-1]='__section__') then
                begin
                 if(tempcstr.item[m]='(') and (tempcstr.item[m+2]=')') then tempstr3:=tempcstr.item[m+1]
                 else tempstr3:='';
                 inc(m,3);
                end;
               if(m>tempcstr.count) then break;
               if(tempcstr.item[m-1]='(') then inc(layer);
               if(tempcstr.item[m-1]=')') then dec(layer);
               if(layer=0) then break;
               inc(m);
              end;
             c_string_delete_item(tempcstr,n,m-n+1); continue;
            end;
           inc(m);
          end;
         m:=1;
         while(m<=tempcstr.count) and (tempcstr.item[m-1]<>'=') do inc(m);
         n:=1;
         if(bool=true) then
          begin
           while(n<tempcstr.count) do
            begin
             if(tempcstr.item[n]='(') or (tempcstr.item[n]='{') then
              begin
               break;
              end
             else if(tempcstr.item[n]='=') then
              begin
               bool:=false; break;
              end;
             inc(n);
            end;
          end;
         inc(state^.varcount);
         SetLength(state^.varname,state^.varcount);
         SetLength(state^.varbool,state^.varcount);
         SetLength(state^.varvalue,state^.varcount);
         SetLength(state^.atpos,state^.varcount);
         SetLength(state^.atsec,state^.varcount);
         SetLength(state^.align,state^.varcount);
         if(bool=true) and (n<tempcstr.count) then
          begin
           state^.varname[state^.varcount-1]:=c_string_copy_item(tempcstr,1,n);
           state^.varbool[state^.varcount-1]:=true;
           tempcstr2:=c_string_copy_item(tempcstr,n+1,tempcstr.Count-n);
           construct_c_expression(tempcstr2,codelist);
           state^.varvalue[state^.varcount-1]:=tempcstr2;
           state^.atpos[state^.varcount-1]:=tempstr1;
           state^.align[state^.varcount-1]:=tempstr2;
           state^.atsec[state^.varcount-1]:=tempstr3;
          end
         else if(m<=tempcstr.count) then
          begin
           state^.varname[state^.varcount-1]:=c_string_copy_item(tempcstr,1,m-1);
           state^.varbool[state^.varcount-1]:=true;
           tempcstr2:=c_string_copy_item(tempcstr,m+1,tempcstr.Count-m);
           construct_c_expression(tempcstr2,codelist);
           state^.varvalue[state^.varcount-1]:=tempcstr2;
           state^.atpos[state^.varcount-1]:=tempstr1;
           state^.align[state^.varcount-1]:=tempstr2;
           state^.atsec[state^.varcount-1]:=tempstr3;
          end
         else
          begin
           state^.varname[state^.varcount-1]:=c_string_copy_all(tempcstr);
           state^.varbool[state^.varcount-1]:=false;
           state^.varvalue[state^.varcount-1].Count:=0;
           state^.atpos[state^.varcount-1]:=tempstr1;
           state^.align[state^.varcount-1]:=tempstr2;
           state^.atsec[state^.varcount-1]:=tempstr3;
          end;
         j:=i+1;
        end;
       inc(i);
      end;
     res.covtype:=c_node_statement;
     res.covcontent:=state;
     construct_c_item:=res;
    end
   else if(i=0) then
    begin
     New(expstate);
     expstate^.content:=code;
     res.covtype:=c_node_expression;
     res.covcontent:=expstate;
     construct_c_item:=res;
    end
   else
    begin
     New(unstrstate);
     unstrstate^.content:=code;
     res.covtype:=c_node_unhandled;
     res.covcontent:=unstrstate;
     construct_c_item:=res;
    end;
  end
 else if(specindex2=1) and (c_string_search_for_keyword(code,';')=0) then
  begin
   New(memstate);
   memstate^.memisstatic:=false;
   memstate^.membertype:='';
   memstate^.membercount:=0;
   i:=1;
   while(i<=code.Count)do
    begin
     if(code.item[i-1]='static') then
      begin
       memstate^.memisstatic:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EXTERN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='*') then
      begin
       break;
      end
     else break;
     inc(i);
    end;
   i:=1; k:=c_string_divide_type_and_name(code,1);
   while(i<=k) do
    begin
     memstate^.membertype:=memstate^.membertype+code.item[i-1];
     if(i<k) and (code.item[i-1]<>'*') and (code.item[i]<>'*') then
     memstate^.membertype:=memstate^.membertype+' ';
     inc(i);
    end;
   c_string_delete_item(code,1,k);
   i:=1; j:=1; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if((layer=0) and (code.item[i-1]=',')) or (i=code.count) then
      begin
       if(i=code.count) then tempcstr:=c_string_copy_item(code,j,i-j+1)
       else tempcstr:=c_string_copy_item(code,j,i-j);
       k:=c_string_search_for_keyword(tempcstr,':');
       if(k=0) then
        begin
         inc(memstate^.membercount);
         SetLength(memstate^.membername,memstate^.membercount);
         SetLength(memstate^.memberbit,memstate^.membercount);
         memstate^.membername[memstate^.membercount-1]:=tempcstr;
         memstate^.memberbit[memstate^.membercount-1]:=0;
        end
       else
        begin
         inc(memstate^.membercount);
         SetLength(memstate^.membername,memstate^.membercount);
         SetLength(memstate^.memberbit,memstate^.membercount);
         memstate^.membername[memstate^.membercount-1]:=c_string_copy_item(tempcstr,1,k-1);
         memstate^.memberbit[memstate^.membercount-1]:=Strtoint(tempcstr.item[k]);
        end;
       j:=i+1;
      end;
     inc(i);
    end;
   res.covtype:=c_node_member;
   res.covcontent:=memstate;
   construct_c_item:=res;
  end
 else if(specindex2=2) and (c_string_search_for_keyword(code,';')=0) then
  begin
   New(classmemstate);
   classmemstate^.memisstatic:=false;
   classmemstate^.membertype:='';
   classmemstate^.membercount:=0;
   i:=1;
   while(i<=code.Count)do
    begin
     if(code.item[i-1]='static') then
      begin
       classmemstate^.memisstatic:=true; c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='const') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='register') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='EXTERN') then
      begin
       c_string_delete_item(code,i,1); continue;
      end
     else if(code.item[i-1]='*') then
      begin
       break;
      end
     else break;
     inc(i);
    end;
   i:=1; k:=c_string_divide_type_and_name(code,1);
   while(i<=k)do
    begin
     classmemstate^.membertype:=classmemstate^.membertype+code.item[i-1];
     if(i<k) and (code.item[i-1]<>'*') and (code.item[i]<>'*') then
     classmemstate^.membertype:=classmemstate^.membertype+' ';
     inc(i);
    end;
   c_string_delete_item(code,1,k);
   i:=1; j:=1; layer:=0;
   while(i<=code.count)do
    begin
     if(code.item[i-1]='(') then inc(layer);
     if(code.item[i-1]=')') then dec(layer);
     if(code.item[i-1]=',') or (i=code.count) then
      begin
       if(i=code.count) then tempcstr:=c_string_copy_item(code,j,i-j+1)
       else tempcstr:=c_string_copy_item(code,j,i-j);
       k:=1; layer2:=0;
       while(k<=tempcstr.count)do
        begin
         if(tempcstr.item[k-1]='(') then inc(layer2);
         if(tempcstr.item[k-1]=')') then dec(layer2);
         if(layer2=0) and (tempcstr.item[k-1]='=') then break;
         inc(k);
        end;
       tempcstr:=c_string_copy_item(tempcstr,1,k-1);
       k:=1; layer2:=0;
       while(k<=tempcstr.count)do
        begin
         if(tempcstr.item[k-1]='(') then inc(layer2);
         if(tempcstr.item[k-1]=')') then dec(layer2);
         if(layer2=0) and (tempcstr.item[k-1]=':') then break;
         inc(k);
        end;
       m:=1; layer2:=0;
       while(m<=tempcstr.count)do
        begin
         if(tempcstr.item[m-1]='(') then inc(layer2);
         if(tempcstr.item[m-1]=')') then dec(layer2);
         if(layer2=0) and (tempcstr.item[m-1]='=') then break;
         inc(m);
        end;
       if(k>tempcstr.count) then
        begin
         inc(classmemstate^.membercount);
         SetLength(classmemstate^.membername,classmemstate^.membercount);
         SetLength(classmemstate^.memberbit,classmemstate^.membercount);
         SetLength(classmemstate^.memberhavevalue,classmemstate^.membercount);
         SetLength(classmemstate^.membervalue,classmemstate^.membercount);
         if(m>tempcstr.count) then
          begin
           classmemstate^.membername[classmemstate^.membercount-1]:=tempcstr;
           classmemstate^.memberbit[classmemstate^.membercount-1]:=0;
           classmemstate^.memberhavevalue[classmemstate^.membercount-1]:=false;
           classmemstate^.membervalue[classmemstate^.membercount-1].count:=0;
          end
         else
          begin
           classmemstate^.membername[classmemstate^.membercount-1]:=
           c_string_copy_item(tempcstr,1,m-1);
           classmemstate^.memberbit[classmemstate^.membercount-1]:=0;
           classmemstate^.memberhavevalue[classmemstate^.membercount-1]:=true;
           classmemstate^.membervalue[classmemstate^.membercount-1]:=
           c_string_Copy_item(tempcstr,m+1,tempcstr.count-m);
          end;
        end
       else
        begin
         inc(classmemstate^.membercount);
         SetLength(classmemstate^.membername,classmemstate^.membercount);
         SetLength(classmemstate^.memberbit,classmemstate^.membercount);
         if(m>tempcstr.count) then
          begin
           classmemstate^.membername[classmemstate^.membercount-1]:=c_string_copy_item(tempcstr,1,k-1);
           classmemstate^.memberbit[classmemstate^.membercount-1]:=c_number_to_number(tempcstr.item[k]);
           classmemstate^.memberhavevalue[classmemstate^.membercount-1]:=false;
           classmemstate^.membervalue[classmemstate^.membercount-1].count:=0;
          end
         else
          begin
           classmemstate^.membername[classmemstate^.membercount-1]:=c_string_copy_item(tempcstr,1,k-1);
           classmemstate^.memberbit[classmemstate^.membercount-1]:=c_number_to_number(tempcstr.item[k]);
           classmemstate^.memberhavevalue[classmemstate^.membercount-1]:=true;
           classmemstate^.membervalue[classmemstate^.membercount-1]:=
           c_string_copy_item(tempcstr,m+1,tempcstr.count-m);
          end;
        end;
       j:=i+1;
      end;
     inc(i);
    end;
   res.covtype:=c_node_class_member;
   res.covcontent:=classmemstate;
   construct_c_item:=res;
  end
 else
  begin
   New(unstrstate);
   unstrstate^.content:=code;
   res.covtype:=c_node_unhandled;
   res.covcontent:=unstrstate;
   construct_c_item:=res;
  end;
 //writeln(res.covtype);
 //c_string_write(incode); writeln;
 //c_string_write(inextcode); writeln;
end;
function initialize_c_tree:Pc_tree;
var res:Pc_tree;
begin
 res:=allocmem(sizeof(c_tree));
 res^.parent:=nil;
 res^.codeseg:=false;
 res^.treetype:=c_node_none;
 res^.content:=nil;
 res^.child:=nil;
 res^.count:=0;
 initialize_c_tree:=res;
end;
procedure update_stack(var tempstack:cov_stack;code:c_string);
var i,j:SizeInt;
    tempcode:c_string;
    tempstr1:c_string;
begin
 tempcode:=c_string_copy_all(code);
 i:=1; tempstack.count:=0;
 while(i<=tempcode.count) do
  begin
   if(tempcode.item[i-1]='{') then
    begin
     inc(tempstack.count);
     SetLength(tempstack.left,tempstack.count);
     SetLength(tempstack.right,tempstack.count);
     SetLength(tempstack.vaild,tempstack.count);
     tempstack.left[tempstack.count-1]:=i;
     tempstack.right[tempstack.count-1]:=0;
     tempstack.vaild[tempstack.count-1]:=false;
     inc(i); continue;
    end
   else if(tempcode.item[i-1]='}') then
    begin
     j:=tempstack.count;
     while(j>0)do
      begin
       if(tempstack.right[j-1]=0) then break;
       dec(j);
      end;
     if(j>0) then tempstack.right[j-1]:=i;
     inc(i); continue;
    end;
   inc(i);
  end;
 i:=1;
 while(i<=tempstack.Count)do
  begin
   tempstr1:=c_string_copy_item(tempcode,tempstack.left[i-1]+1,
   tempstack.right[i-1]-tempstack.left[i-1]-1);
   if(c_string_search_for_keyword(tempstr1,';')>0) and (tempstack.vaild[i-1]=false) then
    begin
     tempstack.vaild[i-1]:=true;
    end
   else if(tempstr1.Count=0) and (tempstack.vaild[i-1]=false) then
    begin
     tempstack.vaild[i-1]:=true;
    end;
   if(i>1) and (tempstack.left[i-2]<tempstack.left[i-1])
   and (tempstack.right[i-2]>tempstack.right[i-1]) and (tempstack.vaild[i-1]) then
    begin
     j:=i-1;
     while(j>0) do
      begin
       if(tempstack.left[j-1]<tempstack.left[i-1])
       and (tempstack.right[j-1]>tempstack.right[i-1]) then break;
       dec(j);
      end;
     if(j=0) then tempstack.vaild[i-1]:=false;
    end;
   inc(i);
  end;
end;
procedure destruct_c_tree(var ctree:Pc_tree);
var i:SizeInt;
    temptree:Pc_tree;
begin
 if(ctree^.count>0) then
  begin
   for i:=1 to ctree^.count do
    begin
     temptree:=ctree^.child+i-1;
     destruct_c_tree(temptree);
    end;
  end;
 if(ctree^.child<>nil) then
  begin
   FreeMem(ctree^.child); ctree^.child:=nil;
  end;
 if(ctree^.content<>nil) and (ctree^.treetype<=c_node_root) then
  begin
   if(ctree^.treetype=c_node_asm) then dispose(Pc_asm(ctree^.content))
   else if(ctree^.treetype=c_node_asm_code) then dispose(Pc_asm_code(ctree^.content))
   else if(ctree^.treetype=c_node_class) then dispose(Pc_class(ctree^.content))
   else if(ctree^.treetype=c_node_class_function) then dispose(Pc_class_function(ctree^.content))
   else if(ctree^.treetype=c_node_class_tag) then dispose(Pc_class_tag(ctree^.content))
   else if(ctree^.treetype=c_node_const) then dispose(Pc_const(ctree^.content))
   else if(ctree^.treetype=c_node_define) then dispose(Pc_define(ctree^.content))
   else if(ctree^.treetype=c_node_enum) then dispose(Pc_enum(ctree^.content))
   else if(ctree^.treetype=c_node_expression) then dispose(Pc_expression(ctree^.content))
   else if(ctree^.treetype=c_node_extern) then dispose(Pc_extern(ctree^.content))
   else if(ctree^.treetype=c_node_extern_c) then dispose(Pc_extern_c(ctree^.content))
   else if(ctree^.treetype=c_node_function) then dispose(Pc_function(ctree^.content))
   else if(ctree^.treetype=c_node_goto_or_label) then dispose(Pc_goto_or_label(ctree^.content))
   else if(ctree^.treetype=c_node_ifdef) then dispose(Pc_ifdef(ctree^.content))
   else if(ctree^.treetype=c_node_if_statement) then dispose(Pc_if_statement(ctree^.content))
   else if(ctree^.treetype=c_node_include) then dispose(Pc_include(ctree^.content))
   else if(ctree^.treetype=c_node_loop_statement) then dispose(Pc_loop_statement(ctree^.content))
   else if(ctree^.treetype=c_node_member) then dispose(Pc_member(ctree^.content))
   else if(ctree^.treetype=c_node_namespace) then dispose(Pc_namespace(ctree^.content))
   else if(ctree^.treetype=c_node_operator) then dispose(Pc_operator(ctree^.content))
   else if(ctree^.treetype=c_node_pragma) then dispose(Pc_pragma(ctree^.content))
   else if(ctree^.treetype=c_node_return) then dispose(Pc_return(ctree^.content))
   else if(ctree^.treetype=c_node_statement) then dispose(Pc_statement(ctree^.content))
   else if(ctree^.treetype=c_node_struct) then dispose(Pc_struct(ctree^.content))
   else if(ctree^.treetype=c_node_switch) then dispose(Pc_switch(ctree^.content))
   else if(ctree^.treetype=c_node_switch_case) then dispose(Pc_switch_case(ctree^.content))
   else if(ctree^.treetype=c_node_lambda_expression) then dispose(Pc_lambda_expression(ctree^.content))
   else if(ctree^.treetype=c_node_constexpr_function) then dispose(Pc_constexpr_function(ctree^.content))
   else if(ctree^.treetype=c_node_typedef) then dispose(Pc_typedef(ctree^.content))
   else if(ctree^.treetype=c_node_using_namespace) then dispose(Pc_using_namespace(ctree^.content));
   ctree^.content:=nil;
  end;
 ctree^.count:=0;
 ctree^.treetype:=c_node_none;
 if(ctree^.treetype=c_node_root) then FreeMem(ctree);
end;
procedure rehandle_c_tree_parent(var basetree:Pc_tree);
var i:SizeInt;
    temptree:Pc_tree;
begin
 i:=basetree^.count;
 while(i>0)do
  begin
   temptree:=basetree^.child+i-1;
   temptree^.parent:=basetree;
   rehandle_c_tree_parent(temptree);
   dec(i);
  end;
end;
procedure construct_c_node(const code:c_string;const node:Pc_tree;const pack:byte;const iscodeseg:boolean);
var i,j,k,m,n,layer,layer2,start,myend:SizeInt;
    tempcode,tempstr,tempstr2,tempstr3,tempstr4:c_string;
    tempitem:cov_item;
    codelist:c_define_list;
    bool,bool2:boolean;
    status:byte=0;
    res:Pc_tree;
begin
 if(code.Count<=0) then exit;
 res:=node; tempcode:=c_string_copy_all(code);
 i:=1; codelist.count:=0;
 while(i<=gcodelist.count)do
  begin
   inc(codelist.count);
   SetLength(codelist.define,codelist.count);
   codelist.define[i-1]:=gcodelist.define[i-1];
   inc(i);
  end;
 i:=1; j:=1;
 while(i<=tempcode.Count)do
  begin
   start:=i; layer:=0; status:=0;
   if(tempcode.item[i-1]='#') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) and (tempcode.status[j-1]=2) then break;
       inc(j);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     tempstr2.Count:=0;
     tempstr3.Count:=0;
     i:=j;
    end
   else if(tempcode.item[i-1]='{') then
    begin
     inc(i); continue;
    end
   else if(tempcode.item[i-1]='}') then
    begin
     inc(i); continue;
    end
   else if(tempcode.item[i-1]='case') or (tempcode.item[i-1]='default') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) and (tempcode.item[j-1]=':') then break;
       inc(j);
      end;
     k:=j; layer:=0; layer2:=0;
     while(k<=tempcode.count)do
      begin
       if(tempcode.item[k-1]='(') then inc(layer);
       if(tempcode.item[k-1]=')') then dec(layer);
       if(tempcode.item[k-1]='{') then inc(layer2);
       if(tempcode.item[k-1]='}') then dec(layer2);
       if(layer=0) and (layer2=0)
       and (k<tempcode.Count) and (tempcode.item[k]='case') then
        begin
         break;
        end;
       if(layer=0) and (layer2=0)
       and (k<tempcode.Count) and (tempcode.item[k]='default') then
        begin
         break;
        end;
       if(layer=0) and (layer2=0) and (k<tempcode.count) and (tempcode.item[k]='}') then break;
       if(k=tempcode.count) then break;
       inc(k);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     tempstr2.Count:=0;
     tempstr3:=c_string_copy_item(tempcode,j+1,k-j);
     i:=k;
    end
   else if(tempcode.item[i-1]='if') or (tempcode.item[i-1]='while') or
   (tempcode.item[i-1]='for') or
   ((i<tempcode.count) and (tempcode.item[i-1]='else') and (tempcode.item[i]='if')) then
    begin
     if((i<tempcode.count) and (tempcode.item[i-1]='else') and (tempcode.item[i]='if')) then
     j:=i+2 else j:=i+1;
     layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) then break;
       inc(j);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     k:=j+1;
     tempstr4:=tempstr;
     construct_c_expression(tempstr4,codelist,true);
     if(tempcode.item[k-1]='{') then
      begin
       layer:=0;
       while(k<=tempcode.count)do
        begin
         if(tempcode.item[k-1]='{') then inc(layer);
         if(tempcode.item[k-1]='}') then dec(layer);
         if(layer=0) then break;
         inc(k);
        end;
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,j+2,k-j-2);
      end
     else
      begin
       layer:=0; layer2:=0; bool:=true;
       while(k<=tempcode.count)do
        begin
         if(tempcode.item[k-1]='(') then inc(layer);
         if(tempcode.item[k-1]=')') then dec(layer);
         if(tempcode.item[k-1]='{') then
          begin
           if(layer=0) and (layer2=0) and (bool=true) then bool:=false;
           inc(layer2);
          end;
         if(tempcode.item[k-1]='}') then
          begin
           dec(layer2);
          end;
         if(layer=0) and (layer2=0) and ((tempcode.item[k-1]='if') or (tempcode.item[k-1]='while') or
         (tempcode.item[k-1]='for') or (tempcode.item[k-1]='else')
         or (tempcode.item[k-1]='do') or (tempcode.item[k-1]='switch')) then
          begin
           inc(k); bool:=true; continue;
          end;
         if(bool=false) and (layer=0) and (layer2=0) then break;
         if(bool=true) and (layer=0) and (layer2=0) and (tempcode.item[k-1]=';') then break;
         inc(k);
        end;
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,j+1,k-j);
      end;
     if(c_string_search_for_keyword(tempstr4,'?')>0) and
     (c_string_search_for_keyword(tempstr4,':')>0) then
      begin
       tempstr:=c_string_copy_item(tempcode,i,k-i+1);
       tempstr2.Count:=0;
       tempstr3.Count:=0;
      end;
     i:=k;
    end
   else if(tempcode.item[i-1]='else') then
    begin
     j:=i+1; layer:=0; layer2:=0;
     if(tempcode.item[j-1]='{') then
      begin
       while(j<=tempcode.count)do
        begin
         if(tempcode.item[j-1]='{') then inc(layer);
         if(tempcode.item[j-1]='}') then dec(layer);
         if(layer=0) then break;
         inc(j);
        end;
       tempstr:=c_string_copy_item(tempcode,i,1);
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,i+2,j-i-2);
      end
     else
      begin
       bool:=true;
       while(j<=tempcode.count)do
        begin
         if(tempcode.item[j-1]='(') then inc(layer);
         if(tempcode.item[j-1]=')') then dec(layer);
         if(tempcode.item[j-1]='{') then
          begin
           if(layer=0) and (layer2=0) and (bool=true) then bool:=false;
           inc(layer2);
          end;
         if(tempcode.item[j-1]='}') then
          begin
           dec(layer2);
          end;
         if(layer=0) and (layer2=0) and ((tempcode.item[j-1]='if') or (tempcode.item[j-1]='while') or
         (tempcode.item[j-1]='for') or (tempcode.item[j-1]='else')
         or (tempcode.item[j-1]='do') or (tempcode.item[j-1]='switch')) then
          begin
           inc(j); bool:=true; continue;
          end;
         if(bool=false) and (layer=0) and (layer2=0) then break;
         if(bool=true) and (layer=0) and (layer2=0) and (tempcode.item[j-1]=';') then break;
         inc(j);
        end;
       tempstr:=c_string_copy_item(tempcode,i,1);
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,i+1,j-i);
      end;
     i:=j;
    end
   else if(tempcode.item[i-1]='do') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='{') then inc(layer);
       if(tempcode.item[j-1]='}') then dec(layer);
       if(layer=0) and (j<tempcode.count) and (tempcode.item[j]='while') then break;
       inc(j);
      end;
     k:=j+2; layer:=0;
     while(k<=tempcode.count)do
      begin
       if(tempcode.item[k-1]='(') then inc(layer);
       if(tempcode.item[k-1]=')') then dec(layer);
       if(layer=0) and (tempcode.item[k-1]=';') then break;
       inc(k);
      end;
     tempstr:=c_string_copy_item(tempcode,i,1);
     tempstr2:=c_string_copy_item(tempcode,j+1,k-j);
     tempstr3:=c_string_copy_item(tempcode,i+1,j-i);
     tempstr4:=tempstr2;
     construct_c_expression(tempstr4,codelist,true);
     if(c_string_search_for_keyword(tempstr4,'?')>0) and
     (c_string_search_for_keyword(tempstr4,':')>0) then
      begin
       tempstr:=c_string_copy_item(tempcode,i,k-i+1);
       tempstr2.Count:=0;
       tempstr3.Count:=0;
      end;
     i:=k;
    end
   else if(tempcode.item[i-1]='switch') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) and (j<tempcode.count) and (tempcode.item[j]='{') then break;
       inc(j);
      end;
     k:=j+1; layer:=0;
     while(k<=tempcode.count)do
      begin
       if(tempcode.item[k-1]='{') then inc(layer);
       if(tempcode.item[k-1]='}') then dec(layer);
       if(layer=0) then break;
       inc(k);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     tempstr2.Count:=0;
     tempstr3:=c_string_copy_item(tempcode,j+2,k-j-2);
     tempstr4:=tempstr;
     construct_c_expression(tempstr4,codelist,true);
     if(c_string_search_for_keyword(tempstr4,'?')>0)
     and(c_string_search_for_keyword(tempstr4,':')>0) then
      begin
       tempstr:=c_string_copy_item(tempcode,i,k-i+1);
       tempstr2.Count:=0;
       tempstr3.Count:=0;
      end;
     i:=k;
    end
   else if(i<tempcode.count) and (tempcode.item[i]=':') then
    begin
     tempstr:=c_string_copy_item(tempcode,i,2);
     tempstr2.Count:=0;
     tempstr3.Count:=0;
     inc(i);
    end
   else if(tempcode.item[i-1]='goto') then
    begin
     tempstr:=c_string_copy_item(tempcode,i,3);
     tempstr2.Count:=0;
     tempstr3.Count:=0;
     inc(i,2);
    end
   else
    begin
     j:=i; layer:=0; layer2:=0; status:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(tempcode.item[j-1]='{') then inc(layer2);
       if(tempcode.item[j-1]='}') then dec(layer2);
       if(layer=0) and (layer2=0) and (tempcode.item[j-1]='enum') then status:=1;
       if(layer=0) and (layer2=0) and (tempcode.item[j-1]='=') then status:=2;
       if(layer>0) and (layer2=0) and (status=1) then status:=0;
       if(status>0) then
        begin
         if(layer=0) and (layer2=0) and (tempcode.item[j-1]=';') then break;
        end
       else
        begin
         if(layer=0) and (layer2=1) and (tempcode.item[j-1]='{') then break
         else if(layer=0) and (layer2=0) and (tempcode.item[j-1]=';') then break;
        end;
       inc(j);
      end;
     if(j>tempcode.count) then j:=tempcode.count;
     if(j=tempcode.count) or (tempcode.item[j-1]=';') then
      begin
       tempstr:=c_string_copy_item(tempcode,i,j-i+1);
       if(not c_string_detect_lambda(tempstr)) then bool2:=false else bool2:=true;
       if(bool2) then
        begin
         k:=j-1; layer2:=0;
         while(k>0)do
          begin
           if(tempcode.item[k-1]='{') then dec(layer2);
           if(tempcode.item[k-1]='}') then inc(layer2);
           if(layer2=0) then break;
           dec(k);
          end;
         tempstr:=c_string_copy_item(tempcode,i,k-i+1);
         tempstr2.Count:=0;
         tempstr3:=c_string_copy_item(tempcode,k+1,j-k-1);
         i:=j;
        end
       else
        begin
         tempstr:=c_string_copy_item(tempcode,i,j-i+1);
         tempstr2.Count:=0;
         tempstr3.Count:=0;
         i:=j;
        end;
      end
     else
      begin
       tempstr:=c_string_copy_item(tempcode,i,j-i);
       k:=j; layer:=0; layer2:=0;
       if(c_string_check_function(tempstr)
       or c_string_check_class_function(tempstr)
       or c_string_check_operator(tempstr)) then bool:=false else bool:=true;
       if(tempstr.count>=1) and (tempstr.item[0]='namespace') and (bool=true) then bool:=false;
       if(tempstr.count=2) and
       (tempstr.item[0]='extern') and ((tempstr.item[1]='"C"') or (tempstr.item[1]=#39'C'#39))
       and (bool=true) then bool:=false;
       while(k<=tempcode.Count)do
        begin
         if(tempcode.item[k-1]='{') then inc(layer);
         if(tempcode.item[k-1]='}') then dec(layer);
         if(tempcode.item[k-1]='(') then inc(layer2);
         if(tempcode.item[k-1]=')') then dec(layer2);
         if(layer=0) and (layer2=0) then break;
         inc(k);
        end;
       m:=k+1; layer2:=0;
       while(m<=tempcode.count) and (bool=true) do
        begin
         if(tempcode.item[m-1]='(') then inc(layer2);
         if(tempcode.item[m-1]=')') then dec(layer2);
         if(layer2=0) and (tempcode.item[m-1]=';') then break;
         if(layer2=0) and (tempcode.item[m-1]='}') then break;
         inc(m);
        end;
       tempstr4:=tempstr;
       construct_c_expression(tempstr4,gcodelist,true);
       if(bool) then
        begin
         if(c_string_compare(tempstr,tempstr4)=true) then
          begin
           tempstr2:=c_string_copy_item(tempcode,k+1,m-k);
           tempstr3:=c_string_copy_item(tempcode,j+1,k-j-1);
          end
         else
          begin
           tempstr:=c_string_copy_item(tempcode,i,m-i+1);
           tempstr2.count:=0;
           tempstr3.count:=0;
          end;
         i:=m;
        end
       else
        begin
         if(c_string_compare(tempstr,tempstr4)=true) then
          begin
           tempstr2.count:=0;
           tempstr3:=c_string_copy_item(tempcode,j+1,k-j-1);
          end
         else
          begin
           tempstr:=c_string_copy_item(tempcode,i,k-i+1);
           tempstr2.count:=0;
           tempstr3.count:=0;
          end;
         i:=k;
        end;
      end;
    end;
   if(res^.treetype=c_node_class) then
   tempitem:=construct_c_item(tempstr,tempstr2,codelist,1,2,pack)
   else if(res^.treetype=c_node_struct) then
   tempitem:=construct_c_item(tempstr,tempstr2,codelist,1,1,pack)
   else
   tempitem:=construct_c_item(tempstr,tempstr2,codelist,1,0,pack);
   if(tempitem.covtype=c_node_none) then
    begin
     inc(i); continue;
    end;
   if(tempitem.covtype<>c_node_unhandled) then
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(c_tree));
     (res^.child+res^.count-1)^.parent:=res;
     (res^.child+res^.count-1)^.codeseg:=iscodeseg;
     (res^.child+res^.count-1)^.treetype:=tempitem.covtype;
     (res^.child+res^.count-1)^.content:=tempitem.covcontent;
     (res^.child+res^.count-1)^.count:=0;
     (res^.child+res^.count-1)^.child:=nil;
     if(tempstr3.Count>0) then
     construct_c_node(tempstr3,res^.child+res^.count-1,pack,iscodeseg);
     if(j=tempcode.Count) then break;
     inc(i);
    end
   else
    begin
     myend:=i; i:=start;
     tempstr:=Pc_unhandled(tempitem.covcontent)^.content;
     c_string_delete_item(tempcode,i,myend-i+1);
     c_string_insert_string(tempstr,tempcode,i);
     Dispose(Pc_unhandled(tempitem.covcontent)); tempitem.covcontent:=nil;
     continue;
    end;
   if(tempitem.covtype=c_node_define) and (Pc_define(tempitem.covcontent)^.defstate=true) then
    begin
     inc(codelist.count);
     SetLength(codelist.define,codelist.count);
     codelist.define[codelist.count-1]:=Pc_define(tempitem.covcontent)^;
    end
   else if(tempitem.covtype=c_node_define) and (Pc_define(tempitem.covcontent)^.defstate=false) then
    begin
     n:=codelist.count;
     while(n>=gcodelist.count+1)do
      begin
       if(codelist.define[n-1].defname.item[0]
       =Pc_define(tempitem.covcontent)^.defname.item[0]) then break;
       dec(n);
      end;
     if(n>=gcodelist.count+1) then
      begin
       Delete(codelist.define,n-1,1); dec(codelist.count,1);
      end;
    end;
   tempitem.covtype:=c_node_none;
   tempitem.covcontent:=nil;
  end;
 SetLength(tempcode.item,0); SetLength(tempcode.status,0); tempcode.count:=0;
 SetLength(codelist.define,0); codelist.count:=0;
end;
function construct_c_tree(content:string):Pc_tree;
var i,j,k,m,n,layer,layer2,start,myend:SizeInt;
    codeseg,bool,bool2:boolean;
    pack:byte;
    tempcode,tempstr,tempstr2,tempstr3,tempstr4:c_string;
    tempitem:cov_item;
    status:byte=0;
    res:Pc_tree;
begin
 res:=initialize_c_tree; res^.treetype:=c_node_root;
 codeseg:=false; pack:=0;
 tempcode:=c_string_generate_from_string(content);
 gcodelist.count:=0;
 i:=1;
 while(i<=tempcode.Count)do
  begin
   start:=i; layer:=0;
   if(tempcode.item[i-1]='#') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) and (tempcode.status[j-1]=2) then break;
       inc(j);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     tempstr2.Count:=0;
     tempstr3.Count:=0;
     i:=j;
    end
   else if(tempcode.item[i-1]='{') then
    begin
     inc(i); continue;
    end
   else if(tempcode.item[i-1]='}') then
    begin
     inc(i); continue;
    end
   else if(tempcode.item[i-1]='case') or (tempcode.item[i-1]='default') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) and (tempcode.item[j-1]=':') then break;
       inc(j);
      end;
     k:=j; layer:=0; layer2:=0;
     while(k<=tempcode.count)do
      begin
       if(tempcode.item[k-1]='(') then inc(layer);
       if(tempcode.item[k-1]=')') then dec(layer);
       if(tempcode.item[k-1]='{') then inc(layer2);
       if(tempcode.item[k-1]='}') then dec(layer2);
       if(layer=0) and (layer2=0)
       and (k<tempcode.Count) and (tempcode.item[k]='case') then
        begin
         break;
        end;
       if(layer=0) and (layer2=0)
       and (k<tempcode.Count) and (tempcode.item[k]='default') then
        begin
         break;
        end;
       if(layer=0) and (layer2=0) and (k<tempcode.count)
       and (tempcode.item[k]='}') then break;
       if(k=tempcode.count) then break;
       inc(k);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     tempstr2.Count:=0;
     tempstr3:=c_string_copy_item(tempcode,j+1,k-j);
     i:=k;
    end
   else if(tempcode.item[i-1]='if') or (tempcode.item[i-1]='while') or
   (tempcode.item[i-1]='for') or
   ((i<tempcode.count) and (tempcode.item[i-1]='else') and (tempcode.item[i]='if')) then
    begin
     if((i<tempcode.count) and (tempcode.item[i-1]='else') and (tempcode.item[i]='if')) then
     j:=i+2 else j:=i+1;
     layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) then break;
       inc(j);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     k:=j+1;
     tempstr4:=tempstr;
     construct_c_expression(tempstr4,gcodelist,true);
     if(tempcode.item[k-1]='{') then
      begin
       layer:=0;
       while(k<=tempcode.count)do
        begin
         if(tempcode.item[k-1]='{') then inc(layer);
         if(tempcode.item[k-1]='}') then dec(layer);
         if(layer=0) then break;
         inc(k);
        end;
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,j+2,k-j-2);
      end
     else
      begin
       layer:=0; layer2:=0; bool:=true;
       while(k<=tempcode.count)do
        begin
         if(tempcode.item[k-1]='(') then inc(layer);
         if(tempcode.item[k-1]=')') then dec(layer);
         if(tempcode.item[k-1]='{') then
          begin
           if(layer=0) and (layer2=0) and (bool=true) then bool:=false;
           inc(layer2);
          end;
         if(tempcode.item[k-1]='}') then
          begin
           dec(layer2);
          end;
         if(layer=0) and (layer2=0) and((tempcode.item[k-1]='if') or (tempcode.item[k-1]='while') or
         (tempcode.item[k-1]='for') or (tempcode.item[k-1]='else')
         or (tempcode.item[k-1]='do') or (tempcode.item[k-1]='switch')) then
          begin
           inc(k); bool:=true; continue;
          end;
         if(bool=false) and (layer=0) and (layer2=0) then break;
         if(bool=true) and (layer=0) and (layer2=0) and (tempcode.item[k-1]=';') then break;
         inc(k);
        end;
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,j+1,k-j);
      end;
     if(c_string_search_for_keyword(tempstr4,'?')>0) and
     (c_string_search_for_keyword(tempstr4,':')>0) then
      begin
       tempstr:=c_string_copy_item(tempcode,i,k-i+1);
       tempstr2.Count:=0;
       tempstr3.Count:=0;
      end;
     i:=k;
    end
   else if(tempcode.item[i-1]='else') then
    begin
     j:=i+1; layer:=0; layer2:=0;
     if(tempcode.item[j-1]='{') then
      begin
       while(j<=tempcode.count)do
        begin
         if(tempcode.item[j-1]='{') then inc(layer);
         if(tempcode.item[j-1]='}') then dec(layer);
         if(layer=0) then break;
         inc(j);
        end;
       tempstr:=c_string_copy_item(tempcode,i,1);
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,i+2,j-i-2);
      end
     else
      begin
       bool:=false;
       while(j<=tempcode.count)do
        begin
         if(tempcode.item[j-1]='(') then inc(layer);
         if(tempcode.item[j-1]=')') then dec(layer);
         if(tempcode.item[j-1]='{') then
          begin
           if(layer=0) and (layer2=0) and (bool=true) then bool:=false;
           inc(layer2);
          end;
         if(tempcode.item[j-1]='}') then
          begin
           dec(layer2);
          end;
         if(layer=0) and (layer2=0) and ((tempcode.item[j-1]='if') or (tempcode.item[j-1]='while') or
         (tempcode.item[j-1]='for') or (tempcode.item[j-1]='else')
         or (tempcode.item[j-1]='do') or (tempcode.item[j-1]='switch')) then
          begin
           inc(j); continue;
           bool:=true;
          end;
         if(bool=false) and (layer=0) and (layer2=0) then break;
         if(bool=true) and (layer=0) and (layer2=0) and (tempcode.item[j-1]=';') then break;
         inc(j);
        end;
       tempstr:=c_string_copy_item(tempcode,i,1);
       tempstr2.Count:=0;
       tempstr3:=c_string_copy_item(tempcode,i+1,j-i);
      end;
     i:=j;
    end
   else if(tempcode.item[i-1]='do') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='{') then inc(layer);
       if(tempcode.item[j-1]='}') then dec(layer);
       if(layer=0) and (j<tempcode.count) and (tempcode.item[j]='while') then break;
       inc(j);
      end;
     k:=j+2; layer:=0;
     while(k<=tempcode.count)do
      begin
       if(tempcode.item[k-1]='(') then inc(layer);
       if(tempcode.item[k-1]=')') then dec(layer);
       if(layer=0) and (tempcode.item[k-1]=';') then break;
       inc(k);
      end;
     tempstr:=c_string_copy_item(tempcode,i,1);
     tempstr2:=c_string_copy_item(tempcode,j+1,k-j);
     tempstr3:=c_string_copy_item(tempcode,i+1,j-i);
     tempstr4:=tempstr2;
     construct_c_expression(tempstr4,gcodelist,true);
     if(c_string_search_for_keyword(tempstr4,'?')>0) and
     (c_string_search_for_keyword(tempstr4,':')>0) then
      begin
       tempstr:=c_string_copy_item(tempcode,i,k-i+1);
       tempstr2.Count:=0;
       tempstr3.Count:=0;
      end;
     i:=k;
    end
   else if(tempcode.item[i-1]='switch') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(layer=0) and (j<tempcode.count) and (tempcode.item[j]='{') then break;
       inc(j);
      end;
     k:=j+1; layer:=0;
     while(k<=tempcode.count)do
      begin
       if(tempcode.item[k-1]='{') then inc(layer);
       if(tempcode.item[k-1]='}') then dec(layer);
       if(layer=0) then break;
       inc(k);
      end;
     tempstr:=c_string_copy_item(tempcode,i,j-i+1);
     tempstr2.Count:=0;
     tempstr3:=c_string_copy_item(tempcode,j+2,k-j-2);
     tempstr4:=tempstr;
     construct_c_expression(tempstr4,gcodelist,true);
     if(c_string_search_for_keyword(tempstr4,'?')>0)
     and(c_string_search_for_keyword(tempstr4,':')>0) then
      begin
       tempstr:=c_string_copy_item(tempcode,i,k-i+1);
       tempstr2.Count:=0;
       tempstr3.Count:=0;
      end;
     i:=k;
    end
   else if(i<tempcode.count) and (tempcode.item[i]=':') then
    begin
     tempstr:=c_string_copy_item(tempcode,i,2);
     tempstr2.Count:=0;
     tempstr3.Count:=0;
     inc(i);
    end
   else if(tempcode.item[i-1]='goto') then
    begin
     tempstr:=c_string_copy_item(tempcode,i,3);
     tempstr2.Count:=0;
     tempstr3.Count:=0;
     inc(i,2);
    end
   else
    begin
     j:=i; layer:=0; layer2:=0; status:=0;
     while(j<=tempcode.count)do
      begin
       if(tempcode.item[j-1]='(') then inc(layer);
       if(tempcode.item[j-1]=')') then dec(layer);
       if(tempcode.item[j-1]='{') then inc(layer2);
       if(tempcode.item[j-1]='}') then dec(layer2);
       if(layer=0) and (layer2=0) and (tempcode.item[j-1]='enum') then status:=1;
       if(layer=0) and (layer2=0) and (tempcode.item[j-1]='=') then status:=2;
       if(layer>0) and (layer2=0) and (status=1) then status:=0;
       if(status>0) then
        begin
         if(layer=0) and (layer2=0) and (tempcode.item[j-1]=';') then break;
        end
       else
        begin
         if(layer=0) and (layer2=1) and (tempcode.item[j-1]='{') then break
         else if(layer=0) and (layer2=0) and (tempcode.item[j-1]=';') then break;
        end;
       inc(j);
      end;
     if(j>tempcode.count) then j:=tempcode.count;
     if(j=tempcode.count) or (tempcode.item[j-1]=';') then
      begin
       tempstr:=c_string_copy_item(tempcode,i,j-i+1);
       if(not c_string_detect_lambda(tempstr)) then bool2:=false else bool2:=true;
       if(bool2) then
        begin
         k:=j-1; layer2:=0;
         while(k>0)do
          begin
           if(tempcode.item[k-1]='{') then dec(layer2);
           if(tempcode.item[k-1]='}') then inc(layer2);
           if(layer2=0) then break;
           dec(k);
          end;
         tempstr:=c_string_copy_item(tempcode,i,k-i+1);
         tempstr2.Count:=0;
         tempstr3:=c_string_copy_item(tempcode,k+1,j-k-1);
         i:=j;
        end
       else
        begin
         tempstr:=c_string_copy_item(tempcode,i,j-i+1);
         tempstr2.Count:=0;
         tempstr3.Count:=0;
         i:=j;
        end;
      end
     else
      begin
       tempstr:=c_string_copy_item(tempcode,i,j-i);
       k:=j; layer:=0; layer2:=0;
       if(c_string_check_function(tempstr)) or
       (c_string_check_class_function(tempstr)) or
       (c_string_check_operator(tempstr)) then bool:=false else bool:=true;
       if(tempstr.count>=1) and (tempstr.item[0]='namespace') and (bool=true) then bool:=false;
       if(tempstr.count=2) and
       (tempstr.item[0]='extern') and ((tempstr.item[1]='"C"') or (tempstr.item[1]=#39'C'#39))
       and (bool=true) then bool:=false;
       while(k<=tempcode.Count)do
        begin
         if(tempcode.item[k-1]='{') then inc(layer);
         if(tempcode.item[k-1]='}') then dec(layer);
         if(tempcode.item[k-1]='(') then inc(layer2);
         if(tempcode.item[k-1]=')') then dec(layer2);
         if(layer=0) and (layer2=0) then break;
         inc(k);
        end;
       m:=k+1; layer2:=0;
       while(m<=tempcode.count) and (bool=true) do
        begin
         if(tempcode.item[m-1]='(') then inc(layer2);
         if(tempcode.item[m-1]=')') then dec(layer2);
         if(layer2=0) and (tempcode.item[m-1]=';') then break;
         if(layer2=0) and (tempcode.item[m-1]='}') then break;
         inc(m);
        end;
       tempstr4:=tempstr;
       construct_c_expression(tempstr4,gcodelist,true);
       if(bool) then
        begin
         if(c_string_compare(tempstr,tempstr4)=true) then
          begin
           tempstr2:=c_string_copy_item(tempcode,k+1,m-k);
           tempstr3:=c_string_copy_item(tempcode,j+1,k-j-1);
          end
         else
          begin
           tempstr:=c_string_copy_item(tempcode,i,m-i+1);
           tempstr2.count:=0;
           tempstr3.count:=0;
          end;
         i:=m;
        end
       else
        begin
         if(c_string_compare(tempstr,tempstr4)=true) then
          begin
           tempstr2.count:=0;
           tempstr3:=c_string_copy_item(tempcode,j+1,k-j-1);
          end
         else
          begin
           tempstr:=c_string_copy_item(tempcode,i,k-i+1);
           tempstr2.count:=0;
           tempstr3.count:=0;
          end;
         i:=k;
        end;
      end;
    end;
   tempitem:=construct_c_item(tempstr,tempstr2,gcodelist,1,0,pack);
   if(tempitem.covtype<>c_node_code_signal) and (tempitem.covtype<>c_node_unhandled) then
    begin
     if(tempitem.covtype=c_node_none) then
      begin
       inc(i); continue;
      end;
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(c_tree));
     (res^.child+res^.count-1)^.parent:=res;
     (res^.child+res^.count-1)^.codeseg:=codeseg;
     (res^.child+res^.count-1)^.treetype:=tempitem.covtype;
     (res^.child+res^.count-1)^.content:=tempitem.covcontent;
     (res^.child+res^.count-1)^.count:=0;
     (res^.child+res^.count-1)^.child:=nil;
     if(tempitem.covtype=c_node_pragma) and (Pc_pragma(tempitem.covcontent)^.pack>0) then pack:=1
     else if(tempitem.covtype=c_node_pragma) and (Pc_pragma(tempitem.covcontent)^.pack=0) then pack:=0;
     if(tempstr3.Count>0) then construct_c_node(tempstr3,res^.child+res^.count-1,pack,codeseg);
    end
   else if(tempitem.covtype=c_node_unhandled) then
    begin
     myend:=i; i:=start;
     tempstr:=Pc_unhandled(tempitem.covcontent)^.content;
     c_string_delete_item(tempcode,i,myend-i+1);
     c_string_insert_string(tempstr,tempcode,i);
     Dispose(Pc_unhandled(tempitem.covcontent)); tempitem.covcontent:=nil;
     continue;
    end
   else
    begin
     codeseg:=true;
     FreeMem(tempitem.covcontent);
     Dispose(Pc_code_seg(tempitem.covcontent)); tempitem.covcontent:=nil;
    end;
   if(tempitem.covtype=c_node_define) and (Pc_define(tempitem.covcontent)^.defstate=true) then
    begin
     inc(gcodelist.count);
     SetLength(gcodelist.define,gcodelist.count);
     gcodelist.define[gcodelist.count-1]:=Pc_define(tempitem.covcontent)^;
    end
   else if(tempitem.covtype=c_node_define) and (Pc_define(tempitem.covcontent)^.defstate=false) then
    begin
     n:=gcodelist.count;
     while(n>=1)do
      begin
       if(gcodelist.define[n-1].defname.item[0]
       =Pc_define(tempitem.covcontent)^.defname.item[0]) then break;
       dec(n);
      end;
     if(n>=1) then
      begin
       Delete(gcodelist.define,n-1,1); dec(gcodelist.count,1);
      end;
    end;
   tempitem.covtype:=0;
   tempitem.covcontent:=nil;
   inc(i);
  end;
 rehandle_c_tree_parent(res);
 SetLength(tempcode.item,0); SetLength(tempcode.status,0); tempcode.count:=0;
 SetLength(gcodelist.define,0); gcodelist.count:=0;
 construct_c_tree:=res;
end;
function initialize_pas_tree:Ppas_tree;
var res:Ppas_tree;
begin
 res:=allocmem(sizeof(pas_tree));
 res^.part:=false;
 res^.parent:=nil;
 res^.content:=nil;
 res^.child:=nil;
 res^.treetype:=pas_node_none;
 res^.count:=0;
 initialize_pas_tree:=res;
end;
function check_hex_char(const ch:char):boolean;
const hexchar1:string='0123456789ABCDEF';
      hexchar2:string='0123456789abcdef';
var i:SizeInt;
begin
 i:=1;
 while(i<=16) do
  begin
   if(hexchar1[i]=ch) then break;
   if(hexchar2[i]=ch) then break;
   inc(i);
  end;
 if(i>16) then check_hex_char:=false else check_hex_char:=true;
end;
function convert_c_string_to_pas_string(const cstr:string):string;
var i,j,len:SizeInt;
    flag:boolean;
    tempnum:word;
    iswidechar:boolean;
    tempstr,tempstr2:string;
begin
 i:=1; len:=length(cstr); tempstr:=''; flag:=true; iswidechar:=false;
 if(tydq_get_character(cstr,1)='L') then
  begin
   tempstr2:=copy(cstr,3,len-3);
   iswidechar:=true;
  end
 else
  begin
   tempstr2:=copy(cstr,2,len-2);
   iswidechar:=false;
  end;
 len:=length(tempstr2);
 while(i<=len)do
  begin
   if(tydq_get_character(tempstr2,i)='\') then
    begin
     if(flag=false) then
      begin
       flag:=true; tempstr:=tempstr+#39;
      end;
     if(tydq_get_character(tempstr2,i+1)='0')
     and ((tydq_get_character(tempstr2,i+2)<'0') or (tydq_get_character(tempstr2,i+2)>'7')) then
      begin
       tempstr:=tempstr+'#0'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='a') then
      begin
       tempstr:=tempstr+'#7'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='b') then
      begin
       tempstr:=tempstr+'#8'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='t') then
      begin
       tempstr:=tempstr+'#9'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='n') then
      begin
       tempstr:=tempstr+'#10'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='v') then
      begin
       tempstr:=tempstr+'#11'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='f') then
      begin
       tempstr:=tempstr+'#12'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='r') then
      begin
       tempstr:=tempstr+'#13'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)=#39) then
      begin
       tempstr:=tempstr+'#39'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='?') then
      begin
       tempstr:=tempstr+'?'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='\') then
      begin
       tempstr:=tempstr+'\'; inc(i,2); continue;
      end
     else if(tydq_get_character(tempstr2,i+1)>='0') and (tydq_get_character(tempstr2,i+1)<='7') then
      begin
       j:=i+1; tempnum:=0;
       while(j<=len) and (tydq_get_character(tempstr2,j)>='0')
       and (tydq_get_character(tempstr2,j)<='7') and
       (((iswidechar=true) and (j-i<=6)) or ((iswidechar=false) and (j-i<=3))) do
        begin
         tempnum:=tempnum*8+Word(tydq_get_character(tempstr2,j))-Word(tydq_get_character(tempstr2,j));
         inc(j);
        end;
       tempstr:=tempstr+'#'+IntToStr(tempnum);
       i:=j; continue;
      end
     else if(tydq_get_character(tempstr2,i+1)='x') then
      begin
       j:=i+2; tempnum:=0;
       tempstr:=tempstr+'#$';
       while(j<=len) and (check_hex_char(tydq_get_character(tempstr2,j))) and
       (((iswidechar=true) and (j-i<=5)) or ((iswidechar=false) and (j-i<=3))) do
        begin
         tempstr:=tempstr+tydq_get_character(tempstr2,j);
         inc(j);
        end;
       i:=j; continue;
      end;
    end
   else
    begin
     if(flag=true) then
      begin
       flag:=false; tempstr:=tempstr+#39;
      end;
     tempstr:=tempstr+tydq_get_character(tempstr2,i);
     if(i=len) then
      begin
       tempstr:=tempstr+#39;
      end;
    end;
   inc(i);
  end;
 if(length(tempstr)=1) then
  begin
   tempstr:=#39+tempstr+#39;
  end;
 convert_c_string_to_pas_string:=tempstr;
end;
function string_get_length(str:string;pas:boolean=false):SizeInt;
var i,j,len,surlen:SizeInt;
    iswide,ister:boolean;
    flag:boolean;
    tempstr:string;
begin
 i:=1; len:=0; surlen:=length(str); iswide:=false; ister:=false;
 if(pas) then
  begin
   flag:=false;
   while(i<=surlen)do
    begin
     if(i<=surlen-1) and (str[i]='#') and (str[i+1]='$') then
      begin
       j:=i+2;
       while(j<=surlen) and (j-i<5) do
        begin
         if(check_hex_char(str[j])=false) then break;
         inc(j);
        end;
       inc(len);
       if(j>surlen) then break;
       if(check_hex_char(str[j])=false) then dec(j);
       i:=j+1;
       continue;
      end
     else if(i<=surlen) and (str[i]='#') then
      begin
       j:=i+1;
       while(j<=surlen) and (j-i<5) do
        begin
         if(str[j]>='0') and (str[j]<='9') then break;
         inc(j);
        end;
       inc(len);
       if(j>surlen) then break;
       if(str[j]>='0') and (str[j]<='9') then dec(j);
       i:=j+1;
       continue;
      end
     else if(str[i]=#39) and (flag=false) then
      begin
       flag:=true;
      end
     else if(str[i]=#39) and (flag=true) then
      begin
       flag:=false;
      end
     else if(str[i]<>#39) and (flag=false) then
      begin
       exit(-1);
      end
     else if(flag=true) then
      begin
       inc(len);
      end;
     inc(i);
    end;
  end
 else
  begin
   if(length(str)>0) and (str[i]='L') then
    begin
     if(str[2]<>'"') and (str[2]<>#39) then exit(-1);
     iswide:=true; tempstr:=Copy(str,3,surlen-3);
     if(str[2]='"') then ister:=true else ister:=false;
    end
   else
    begin
     if(str[1]<>'"') and (str[1]<>#39) then exit(-1);
     iswide:=false; tempstr:=Copy(str,2,surlen-2);
     if(str[1]='"') then ister:=true else ister:=false;
    end;
   surlen:=length(tempstr);
   while(i<=surlen) do
    begin
     if(tempstr[i]='\') then
      begin
       if(i<surlen-1) and (tempstr[i+1]='0') and (tempstr[i+2]>='0') and (tempstr[i+2]<='7') then
        begin
         j:=i+2;
         while(j<=surlen) and (j-i<5) and (iswide=true) do
          begin
           if(tempstr[j]<'0') or (tempstr[j]>'7') then break;
           inc(j);
          end;
         while(j<=surlen) and (j-i<3) and (iswide=false) do
          begin
           if(tempstr[j]<'0') or (tempstr[j]>'7') then break;
           inc(j);
          end;
         inc(len);
         if(j>surlen) then break;
         if(tempstr[j]<'0') or (tempstr[j]>'7') then dec(j);
         i:=j+1;
         continue;
        end
       else if(i<surlen-1) and (tempstr[i+1]='0') and ((tempstr[i+2]<'0') or (tempstr[i+2]>'7')) then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen-1) and (tempstr[i+1]='x') then
        begin
         j:=i+2;
         while(j<=surlen) and (j-i<5) and (iswide=true) do
          begin
           if(check_hex_char(tempstr[i])=false) then break;
           inc(j);
          end;
         while(j<=surlen) and (j-i<3) and (iswide=false) do
          begin
           if(check_hex_char(tempstr[i])=false) then break;
           inc(j);
          end;
         inc(len);
         if(j>surlen) then break;
         if(check_hex_char(tempstr[i])=false) then dec(j);
         i:=j+1;
         continue;
        end
       else if(i=surlen-1) and (tempstr[i+1]='0') then
        begin
         inc(i,2); inc(len); ister:=true; continue;
        end
       else if(i<surlen) and (tempstr[i+1]='0') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='a') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='b') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='t') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='n') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='v') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='f') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='r') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='"') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]=#39) then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='\') then
        begin
         inc(i,2); inc(len); continue;
        end
       else if(i<surlen) and (tempstr[i+1]='?') then
        begin
         inc(i,2); inc(len); continue;
        end;
      end
     else inc(len);
     inc(i);
    end;
   if(ister=false) then dec(len);
  end;
 string_get_length:=len;
end;
function convert_c_asm_string_to_pas_asm_string(const asmstr:string):c_string;
var res:c_string;
    i,len:SizeInt;
    tempstr:string;
begin
 i:=1;
 if(tydq_get_character(asmstr,1)='L') then
  begin
   tempstr:=copy(asmstr,3,length(asmstr)-3);
   Trim(tempstr);
  end
 else
  begin
   tempstr:=copy(asmstr,2,length(asmstr)-2);
   Trim(tempstr);
  end;
 len:=length(tempstr);
 while(i<=len) do
  begin
   if(copy(tempstr,i,4)='\n\t') then
    begin
     delete(tempstr,i,4);
     insert(#10,tempstr,i);
    end
   else if(copy(tempstr,i,2)='\n') then
    begin
     delete(tempstr,i,2);
     insert(#10,tempstr,i);
    end
   else if(tydq_get_character(tempstr,i)=';') then
    begin
     tempstr[i]:=#10;
    end;
   inc(i);
  end;
 res:=c_string_generate_from_string(tempstr);
 res.status[res.count-1]:=2;
 convert_c_asm_string_to_pas_asm_string:=res;
end;
function convert_c_asm_to_pas_asm(const casm:Pc_asm):Ppas_asm;
var i,j:SizeInt;
    tempstr1:string;
    tempstr:c_string;
    tempasm:cov_asm;
    res:Ppas_asm;
begin
 tempasm.asmcount:=0;
 i:=3;
 while(i<=casm^.asminput.count)do
  begin
   inc(tempasm.asmcount);
   SetLength(tempasm.asmreg,tempasm.asmcount);
   tempasm.asmreg[tempasm.asmcount-1]:=casm^.asminput.item[i-1];
   inc(i,5);
  end;
 i:=3;
 while(i<=casm^.asmoutput.count)do
  begin
   inc(tempasm.asmcount);
   SetLength(tempasm.asmreg,tempasm.asmcount);
   tempasm.asmreg[tempasm.asmcount-1]:=casm^.asmoutput.item[i-1];
   inc(i,5);
  end;
 tempstr.Count:=0;
 i:=1;
 while(i<casm^.asmcode.count)do
  begin
   c_string_insert_string(
   convert_c_asm_string_to_pas_asm_string(casm^.asmcode.item[i-1]),
   tempstr,tempstr.Count+1);
   inc(i);
  end;
 i:=1;
 while(i<=tempstr.count) do
  begin
   if(i<=tempstr.count-1) and (tempstr.item[i-1]='%') then
    begin
     j:=0;
     while(j<=tempasm.asmcount-1) do
      begin
       tempstr1:=IntToStr(j);
       if(tempstr.item[i]=tempstr1) then
        begin
         c_string_delete_item(tempstr,i,2);
         c_string_insert_item(tempasm.asmreg[j-1],tempstr,i);
         break;
        end;
       inc(j);
      end;
    end;
   inc(i);
  end;
 New(res);
 res^.count:=0;
 i:=1; j:=1;
 while(i<=tempstr.count) do
  begin
   if(tempstr.status[i-1]=2) then
    begin
     inc(res^.count);
     SetLength(res^.code,res^.count);
     res^.code[res^.count-1]:=c_string_copy_item(tempstr,j,i-j+1);
     i:=j+1; continue;
    end;
   inc(i);
  end;
 convert_c_asm_to_pas_asm:=res;
end;
function c_type_to_pas_type(const ctype:string):cov_type;
var i,j,layer,len,count:SizeInt;
    tempstr2,tempstr3:string;
    tempcstr:c_string;
    res:cov_type;
begin
 len:=length(ctype); i:=len; j:=1; count:=0;
 while(i>0)do
  begin
   if(tydq_get_character(ctype,i)<>'*') then break;
   inc(count);
   dec(i);
  end;
 tempstr2:=Trim(copy(ctype,1,i));
 if(tempstr2='bool') then
  begin
   tempstr3:='Boolean';
  end
 else if(tempstr2='UINT8') or (tempstr2='uint8') or (tempstr2='unsigned char')
 or (tempstr2='uint8_t') then
  begin
   tempstr3:='Byte';
  end
 else if(tempstr2='INT8') or (tempstr2='int8') or (tempstr2='int8_t') then
  begin
   tempstr3:='SmallInt';
  end
 else if(tempstr2='signed char') or (tempstr2='char') then
  begin
   tempstr3:='Char';
  end
 else if(tempstr2='UINT16') or (tempstr2='uint16') or (tempstr2='unsigned short')
 or (tempstr2='uint16_t') then
  begin
   tempstr3:='Word';
  end
 else if(tempstr2='INT16') or (tempstr2='int16') or (tempstr2='signed short') or (tempstr2='short')
 or (tempstr2='int16_t') then
  begin
   tempstr3:='Shortint';
  end
 else if(tempstr2='UINT32') or (tempstr2='uint32') or (tempstr2='unsigned int')
 or (tempstr2='unsigned') or (tempstr2='unsigned long')
 or (tempstr2='uint32_t') then
  begin
   tempstr3:='Dword';
  end
 else if(tempstr2='INT32') or (tempstr2='int32') or (tempstr2='int32_t')
 or (tempstr2='signed int') or (tempstr2='signed') or (tempstr2='int') or (tempstr2='long') then
  begin
   tempstr3:='Integer';
  end
 else if(tempstr2='UINT64') or (tempstr2='uint64') or (tempstr2='uint64_t')
 or (tempstr2='unsigned long long') or (tempstr2='unsigned long long int') then
  begin
   tempstr3:='Qword';
  end
 else if(tempstr2='INT64') or (tempstr2='int64') or (tempstr2='long long')
 or (tempstr2='signed long long') or (tempstr2='signed long long int') or
 (tempstr2='int64_t') or (tempstr2='long long int') then
  begin
   tempstr3:='Int64';
  end
 else if(tempstr2='INT96') or (tempstr2='int96') or (tempstr2='int96_t') then
  begin
   tempstr3:='Int96';
  end
 else if(tempstr2='UINT96') or (tempstr2='uint96') or (tempstr2='uint96_t') then
  begin
   tempstr3:='UInt96';
  end
 else if(tempstr2='INT128') or (tempstr2='int128') or (tempstr2='int128_t') then
  begin
   tempstr3:='Int128';
  end
 else if(tempstr2='UINT128') or (tempstr2='uint128') or (tempstr2='uint128_t') then
  begin
   tempstr3:='UInt128';
  end
 else if(tempstr2='float') then
  begin
   tempstr3:='Float';
  end
 else if(tempstr2='double') then
  begin
   tempstr3:='Double';
  end
 else if(tempstr2='long double') then
  begin
   tempstr3:='Extended';
  end
 else if(tempstr2='wchar_t') then
  begin
   tempstr3:='WideChar';
  end
 else if(tempstr2='size_t') then
  begin
   tempstr3:='SizeUInt';
  end
 else if(tempstr2='va_list') then
  begin
   tempstr3:='Char'; inc(count);
  end
 else if(tempstr2='ptrdiff_t') then
  begin
   tempstr3:='Integer';
  end
 else if(tempstr2='fpos_t') then
  begin
   tempstr3:='Integer';
  end
 else if(tempstr2='FILE') or (tempstr2='file') then
  begin
   tempstr3:='Thandle';
  end
 else if(tempstr2='auto') or (tempstr2='AUTO') then
  begin
   tempstr3:='Variant';
  end
 else if(tempstr2='lpcstr') or (tempstr2='LPCSTR') then
  begin
   tempstr3:='Char'; inc(count);
  end
 else if(tempstr2='lpwstr') or (tempstr2='LPWSTR') then
  begin
   tempstr3:='WideChar'; inc(count);
  end
 else if(tempstr2='lpcwstr') or (tempstr2='LPCWSTR') then
  begin
   tempstr3:='Widechar'; inc(count);
  end
 else if(copy(tempstr2,1,6)='struct') then
  begin
   tempstr3:=Trim(copy(tempstr2,8,i-7));
  end
 else if(copy(tempstr2,1,5)='union') then
  begin
   tempstr3:=Trim(copy(tempstr2,7,i-6));
  end
 else if(copy(tempstr2,1,4)='enum') then
  begin
   tempstr3:=Trim(copy(tempstr2,6,i-5));
  end
 else if(tempstr2='void') and (count=1) then
  begin
   tempstr3:='Pointer'; j:=2;
  end
 else if(tempstr2='void') and (count>1) then
  begin
   tempstr3:='Pointer'; j:=2;
  end
 else if(tempstr2='void') and (count<1) then
  begin
   tempstr3:=''; j:=1;
  end
 else if(tempstr2='typename') then
  begin
   tempstr3:=Trim(copy(tempstr2,10,i-9));
  end
 else if(tempstr2='typename...') then
  begin
   tempstr3:=Trim(Copy(tempstr2,12,i-11));
  end
 else
  begin
   tempcstr:=c_string_generate_from_string(tempstr2,true);
   i:=1; layer:=0;
   while(i<=tempcstr.count)do
    begin
     if(i<=0) then i:=1;
     if(tempcstr.item[i-1]='<') then inc(layer);
     if(tempcstr.item[i-1]='>') then dec(layer);
     if(layer>=2) and (tempcstr.item[i-1]='>>') then
      begin
       tempcstr.item[i-1]:='>'; c_string_insert_item('>',tempcstr,i+1);
       dec(layer,2);
      end;
     if(tempcstr.item[i-1]='::') then tempcstr.item[i-1]:='.';
     if(tempcstr.item[i-1]='vector') then tempcstr.item[i-1]:='TArray';
     if(i>1) and (tempcstr.item[i-2]='std') and (tempcstr.item[i-1]='.') then
      begin
       c_string_delete_item(tempcstr,i-1,2); dec(i); continue;
      end;
     if(tempcstr.item[i-1]='list') then tempcstr.item[i-1]:='TList';
     if(tempcstr.item[i-1]='initialize_list') then tempcstr.item[i-1]:='TList';
     if(tempcstr.item[i-1]='queue') then tempcstr.item[i-1]:='TQueue';
     if(tempcstr.item[i-1]='stack') then tempcstr.item[i-1]:='TStack';
     inc(i,1);
    end;
   i:=1;
   while(i<=tempcstr.count)do
    begin
     if(i>1) and (tempcstr.item[i-1]='<') then
      begin
       c_string_insert_item('specialize',tempcstr,i-1);
       inc(i,2); continue;
      end;
     inc(i);
    end;
   tempstr3:=c_string_to_string(tempcstr);
  end;
 if(tempstr2='void') and (count<1) then
  begin
   res.ctype:=''; res.clayer:=0;
  end
 else
  begin
   res.ctype:=tempstr3; res.clayer:=count-j+1;
  end;
 c_type_to_pas_type:=res;
end;
function c_string_check_function_pointer(str:c_string):boolean;
var count:byte;
    i,layer:SizeInt;
begin
 i:=1; count:=0; layer:=0;
 while(i<=str.count)do
  begin
   if(str.item[i-1]='(') then inc(layer);
   if(str.item[i-1]=')') then dec(layer);
   if(layer=0) and (str.item[i-1]=')') then
    begin
     inc(count); inc(i); continue;
    end;
   if(layer=0) and (count>0) and (str.item[i-1]<>'(') then break;
   if(count<2) and (layer=0) and (str.item[i-1]='=') then exit(false);
   inc(i);
  end;
 if(count>=2) then c_string_check_function_pointer:=true
 else c_string_check_function_pointer:=false;
end;
function convert_c_param_to_pas_param(const cparam:c_string):pas_temp;
var i,j,k,layer:SizeInt;
    bool:boolean;
    tempstr,tempstr2,tempstr3:string;
    tempparam,tempcstr:c_string;
    ctype:cov_type;
    covparam:cov_param;
    res:pas_temp;
begin
 i:=1; tempparam:=cparam; res.temptypecount:=0; bool:=false;
 covparam.isconst:=false; covparam.isquoted:=false;
 covparam.pname:=''; covparam.ptype:=''; covparam.phavevalue:=false;
 while(i<=tempparam.count)do
  begin
   if(tempparam.item[i-1]='const') or (tempparam.item[i-1]='CONST') then
    begin
     c_string_delete_item(tempparam,i,1); covparam.isconst:=true; continue;
    end
   else if(tempparam.item[i-1]='register') then
    begin
     c_string_delete_item(tempparam,i,1); continue;
    end
   else if(tempparam.item[i-1]='IN') or (tempparam.item[i-1]='in')
   or (tempparam.item[i-1]='OUT') or (tempparam.item[i-1]='out') then
    begin
     c_string_delete_item(tempparam,i,1); continue;
    end
   else if(tempparam.item[i-1]='&') then
    begin
     c_string_delete_item(tempparam,i,1); covparam.isquoted:=true; continue;
    end
   else if(tempparam.item[i-1]='=') then
    begin
     covparam.phavevalue:=true;
     covparam.pvalue:=c_string_copy_item(tempparam,i+1,tempparam.count-i);
     c_string_delete_item(tempparam,i,tempparam.count-i+1);
    end
   else if(tempparam.item[i-1]='ATTRIBUTE_UNUSED') then
    begin
     c_string_delete_item(tempparam,i,1); bool:=true; continue;
    end
   else if(tempparam.item[i-1]='__attribute__') then
    begin
     j:=i+1; k:=i+1; layer:=0;
     while(j<=tempparam.count)do
      begin
       if(tempparam.item[j-1]='(') then inc(layer);
       if(tempparam.item[j-1]=')') then dec(layer);
       if(layer=2) and (tempparam.item[j-1]='(') then
        begin
         k:=j+1;
        end
       else if(layer=1) and (tempparam.item[j-1]=')') then
        begin
         tempcstr:=c_string_copy_item(tempparam,k,j-k);
         if(tempcstr.item[0]='unused') then bool:=true
         else if(tempcstr.item[0]='used') then bool:=false;
         k:=j+1; inc(j,1); break;
        end
       else if(layer=2) and (tempparam.item[j-1]=',') then
        begin
         tempcstr:=c_string_copy_item(tempparam,k,j-k);
         if(tempcstr.item[0]='unused') then bool:=true
         else if(tempcstr.item[0]='used') then bool:=false;
         k:=j+1;
        end;
       inc(j);
      end;
     c_string_delete_item(tempparam,i,j-i+1); continue;
    end;
   inc(i);
  end;
 if(bool) then
  begin
   res.exp.count:=0; exit(res);
  end;
 i:=1;
 if(tempparam.count=0) then
  begin
   res.exp.count:=0; exit(res);
  end
 else if(tempparam.count=1) and (tempparam.item[0]='...') then
  begin
   res.exp:=c_string_generate_from_string('param:array of variant',true);
  end
 else if(tempparam.count=1) and (tempparam.item[0]='void') then
  begin
   res.exp.count:=0; exit(res);
  end
 else if(tempparam.count>=1) then
  begin
   i:=1; j:=c_string_divide_type_and_name(tempparam,0);
   tempstr:='';
   while(i<=j)do
    begin
     tempstr:=tempstr+tempparam.item[i-1];
     if(i<j) and (tempparam.item[i-1]<>'*') and (tempparam.item[i]<>'*') then
     tempstr:=tempstr+' ';
     inc(i);
    end;
   c_string_delete_item(tempparam,1,j);
   ctype:=c_type_to_pas_type(tempstr);
   tempstr:=ctype.ctype;
   if(Pos('specialize',tempstr)>0) then
    begin
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:='gen'+IntToStr(newgenindex);
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr,true);
     tempstr:='gen'+IntToStr(newgenindex);
     inc(newgenindex);
    end;
   for i:=1 to ctype.clayer do
    begin
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:='P'+tempstr;
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string('^'+tempstr,true);
     tempstr:='P'+tempstr;
    end;
   i:=2; j:=3; layer:=0; covparam.parrc:=0; tempstr3:='';
   if(tempparam.count>0) then covparam.pname:=tempparam.item[0] else covparam.pname:='';
   while(i<=tempparam.count)do
    begin
     if(tempparam.item[i-1]='[') then inc(layer);
     if(tempparam.item[i-1]=']') then dec(layer);
     if(layer=0) and (tempparam.item[i-1]=']') then
      begin
       inc(covparam.parrc);
       SetLength(covparam.parrd,covparam.parrc);
       if(covparam.parrc=1) then tempstr3:='array[' else tempstr3:=tempstr3+',';
       covparam.parrd[covparam.parrc-1]:=c_string_copy_item(tempparam,j+1,i-j-1);
       if(covparam.parrd[covparam.parrc-1].count>0) then
        begin
         tempstr3:=tempstr3+'0..'+c_string_to_string(covparam.parrd[covparam.parrc-1])+'-1';
        end
       else
        begin
         tempstr3:=tempstr3+'0..0';
        end;
       j:=i+1;
      end;
     inc(i);
    end;
   if(tempstr3<>'') then tempstr3:=tempstr3+'] of '+tempstr;
   if(covparam.parrc>0) then
    begin
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:='arr'+IntToStr(newarrayindex);
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr3,true);
     res.exp:=c_string_generate_from_string(covparam.pname+':'+'arr'+IntToStr(newarrayindex),true);
     if(covparam.phavevalue) then
      begin
       c_string_insert_item('=',res.exp,res.exp.count+1);
       c_string_insert_string(covparam.pvalue,res.exp,res.exp.count+1);
      end;
     inc(newarrayindex);
    end
   else
    begin
     res.exp:=c_string_generate_from_string(covparam.pname+':'+tempstr,true);
     if(covparam.phavevalue) then
      begin
       c_string_insert_item('=',res.exp,res.exp.count+1);
       c_string_insert_string(covparam.pvalue,res.exp,res.exp.count+1);
      end;
    end;
   if(covparam.isquoted) then
    begin
     c_string_insert_item('var',res.exp,1);
    end
   else if(covparam.isconst) then
    begin
     c_string_insert_item('const',res.exp,1);
    end;
  end;
 convert_c_param_to_pas_param:=res;
end;
function converter_get_main_bracket_number(const str:c_string):SizeInt;
var i,j,layer,layer2,count:SizeInt;
begin
 i:=1; count:=0; layer:=0;
 while(i<=str.count)do
  begin
   if(str.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer2:=0;
     while(j<=str.count)do
      begin
       if(str.item[j-1]='(') then inc(layer2);
       if(str.item[j-1]=')') then dec(layer2);
       inc(j);
      end;
     i:=j+1; continue;
    end;
   if(str.item[i-1]='(') then inc(layer);
   if(str.item[i-1]=')') then dec(layer);
   if(layer=0) and (str.item[i-1]=')') then inc(count);
   inc(i);
  end;
 converter_get_main_bracket_number:=count;
end;
function convert_c_func_pointer_to_pas_func_pointer(const cfuncp:c_string;istype:boolean=false):pas_temp;
var i,j,k,m,n,l,count,layer,layer2,layer3:SizeInt;
    func,tempfunc:cov_func;
    bool,defbool,enterfunc:boolean;
    covtype:cov_type;
    covarr:cov_array;
    paramindex:SizeInt=0;
    tempstr,tempstr2,tempstr3,tempstr4,tempstr6:string;
    defvalue:c_string;
    tempfuncp,tempcstr1,tempcstr2,tempcstr3,tempcstr4,tempcstr5,tempcstr6:c_string;
    res,tempres:pas_temp;
begin
 i:=1; res.temptypecount:=0; count:=0;
 tempfuncp:=cfuncp; res.exp.count:=0;
 i:=1; j:=0; k:=1; m:=1; layer:=0; defbool:=false;
 func.abi:='cdecl'; func.alias:=''; func.isasm:=false;
 func.isinline:=false; func.resulttype:='';
 func.name:=''; func.conv:=''; func.layer:=0;
 tempfunc.abi:='cdecl'; tempfunc.alias:=''; tempfunc.isasm:=false;
 tempfunc.isinline:=false; tempfunc.resulttype:='';
 tempfunc.name:=''; tempfunc.conv:=''; tempfunc.layer:=0;
 while(i<=tempfuncp.count)do
  begin
   if(tempfuncp.item[i-1]='(') and (j=0) then
    begin
     j:=i-1;
    end;
   if(tempfuncp.item[i-1]='(') then
    begin
     inc(layer);
     if(layer=1) then k:=i+1;
    end;
   if(layer=0) and (tempfuncp.item[i-1]='=') then
    begin
     defvalue:=c_string_copy_item(tempfuncp,i,tempfuncp.count-i+1);
     c_string_delete_item(tempfuncp,i,tempfuncp.count-i+1);
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__asm') then
    begin
     func.isasm:=true; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__extension__') then
    begin
     c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='ATTRIBUTE_NONNULL') then
    begin
     c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='ATTRIBUTE_NORETURN') then
    begin
     c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='inline') then
    begin
     func.isinline:=true; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='EFIAPI') then
    begin
     func.abi:='efiapi'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__cdecl') then
    begin
     func.conv:='cdecl'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__pascal') then
    begin
     func.conv:='pascal'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__stdcall') then
    begin
     func.conv:='stdcall'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__fastcall') then
    begin
     func.conv:='fastcall'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__thiscall') then
    begin
     func.conv:='thiscall'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='WINAPI') then
    begin
     func.abi:='winapi'; c_string_delete_item(tempfuncp,i,1); continue;
    end
   else if(layer=0) and (tempfuncp.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer2:=0;
     while(j<=tempfuncp.count)do
      begin
       if(tempfuncp.item[j-1]='(') then
        begin
         inc(layer2); n:=j+1;
        end;
       if(tempfuncp.item[j-1]=')') then dec(layer2);
       if(tempfuncp.item[j-1]=',') and (layer2=2) then
        begin
         tempcstr4:=c_string_copy_item(tempfuncp,n,j-n);
         if(tempcstr4.item[0]='alias') or (tempcstr4.item[0]='__alias__') then
          begin
           func.alias:=tempcstr4.item[2];
          end
         else if(tempcstr4.item[0]='__ms_abi__') or (tempcstr4.item[0]='ms_abi') then
          begin
           func.abi:='ms_abi_default';
          end
         else if(tempcstr4.item[0]='__sysv_abi__') or (tempcstr4.item[0]='sysv_abi') then
          begin
           func.abi:='sysv_abi_default';
          end;
         n:=j+1;
        end
       else if(tempfuncp.item[j-1]=')') and (layer=2) then
        begin
         tempcstr4:=c_string_copy_item(tempfuncp,n,j-n);
         if(tempcstr4.item[0]='alias') or (tempcstr4.item[0]='__alias__') then
          begin
           func.alias:=tempcstr4.item[2];
          end
         else if(tempcstr4.item[0]='__ms_abi__') or (tempcstr4.item[0]='ms_abi') then
          begin
           func.abi:='ms_abi_default';
          end
         else if(tempcstr4.item[0]='__sysv_abi__') or (tempcstr4.item[0]='sysv_abi') then
          begin
           func.abi:='sysv_abi_default';
          end;
         n:=j+1;
        end;
       inc(j);
      end;
     c_string_delete_item(tempfuncp,i,j-i+1); continue;
    end;
   if(tempfuncp.item[i-1]=')') then
    begin
     dec(layer);
     if(layer=0) then
      begin
       inc(count);
       m:=i-1;
       if(count=1) then
        begin
         tempcstr1:=c_string_copy_item(tempfuncp,k,m-k+1);
         c_string_delete_item(tempfuncp,k-1,m-k+3);
        end
       else if(count=2) then
        begin
         tempcstr2:=c_string_copy_item(tempfuncp,k,m-k+1);
         c_string_delete_item(tempfuncp,k-1,m-k+3);
        end;
       i:=k-1; continue;
      end;
    end;
   inc(i);
  end;
 tempstr:='';
 i:=1;
 while(i<=j)do
  begin
   tempstr:=tempstr+tempfuncp.item[i-1];
   if(i<j) and (tempfuncp.item[i-1]<>'*') and (tempfuncp.item[i]<>'*') then
   tempstr:=tempstr+' ';
   inc(i);
  end;
 covtype:=c_type_to_pas_type(tempstr);
 i:=1; tempstr:=covtype.ctype;
 while(i<=covtype.clayer)do
  begin
   inc(res.temptypecount);
   SetLength(res.temptype,res.temptypecount);
   res.temptype[res.temptypecount-1].newname:='P'+tempstr;
   res.temptype[res.temptypecount-1].oldname:=
   c_string_generate_from_string('^'+tempstr,true);
   tempstr:='P'+tempstr;
   inc(i);
  end;
 i:=1; m:=1; n:=1; count:=0; layer:=0; layer2:=0; bool:=false;
 func.count:=0; tempfunc.count:=0;
 covarr.arrc:=0;
 while(i<=tempcstr1.count) do
  begin
   if(tempcstr1.item[i-1]='__asm') then
    begin
     func.isasm:=true; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='inline') then
    begin
     func.isinline:=true; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='ATTRIBUTE_NONNULL') then
    begin
     c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='ATTRIBUTE_NORETURN') then
    begin
     c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='EFIAPI') then
    begin
     func.abi:='efiapi'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='WINAPI') then
    begin
     func.abi:='winapi'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='__cdecl') then
    begin
     func.conv:='cdecl'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='__pascal') then
    begin
     func.conv:='pascal'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='__stdcall') then
    begin
     func.conv:='stdcall'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='__fastcall') then
    begin
     func.conv:='fastcall'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='__thiscall') then
    begin
     func.conv:='thiscall'; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='__attribute__') then
    begin
     j:=i+1; k:=i+3;
     while(j<=tempcstr1.count)do
      begin
       if(tempcstr1.item[j-1]='(') then inc(layer2);
       if(tempcstr1.item[j-1]=')') then dec(layer2);
       if(layer2=2) and (tempcstr1.item[j-1]=',') then
        begin
         tempcstr4:=c_string_copy_item(tempcstr1,k,j-k);
         if(tempcstr4.item[0]='__alias__') or (tempcstr4.item[0]='alias') then
          begin
           func.alias:=tempcstr4.item[2];
          end
         else if(tempcstr4.item[0]='__ms_abi__') or (tempcstr4.item[0]='ms_abi') then
          begin
           func.abi:='ms_abi_default';
          end
         else if(tempcstr4.item[0]='__sysv_abi__') or (tempcstr4.item[0]='sysv_abi') then
          begin
           func.abi:='sysv_abi_default';
          end;
         k:=j+1;
        end
       else if(layer2=1) and (tempcstr1.item[j-1]=')') then
        begin
         tempcstr4:=c_string_copy_item(tempcstr1,k,j-k);
         if(tempcstr4.item[0]='__alias__') or (tempcstr4.item[0]='alias') then
          begin
           func.alias:=tempcstr4.item[2];
          end
         else if(tempcstr4.item[0]='__ms_abi__') or (tempcstr4.item[0]='ms_abi') then
          begin
           func.abi:='ms_abi_default';
          end
         else if(tempcstr4.item[0]='__sysv_abi__') or (tempcstr4.item[0]='sysv_abi') then
          begin
           func.abi:='sysv_abi_default';
          end;
         inc(j); break;
        end;
       inc(j);
      end;
     c_string_delete_item(tempcstr1,i,j-i+1); continue;
    end;
   if(tempcstr1.item[i-1]='(') then
    begin
     inc(layer);
     if(layer=1) then l:=i+1;
    end
   else if(tempcstr1.item[i-1]=')') then dec(layer);
   if(layer=0) and (tempcstr1.item[i-1]=')') then
    begin
     j:=i+1; tempcstr3:=c_string_copy_item(tempcstr1,l,i-l);
     c_string_delete_item(tempcstr1,l-1,i-l+1);
     repeat
      begin
       k:=converter_get_main_bracket_number(tempcstr3);
       if(k>=2) then break
       else if(k=1) then
        begin
         m:=1; n:=1; layer2:=0; count:=0;
         while(m<=tempcstr1.count) do
          begin
           if(tempcstr1.item[m-1]='*') then
            begin
             n:=m; inc(count);
            end
           else if(tempcstr1.item[m-1]='(') then inc(layer2)
           else if(tempcstr1.item[m-1]=')') then dec(layer2);
           if(layer2=0) then break;
           inc(m);
          end;
         tempfunc.layer:=tempfunc.layer+count-1;
         tempcstr3:=c_string_copy_item(tempcstr3,n+1,m-n-1);
        end;
      end;
     until(k>=2);
     m:=1; layer2:=0;
     while(m<=tempcstr3.count)do
      begin
       if(tempcstr3.item[m-1]='(') then inc(layer2);
       if(tempcstr3.item[m-1]=')') then inc(layer2);
       if(layer2=0) then break;
       inc(m);
      end;
     tempcstr4:=c_string_copy_item(tempcstr3,2,m-2);
     tempcstr5:=c_string_copy_item(tempcstr3,m+2,tempcstr3.count-m-2);
     j:=1; k:=1; layer2:=0; count:=0;
     while(j<=tempcstr4.count)do
      begin
       if(tempcstr4.item[j-1]='*') then
        begin
         inc(count); c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__asm') then
        begin
         tempfunc.isasm:=true; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='WINAPI') then
        begin
         tempfunc.abi:='winapi'; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__cdecl') then
        begin
         tempfunc.conv:='cdecl'; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__pascal') then
        begin
         tempfunc.conv:='pascal'; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__stdcall') then
        begin
         tempfunc.conv:='stdcall'; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__fastcall') then
        begin
         tempfunc.conv:='fastcall'; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__thiscall') then
        begin
         tempfunc.conv:='thiscall'; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='inline') then
        begin
         tempfunc.isinline:=true; c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='ATTRIBUTE_NORETURN') then
        begin
         c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='ATTRIBUTE_NONNULL') then
        begin
         c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(tempcstr4.item[j-1]='__attribute__') then
        begin
         m:=j+1; n:=j+3; layer3:=0;
         while(m<=tempcstr4.count)do
          begin
           if(tempcstr4.item[m-1]='(') then inc(layer3);
           if(tempcstr4.item[m-1]=')') then dec(layer3);
           if((layer3=2) and (tempcstr4.item[m-1]=',')) or
           ((layer3=1) and (tempcstr4.item[m-1]=')')) then
            begin
             tempcstr5:=c_string_copy_item(tempcstr4,n,m-n);
             if(tempcstr5.item[0]='alias') or (tempcstr5.item[0]='__alias__') then
              begin
               tempfunc.alias:=tempcstr5.item[2];
              end
             else if(tempcstr5.item[0]='__ms_abi__') or (tempcstr5.item[0]='ms_abi') then
              begin
               tempfunc.abi:='ms_abi_default';
              end
             else if(tempcstr5.item[0]='__sysv_abi__') or (tempcstr5.item[0]='sysv_abi') then
              begin
               tempfunc.abi:='sysv_abi_default';
              end;
             if(layer3=1) then
              begin
               inc(m); break;
              end
             else n:=m+1;
            end;
           inc(m);
          end;
         c_string_delete_item(tempcstr4,j,m-j+1); continue;
        end
       else if(count>=1) and (tempfunc.name='') then
        begin
         tempfunc.name:=tempcstr4.item[j-1];
         c_string_delete_item(tempcstr4,j,1); continue;
        end
       else if(count=0) then
        begin
         c_string_delete_item(tempcstr4,j,1); continue;
        end;
       inc(j);
      end;
     tempfunc.layer:=tempfunc.layer+count-1;
     j:=1; k:=1; layer2:=0;
     while(j<=tempcstr5.count)do
      begin
       if(tempcstr5.item[j-1]='(') then inc(layer2);
       if(tempcstr5.item[j-1]=')') then dec(layer2);
       if((layer2=0) and (tempcstr5.item[j-1]=',')) or (j=tempcstr5.count) then
        begin
         if(j=tempcstr5.count) then tempcstr6:=c_string_copy_item(tempcstr5,k,j-k+1)
         else tempcstr6:=c_string_copy_item(tempcstr5,k,j-k);
         if(c_string_check_function_pointer(tempcstr6)) then
          begin
           tempres:=convert_c_func_pointer_to_pas_func_pointer(tempcstr6,false);
           for m:=1 to tempres.temptypecount do
            begin
             inc(res.temptypecount);
             SetLength(res.temptype,res.temptypecount);
             res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
            end;
           inc(tempfunc.count);
           SetLength(tempfunc.param,tempfunc.count);
           tempfunc.param[tempfunc.count-1]:=tempres.exp;
          end
         else
          begin
           tempres:=convert_c_param_to_pas_param(tempcstr6);
           for m:=1 to tempres.temptypecount do
            begin
             inc(res.temptypecount);
             SetLength(res.temptype,res.temptypecount);
             res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
            end;
           inc(tempfunc.count);
           SetLength(tempfunc.param,tempfunc.count);
           tempfunc.param[tempfunc.count-1]:=tempres.exp;
          end;
         k:=j+1;
        end;
       inc(j);
      end;
    end
   else if(func.layer>=1) and (tempcstr1.item[i-1]<>'*') and (func.name='') then
    begin
     func.name:=tempcstr1.item[i-1]; c_string_delete_item(tempcstr1,i,1); continue;
    end
   else if(tempcstr1.item[i-1]='*') then
    begin
     inc(func.layer); c_string_delete_item(tempcstr1,i,1); continue;
    end;
   if(layer=0) and (tempcstr1.item[i-1]='[') then
    begin
     j:=i+1; layer2:=1;
     while(j<=tempcstr1.count)do
      begin
       if(tempcstr1.item[j-1]='[') then inc(layer2);
       if(tempcstr1.item[j-1]=']') then dec(layer2);
       if(layer2=0) then break;
       inc(j);
      end;
     inc(covarr.arrc);
     SetLength(covarr.arrd,covarr.arrc);
     covarr.arrd[covarr.arrc-1]:=c_string_copy_item(tempcstr1,i+1,j-i-1);
     c_string_delete_item(tempcstr1,i,j-i+1);
    end;
   inc(i);
  end;
 if(func.layer>0) then dec(func.layer);
 i:=1; layer:=0;
 while(i<=tempcstr2.count)do
  begin
   if(tempcstr2.item[i-1]='(') then inc(layer);
   if(tempcstr2.item[i-1]=')') then dec(layer);
   if((tempcstr2.item[i-1]=',') and (layer=0)) or (i=tempcstr2.count) then
    begin
     if(i=tempcstr2.count) then tempcstr3:=c_string_copy_item(tempcstr2,m,i-m+1)
     else tempcstr3:=c_string_copy_item(tempcstr2,m,i-m);
     if(tempcstr3.count>0) and (c_string_check_function_pointer(tempcstr3)) then
      begin
       tempres:=convert_c_func_pointer_to_pas_func_pointer(tempcstr3);
       n:=1;
       while(n<=tempres.temptypecount)do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[n-1];
         inc(n);
        end;
      inc(func.count);
      SetLength(func.param,func.count);
      func.param[func.count-1]:=tempres.exp;
     end
    else if(tempcstr3.count>0) then
     begin
      tempres:=convert_c_param_to_pas_param(tempcstr3);
      n:=1;
      while(n<=tempres.temptypecount)do
       begin
        inc(res.temptypecount);
        SetLength(res.temptype,res.temptypecount);
        res.temptype[res.temptypecount-1]:=tempres.temptype[n-1];
        inc(n);
       end;
      inc(func.count);
      SetLength(func.param,func.count);
      func.param[func.count-1]:=tempres.exp;
     end;
     m:=i+1;
    end;
   inc(i);
  end;
 func.alias:=convert_c_string_to_pas_string(func.alias);
 tempfunc.alias:=convert_c_string_to_pas_string(tempfunc.alias);
 i:=1;
 if(istype) then
  begin
   if(bool) then
    begin
     if(tempstr='') then tempstr2:='procedure' else tempstr2:='function';
     paramindex:=0; enterfunc:=false;
     for i:=1 to func.count do
      begin
       if(func.param[i-1].count=0) then continue;
       if(enterfunc=false) then
        begin
         tempstr2:=tempstr2+'('; enterfunc:=true;
        end;
       if(func.param[i-1].count>1) and (func.param[i-1].item[0]=':') then
        begin
         tempstr2:=tempstr2+'param'+IntToStr(paramindex)+c_string_to_string(func.param[i-1]);
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='var') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'var param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='const') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'const param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) then
        begin
         tempstr2:=tempstr2+c_string_to_string(func.param[i-1]);
        end;
       if(i<func.count) then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+')';
      end;
     if(tempstr='') then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+':'+tempstr+';';
     if(func.abi<>'') then tempstr2:=tempstr2+func.abi+';';
     if(func.isinline) then tempstr2:=tempstr2+'inline;';
     if(func.conv<>'') then tempstr2:=tempstr2+func.conv+';';
     if(func.isasm) then tempstr2:=tempstr2+'assembler;';
     if(func.alias<>'') then tempstr2:=tempstr2+'[alias:'+func.alias+'];';
     tempstr3:='func'+IntToStr(newfuncindex);
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:=tempstr3;
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr2,true);
     inc(newfuncindex);
     for i:=1 to count-1 do
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='P'+tempstr3;
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string('^'+tempstr3,true);
       tempstr3:='P'+tempstr3;
      end;
     tempstr6:='function';
     paramindex:=0; enterfunc:=false;
     for i:=1 to func.count do
      begin
       if(tempfunc.param[i-1].count=0) then continue;
       if(enterfunc=false) then
        begin
         tempstr2:=tempstr2+'('; enterfunc:=true;
        end;
       if(tempfunc.param[i-1].count>1) and (tempfunc.param[i-1].item[0]=':') then
        begin
         tempstr6:=tempstr6+'param'+IntToStr(paramindex)+c_string_to_string(tempfunc.param[i-1]);
        end
       else if(tempfunc.param[i-1].count>1) and (tempfunc.param[i-1].item[0]='var') and
       (tempfunc.param[i-1].item[1]=':') then
        begin
         tempstr6:=tempstr6+'var param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(tempfunc.param[i-1],2,tempfunc.param[i-1].count-1));
        end
       else if(tempfunc.param[i-1].count>1) and (tempfunc.param[i-1].item[0]='const') and
       (tempfunc.param[i-1].item[1]=':') then
        begin
         tempstr6:=tempstr6+'const param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(tempfunc.param[i-1],2,tempfunc.param[i-1].count-1));
        end
       else if(tempfunc.param[i-1].count>1) then
        begin
         tempstr6:=tempstr6+c_string_to_string(tempfunc.param[i-1]);
        end
       else continue;
       if(i<tempfunc.count) then tempstr6:=tempstr6+';' else tempstr6:=tempstr6+')';
      end;
     tempstr6:=tempstr6+':'+tempstr3+';';
     if(tempfunc.abi<>'') then tempstr6:=tempstr6+tempfunc.abi+';';
     if(tempfunc.isinline) then tempstr6:=tempstr6+'inline;';
     if(tempfunc.conv<>'') then tempstr6:=tempstr6+tempfunc.conv+';';
     if(tempfunc.isasm) then tempstr2:=tempstr2+'assembler;';
     if(tempfunc.alias<>'') then tempstr6:=tempstr6+'[alias:'+tempfunc.alias+'];';
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:=tempfunc.name;
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr6,true);
     tempstr4:='';
     for i:=1 to covarr.arrc do
      begin
       if(i=1) then tempstr4:='array[';
       if(covarr.arrd[i-1].count=0) then
       tempstr4:=tempstr4+'0..0'
       else
       tempstr4:=tempstr4+'0..'+c_string_to_string(covarr.arrd[i-1])+'-1';
       if(i<covarr.arrc) then tempstr4:=tempstr4+',' else tempstr4:=tempstr4+'] of ';
      end;
     if(covarr.arrc>0) then
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='arr'+IntToStr(newarrayindex);
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr4+tempstr3,true);
       inc(newarrayindex);
      end;
    end
   else
    begin
     if(tempstr='') then tempstr2:='procedure' else tempstr2:='function';
     paramindex:=0; enterfunc:=false;
     for i:=1 to func.count do
      begin
       if(func.param[i-1].count=0) then continue;
       if(enterfunc=false) then
        begin
         tempstr2:=tempstr2+'('; enterfunc:=true;
        end;
       if(func.param[i-1].count>1) and (func.param[i-1].item[0]=':') then
        begin
         tempstr2:=tempstr2+'param'+IntToStr(paramindex)+c_string_to_string(func.param[i-1]);
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='var') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'var param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='const') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'const param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) then
        begin
         tempstr2:=tempstr2+c_string_to_string(func.param[i-1]);
        end;
       if(i<func.count) then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+')';
      end;
     if(tempstr='') then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+':'+tempstr+';';
     if(func.abi<>'') then tempstr2:=tempstr2+func.abi+';';
     if(func.isinline) then tempstr2:=tempstr2+'inline;';
     if(func.conv<>'') then tempstr2:=tempstr2+func.conv+';';
     if(func.isasm) then tempstr2:=tempstr2+'assembler;';
     if(func.alias<>'') then tempstr2:=tempstr2+'[alias:'+func.alias+'];';
     tempstr3:=func.name;
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:=tempstr3;
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr2,true);
     for i:=1 to count-1 do
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='P'+tempstr3;
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string('^'+tempstr3,true);
       tempstr3:='P'+tempstr3;
      end;
     tempstr4:='';
     for i:=1 to covarr.arrc do
      begin
       if(i=1) then tempstr4:='array[';
       if(covarr.arrd[i-1].count=0) then
       tempstr4:=tempstr4+'0..0'
       else
       tempstr4:=tempstr4+'0..'+c_string_to_string(covarr.arrd[i-1])+'-1';
       if(i<covarr.arrc) then tempstr4:=tempstr4+',' else tempstr4:=tempstr4+'] of ';
      end;
     if(covarr.arrc>0) then
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='arr'+IntToStr(newarrayindex);
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr4+tempstr3,true);
       inc(newarrayindex);
      end;
    end;
  end
 else
  begin
   if(bool) then
    begin
     if(tempstr='') then tempstr2:='procedure' else tempstr2:='function';
     paramindex:=0; enterfunc:=false;
     for i:=1 to func.count do
      begin
       if(func.param[i-1].count=0) then continue;
       if(enterfunc=false) then
        begin
         tempstr2:=tempstr2+'('; enterfunc:=true;
        end;
       if(func.param[i-1].count>1) and (func.param[i-1].item[0]=':') then
        begin
         tempstr2:=tempstr2+'param'+IntToStr(paramindex)+c_string_to_string(func.param[i-1]);
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='var') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'var param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='const') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'const param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) then
        begin
         tempstr2:=tempstr2+c_string_to_string(func.param[i-1]);
        end;
       if(i<func.count) then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+')';
      end;
     if(tempstr='') then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+':'+tempstr+';';
     if(func.abi<>'') then tempstr2:=tempstr2+func.abi+';';
     if(func.isinline) then tempstr2:=tempstr2+'inline;';
     if(func.conv<>'') then tempstr2:=tempstr2+func.conv+';';
     if(func.isasm) then tempstr2:=tempstr2+'assembler;';
     if(func.alias<>'') then tempstr2:=tempstr2+'[alias:'+func.alias+'];';
     tempstr3:='func'+IntToStr(newfuncindex);
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:=tempstr3;
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr2,true);
     inc(newfuncindex);
     for i:=1 to count-1 do
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='P'+tempstr3;
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string('^'+tempstr3,true);
       tempstr3:='P'+tempstr3;
      end;
     tempstr6:='function';
     paramindex:=0; enterfunc:=false;
     for i:=1 to func.count do
      begin
       if(tempfunc.param[i-1].count=0) then continue;
       if(enterfunc=false) then
        begin
         tempstr2:=tempstr2+'('; enterfunc:=true;
        end;
       if(tempfunc.param[i-1].count>1) and (tempfunc.param[i-1].item[0]=':') then
        begin
         tempstr6:=tempstr6+'param'+IntToStr(paramindex)+c_string_to_string(tempfunc.param[i-1]);
        end
       else if(tempfunc.param[i-1].count>1) and (tempfunc.param[i-1].item[0]='var') and
       (tempfunc.param[i-1].item[1]=':') then
        begin
         tempstr6:=tempstr6+'var param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(tempfunc.param[i-1],2,tempfunc.param[i-1].count-1));
        end
       else if(tempfunc.param[i-1].count>1) and (tempfunc.param[i-1].item[0]='const') and
       (tempfunc.param[i-1].item[1]=':') then
        begin
         tempstr6:=tempstr6+'const param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(tempfunc.param[i-1],2,tempfunc.param[i-1].count-1));
        end
       else if(tempfunc.param[i-1].count>1) then
        begin
         tempstr6:=tempstr6+c_string_to_string(tempfunc.param[i-1]);
        end
       else continue;
       if(i<tempfunc.count) then tempstr6:=tempstr6+';' else tempstr6:=tempstr6+')';
      end;
     tempstr6:=tempstr6+':'+tempstr3+';';
     if(tempfunc.abi<>'') then tempstr6:=tempstr6+tempfunc.abi+';';
     if(tempfunc.isinline) then tempstr6:=tempstr6+'inline;';
     if(tempfunc.conv<>'') then tempstr6:=tempstr6+tempfunc.conv+';';
     if(tempfunc.isasm) then tempstr2:=tempstr2+'assembler;';
     if(tempfunc.alias<>'') then tempstr6:=tempstr6+'[alias:'+tempfunc.alias+'];';
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     tempstr3:='func'+IntTostr(newfuncindex);
     res.temptype[res.temptypecount-1].newname:='func'+IntTostr(newfuncindex);
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr6,true);
     tempstr4:='';
     inc(newfuncindex);
     for i:=1 to covarr.arrc do
      begin
       if(i=1) then tempstr4:='array[';
       if(covarr.arrd[i-1].count=0) then
       tempstr4:=tempstr4+'0..0'
       else
       tempstr4:=tempstr4+'0..'+c_string_to_string(covarr.arrd[i-1])+'-1';
       if(i<covarr.arrc) then tempstr4:=tempstr4+',' else tempstr4:=tempstr4+'] of ';
      end;
     if(covarr.arrc>0) then
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='arr'+IntToStr(newarrayindex);
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr4+tempstr3,true);
       res.exp:=c_string_generate_from_string(tempfunc.name+':'+'arr'+IntToStr(newarrayindex),true);
      end
     else
      begin
       res.exp:=c_string_generate_from_string(tempfunc.name+':'+tempstr3,true);
      end;
    end
   else
    begin
     if(tempstr='') then tempstr2:='procedure' else tempstr2:='function';
     paramindex:=0; enterfunc:=false;
     for i:=1 to func.count do
      begin
       if(func.param[i-1].count=0) then continue;
       if(enterfunc=false) then
        begin
         tempstr2:=tempstr2+'('; enterfunc:=true;
        end;
       if(func.param[i-1].count>1) and (func.param[i-1].item[0]=':') then
        begin
         tempstr2:=tempstr2+'param'+IntToStr(paramindex)+c_string_to_string(func.param[i-1]);
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='var') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'var param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) and (func.param[i-1].item[0]='const') and
       (func.param[i-1].item[1]=':') then
        begin
         tempstr2:=tempstr2+'const param'+IntToStr(paramindex)+
         c_string_to_string(c_string_copy_item(func.param[i-1],2,func.param[i-1].count-1));
        end
       else if(func.param[i-1].count>1) then
        begin
         tempstr2:=tempstr2+c_string_to_string(func.param[i-1]);
        end;
       if(i<func.count) then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+')';
      end;
     if(tempstr='') then tempstr2:=tempstr2+';' else tempstr2:=tempstr2+':'+tempstr+';';
     if(func.abi<>'') then tempstr2:=tempstr2+func.abi+';';
     if(func.isinline) then tempstr2:=tempstr2+'inline;';
     if(func.conv<>'') then tempstr2:=tempstr2+func.conv+';';
     if(func.isasm) then tempstr2:=tempstr2+'assembler;';
     if(func.alias<>'') then tempstr2:=tempstr2+'[alias:'+func.alias+'];';
     tempstr3:='func'+IntToStr(newfuncindex);
     inc(res.temptypecount);
     SetLength(res.temptype,res.temptypecount);
     res.temptype[res.temptypecount-1].newname:=tempstr3;
     res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr2,true);
     inc(newfuncindex);
     for i:=1 to count-1 do
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='P'+tempstr3;
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string('^'+tempstr3,true);
       tempstr3:='P'+tempstr3;
      end;
     tempstr4:='';
     for i:=1 to covarr.arrc do
      begin
       if(i=1) then tempstr4:='array[';
       if(covarr.arrd[i-1].count=0) then
       tempstr4:=tempstr4+'0..0'
       else
       tempstr4:=tempstr4+'0..'+c_string_to_string(covarr.arrd[i-1])+'-1';
       if(i<covarr.arrc) then tempstr4:=tempstr4+',' else tempstr4:=tempstr4+'] of ';
      end;
     if(covarr.arrc>0) then
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1].newname:='arr'+IntToStr(newarrayindex);
       res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string(tempstr4+tempstr3,true);
       inc(newarrayindex);
       res.exp:=c_string_generate_from_string(func.name+':'+'arr'+IntToStr(newarrayindex),true);
      end
     else
      begin
       res.exp:=c_string_generate_from_string(func.name+':'+tempstr3,true);
      end;
    end;
  end;
 if(defbool) then
  begin
   c_string_insert_string(defvalue,res.exp,res.exp.count+1);
  end;
 convert_c_func_pointer_to_pas_func_pointer:=res;
end;
function convert_c_func_to_pas_func(const cfunc:c_string):pas_temp;
var param:cov_func_param;
    ctype:cov_type;
    i,j,k,layer:SizeInt;
    tempstr:string;
    cexp,tempcstr,tempcstr2:c_string;
    bool,bool2:boolean;
    res:pas_temp;
begin
 i:=1; cexp:=cfunc; res.temptypecount:=0;
 while(i<=cexp.count)do
  begin
   if(i<cexp.count) and (c_string_is_operator(cexp.item[i-1],true)=0)
   and (c_string_is_bracket_string(cexp.item[i-1])=false) and (cexp.item[i]='(') then
    begin
     param.funcname:=cexp.item[i-1]; param.count:=0;
     j:=i+2; k:=i+2; layer:=1;
     while(j<=cexp.count)do
      begin
       if(cexp.item[j-1]='(') then inc(layer);
       if(cexp.item[j-1]=')') then dec(layer);
       if((layer=1) and (cexp.item[j-1]=',')) or ((layer=0) and (cexp.item[j-1]=')')) then
        begin
         inc(param.count);
         SetLength(param.param,param.count);
         param.param[param.count-1]:=c_string_copy_item(cexp,k,j-k);
         if(layer=0) and (cexp.item[j-1]=')') then break else k:=j+1;
        end;
       inc(j);
      end;
    bool:=true;
    if(param.funcname='new') then
     begin
      tempcstr:=c_string_generate_from_string('New()',true);
      tempcstr2:=c_string_copy_item(cexp,1,i-1);
      j:=2; layer:=0; bool:=false;
      while(j<=tempcstr2.count)do
       begin
        if(tempcstr2.item[j-1]='[') then inc(layer);
        if(tempcstr2.item[j-1]=']') then
         begin
          dec(layer); c_string_delete_item(tempcstr2,2,j-1);
         end;
        inc(j);
       end;
      c_string_insert_string(tempcstr2,tempcstr,3);
     end
    else if(param.funcname='delete') then
     begin
      tempcstr:=c_string_generate_from_string('Dispose()',true);
      tempcstr2:=param.param[0];
      j:=1; layer:=0; bool:=false;
      while(j<=tempcstr2.count)do
       begin
        if(tempcstr2.item[j-1]='[') then inc(layer);
        if(tempcstr2.item[j-1]=']') then
         begin
          dec(layer); c_string_delete_item(tempcstr2,1,j);
         end;
        inc(j);
       end;
      c_string_insert_string(tempcstr2,tempcstr,3);
     end;
    if(bool=false) then
     begin
      c_string_delete_item(cexp,i,j-i+1);
      c_string_insert_string(tempcstr,cexp,i);
     end;
    inc(i,1); continue;
   end;
  inc(i);
 end;
 res.exp:=cexp;
 convert_c_func_to_pas_func:=res;
end;
function convert_c_generic_to_pas_generic(const cgen:c_string):pas_temp;
var i,j,k,m,n,l,r,layer:SizeInt;
    tempexp,tempcstr:c_string;
    tempstr,tempstr2:string;
    cposlist:cov_pos_list;
    ctype:cov_type;
    res:pas_temp;
begin
 tempexp:=cgen;
 i:=1; layer:=0; cposlist.count:=0; res.temptypecount:=0;
 while(i<=tempexp.count)do
  begin
   if(tempexp.item[i-1]='<') or (tempexp.item[i-1]='>') or (tempexp.item[i-1]='>>') then
    begin
     inc(cposlist.count);
     SetLength(cposlist.item,cposlist.count);
     if(tempexp.item[i-1]='<') then
      begin
       cposlist.item[cposlist.count-1]:=1;
      end
     else if(tempexp.item[i-1]='>') then
      begin
       cposlist.item[cposlist.count-1]:=2;
      end
     else if(tempexp.item[i-1]='>>') then
      begin
       cposlist.item[cposlist.count-1]:=3;
      end;
    end;
   inc(i);
  end;
 i:=1; j:=1;
 while(i<=cposlist.count)do
  begin
   if(cposlist.item[i-1]=1) then
    begin
     j:=i+1; k:=cposlist.item[i-1]+1; layer:=1;
     while(j<=cposlist.count)do
      begin
       if(cposlist.item[j-1]<=1) then inc(layer);
       if(cposlist.item[j-1]=2) then dec(layer);
       if(layer>=2) and (cposlist.item[j-1]=3) then
        begin
         dec(layer,2);
         tempexp.item[j-1]:='>';
         c_string_insert_item('>',tempexp,j+1);
         insert(cposlist.item[j-1]+1,cposlist.item,j);
         inc(cposlist.count);
         m:=j+2;
         while(m<=cposlist.count)do
          begin
           inc(cposlist.item[m-1]);
           inc(m);
          end;
        end;
       if(layer=0) then break;
       inc(j);
      end;
     if(j>cposlist.count) then break;
     m:=cposlist.item[j-1]-1; n:=k;
     while(n<=m) do
      begin
       if(c_string_is_operator(tempexp.item[n-1])>0) and
       (tempexp.item[n-1]<>'<') and (tempexp.item[n-1]<>'>>')
       and (tempexp.item[n-1]<>'>') and (tempexp.item[n-1]<>'*') then break;
       if(tempexp.item[n-1]='(') or (tempexp.item[n-1]=')') or
       (tempexp.item[n-1]='[') or (tempexp.item[n-1]=']') then break;
       inc(n);
      end;
     if(n<=m) then
      begin
       i:=j+1; continue;
      end
     else
      begin
       n:=k; l:=k; layer:=0;
       while(n<=m)do
        begin
         if(tempexp.item[n-1]='<') then inc(layer);
         if(tempexp.item[n-1]='>') then dec(layer);
         if(tempexp.item[n-1]='>>') and (layer>=2) then dec(layer,2);
         if((layer=0) and (tempexp.item[n-1]=',')) or (n=m) then
          begin
           tempcstr:=c_string_copy_item(tempexp,l,n-l);
           r:=1;
           while(r<=tempcstr.count)do
            begin
             if(tempcstr.item[r-1]='const') or (tempcstr.item[r-1]='CONST') then
              begin
               c_string_delete_item(tempcstr,r,1); continue;
              end
             else if(tempcstr.item[r-1]='register') or (tempcstr.item[r-1]='REGISTER') then
              begin
               c_string_delete_item(tempcstr,r,1); continue;
              end
             else if(tempcstr.item[r-1]='static') or (tempcstr.item[r-1]='STATIC') then
              begin
               c_string_delete_item(tempcstr,r,1); continue;
              end
             else if(tempcstr.item[r-1]='constexpr') or (tempcstr.item[r-1]='CONSTEXPR') then
              begin
               c_string_delete_item(tempcstr,r,1); continue;
              end;
             inc(r);
            end;
           tempstr:=c_string_to_string(tempcstr);
           ctype:=c_type_to_pas_type(tempstr);
           tempstr2:=ctype.ctype;
           r:=1;
           while(r<=ctype.clayer)do
            begin
             inc(res.temptypecount);
             SetLength(res.temptype,res.temptypecount);
             res.temptype[res.temptypecount-1].newname:='P'+tempstr2;
             res.temptype[res.temptypecount-1].oldname:=
             c_string_generate_from_string('^'+tempstr2,true);
             tempstr2:='P'+tempstr2;
             inc(r);
            end;
           c_string_delete_item(tempcstr,l,n-l);
           for r:=i to cposlist.count do dec(cposlist.item[r-1],n-l-1);
           c_string_insert_item(tempstr2,tempcstr,l);
           l:=n+1;
          end;
         inc(n);
        end;
       if(l>1) then c_string_insert_item('specialize',tempexp,l-1);
       for r:=i to cposlist.count do inc(cposlist.item[r-1]);
      end;
    end;
   inc(i);
  end;
 res.exp:=tempexp;
 convert_c_generic_to_pas_generic:=res;
end;
function convert_c_lambda_to_pas_lambda(const cc:c_string;pastree:Ppas_tree=nil):c_string;
var i,j,k,layer:SizeInt;
    treelist:pas_tree_list;
    tempcstr:c_string;
    lambdafunc:cov_func_param;
    tempcc:c_string;
begin
 i:=1; treelist.count:=0;
 if(pastree=nil) then exit(cc);
 for i:=1 to pastree^.count do
  begin
   if((pastree^.child+i-1)^.treetype=pas_node_function)
   and (Ppas_function((pastree^.child+i-1)^.content)^.islambda) then
    begin
     inc(treelist.count);
     SetLength(treelist.tree,treelist.count);
     treelist.tree[treelist.count-1]:=pastree^.child+i-1;
    end;
  end;
 if(treelist.count=0) then exit(cc);
 tempcc:=cc; lambdafunc.count:=0;
 while(i<=cc.count)do
  begin
   if(c_string_is_operator(tempcc.item[i-1])=0) and (tempcc.item[i-1]='(') then
    begin
     k:=treelist.count; lambdafunc.funcname:=tempcc.item[i-1];
     while(k>0)do
      begin
       if(lambdafunc.funcname=Ppas_function(treelist.tree[k-1]^.content)^.funcname) then break;
       dec(k);
      end;
     if(k=0) then
      begin
       inc(i); continue;
      end;
     j:=i+2; layer:=0;
     while(j<=tempcc.count)do
      begin
       if(tempcc.item[j-1]='(') then inc(layer);
       if(tempcc.item[j-1]=')') then dec(layer);
       if((layer=1) and (tempcc.item[j-1]=',')) or ((layer=0) and (tempcc.item[j-1]=')')) then
        begin
         inc(lambdafunc.count);
         SetLength(lambdafunc.param,lambdafunc.count);
         lambdafunc.param[lambdafunc.count-1]:=c_string_copy_item(tempcc,j,i-j);
        end;
       inc(j);
      end;
     c_string_delete_item(tempcc,i,j-i+1);
     j:=Ppas_function(treelist.tree[k-1]^.content)^.paramcaptureindex+1;
     while(j<=Ppas_function(treelist.tree[k-1]^.content)^.paramcount)do
      begin
       inc(lambdafunc.count);
       SetLength(lambdafunc.param,lambdafunc.count);
       if(Ppas_function(treelist.tree[k-1]^.content)^.param[j-1].item[0]<>'var') then
       lambdafunc.param[lambdafunc.count-1]:=
       c_string_generate_from_string(
       Ppas_function(treelist.tree[k-1]^.content)^.param[j-1].item[0],true)
       else
       lambdafunc.param[lambdafunc.count-1]:=
       c_string_generate_from_string(
       Ppas_function(treelist.tree[k-1]^.content)^.param[j-1].item[1],true);
      end;
     tempcstr:=c_string_generate_from_string(lambdafunc.funcname+'()',true);
     j:=1;
     for j:=1 to lambdafunc.count do
      begin
       c_string_insert_string(lambdafunc.param[j-1],tempcstr,tempcstr.count);
       if(j<lambdafunc.count) then c_string_insert_item(';',tempcstr,tempcstr.count);
      end;
     c_string_insert_string(tempcstr,tempcc,i);
    end;
   inc(i);
  end;
 convert_c_lambda_to_pas_lambda:=tempcc;
end;
function convert_c_expression_to_pas_expression(const cexp:c_string;pastree:Ppas_tree=nil):pas_temp;
var i,j,k,m,n,l,r,layer,layer2:SizeInt;
    tempexp,tempcstr,tempcstr1,tempcstr2,tempcstr3:c_string;
    tempstr,tempstr2,tempstr3:string;
    ioparam:cov_io_param;
    covtype:cov_type;
    tempres,res:pas_temp;
    bool,bool2:boolean;
begin
 i:=1; j:=1;
 tempres.formercount:=0; tempres.lattercount:=0; tempres.temptypecount:=0;
 res.formercount:=0; res.lattercount:=0; res.temptypecount:=0;
 if(length(cexp.item)>0) then
  begin
   tempexp:=cexp;
   c_string_delete_unnecessary_bracket(tempexp);
  end
 else
  begin
   res.exp.count:=0;
   exit(res);
  end;
 if(tempexp.count=0) then
  begin
   res.exp.count:=0;
   exit(res);
  end
 else if(tempexp.count=1) then
  begin
   res.exp:=tempexp;
   exit(res);
  end;
 layer:=0;
 {Handle the cout and cin}
 if(tempexp.item[0]='cout') or (tempexp.item[0]='cin') then
  begin
   if(tempexp.item[0]='cout') then bool:=true else bool:=false;
   i:=2; j:=2;
   ioparam.count:=0; SetLength(ioparam.item,0);
   layer:=0; layer2:=0;
   while(i<=tempexp.count)do
    begin
     if(tempexp.item[i-1]='(') then inc(layer);
     if(tempexp.item[i-1]=')') then dec(layer);
     if(layer=0) then
      begin
       if(tempexp.item[i-1]='<') then inc(layer2);
       if(tempexp.item[i-1]='>') then dec(layer2);
      end
     else layer2:=0;
     if(((tempexp.item[i-1]='<<') and (bool=true)) or ((tempexp.item[i-1]='>>') and (bool=false)))
     and (layer=0) and (layer2=0) then
      begin
       if(tempexp.item[j-1]='endl') and (bool=true) then
        begin
         inc(ioparam.count);
         SetLength(ioparam.item,ioparam.count);
         c_string_insert_item('#10',ioparam.item[ioparam.count-1],1);
         j:=i+2; inc(i,2); continue;
        end
       else if(tempexp.item[j-1]='endl') then
        begin
         j:=i+2; inc(i,2); continue;
        end;
       inc(ioparam.count);
       SetLength(ioparam.item,ioparam.count);
       ioparam.item[ioparam.count-1]:=c_string_copy_item(tempexp,j,i-j);
       j:=i+2; inc(i,2); continue;
      end;
     inc(i);
    end;
   if(bool) then
   tempexp:=c_string_generate_from_string('write()',false)
   else if(bool=false) then
   tempexp:=c_string_generate_from_string('read()',false);
   i:=1; j:=1;
   while(i<=ioparam.count)do
    begin
     c_string_insert_string(ioparam.item[i-1],tempexp,tempexp.count);
     if(i<ioparam.count) then c_string_insert_item(',',tempexp,tempexp.count);
     inc(i);
    end;
  end;
 {Handle the other C stream}
 k:=1; layer:=0; layer2:=0; bool:=true; bool2:=true;
 while(k<=tempexp.count)do
  begin
   if(tempexp.item[k-1]='(') then inc(layer);
   if(tempexp.item[k-1]=')') then dec(layer);
   if(tempexp.item[k-1]='<') then inc(layer2);
   if(tempexp.item[k-1]='>') then dec(layer2);
   if(layer2>=2) and (tempexp.item[k-1]='>>') then dec(layer2,2)
   else if(tempexp.item[k-1]='<<') or (tempexp.item[k-1]='>>') then break;
   if(layer=0) and (layer2=0) and (tempexp.item[k-1]<>'*') and (tempexp.item[k-1]<>'.')
   and (tempexp.item[k-1]='->')
   and (c_string_is_operator(tempexp.item[k-1])>0) then break;
   if(Pos('=',tempexp.item[k-1])>0) then
    begin
     bool:=false; break;
    end;
   inc(k);
  end;
 if(k>=tempexp.count) then bool:=false;
 if(bool=true) then
  begin
   if(tempexp.item[k]='<<') then bool2:=true else bool2:=false;
   tempcstr:=c_string_copy_item(tempexp,1,k); ioparam.count:=0;
   j:=k+2; i:=k+2;
   while(i<=tempexp.count)do
    begin
     if(tempexp.item[i-1]='(') then inc(layer);
     if(tempexp.item[i-1]=')') then dec(layer);
     if(layer=0) then
      begin
       if(tempexp.item[i-1]='<') then inc(layer2);
       if(tempexp.item[i-1]='>') then dec(layer2);
      end
     else layer2:=0;
     if(((tempexp.item[i-1]='<<') and (bool2=true)) or ((tempexp.item[i-1]='>>') and (bool2=false)))
     and (layer=0) and (layer2=0) then
      begin
       inc(ioparam.count);
       SetLength(ioparam.item,ioparam.count);
       ioparam.item[ioparam.count-1]:=c_string_copy_item(tempexp,j,i-j);
       j:=i+2; inc(i,2); continue;
      end;
     inc(i);
    end;
   for i:=1 to ioparam.count do
    begin
     if(bool2=true) then
      begin
       tempstr:='.Write(,sizeof())';
       tempstr2:=c_string_to_string(ioparam.item[i-1])+tempstr;
       tempcstr2:=c_string_generate_from_string(tempstr2,false);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count-4);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count-1);
      end
     else if(bool2=false) then
      begin
       tempstr:='.Read(,sizeof())';
       tempstr2:=c_string_to_string(ioparam.item[i-1])+tempstr;
       tempcstr2:=c_string_generate_from_string(tempstr2,false);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count-4);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count-1);
      end;
     if(i<ioparam.count) then
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[i-1]:=tempcstr2;
      end
     else tempexp:=tempcstr2;
    end;
  end;
 {Handle the new and delete procedure}
 i:=1;
 while(i<tempexp.count)do
  begin
   if(tempexp.item[i-1]='new') or (tempexp.item[i-1]='delete') then
    begin
     c_string_insert_item(')',tempexp,tempexp.count+1);
     c_string_insert_item('(',tempexp,i+1);
     c_string_delete_unnecessary_bracket(tempexp,true);
     inc(i,2); continue;
    end;
   inc(i);
  end;
 {Handle the generic class}
 tempres:=convert_c_generic_to_pas_generic(tempexp);
 for i:=1 to tempres.temptypecount do
  begin
   inc(res.temptypecount);
   SetLength(res.temptype,res.temptypecount);
   res.temptype[res.temptypecount-1]:=tempres.temptype[i-1];
  end;
 tempexp:=tempres.exp;
 {Handle the type convertion or function pointer convertion}
 i:=1; j:=0; k:=0; bool:=false; layer:=0;
 while(i<=tempexp.count)do
  begin
   if(i<tempexp.count) and (((tempexp.item[i-1]=')') and (tempexp.item[i]='('))
   or ((tempexp.item[i-1]=')') and (c_string_is_operator(tempexp.item[i])=0) and (tempexp.item[i]<>')'))
   or ((tempexp.item[i-1]=')') and (tempexp.item[i]='*'))) then
    begin
     if(i<tempexp.count-1) and (tempexp.item[i-1]=')') and (tempexp.item[i]='*')
     and (tempexp.item[i+1]='(') then
      begin
       inc(i); continue;
      end
     else if(i>2) and (tempexp.item[i-3]='(')
     and (tempexp.item[i-2]='*') and (tempexp.item[i-1]=')')
     and (tempexp.item[i]='(') then
      begin
       inc(i); continue;
      end;
     j:=i-1; layer:=1; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(layer=0) and (layer2=0) then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]<>'*')
       and (c_string_is_operator(tempexp.item[k],false)<>0) then break;
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]=')') then break;
       if(layer=0) and (layer2=0) and (k<tempexp.count) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     if(j>1) and (tempexp.item[j-1]='(') and
     (c_string_is_operator(tempexp.item[j-2])=0) and
     (c_string_is_bracket_string(tempexp.item[j-2])=false) then
      begin
       inc(i); continue;
      end
     else
      begin
       tempcstr1:=c_string_copy_item(tempexp,j,i-j+1);
       tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
       c_string_delete_unnecessary_bracket(tempcstr1);
       l:=1;
       while(l<=tempcstr1.count)do
        begin
         if(tempcstr1.item[l-1]='*') then break;
         inc(l);
        end;
       if(l>1) and (l<tempcstr1.count) and
       (tempcstr1.item[l-1]='*') and (tempcstr1.item[l-2]<>'*') and (tempcstr1.item[l]<>'*') then
        begin
         inc(i); continue;
        end;
       c_string_delete_unnecessary_bracket(tempcstr2);
       l:=1;
       while(l<=tempcstr1.count)do
        begin
         if(tempcstr1.item[l-1]='const') then
          begin
           c_string_delete_item(tempcstr1,l,1); continue;
          end
         else if(tempcstr1.item[l-1]='constexpr') then
          begin
           c_string_delete_item(tempcstr1,l,1); continue;
          end
         else if(tempcstr1.item[l-1]='static') then
          begin
           c_string_delete_item(tempcstr1,l,1); continue;
          end
         else if(tempcstr1.item[l-1]='register') then
          begin
           c_string_delete_item(tempcstr1,l,1); continue;
          end;
         inc(l);
        end;
       l:=1;
       while(l<=tempcstr1.count)do
        begin
         if(c_string_is_operator(tempcstr1.item[l-1],false)>0) and
         (tempcstr1.item[l-1]<>'*') then break;
         inc(l);
        end;
       if(l<=tempcstr1.count) then
        begin
         inc(i); continue;
        end;
       c_string_delete_item(tempexp,j,k-j+1);
       if(tempcstr1.item[0]='*') then
        begin
         tempstr2:='';
         for l:=2 to tempcstr1.count do
          begin
           if(tempcstr1.item[l-1]<>'*') then
            begin
             tempstr2:=tempstr2+tempcstr1.item[l-1];
            end;
          end;
         tempcstr3:=c_string_generate_from_string(tempstr2+'()',true);
         c_string_insert_string(tempcstr2,tempcstr3,3);
         c_string_insert_string(tempcstr3,tempexp,j);
         i:=j+1; continue;
        end;
       tempstr:=c_string_to_string(tempcstr1);
       covtype:=c_type_to_pas_type(tempstr);
       tempstr2:=covtype.ctype;
       if(tempstr2='') then
        begin
         tempcstr3:=c_string_generate_from_string('()',true);
         c_string_insert_string(tempcstr2,tempcstr3,2);
         c_string_insert_string(tempcstr3,tempexp,j);
         i:=j+1; continue;
        end;
       for m:=1 to covtype.clayer do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1].newname:='P'+tempstr2;
         res.temptype[res.temptypecount-1].oldname:=
         c_string_generate_from_string('^'+tempstr2,true);
         tempstr2:='P'+tempstr2;
        end;
       tempcstr3:=c_string_generate_from_string(tempstr2+'()',true);
       c_string_insert_string(tempcstr2,tempcstr3,3);
       c_string_insert_string(tempcstr3,tempexp,j);
       i:=j+1; continue;
      end;
    end;
   inc(i);
  end;
 {Handle the C language sign}
 i:=1; j:=1; layer:=0;
 while(i<=tempexp.count)do
  begin
   if(i<=0) then i:=1;
   if(i<tempexp.count) and (tempexp.item[i-1]=']') and (tempexp.item[i]='[') then
    begin
     c_string_delete_item(tempexp,i,2);
     c_string_insert_item(',',tempexp,i);
     inc(i); continue;
    end
   else if(i>1) and (tempexp.item[i-2]='std') and (tempexp.item[i-1]='::') then
    begin
     c_string_delete_item(tempexp,i-1,2);
     dec(i); continue;
    end
   else if(tempexp.item[i-1]='<<=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('shl',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='>>=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('shr',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='+=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('+',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='-=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('-',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='*=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('*',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='/=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('/',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='%=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('mod',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='&=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('and',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='^=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('xor',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='|=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     c_string_delete_item(tempexp,j,k-j+1);
     tempcstr3:=tempcstr1;
     c_string_insert_item(':=',tempcstr3,tempcstr3.Count+1);
     c_string_insert_string(tempcstr1,tempcstr3,tempcstr3.Count+1);
     c_string_insert_item('or',tempcstr3,tempcstr3.count+1);
     c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; i:=1;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='++') then
    begin
     j:=i; layer:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') or (tempexp.item[j-1]=']') then inc(layer);
       if(tempexp.item[j-1]='(') or (tempexp.item[j-1]='[') then dec(layer);
       if(layer=0) and (c_string_is_operator(tempexp.item[j-1],false)>0)
       and (Pos('=',tempexp.item[j-1])>0) then
        begin
         inc(j); break;
        end;
       if(layer=0) and (j<i) and (tempexp.item[j-1]='++') or (tempexp.item[j-1]='--') then
        begin
         inc(j); break;
        end;
       if(layer<0) and ((tempexp.item[j-1]='(') or (tempexp.item[j-1]='[')) then
        begin
         inc(j); break;
        end;
       if(layer=0) and (tempexp.item[j-1]<>'*') and
       (c_string_is_operator(tempexp.item[j-1],false)=0) then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i; layer:=0;
     while(k<tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') or (tempexp.item[j-1]='[') then inc(layer);
       if(tempexp.item[k-1]=')') or (tempexp.item[j-1]=']') then dec(layer);
       if(layer<0) and ((tempexp.item[k-1]=')') or (tempexp.item[k-1]=']')) then
        begin
         dec(k); break;
        end;
       if(layer=0) and (c_string_is_operator(tempexp.item[k-1],false)>0)
       and (Pos('=',tempexp.item[k-1])>0) then
        begin
         dec(k); break;
        end;
       if(layer=0) and (j<i) and (tempexp.item[k-1]='++') or (tempexp.item[k-1]='--') then
        begin
         dec(k); break;
        end;
       if(layer<0) and ((tempexp.item[k-1]=')') or (tempexp.item[k-1]=']')) then
        begin
         dec(k); break;
        end;
       if(layer=0) and (k<tempexp.count) and
       ((tempexp.item[k]=')') or (tempexp.item[k]=']')) then break;
       inc(k);
      end;
     if(i-j<=0) then
      begin
       tempcstr1:=c_string_copy_item(tempexp,i+1,k-i);
       tempcstr2:=c_string_generate_from_string('inc()',true);
       tempres:=convert_c_expression_to_pas_expression(tempcstr1,pastree);
       m:=1;
       while(m<=tempres.temptypecount) do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
        end;
       m:=1;
       while(m<=tempres.formercount)do
        begin
         inc(res.formercount);
         SetLength(res.formerexp,res.formercount);
         res.formerexp[res.formercount-1]:=tempres.formerexp[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.formercount);
         SetLength(res.formerexp,res.formercount);
         res.formerexp[res.formercount-1]:=tempres.latterexp[m-1];
        end;
       c_string_insert_string(tempres.exp,tempcstr2,3);
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr2;
      end
     else if(k-i<=0) then
      begin
       tempcstr1:=c_string_copy_item(tempexp,j,i-j);
       tempres:=convert_c_expression_to_pas_expression(tempcstr1,pastree);
       tempcstr2:=c_string_generate_from_string('inc()',true);
       m:=1;
       while(m<=tempres.temptypecount) do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.formerexp[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.latterexp[m-1];
        end;
       c_string_insert_string(tempres.exp,tempcstr2,3);
       inc(res.lattercount);
       SetLength(res.latterexp,res.lattercount);
       res.latterexp[res.lattercount-1]:=tempcstr2;
      end
     else
      begin
       tempcstr1:=c_string_copy_item(tempexp,j,i-j);
       tempres:=convert_c_expression_to_pas_expression(tempcstr1,pastree);
       tempcstr2:=c_string_generate_from_string('inc()',true);
       m:=1;
       while(m<=tempres.temptypecount) do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.formerexp[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.latterexp[m-1];
        end;
       c_string_insert_string(tempres.exp,tempcstr2,3);
       inc(res.lattercount);
       SetLength(res.latterexp,res.lattercount);
       res.latterexp[res.lattercount-1]:=tempcstr2;
      end;
     c_string_delete_item(tempexp,i,1);
     if(tempexp.count=1) then c_string_delete_item(tempexp,1,1);
    end
   else if(tempexp.item[i-1]='--') then
    begin
     j:=i; layer:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') or (tempexp.item[j-1]=']') then inc(layer);
       if(tempexp.item[j-1]='(') or (tempexp.item[j-1]='[') then dec(layer);
       if(layer=0) and (c_string_is_operator(tempexp.item[j-1],false)>0)
       and (Pos('=',tempexp.item[j-1])>0) then
        begin
         inc(j); break;
        end;
       if(layer=0) and (j<i) and (tempexp.item[j-1]='++') or (tempexp.item[j-1]='--') then
        begin
         inc(j); break;
        end;
       if(layer<0) and ((tempexp.item[j-1]='(') or (tempexp.item[j-1]='[')) then
        begin
         inc(j); break;
        end;
       if(layer=0) and (tempexp.item[j-1]<>'*') and
       (c_string_is_operator(tempexp.item[j-1],false)=0) then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i; layer:=0;
     while(k<tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') or (tempexp.item[j-1]='[') then inc(layer);
       if(tempexp.item[k-1]=')') or (tempexp.item[j-1]=']') then dec(layer);
       if(layer<0) and ((tempexp.item[k-1]=')') or (tempexp.item[k-1]=']')) then
        begin
         dec(k); break;
        end;
       if(layer=0) and (c_string_is_operator(tempexp.item[k-1],false)>0)
       and (Pos('=',tempexp.item[k-1])>0) then
        begin
         dec(k); break;
        end;
       if(layer=0) and (j<i) and (tempexp.item[k-1]='++') or (tempexp.item[k-1]='--') then
        begin
         dec(k); break;
        end;
       if(layer=0) and (k<tempexp.count) and
       ((tempexp.item[k]=')') or (tempexp.item[k]=']')) then break;
       inc(k);
      end;
     if(i-j<=0) then
      begin
       tempcstr1:=c_string_copy_item(tempexp,i+1,k-i);
       tempcstr2:=c_string_generate_from_string('dec()',true);
       tempres:=convert_c_expression_to_pas_expression(tempcstr1,pastree);
       m:=1;
       while(m<=tempres.temptypecount) do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
        end;
       m:=1;
       while(m<=tempres.formercount)do
        begin
         inc(res.formercount);
         SetLength(res.formerexp,res.formercount);
         res.formerexp[res.formercount-1]:=tempres.formerexp[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.formercount);
         SetLength(res.formerexp,res.formercount);
         res.formerexp[res.formercount-1]:=tempres.latterexp[m-1];
        end;
       c_string_insert_string(tempres.exp,tempcstr2,3);
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr2;
      end
     else if(k-i<=0) then
      begin
       tempcstr1:=c_string_copy_item(tempexp,j,i-j);
       tempres:=convert_c_expression_to_pas_expression(tempcstr1,pastree);
       tempcstr2:=c_string_generate_from_string('dec()',true);
       m:=1;
       while(m<=tempres.temptypecount) do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.formerexp[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.latterexp[m-1];
        end;
       c_string_insert_string(tempres.exp,tempcstr2,3);
       inc(res.lattercount);
       SetLength(res.latterexp,res.lattercount);
       res.latterexp[res.lattercount-1]:=tempcstr2;
      end
     else
      begin
       tempcstr1:=c_string_copy_item(tempexp,j,i-j);
       tempres:=convert_c_expression_to_pas_expression(tempcstr1,pastree);
       tempcstr2:=c_string_generate_from_string('dec()',true);
       m:=1;
       while(m<=tempres.temptypecount) do
        begin
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1]:=tempres.temptype[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.formerexp[m-1];
        end;
       m:=1;
       while(m<=tempres.lattercount)do
        begin
         inc(res.lattercount);
         SetLength(res.latterexp,res.lattercount);
         res.latterexp[res.lattercount-1]:=tempres.latterexp[m-1];
        end;
       c_string_insert_string(tempres.exp,tempcstr2,3);
       inc(res.lattercount);
       SetLength(res.latterexp,res.lattercount);
       res.latterexp[res.lattercount-1]:=tempcstr2;
      end;
     c_string_delete_item(tempexp,i,1);
     if(tempexp.count=1) then c_string_delete_item(tempexp,1,1);
    end
   else if(tempexp.item[i-1]='::') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('.',tempexp,i);
    end
   else if(tempexp.item[i-1]='->') then
    begin
     c_string_delete_item(tempexp,i,1);
     tempcstr:=c_string_generate_from_string('^.',true);
     c_string_insert_string(tempcstr,tempexp,i);
     inc(i,2); continue;
    end
   else if(tempexp.item[i-1]='##') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('+',tempexp,i);
    end
   else if(tempexp.item[i-1]='<<') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('shl',tempexp,i);
    end
   else if(tempexp.item[i-1]='>>') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('shr',tempexp,i);
    end
   else if(tempexp.item[i-1]='/') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('div',tempexp,i);
    end
   else if(tempexp.item[i-1]='%') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('mod',tempexp,i);
    end
   else if(tempexp.item[i-1]='||') or (tempexp.item[i-1]='|') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('or',tempexp,i);
    end
   else if(tempexp.item[i-1]='&&') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('and',tempexp,i);
    end
   else if(tempexp.item[i-1]='!') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('not',tempexp,i);
    end
   else if(tempexp.item[i-1]='!=') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('<>',tempexp,i);
    end
   else if(tempexp.item[i-1]='=') then
    begin
     j:=i-1; layer:=0; layer2:=0;
     while(j>0)do
      begin
       if(tempexp.item[j-1]=')') then inc(layer);
       if(tempexp.item[j-1]='(') then dec(layer);
       if(tempexp.item[j-1]=']') then inc(layer2);
       if(tempexp.item[j-1]='[') then dec(layer2);
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='(') then break;
       if(j>1) and (layer=0) and (layer2=0) and (tempexp.item[j-2]='[') then break;
       if(j=1) then break;
       dec(j);
      end;
     k:=i+1; layer:=0; layer2:=0;
     while(k<=tempexp.count)do
      begin
       if(tempexp.item[k-1]='(') then inc(layer);
       if(tempexp.item[k-1]=')') then dec(layer);
       if(tempexp.item[k-1]='[') then inc(layer2);
       if(tempexp.item[k-1]=']') then dec(layer2);
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=')') then break;
       if(k<tempexp.count) and (layer=0) and (layer2=0) and (tempexp.item[k]=']') then break;
       if(k=tempexp.count) then break;
       inc(k);
      end;
     tempcstr1:=c_string_copy_item(tempexp,j,i-j);
     tempcstr2:=c_string_copy_item(tempexp,i+1,k-i);
     tempcstr3:=c_string_generate_from_string(':=',true);
     c_string_insert_string(tempcstr2,tempcstr3,2);
     c_string_insert_string(tempcstr1,tempcstr3,1);
     c_string_delete_item(tempexp,j,k-j+1);
     if(tempexp.count=0) then
      begin
       tempexp:=tempcstr3; break;
      end
     else
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempcstr3;
       c_string_insert_string(tempcstr2,tempexp,j);
       i:=j;
      end;
     continue;
    end
   else if(tempexp.item[i-1]='^') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('xor',tempexp,i);
    end
   else if(tempexp.item[i-1]='~') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('not',tempexp,i);
    end
   else if(copy(tempexp.item[i-1],1,2)='0x') or (copy(tempexp.item[i-1],1,2)='0X') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '$'+copy(tempexp.item[i-1],3,length(tempexp.item[i-1])-2),true);
     c_string_delete_item(tempexp,i,1);
     c_string_insert_string(tempcstr2,tempexp,i);
     inc(i,2); continue;
    end
   else if(copy(tempexp.item[i-1],1,2)='-0x') or (copy(tempexp.item[i-1],1,2)='-0X') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '-$'+copy(tempexp.item[i-1],4,length(tempexp.item[i-1])-3),true);
     c_string_delete_item(tempexp,i,1);
     c_string_insert_string(tempcstr2,tempexp,i);
     inc(i,3); continue;
    end
   else if(copy(tempexp.item[i-1],1,2)='0b') or (copy(tempexp.item[i-1],1,2)='0b') then
    begin
     tempcstr2:=c_string_generate_from_string(IntToStr(HexToInt(tempexp.item[i-1])),true);
     c_string_delete_item(tempexp,i,1);
     c_string_insert_string(tempcstr2,tempexp,i);
     inc(i,1); continue;
    end
   else if(copy(tempexp.item[i-1],1,2)='-0b') or (copy(tempexp.item[i-1],1,2)='-0b') then
    begin
     tempcstr2:=c_string_generate_from_string(IntToStr(HexToInt(tempexp.item[i-1])),true);
     c_string_delete_item(tempexp,i,1);
     c_string_insert_string(tempcstr2,tempexp,i);
     inc(i,1); continue;
    end
   else if(copy(tempexp.item[i-1],1,1)='"') or (copy(tempexp.item[i-1],1,1)=#39) then
    begin
     tempexp.item[i-1]:=convert_c_string_to_pas_string(tempexp.item[i-1]);
     inc(i); continue;
    end
   else if(c_string_is_vaild_value(tempexp.item[i-1])) and (Pos('+',tempexp.item[i-1])>0) then
    begin
     tempexp.item[i-1]:=c_float_to_pas_float(tempexp.item[i-1]);
     inc(i); continue;
    end
   else if(tempexp.item[i-1]='NULL') or (tempexp.item[i-1]='nullptr') then
    begin
     tempexp.item[i-1]:='nil';
     inc(i); continue;
    end
   else if(tempexp.item[i-1]='stderr') then
    begin
     tempexp.item[i-1]:='ErrOutput';
     inc(i); continue;
    end
   else if(tempexp.item[i-1]='stdin') then
    begin
     tempexp.item[i-1]:='Input';
     inc(i); continue;
    end
   else if(tempexp.item[i-1]='stdout') then
    begin
     tempexp.item[i-1]:='Output';
     inc(i); continue;
    end;
   inc(i);
  end;
 i:=1;
 while(i<=tempexp.count)do
  begin
   if(tempexp.item[i-1]='==') then
    begin
     c_string_delete_item(tempexp,i,1);
     c_string_insert_item('=',tempexp,i);
    end
   else if(i>1) and (i<tempexp.count) and (tempexp.item[i-2]='0')
   and (tempexp.item[i-1]='==')
   and (tempexp.item[i]='1') then
    begin
     c_string_delete_item(tempexp,i-1,3);
     c_string_insert_item('False',tempexp,i);
    end
   else if(i>1) and (i<tempexp.count) and (tempexp.item[i-2]='1')
   and (tempexp.item[i-1]='==')
   and (tempexp.item[i]='0') then
    begin
     c_string_delete_item(tempexp,i-1,3);
     c_string_insert_item('False',tempexp,i);
    end
   else if(i>1) and (i<tempexp.count) and (tempexp.item[i-2]='0')
   and (tempexp.item[i-1]='==')
   and (tempexp.item[i]='0') then
    begin
     c_string_delete_item(tempexp,i-1,3);
     c_string_insert_item('True',tempexp,i);
    end
   else if(i>1) and (i<tempexp.count) and (tempexp.item[i-2]='1')
   and (tempexp.item[i-1]='==')
   and (tempexp.item[i]='1') then
    begin
     c_string_delete_item(tempexp,i-1,3);
     c_string_insert_item('True',tempexp,i);
    end
   else if(tempexp.item[i-1]='->') then
    begin
     c_string_delete_item(tempexp,i,1);
     tempcstr:=c_string_generate_from_string('^.',true);
     c_string_insert_string(tempcstr,tempexp,i);
     inc(i,2); continue;
    end
   else if(tempexp.item[i-1]='&') then
    begin
     if(i>1) and (c_string_is_operator(tempexp.item[i-2],true)=0) then
      begin
       c_string_delete_item(tempexp,i,1);
       c_string_insert_item('and',tempexp,i);
      end
     else
      begin
       c_string_delete_item(tempexp,i,1);
       c_string_insert_item('@',tempexp,i);
      end;
    end
   else if(tempexp.item[i-1]='*') then
    begin
     if(i>1) and (i<tempexp.count) and (c_string_is_operator(tempexp.item[i-2],true)=0)
     and (c_string_is_operator(tempexp.item[i],true)=0) and
     (c_string_is_bracket_string(tempexp.item[i-2])=false) and
     (c_string_is_bracket_string(tempexp.item[i])=false) then
      begin
       inc(i); continue;
      end
     else if(i>1) and (i<tempexp.count) and ((tempexp.item[i-2]=')') or (tempexp.item[i-2]=']'))
     and ((tempexp.item[i]='(') or (tempexp.item[i]='[')) then
      begin
       inc(i); continue;
      end
     else if(i<tempexp.count) and (c_string_is_operator(tempexp.item[i],true)=0) then
      begin
       j:=i+1; layer:=0;
       while(j<=tempexp.count)do
        begin
         if(tempexp.item[j-1]='(') or (tempexp.item[j-1]='[') then inc(layer);
         if(tempexp.item[j-1]=')') or (tempexp.item[j-1]=']') then dec(layer);
         if(layer=0) then break;
         inc(j);
        end;
       c_string_insert_item('^',tempexp,j+1);
       c_string_delete_item(tempexp,i,1); continue;
      end
     else
      begin
       inc(i); continue;
      end;
    end
   else if(i>1) and (tempexp.item[i-2]='this') and (tempexp.item[i-1]='^') then
    begin
     c_string_delete_item(tempexp,i-1,2);
     dec(i); continue;
    end;
   inc(i);
  end;
 i:=1;
 while(i<=tempexp.count)do
  begin
   if(tempexp.item[i-1]='{') then
    begin
     tempexp.item[i-1]:='(';
    end
   else if(tempexp.item[i-1]='}') then
    begin
     tempexp.item[i-1]:=')';
    end;
   inc(i);
  end;
 i:=1;
 while(i<=tempexp.count)do
  begin
   if(tempexp.item[i-1]='#') then
    begin
     j:=i+1;
     while(j<=tempexp.count)do
      begin
       if(tempexp.status[j-1]=2) then break;
       inc(j);
      end;
     tempcstr:=c_string_copy_item(tempexp,i+2,j-i-1);
     k:=1;
     while(k<=tempcstr.Count)do
      begin
       if(LowerCase(tempcstr.item[k-1])='defined') or (LowerCase(tempcstr.item[k-1])='sizeof') then
        begin
         m:=k+1; layer2:=0;
         while(m<=tempcstr.count)do
          begin
           if(tempcstr.item[m-1]='(') then inc(layer2);
           if(tempcstr.item[m-1]=')') then dec(layer2);
           if(layer2=0) then break;
           inc(m);
          end;
         if(m-k=1) then
          begin
           c_string_insert_item(')',tempcstr,m+1);
           c_string_insert_item('(',tempcstr,k+1);
          end;
         k:=m+1;
        end;
       inc(k);
      end;
     if(tempexp.item[i]='ifdef') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$ifdef}',true);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count);
      end
     else if(tempexp.item[i]='ifndef') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$ifndef}',true);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count);
      end
     else if(tempexp.item[i]='if') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$if}',true);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count);
      end
     else if(tempexp.item[i]='elif') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$elseif}',true);
       c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count);
      end
     else if(tempexp.item[i]='else') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$else}',true);
      end
     else if(tempexp.item[i]='endif') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$endif}',true);
      end;
     c_string_delete_item(tempexp,i,j-i+1);
     c_string_insert_string(tempcstr2,tempexp,i);
     i:=i+tempcstr2.Count; continue;
    end;
   inc(i);
  end;
 res.exp:=tempexp;
 tempres:=convert_c_func_to_pas_func(res.exp);
 for i:=1 to tempres.temptypecount do
  begin
   inc(res.temptypecount);
   SetLength(res.temptype,res.temptypecount);
   res.temptype[res.temptypecount-1]:=tempres.temptype[i-1];
  end;
 res.exp:=tempres.exp;
 if(pastree<>nil) then res.exp:=convert_c_lambda_to_pas_lambda(res.exp,pastree);
 c_string_delete_unnecessary_bracket(res.exp,true);
 convert_c_expression_to_pas_expression:=res;
end;
function convert_c_ifdef_condition_to_pas(cc:c_string;pastree:Ppas_tree=nil):pas_temp;
begin
 convert_c_ifdef_condition_to_pas:=convert_c_expression_to_pas_expression(cc,pastree);
end;
function convert_c_number_to_pas_number(cnum:string):string;
var i:SizeInt;
    tempstr:string;
begin
 if(copy(cnum,1,2)='-0x') or (copy(cnum,1,2)='-0X') then
 convert_c_number_to_pas_number:='-$'+copy(cnum,4,length(cnum)-3)
 else if(copy(cnum,1,2)='0x') or (copy(cnum,1,2)='0X') then
 convert_c_number_to_pas_number:='$'+copy(cnum,3,length(cnum)-2)
 else if(copy(cnum,1,2)='-0b') or (copy(cnum,1,2)='-0B') then
  begin
   tempstr:=copy(cnum,2,length(cnum)-1);
   convert_c_number_to_pas_number:='-'+IntToStr(HexToInt(tempstr));
  end
 else if(copy(cnum,1,2)='0b') or (copy(cnum,1,2)='0B') then
  begin
   tempstr:=cnum;
   convert_c_number_to_pas_number:=IntToStr(HexToInt(tempstr));
  end
 else
 convert_c_number_to_pas_number:=cnum;
end;
procedure convert_c_enum_content_to_pas_content(var content:c_string);
var i,j,k,layer3,maxlayer:SizeInt;
    tempcstr2,tempcstr:c_string;
begin
 i:=1; layer3:=0; maxlayer:=0;
 while(i<=content.count)do
  begin
   if(content.item[i-1]='{') then
    begin
     content.item[i-1]:='(';
     inc(layer3);
     if(layer3>maxlayer) then maxlayer:=layer3;
    end
   else if(content.item[i-1]='}') then
    begin
     content.item[i-1]:=')';
     dec(layer3);
    end
   else if(copy(content.item[i-1],1,2)='0x') or (copy(content.item[i-1],1,2)='0X') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '$'+copy(content.item[i-1],3,length(content.item[i-1])-2),true);
     c_string_delete_item(content,i,1);
     c_string_insert_string(tempcstr2,content,i);
     inc(i,2); continue;
    end
   else if(copy(content.item[i-1],1,3)='-0x') or (copy(content.item[i-1],1,3)='-0X') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '-$'+copy(content.item[i-1],4,length(content.item[i-1])-3),true);
     c_string_delete_item(content,i,1);
     c_string_insert_string(tempcstr2,content,i);
     inc(i,3); continue;
    end
   else if(copy(content.item[i-1],1,2)='0b') or (copy(content.item[i-1],1,2)='0B') then
    begin
     tempcstr2:=c_string_generate_from_string(
     IntToStr(HexToInt(copy(content.item[i-1],3,length(content.item[i-1])-2))),true);
     c_string_delete_item(content,i,1);
     c_string_insert_string(tempcstr2,content,i);
     inc(i,3); continue;
    end
   else if(copy(content.item[i-1],1,3)='-0b') or (copy(content.item[i-1],1,3)='-0B') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '-'+IntToStr(HexToInt(copy(content.item[i-1],4,length(content.item[i-1])-3))),true);
     c_string_delete_item(content,i,1);
     c_string_insert_string(tempcstr2,content,i);
     inc(i,3); continue;
    end
   else if(copy(content.item[i-1],1,1)='"') or (copy(content.item[i-1],1,1)=#39) then
    begin
     content.item[i-1]:=convert_c_string_to_pas_string(content.item[i-1]);
     inc(i); continue;
    end
   else if(c_string_is_vaild_value(content.item[i-1])) and (Pos('+',content.item[i-1])>0) then
    begin
     content.item[i-1]:=c_float_to_pas_float(content.item[i-1]);
     inc(i); continue;
    end
   else if(content.item[i-1]='NULL') then
    begin
     content.item[i-1]:='nil';
     inc(i); continue;
    end;
   inc(i);
  end;
 i:=1;
 while(i<=content.count)do
  begin
   if(content.item[i-1]='#') then
    begin
     j:=i;
     while(j<=content.count)do
      begin
       if(content.status[j-1]=2) then break;
       inc(j);
      end;
     tempcstr:=c_string_copy_item(content,i+2,j-i-1);
     c_string_delete_unnecessary_bracket(tempcstr);
     k:=1;
     while(k<=tempcstr.count)do
      begin
       if(LowerCase(tempcstr.item[k-1])='defined') or (LowerCase(tempcstr.item[k-1])='sizeof') then
        begin
         if(k<tempcstr.count) and (tempcstr.item[k]='(') then
          begin
           inc(k); continue;
          end;
         c_string_insert_item(')',tempcstr,k+3);
         c_string_insert_item('(',tempcstr,k+1);
         k:=k+3; continue;
        end
       else if(tempcstr.item[k-1]='&&') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('and',tempcstr,k);
        end
       else if(tempcstr.item[k-1]='||') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('or',tempcstr,k);
        end
       else if(tempcstr.item[k-1]='!=') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('<>',tempcstr,k);
        end
       else if(tempcstr.item[k-1]='!') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('not',tempcstr,k);
        end;
       inc(k);
      end;
     if(content.item[i]='ifdef') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$ifdef}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(content.item[i]='ifndef') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$ifndef}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(content.item[i]='if') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$if}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(content.item[i]='elif') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$elseif}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(content.item[i]='else') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$else}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(content.item[i]='endif') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$endif}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end;
     c_string_delete_item(content,i,j-i+1);
     if(codenoifdef=false) then c_string_insert_string(tempcstr2,content,i);
     i:=i+tempcstr2.count;
    end;
   inc(i);
  end;
end;
function convert_c_value_to_pas_value(pastree:Ppas_tree;pastype:string;layer:byte;var value:c_string;
prehandle:boolean=false):cov_array_dimension;
var i,j,k,m,n,layer2,layer3,maxlayer:SizeInt;
    temptree,temptree2,temptree3:Ppas_tree;
    tempcstr,tempcstr2,tempcstr3:c_string;
    res,tres:cov_array_dimension;
label l1,l2,l3;
begin
 if(prehandle=true) then goto l1;
 i:=1; layer3:=0; maxlayer:=0;
 while(i<=value.count)do
  begin
   if(value.item[i-1]='{') then
    begin
     value.item[i-1]:='(';
     inc(layer3);
     if(layer3>maxlayer) then maxlayer:=layer3;
    end
   else if(value.item[i-1]='}') then
    begin
     value.item[i-1]:=')';
     dec(layer3);
    end
   else if(copy(value.item[i-1],1,2)='0x') or (copy(value.item[i-1],1,2)='0X') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '$'+copy(value.item[i-1],3,length(value.item[i-1])-2),true);
     c_string_delete_item(value,i,1);
     c_string_insert_string(tempcstr2,value,i);
     inc(i,2); continue;
    end
   else if(copy(value.item[i-1],1,3)='-0x') or (copy(value.item[i-1],1,3)='-0X') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '-$'+copy(value.item[i-1],4,length(value.item[i-1])-3),true);
     c_string_delete_item(value,i,1);
     c_string_insert_string(tempcstr2,value,i);
     inc(i,3); continue;
    end
   else if(copy(value.item[i-1],1,2)='0b') or (copy(value.item[i-1],1,2)='0B') then
    begin
     tempcstr2:=c_string_generate_from_string(
     IntToStr(HexToInt(copy(value.item[i-1],3,length(value.item[i-1])-2))),true);
     c_string_delete_item(value,i,1);
     c_string_insert_string(tempcstr2,value,i);
     inc(i,3); continue;
    end
   else if(copy(value.item[i-1],1,3)='-0b') or (copy(value.item[i-1],1,3)='-0B') then
    begin
     tempcstr2:=c_string_generate_from_string(
     '-'+IntToStr(HexToInt(copy(value.item[i-1],4,length(value.item[i-1])-3))),true);
     c_string_delete_item(value,i,1);
     c_string_insert_string(tempcstr2,value,i);
     inc(i,3); continue;
    end
   else if(copy(value.item[i-1],1,1)='"') or (copy(value.item[i-1],1,1)=#39) then
    begin
     value.item[i-1]:=convert_c_string_to_pas_string(value.item[i-1]);
     inc(i); continue;
    end
   else if(c_string_is_vaild_value(value.item[i-1])) and (Pos('+',value.item[i-1])>0) then
    begin
     value.item[i-1]:=c_float_to_pas_float(value.item[i-1]);
     inc(i); continue;
    end
   else if(value.item[i-1]='NULL') then
    begin
     value.item[i-1]:='nil';
     inc(i); continue;
    end;
   inc(i);
  end;
 if(maxlayer=0) then
  begin
   value:=convert_c_expression_to_pas_expression(value,pastree).exp;
   res.arrc:=0;
   if(value.count=1) and (Copy(value.item[0],1,1)=#39) then
    begin
     inc(res.arrc);
     SetLength(res.arrd,res.arrc);
     res.arrd[res.arrc-1]:=string_get_length(value.item[0],true)+1;
    end;
   exit(res);
  end;
 i:=1;
 while(i<=value.count)do
  begin
   if(value.item[i-1]='#') then
    begin
     j:=i;
     while(j<=value.count)do
      begin
       if(value.status[j-1]=2) then break;
       inc(j);
      end;
     tempcstr:=c_string_copy_item(value,i+2,j-i-1);
     c_string_delete_unnecessary_bracket(tempcstr);
     k:=1;
     while(k<=tempcstr.count)do
      begin
       if(LowerCase(tempcstr.item[k-1])='defined') or (LowerCase(tempcstr.item[k-1])='sizeof') then
        begin
         if(k<tempcstr.count) and (tempcstr.item[k]='(') then
          begin
           inc(k); continue;
          end;
         c_string_insert_item(')',tempcstr,k+3);
         c_string_insert_item('(',tempcstr,k+1);
         k:=k+3; continue;
        end
       else if(tempcstr.item[k-1]='&&') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('and',tempcstr,k);
        end
       else if(tempcstr.item[k-1]='||') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('or',tempcstr,k);
        end
       else if(tempcstr.item[k-1]='!=') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('<>',tempcstr,k);
        end
       else if(tempcstr.item[k-1]='!') then
        begin
         c_string_delete_item(tempcstr,k,1);
         c_string_insert_item('not',tempcstr,k);
        end;
       inc(k);
      end;
     if(value.item[i]='ifdef') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$ifdef}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(value.item[i]='ifndef') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$ifndef}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(value.item[i]='if') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$if}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(value.item[i]='elif') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$elseif}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(value.item[i]='else') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$else}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end
     else if(value.item[i]='endif') and (codenoifdef=false) then
      begin
       tempcstr2:=c_string_generate_from_string('{$endif}',true);
       c_string_insert_string(tempcstr,tempcstr2,4);
      end;
     c_string_delete_item(value,i,j-i+1);
     if(codenoifdef=false) then c_string_insert_string(tempcstr2,value,i);
     i:=i+tempcstr2.count;
    end;
   inc(i);
  end;
 l1:
 i:=pastree^.count;
 while(i>=1)do
  begin
   temptree:=pastree^.child+i-1;
   if(temptree^.treetype=pas_node_record) and (Ppas_record(temptree^.content)^.recordname=pastype) then
    begin
     m:=1;
     if(m>temptree^.count) then goto l3;
     l2:
     temptree2:=temptree^.child+m-1;
     if(temptree2^.treetype<>pas_node_member) then goto l3
     else
      begin
       n:=m;
       while(n>0) and ((temptree^.child+n-1)^.treetype=pas_node_record) do dec(n);
       if(n=0) then temptree3:=nil else temptree3:=temptree^.child+n-1;
      end;
     layer2:=0; j:=1;
     while(j<=value.count)do
      begin
       if(value.item[j-1]='(') then inc(layer2);
       if(value.item[j-1]=')') then dec(layer2);
       if(layer+1+Ppas_member(temptree2^.content)^.memarraycount=layer2) and
       (value.item[j-1]='(') then
        begin
         k:=j+1;
        end
       else if(layer+1+Ppas_member(temptree2^.content)^.memarraycount=layer2)
       and (value.item[j-1]=',') then
        begin
         tempcstr:=c_string_copy_item(value,k,j-k);
         c_string_delete_item(value,k,j-k);
         tempcstr3:=c_string_generate_from_string(
         Ppas_member(temptree2^.content)^.memname+':',true);
         if(temptree3<>nil) and (temptree3^.treetype=pas_node_record)
         and (Ppas_member(temptree2^.content)^.memtype
         =Ppas_record(temptree3^.content)^.recordname) then
          begin
           convert_c_value_to_pas_value(temptree,
           Ppas_record(temptree3^.content)^.recordname,
           Ppas_member(temptree2^.content)^.memarraycount,
           tempcstr);
           c_string_insert_string(tempcstr,tempcstr3,tempcstr3.count+1);
          end
         else
          begin
           tempcstr2:=convert_c_expression_to_pas_expression(tempcstr,pastree).exp;
           c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
          end;
         c_string_insert_string(tempcstr3,value,k);
         k:=k+tempcstr3.count; j:=k;
        end
       else if(layer+Ppas_member(temptree2^.content)^.memarraycount=layer2) and
       (value.item[j-1]=')') then
        begin
         tempcstr:=c_string_copy_item(value,k,j-k);
         c_string_delete_item(value,k,j-k);
         tempcstr3:=c_string_generate_from_string(
         Ppas_member(temptree2^.content)^.memname+':',true);
         if(temptree3<>nil) and (temptree3^.treetype=pas_node_record)
         and (Ppas_member(temptree2^.content)^.memtype
         =Ppas_record(temptree3^.content)^.recordname) then
          begin
           convert_c_value_to_pas_value(temptree,
           Ppas_record(temptree3^.content)^.recordname,
           Ppas_member(temptree2^.content)^.memarraycount,
           tempcstr);
           c_string_insert_string(tempcstr,tempcstr3,tempcstr3.count+1);
          end
         else
          begin
           tempcstr2:=convert_c_expression_to_pas_expression(tempcstr,pastree).exp;
           c_string_insert_string(tempcstr2,tempcstr3,tempcstr3.count+1);
          end;
         c_string_insert_string(tempcstr3,value,k);
         k:=k+tempcstr3.count; j:=k; break;
        end;
       inc(j);
      end;
     l3:
     if(m<temptree^.count) then
      begin
       inc(m); goto l2;
      end;
    end;
   if(temptree^.count>0) then convert_c_value_to_pas_value(temptree,pastype,layer,value,true);
   dec(i);
  end;
 i:=1; j:=1; layer2:=0;
 res.arrc:=0; tres.arrc:=0;
 if(prehandle=true) then exit(res);
 while(i<=value.count)do
  begin
   if(value.item[i-1]='(') then
    begin
     inc(layer2);
     if(layer2>res.arrc) then
      begin
       inc(res.arrc);
       SetLength(res.arrd,res.arrc);
       res.arrd[res.arrc-1]:=1;
       inc(tres.arrc);
       SetLength(tres.arrd,tres.arrc);
       tres.arrd[tres.arrc-1]:=1;
      end;
    end
   else if(value.item[i-1]=')') then
    begin
     if(tres.arrd[layer2-1]>res.arrd[layer2-1]) then
      begin
       res.arrd[layer2-1]:=tres.arrd[layer2-1];
      end;
     tres.arrd[layer2-1]:=0;
     dec(layer2);
    end
   else if(value.item[i-1]=',') then
    begin
     inc(tres.arrd[layer2-1]);
    end
   else
    begin
     j:=string_get_length(value.item[i-1],true);
     if(j=-1) then
      begin
       inc(i); continue;
      end;
     inc(layer2);
     if(layer2>res.arrc) then
      begin
       inc(res.arrc);
       SetLength(res.arrd,res.arrc);
       res.arrd[res.arrc-1]:=j+1;
       inc(tres.arrc);
       SetLength(tres.arrd,tres.arrc);
       tres.arrd[tres.arrc-1]:=j+1;
      end;
     dec(layer2);
    end;
   inc(i);
  end;
 convert_c_value_to_pas_value:=res;
end;
function convert_c_init_to_pas_expression(cinit:c_string;pastree:Ppas_tree=nil):pas_temp;
var i,j,layer:SizeInt;
    tempinit:c_string;
    res:pas_temp;
begin
 tempinit:=cinit; i:=1; j:=1; layer:=0;
 res.formercount:=0;
 while(i<=tempinit.count)do
  begin
   if(tempinit.item[i-1]='(') then inc(layer);
   if(tempinit.item[i-1]=')') then dec(layer);
   if(tempinit.item[i-1]=',') and (layer=0) then
    begin
     inc(res.formercount);
     SetLength(res.formerexp,res.formercount);
     res.formerexp[res.formercount-1]:=
     convert_c_expression_to_pas_expression(c_string_copy_item(tempinit,j,i-j),pastree).exp;
     j:=i+1;
    end
   else if(i=tempinit.count) then
    begin
     res.exp:=convert_c_expression_to_pas_expression(c_string_copy_item(tempinit,j,i-j+1),pastree).exp;
    end;
   inc(i);
  end;
 i:=1;
 while(i<=res.formercount)do
  begin
   c_string_insert_item(':=',res.formerexp[i-1],2);
   c_string_delete_unnecessary_bracket(res.formerexp[i-1],true);
   c_string_insert_item('.',res.formerexp[i-1],2);
   c_string_insert_item('Self',res.formerexp[i-1],1);
   inc(i);
  end;
 c_string_insert_item(':=',res.exp,2);
 c_string_delete_unnecessary_bracket(res.exp,true);
 c_string_insert_item('.',res.exp,1);
 c_string_insert_item('Self',res.exp,1);
 convert_c_init_to_pas_expression:=res;
end;
function convert_c_step_to_pas_expression(cstep:c_string;pastree:Ppas_tree=nil):pas_temp;
var i,j,k,layer:SizeInt;
    tempstep:c_string;
    res,tempres:pas_temp;
begin
 tempstep:=cstep; i:=1; j:=1; layer:=0;
 res.temptypecount:=0; res.formercount:=0; res.lattercount:=0;
 while(i<=tempstep.count)do
  begin
   if(tempstep.item[i-1]='(') then inc(layer);
   if(tempstep.item[i-1]=')') then dec(layer);
   if(tempstep.item[i-1]=',') and (layer=0) then
    begin
     inc(res.formercount);
     SetLength(res.formerexp,res.formercount);
     tempres:=convert_c_expression_to_pas_expression(c_string_copy_item(tempstep,j,i-j),pastree);
     for k:=1 to tempres.temptypecount do
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1]:=tempres.temptype[k-1];
      end;
     for k:=1 to tempres.formercount do
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempres.formerexp[k-1];
      end;
     for k:=1 to tempres.lattercount do
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempres.latterexp[k-1];
      end;
     inc(res.formercount);
     SetLength(res.formerexp,res.formercount);
     res.formerexp[res.formercount-1]:=tempres.exp;
     j:=i+1;
    end
   else if(i=tempstep.count) then
    begin
     inc(res.formercount);
     SetLength(res.formerexp,res.formercount);
     tempres:=convert_c_expression_to_pas_expression(c_string_copy_item(tempstep,j,i-j+1),pastree);
     for k:=1 to tempres.temptypecount do
      begin
       inc(res.temptypecount);
       SetLength(res.temptype,res.temptypecount);
       res.temptype[res.temptypecount-1]:=tempres.temptype[k-1];
      end;
     for k:=1 to tempres.formercount do
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempres.formerexp[k-1];
      end;
     for k:=1 to tempres.lattercount do
      begin
       inc(res.formercount);
       SetLength(res.formerexp,res.formercount);
       res.formerexp[res.formercount-1]:=tempres.latterexp[k-1];
      end;
     res.exp:=tempres.exp; break;
    end;
   inc(i);
  end;
 i:=1;
 while(i<=res.formercount)do
  begin
   c_string_delete_unnecessary_bracket(res.formerexp[i-1],true);
   inc(i);
  end;
 c_string_delete_unnecessary_bracket(res.exp,true);
 convert_c_step_to_pas_expression:=res;
end;
function convert_c_statement_to_pas_statement(cstate:c_string;pastree:Ppas_tree):pas_temp;
var i,j,k,m,n,count,layer:SizeInt;
    tempstr,tempstr2:string;
    temptype:cov_type;
    covarr:cov_array_dimension;
    tempstate,tempcstr:c_string;
    res:pas_temp;
begin
 i:=1; tempstate:=cstate;
 res.temptypecount:=0; res.formercount:=0; res.lattercount:=0;
 while(i<=tempstate.count)do
  begin
   if(tempstate.item[i-1]='__attribute__') then
    begin
     j:=i+1; layer:=0;
     while(j<=tempstate.count) do
      begin
       if(tempstate.item[j-1]='(') then inc(layer);
       if(tempstate.item[j-1]=')') then dec(layer);
       if(layer=0) then break;
       inc(j);
      end;
     c_string_delete_item(tempstate,i,j-i+1);
    end;
   inc(i);
  end;
 i:=1; tempstr:='';
 while(i<=tempstate.count)do
  begin
   if(tempstate.item[i-1]='*') then break;
   if(i<tempstate.count) and (tempstate.item[i]=',') then break;
   if(i<tempstate.count) and (tempstate.item[i]='=') then break;
   tempstr:=tempstr+tempstate.item[i-1];
   if(i<tempstate.count) and (tempstate.item[i-1]<>'*')
   and (tempstate.item[i]<>'*') then tempstr:=tempstr+' ';
   inc(i);
  end;
 c_string_delete_item(tempstate,1,i-1);
 res.temptypecount:=0; res.tempvarcount:=0;
 if(tempstr<>'') then
  begin
   temptype:=c_type_to_pas_type(tempstr);
   i:=1; j:=1;
   while(i<=tempstate.count)do
    begin
     if(tempstate.item[i-1]=',') or (i=tempstate.count) then
      begin
       if(tempstate.item[i-1]=',') then
       tempcstr:=c_string_copy_item(tempstate,j,i-j)
       else
       tempcstr:=c_string_copy_item(tempstate,j,i-j+1);
       tempstr2:=temptype.ctype;
       k:=1; count:=0;
       while(k<=tempcstr.count) do
        begin
         if(tempcstr.item[k-1]='*') then inc(count) else break;
         inc(res.temptypecount);
         SetLength(res.temptype,res.temptypecount);
         res.temptype[res.temptypecount-1].newname:='P'+tempstr2;
         res.temptype[res.temptypecount-1].oldname:=c_string_generate_from_string('^'+tempstr2,true);
         tempstr2:='P'+tempstr2;
         inc(k);
        end;
       inc(res.tempvarcount);
       SetLength(res.tempvar,res.tempvarcount);
       res.tempvar[res.tempvarcount-1].varname:=tempcstr.item[k-1];
       res.tempvar[res.tempvarcount-1].vartype:=tempstr2;
       inc(k); m:=k; layer:=0;
       res.tempvar[res.tempvarcount-1].vararrayc:=0;
       while(k<=tempcstr.count)do
        begin
         if(tempcstr.item[k-1]=',') or (tempcstr.item[k-1]='=') then break;
         if(tempcstr.item[k-1]='[') then inc(layer);
         if(tempcstr.item[k-1]=']') then dec(layer);
         if(layer=0) then
          begin
           inc(res.tempvar[res.tempvarcount-1].vararrayc);
           SetLength(res.tempvar[res.tempvarcount-1].vararrayd,
           res.tempvar[res.tempvarcount-1].vararrayc);
           res.tempvar[res.tempvarcount-1].vararrayd[
           res.tempvar[res.tempvarcount-1].vararrayc-1]:=c_string_copy_item(tempcstr,m+1,k-m-1);
           m:=k+1;
          end;
         inc(k);
        end;
       if(tempcstr.item[k-1]='=') then
        begin
         res.tempvar[res.tempvarcount-1].varhavevalue:=true;
         res.tempvar[res.tempvarcount-1].varvalue:=c_string_copy_item(tempcstr,k+1,tempcstr.count-k);
         covarr:=convert_c_value_to_pas_value(pastree,tempstr2,res.tempvar[res.tempvarcount-1].vararrayc,
         res.tempvar[res.tempvarcount-1].varvalue);
         for k:=1 to res.tempvar[res.tempvarcount-1].vararrayc do
          begin
           if(res.tempvar[res.tempvarcount-1].vararrayd[k-1].count=0) then
            begin
             res.tempvar[res.tempvarcount-1].vararrayd[k-1]:=
             c_string_generate_from_string('0..'+IntToStr(covarr.arrd[k-1]-1),true);
            end;
          end;
        end
       else
        begin
         res.tempvar[res.tempvarcount-1].varhavevalue:=false;
        end;
       j:=i+1;
      end;
     inc(i);
    end;
  end
 else
  begin
   res:=convert_c_expression_to_pas_expression(cstate,pastree);
  end;
 convert_c_statement_to_pas_statement:=res;
end;
procedure pas_tree_add_item(pastree:Ppas_tree;pastype:byte;pascontent:Pointer;codeseg:boolean=false);
var temptree,temptree2:Ppas_tree;
begin
 temptree:=pastree;
 inc(temptree^.count);
 ReallocMem(temptree^.child,sizeof(pas_tree)*temptree^.count);
 temptree2:=temptree^.child+temptree^.count-1;
 temptree2^.parent:=temptree;
 temptree2^.part:=codeseg;
 temptree2^.treetype:=pastype;
 temptree2^.content:=pascontent;
 temptree2^.child:=nil;
 temptree2^.count:=0;
end;
procedure rehandle_pas_tree_parent(var basetree:Ppas_tree);
var i:SizeInt;
    temptree:Ppas_tree;
begin
 i:=basetree^.count;
 while(i>0) do
  begin
   temptree:=basetree^.child+i-1;
   if(Pointer_vaild(temptree)=true) and (temptree^.treetype>pas_node_none)
   and (temptree^.treetype<=pas_node_root) then
    begin
     temptree^.parent:=basetree;
     rehandle_pas_tree_parent(temptree);
    end;
   dec(i);
  end;
end;
function convert_c_tree_to_pas_tree(ctree:Pc_tree;pastree:Ppas_tree=nil):Ppas_tree;
var i,j,k,m,n,l,r,a,b,count,ii,ii2,ii3,len,len1,len2,len3,layer,layer2:SizeInt;
    paramindex:SizeInt=0;
    tempnum:SizeInt;
    tempstr,tempstr2,tempstr3,tempstr5,tempstr6,tempstr7,tempstr8:string;
    temppas:pas_temp;
    tempcstr,tempcstr2,tempcstr3,tempcstr4,tempcstr6,tempcstr7,tempcstr8:c_string;
    ctype:cov_type;
    orgtree,orgtree2:Pc_tree;
    res,tempres:Ppas_tree;
    asmstate:Ppas_asm;
    asmcodestate:Ppas_asm_code;
    classstate:Ppas_class;
    classtagstate:Ppas_class_tag;
    conststate:Ppas_const;
    typestate:Ppas_type;
    enumstate:Ppas_enum;
    varstate:Ppas_variable;
    expstate:Ppas_expression;
    funcstate:Ppas_function;
    classfuncstate:Ppas_class_function;
    opestate:Ppas_operator;
    golstate:Ppas_goto_or_label;
    ldstate:Ppas_label_declare;
    ifdefstate:Ppas_ifdef;
    ifstate:Ppas_if_statement;
    loopstate:Ppas_loop_statement;
    usesstate:Ppas_uses;
    recstate:Ppas_record;
    retstate:Ppas_return;
    memstate:Ppas_member;
    defstate:Ppas_define;
    covarr:cov_array_dimension;
{For lambda expression handling}
    strlist:c_string_list;
    bool1,bool2:boolean;
label l1,l2,l3,l4,l5;
begin
 if(pastree=nil) then
  begin
   res:=initialize_pas_tree; res^.treetype:=pas_node_root; glopastree:=res;
  end
 else
  begin
   res:=pastree;
  end;
 if(pointer_vaild(ctree^.child)=false) or (ctree^.count=0) then exit;
 ii:=1;
 l1:
 orgtree:=ctree^.child+ii-1;
 if(Pointer_vaild(orgtree)=false) or (Pointer_vaild(orgtree^.content)=false) then
  begin
   goto l2;
  end;
 //writeln(orgtree^.treetype);
 if(orgtree^.treetype=c_node_asm) then
  begin
   asmstate:=convert_c_asm_to_pas_asm(Pc_asm(orgtree^.content));
   pas_tree_add_item(res,pas_node_asm,asmstate,false);
  end
 else if(orgtree^.treetype=c_node_asm_code) then
  begin
   New(asmcodestate);
   asmcodestate^.code:=Pc_asm_code(orgtree^.content)^.asmcode;
   pas_tree_add_item(res,pas_node_asm_code,asmcodestate,false);
  end
 else if(orgtree^.treetype=c_node_switch) then
  begin
   New(loopstate);
   loopstate^.looptype:=2;
   loopstate^.condition:=c_string_generate_from_string('False',true);
   pas_tree_add_item(res,pas_node_loop_statement,loopstate,false);
   convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
  end
 else if(orgtree^.treetype=c_node_switch_case) then
  begin
   New(ifstate);
   ifstate^.iftype:=0;
   ifstate^.havenext:=false;
   orgtree2:=ctree;
   while(orgtree2^.parent<>nil) and (orgtree2^.treetype<>c_node_switch) do orgtree2:=orgtree2^.parent;
   tempcstr:=Pc_switch(orgtree2^.content)^.exp;
   tempcstr2:=Pc_switch_case(orgtree^.content)^.constexp;
   tempcstr3:=c_string_generate_from_string('==',false);
   c_string_insert_string(tempcstr2,tempcstr3,2);
   c_string_insert_string(tempcstr,tempcstr3,1);
   ifstate^.condition:=convert_c_expression_to_pas_expression(tempcstr3,res).exp;
   pas_tree_add_item(res,pas_node_if_statement,ifstate,false);
   convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
  end
 else if(orgtree^.treetype=c_node_class) then
  begin
   New(classstate);
   classstate^.isgeneric:=Pc_class(orgtree^.content)^.generichave;
   classstate^.genericcount:=0;
   i:=1;
   if(classstate^.isgeneric=true) then
    begin
      len1:=Pc_class(orgtree^.content)^.genericcount;
      len2:=Pc_class(orgtree^.content)^.genericspeccount;
      len3:=Max(len1,len2);
      while(i<=len3) do
       begin
        if(i>len1) then tempcstr.count:=0
        else tempcstr:=Pc_class(orgtree^.content)^.genericitem[i-1];
        if(i>len2) then tempcstr2.count:=0
        else tempcstr2:=Pc_class(orgtree^.content)^.genericspec[i-1];
        if(tempcstr2.count>0) then tempstr:=c_string_to_string(tempcstr2,false)
        else tempstr:=c_string_to_string(tempcstr,false);
        ctype:=c_type_to_pas_type(tempstr);
        tempstr2:=ctype.ctype; j:=1;
        while(j<=ctype.clayer)do
         begin
          New(typestate);
          typestate^.newname:='P'+tempstr2;
          typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
          pas_tree_add_item(res,pas_node_type,typestate,false);
          inc(j);
         end;
        inc(classstate^.genericcount);
        SetLength(classstate^.generictype,classstate^.genericcount);
        classstate^.generictype[classstate^.genericcount-1]:=tempstr2;
        inc(i);
       end;
    end;
   classstate^.classname:=Pc_class(orgtree^.content)^.classname;
   classstate^.inheritcount:=Pc_class(orgtree^.content)^.inheritcount;
   i:=1; len:=Pc_class(orgtree^.content)^.inheritcount;
   while(i<=len)do
    begin
     inc(classstate^.inheritcount);
     SetLength(classstate^.inheritclass,classstate^.inheritcount);
     classstate^.inheritclass[classstate^.inheritcount-1]:=
     Pc_class(orgtree^.content)^.inheritclass[i-1];
     inc(i);
    end;
   pas_tree_add_item(res,pas_node_class,classstate,false);
   convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
  end
 else if(orgtree^.treetype=c_node_class_tag) then
  begin
   New(classtagstate);
   classtagstate^.tagtype:=Ppas_class_tag(orgtree^.content)^.tagtype;
   pas_tree_add_item(res,pas_node_class_tag,classtagstate,false);
  end
 else if(orgtree^.treetype=c_node_const) then
  begin
   i:=1; len:=Pc_const(orgtree^.content)^.ccount;
   while(i<=len)do
    begin
     j:=1;
     tempstr:=Pc_const(orgtree^.content)^.ctype;
     tempcstr:=Pc_const(orgtree^.content)^.cname[i-1];
     while(j<=tempcstr.count)do
      begin
       if(tempcstr.item[j-1]<>'*') then break;
       tempstr:=tempstr+'*';
       inc(j);
      end;
     c_string_delete_item(tempcstr,1,j-1);
     ctype:=c_type_to_pas_type(tempstr);
     j:=1; tempstr2:=ctype.ctype;
     while(j<=ctype.clayer)do
      begin
       New(typestate);
       typestate^.newname:='P'+tempstr2;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
       tempstr2:='P'+tempstr2;
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(j);
      end;
     New(conststate);
     conststate^.constname:=tempcstr.item[0];
     conststate^.consttype:=tempstr2;
     conststate^.constcount:=0;
     j:=2; k:=2; layer2:=0;
     while(j<=tempcstr.count) do
      begin
       if(tempcstr.item[j-1]='[') then inc(layer2);
       if(tempcstr.item[j-1]=']') then dec(layer2);
       if(layer2=0) and (tempcstr.item[j-1]<>']') then
        begin
         break;
        end
       else if(layer2=0) then
        begin
         inc(conststate^.constcount);
         SetLength(conststate^.constarray,conststate^.constcount);
         conststate^.constarray[conststate^.constcount-1]:=c_string_copy_item(tempcstr,k+1,j-k-1);
         k:=j+1;
        end;
       inc(j);
      end;
     conststate^.consthavevalue:=Pc_const(orgtree^.content)^.chavevalue[i-1];
     conststate^.constvalue:=Pc_const(orgtree^.content)^.cvalue[i-1];
     covarr:=convert_c_value_to_pas_value(glopastree,conststate^.consttype,
     conststate^.constcount,conststate^.constvalue);
     for n:=1 to conststate^.constcount do
      begin
       if(conststate^.constarray[n-1].Count=0) then
        begin
         conststate^.constarray[n-1]:=c_string_generate_from_string(
         '0..'+IntToStr(covarr.arrd[n-1]-1),true);
        end
       else
        begin
         tempstr6:=c_string_to_string(conststate^.constarray[n-1]);
         tempnum:=c_string_convert_integer(tempstr6);
         if(tempnum=-1) then
          begin
           conststate^.constarray[conststate^.constcount-1]:=c_string_generate_from_string('0..0',true);
          end
         else
          begin
           conststate^.constarray[conststate^.constcount-1]:=
           c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
          end;
        end;
      end;
     pas_tree_add_item(res,pas_node_const,conststate,false);
     inc(i);
    end;
  end
 else if(orgtree^.treetype=c_node_enum) then
  begin
   New(enumstate);
   enumstate^.enumcount:=0;
   i:=1; len:=Pc_enum(orgtree^.content)^.enumcount;
   while(i<=len)do
    begin
     if(Pc_enum(orgtree^.content)^.enumdep[i-1]=false) and
     (Pc_enum(orgtree^.content)^.enumuna[i-1]=false) then
      begin
       inc(enumstate^.enumcount);
       SetLength(enumstate^.enumcontent,enumstate^.enumcount);
       tempcstr:=Pc_enum(orgtree^.content)^.enumcontent[enumstate^.enumcount-1];
       enumstate^.enumcontent[enumstate^.enumcount-1]:=
       Pc_enum(orgtree^.content)^.enumcontent[enumstate^.enumcount-1];
       convert_c_enum_content_to_pas_content(enumstate^.enumcontent[enumstate^.enumcount-1]);
      end;
     inc(i);
    end;
   if(Pc_enum(orgtree^.content)^.enumdefnamecount=0) then
    begin
     if(Pc_enum(orgtree^.content)^.enumtype<>'') then
      begin
       enumstate^.enumname:=Pc_enum(orgtree^.content)^.enumtype;
      end
     else
      begin
       enumstate^.enumname:='enum'+IntToStr(newenumindex);
       inc(newenumindex);
      end;
     pas_tree_add_item(res,pas_node_enum,enumstate,false);
    end
   else if(Pc_enum(orgtree^.content)^.enumdefnamecount=1) then
    begin
     if(Pc_enum(orgtree^.content)^.enumdefname[0].count=1) then
      begin
       enumstate^.enumname:=Pc_enum(orgtree^.content)^.enumdefname[0].item[0];
      end
     else if(Pc_enum(orgtree^.content)^.enumtype<>'') then
      begin
       enumstate^.enumname:=Pc_enum(orgtree^.content)^.enumtype;
      end
     else
      begin
       enumstate^.enumname:='enum'+IntToStr(newenumindex);
       inc(newenumindex);
      end;
     pas_tree_add_item(res,pas_node_enum,enumstate,false);
     if(Pc_enum(orgtree^.content)^.enumdefname[0].count>1) then
      begin
       tempstr:=enumstate^.enumname;
       for i:=1 to Pc_enum(orgtree^.content)^.enumdefname[0].count-2 do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
         tempstr:='P'+tempstr;
        end;
       tempstr2:=Pc_enum(orgtree^.content)^.enumdefname[0].item
       [Pc_enum(orgtree^.content)^.enumdefname[0].count-1];
       New(typestate);
       typestate^.newname:=tempstr2;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
      end;
    end
   else if(Pc_enum(orgtree^.content)^.enumdefnamecount>1) then
    begin
     if(Pc_enum(orgtree^.content)^.enumtype<>'') then
      begin
       enumstate^.enumname:=Pc_enum(orgtree^.content)^.enumtype;
      end
     else
      begin
       enumstate^.enumname:='enum'+IntToStr(newenumindex);
       inc(newenumindex);
      end;
     pas_tree_add_item(res,pas_node_enum,enumstate,false);
     for j:=1 to Pc_enum(orgtree^.content)^.enumdefnamecount do
      begin
       if(Pc_enum(orgtree^.content)^.enumdefname[j-1].count>1) then
        begin
         tempstr:=enumstate^.enumname;
         for i:=1 to Pc_enum(orgtree^.content)^.enumdefname[j-1].count-2 do
          begin
           New(typestate);
           typestate^.newname:='P'+tempstr;
           typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
           tempstr:='P'+tempstr;
          end;
         tempstr2:=Pc_enum(orgtree^.content)^.enumdefname[j-1].item
         [Pc_enum(orgtree^.content)^.enumdefname[j-1].count-1];
         New(typestate);
         typestate^.newname:=tempstr2;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
        end;
      end;
    end;
   i:=1; j:=1;
   while(i<=Pc_enum(orgtree^.content)^.varcount)do
    begin
     tempcstr:=Pc_enum(orgtree^.content)^.varname[i-1];
     j:=1; count:=0; tempstr:=enumstate^.enumname;
     while(j<=tempcstr.count) and (tempcstr.item[j-1]='*') do
      begin
       New(typestate);
       typestate^.newname:='P'+tempstr;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
       tempstr:='P'+tempstr;
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(count);
       inc(j);
      end;
     if(ctree^.treetype<>c_node_struct) and (ctree^.treetype<>c_node_class)
     and(ctree^.treetype<>c_node_namespace) then
      begin
       New(varstate);
       varstate^.varname:=tempcstr.item[j-1];
       varstate^.vartype:=tempstr;
       varstate^.vararrayc:=0;
       inc(j); k:=j; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) then
          begin
           inc(varstate^.vararrayc);
           SetLength(varstate^.vararrayd,varstate^.vararrayc);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,j+1,k-j-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(varstate^.vararrayd[varstate^.vararrayc-1].count<>0) then
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           k:=j+1;
          end;
         inc(j);
        end;
       varstate^.varhavevalue:=Pc_enum(orgtree^.content)^.varhavevalue[i-1];
       if(varstate^.varhavevalue) then
        begin
         varstate^.varvalue:=Pc_enum(orgtree^.content)^.varvalue[i-1];
         covarr:=convert_c_value_to_pas_value(glopastree,tempstr,varstate^.vararrayc,varstate^.varvalue);
         for n:=1 to varstate^.vararrayc do
          begin
           if(varstate^.vararrayd[n-1].Count=0) then
            begin
             varstate^.vararrayd[n-1]:=c_string_generate_from_string(
             '0..'+IntToStr(covarr.arrd[n-1]-1),true);
            end
           else
            begin
             tempstr6:=c_string_to_string(varstate^.vararrayd[n-1]);
             tempnum:=c_string_convert_integer(tempstr6);
             if(tempnum=-1) then
              begin
               varstate^.vararrayd[n-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               varstate^.vararrayd[n-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
            end;
          end;
        end
       else
        begin
         varstate^.varvalue.count:=0;
        end;
       pas_tree_add_item(res,pas_node_variable,varstate,false);
      end
     else
      begin
       New(memstate);
       if(ctree^.treetype=c_node_class) and (Pc_class(ctree^.content)^.classname<>'') then
       memstate^.memclass:=Pc_class(ctree^.content)^.classname
       else if(ctree^.treetype=c_node_namespace) and
       (Pc_namespace(ctree^.content)^.spacename<>'') then
       memstate^.memclass:=Pc_namespace(ctree^.content)^.spacename
       else
       memstate^.memclass:='';
       memstate^.memname:=tempcstr.item[j-1];
       memstate^.memtype:=tempstr;
       memstate^.memarraycount:=0;
       inc(j); k:=j; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) then
          begin
           inc(memstate^.memarraycount);
           SetLength(memstate^.memarray,memstate^.memarraycount);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,k+1,j-k-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           k:=j+1;
          end;
         inc(j);
        end;
       pas_tree_add_item(res,pas_node_member,memstate,false);
      end;
     inc(i);
    end;
  end
 else if(orgtree^.treetype=c_node_expression) then
  begin
   temppas:=convert_c_expression_to_pas_expression(Pc_expression(orgtree^.content)^.content,res);
   i:=1;
   while(i<=temppas.temptypecount) do
    begin
     New(typestate);
     typestate^:=temppas.temptype[i-1];
     pas_tree_add_item(res,pas_node_type,typestate,false);
     inc(i);
    end;
   for i:=1 to temppas.formercount do
    begin
     New(expstate);
     expstate^.content:=temppas.formerexp[i-1];
     pas_tree_add_item(res,pas_node_expression,expstate,false);
    end;
   New(expstate);
   expstate^.content:=temppas.exp;
   pas_tree_add_item(res,pas_node_expression,expstate,false);
   for i:=1 to temppas.lattercount do
    begin
     New(expstate);
     expstate^.content:=temppas.latterexp[i-1];
     pas_tree_add_item(res,pas_node_expression,expstate,false);
    end;
  end
 else if(orgtree^.treetype=c_node_extern_c) then
  begin
   convert_c_tree_to_pas_tree(orgtree,res);
  end
 else if(orgtree^.treetype=c_node_extern) then
  begin
   i:=1; len:=Pc_extern(orgtree^.content)^.extvarcount;
   tempcstr:=c_string_generate_from_string(Pc_extern(orgtree^.content)^.exttype);
   while(i<=len)do
    begin
     tempcstr2:=Pc_extern(orgtree^.content)^.extvar[i-1];
     tempcstr6:=tempcstr2;
     c_string_insert_string(tempcstr,tempcstr2,1);
     if(c_string_check_function_pointer(tempcstr2)) then
      begin
       temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr2);
       k:=1;
       while(k<=temppas.temptypecount)do
        begin
         New(typestate);
         typestate^:=temppas.temptype[k-1];
         pas_tree_add_item(res,pas_node_type,typestate,false);
         inc(k);
        end;
       New(varstate);
       varstate^.varname:=temppas.exp.item[0];
       varstate^.vartype:=temppas.exp.item[2];
       varstate^.varext:=true;
       if(temppas.exp.count>3) and (temppas.exp.item[3]='=') then
        begin
         varstate^.varhavevalue:=true;
         varstate^.varvalue:=c_string_copy_item(temppas.exp,5,temppas.exp.count-4);
         covarr:=convert_c_value_to_pas_value(glopastree,varstate^.vartype,
         varstate^.vararrayc,varstate^.varvalue);
         for n:=1 to varstate^.vararrayc do
          begin
           if(varstate^.vararrayd[n-1].Count=0) then
            begin
             varstate^.vararrayd[n-1]:=c_string_generate_from_string(
             '0..'+IntToStr(covarr.arrd[n-1]-1),true);
            end
           else
            begin
             tempstr6:=c_string_to_string(varstate^.vararrayd[n-1]);
             tempnum:=c_string_convert_integer(tempstr6);
             if(tempnum=-1) then
              begin
               varstate^.vararrayd[n-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               varstate^.vararrayd[n-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
            end;
          end;
        end
       else
        begin
         varstate^.varhavevalue:=false;
        end;
       pas_tree_add_item(res,pas_node_variable,varstate,false);
      end
     else if(c_string_check_operator(tempcstr2)) then
      begin
       New(opestate);
       opestate^.abi:=''; opestate^.align:=''; opestate^.conv:='cdecl';
       opestate^.isinline:=false;
       opestate^.ext:=true; opestate^.resulttype:='';
       opestate^.isvirtual:=false; opestate^.isoverride:=false;
       opestate^.signname:=''; opestate^.ext:=true;
       opestate^.isgeneric:=false; opestate^.genericcount:=0;
       paramindex:=0;
       tempcstr3:=tempcstr2;
       m:=1;
       while(m<=tempcstr3.Count)do
        begin
         if(tempcstr3.item[m-1]='template') then
          begin
           opestate^.isgeneric:=true;
           n:=m+2; l:=m+2; layer:=0;
           while(n<=tempcstr3.count)do
            begin
             if(tempcstr3.item[n-1]='<') then inc(layer);
             if(tempcstr3.item[n-1]='>') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]='>')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               r:=1; l:=n+1;
               while(r<=tempcstr4.count)do
                begin
                 if(tempcstr4.item[r-1]='const') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='register') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='static') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='constexpr') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end;
                 inc(r);
                end;
               if(tempcstr4.item[0]='typename') then
                begin
                 c_string_delete_item(tempcstr4,1,1);
                end
               else
                begin
                 c_string_delete_item(tempcstr4,tempcstr4.count,1);
                end;
               tempstr2:=c_string_to_string(tempcstr4);
               ctype:=c_type_to_pas_type(tempstr2);
               tempstr3:=ctype.ctype; r:=1;
               while(r<=ctype.clayer)do
                begin
                 New(typestate);
                 typestate^.newname:='P'+tempstr3;
                 typestate^.oldname:=
                 c_string_generate_from_string('^'+tempstr3,true);
                 tempstr3:='P'+tempstr3;
                 inc(r);
                end;
               inc(opestate^.genericcount);
               SetLength(opestate^.generictype,opestate^.genericcount);
               opestate^.generictype[opestate^.genericcount-1]:=tempstr3;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,l-m+1); continue;
          end
         else if(tempcstr3.item[m-1]='<') then
          begin
           n:=m+1; l:=m+1; layer:=0; a:=0;
           while(n<=tempcstr3.count)do
            begin
             if(tempcstr3.item[n-1]='<') then inc(layer);
             if(tempcstr3.item[n-1]='>') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]='>')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               r:=1; l:=n+1; inc(a);
               while(r<=tempcstr4.count)do
                begin
                 if(tempcstr4.item[r-1]='const') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='register') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='static') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='constexpr') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end;
                 inc(r);
                end;
               if(tempcstr4.item[0]='typename') then
                begin
                 c_string_delete_item(tempcstr4,1,1);
                end
               else
                begin
                 c_string_delete_item(tempcstr4,tempcstr4.count,1);
                end;
               tempstr2:=c_string_to_string(tempcstr4);
               ctype:=c_type_to_pas_type(tempstr2);
               tempstr3:=ctype.ctype; r:=1;
               while(r<=ctype.clayer)do
                begin
                 New(typestate);
                 typestate^.newname:='P'+tempstr3;
                 typestate^.oldname:=
                 c_string_generate_from_string('^'+tempstr3,true);
                 tempstr3:='P'+tempstr3;
                 inc(r);
                end;
               if(a>opestate^.genericcount) then
                begin
                 inc(opestate^.genericcount);
                 SetLength(opestate^.generictype,opestate^.genericcount);
                 opestate^.generictype[opestate^.genericcount-1]:=tempstr3;
                end
               else
                begin
                 opestate^.generictype[a-1]:=tempstr3;
                end;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,l-m+1); continue;
          end
         else if(tempcstr3.item[m-1]='static') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='inline') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.isinline:=true; continue;
          end
         else if(tempcstr3.item[m-1]='constexpr') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='const') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='register') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='virtual') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.isvirtual:=true; continue;
          end
         else if(tempcstr3.item[m-1]='override') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.isoverride:=true; continue;
          end
         else if(tempcstr3.item[m-1]='__cdecl') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.conv:='cdecl'; continue;
          end
         else if(tempcstr3.item[m-1]='__pascal') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.conv:='pascal'; continue;
          end
         else if(tempcstr3.item[m-1]='__stdcall') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.conv:='stdcall'; continue;
          end
         else if(tempcstr3.item[m-1]='__fastcall') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.conv:='fastcall'; continue;
          end
         else if(tempcstr3.item[m-1]='__thiscall') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.conv:='thiscall'; continue;
          end
         else if(tempcstr3.item[m-1]='EFIAPI') or (tempcstr3.item[m-1]='efiapi') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.abi:='efiapi'; continue;
          end
         else if(tempcstr3.item[m-1]='WINAPI') or (tempcstr3.item[m-1]='winapi') then
          begin
           c_string_delete_item(tempcstr3,m,1); opestate^.conv:='winapi'; continue;
          end
         else if(tempcstr3.item[m-1]='__attribute__') then
          begin
           n:=m+1; l:=m+1; layer:=0;
           while(n<=tempcstr3.count) do
            begin
             if(tempcstr3.item[n-1]='(') then inc(layer);
             if(tempcstr3.item[n-1]=')') then dec(layer);
             if(tempcstr3.item[n-1]='(') and (layer=2) then
              begin
               l:=n+1;
              end
             else if(tempcstr3.item[n-1]=',') and (layer=2) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.item[0]='__ms_abi__') then
                begin
                 opestate^.abi:='ms_abi_default';
                end
               else if(tempcstr4.item[0]='__sysv_abi__') then
                begin
                 opestate^.abi:='sysv_abi_default';
                end;
              end
             else if(tempcstr3.item[n-1]=')') and (layer=1) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.item[0]='__ms_abi__') then
                begin
                 opestate^.abi:='ms_abi_default';
                end
               else if(tempcstr4.item[0]='__sysv_abi__') then
                begin
                 opestate^.abi:='sysv_abi_default';
                end;
              end;
             if(layer=0) then break;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,n-m+1);
          end
         else if(tempcstr3.item[m-1]='(') then
          begin
           n:=m+1; l:=m+1; layer:=1;
           while(n<=tempcstr3.Count)do
            begin
             if(tempcstr3.item[n-1]='(') then inc(layer);
             if(tempcstr3.item[n-1]=')') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]=')')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.count=0) then
                begin
                 l:=n+1; inc(n); continue;
                end;
               if(c_string_check_function_pointer(tempcstr4)) then
                begin
                 temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr4);
                 r:=1;
                 while(r<=temppas.temptypecount)do
                  begin
                   New(typestate);
                   typestate^:=temppas.temptype[r-1];
                   pas_tree_add_item(res,pas_node_type,typestate,false);
                   inc(r);
                  end;
                 inc(opestate^.paramcount);
                 SetLength(opestate^.param,opestate^.paramcount);
                 opestate^.param[opestate^.paramcount-1]:=temppas.exp;
                 if(temppas.exp.item[0]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   opestate^.param[opestate^.paramcount-1],1);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   opestate^.param[opestate^.paramcount-1],2);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   opestate^.param[opestate^.paramcount-1],2);
                   Inc(paramindex);
                  end;
                end
               else
                begin
                 temppas:=convert_c_param_to_pas_param(tempcstr4);
                 r:=1;
                 while(r<=temppas.temptypecount)do
                  begin
                   New(typestate);
                   typestate^:=temppas.temptype[r-1];
                   pas_tree_add_item(res,pas_node_type,typestate,false);
                   inc(r);
                  end;
                 if(temppas.exp.count=0) then
                  begin
                   l:=n+1; inc(n); continue;
                  end;
                 inc(opestate^.paramcount);
                 SetLength(opestate^.param,opestate^.paramcount);
                 opestate^.param[opestate^.paramcount-1]:=temppas.exp;
                 if(temppas.exp.item[0]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   opestate^.param[opestate^.paramcount-1],1);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   opestate^.param[opestate^.paramcount-1],2);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   opestate^.param[opestate^.paramcount-1],2);
                   Inc(paramindex);
                  end;
                end;
               l:=n+1;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,n-m+1);
          end;
         inc(m);
        end;
       opestate^.signname:=tempcstr3.item[tempcstr3.count-1];
       if(opestate^.signname='+') then opestate^.signname:='+'
       else if(opestate^.signname='-') then opestate^.signname:='-'
       else if(opestate^.signname='*') then opestate^.signname:='*'
       else if(opestate^.signname='/') then opestate^.signname:='/'
       else if(opestate^.signname='%') then opestate^.signname:='mod'
       else if(opestate^.signname='!=') then opestate^.signname:='<>'
       else if(opestate^.signname='&&') then opestate^.signname:='and'
       else if(opestate^.signname='||') then opestate^.signname:='or'
       else if(opestate^.signname='<<') then opestate^.signname:='shl'
       else if(opestate^.signname='>>') then opestate^.signname:='shr'
       else if(opestate^.signname='!') then opestate^.signname:='not'
       else if(opestate^.signname='&') then opestate^.signname:='@'
       else if(opestate^.signname='|') then opestate^.signname:='or'
       else if(opestate^.signname='^') then opestate^.signname:='xor'
       else if(opestate^.signname='!') then opestate^.signname:='not'
       else opestate^.signname:='';
       tempstr5:=''; r:=1;
       while(r<=tempcstr3.count-1) do
        begin
         tempstr5:=tempstr5+tempcstr3.item[r-1];
         if(r<tempcstr3.count-1) and (tempcstr3.item[r-1]<>'*')
         and (tempcstr3.item[r-1]<>'*') then tempstr5:=tempstr5+' ';
         inc(r);
        end;
       ctype:=c_type_to_pas_type(tempstr5); tempstr5:=ctype.ctype;
       r:=1;
       while(r<=ctype.clayer)do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr5;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr5,true);
         pas_tree_add_item(res,pas_node_type,typestate,false);
         tempstr5:='P'+tempstr5;
         inc(r);
        end;
       opestate^.resulttype:=tempstr5;
       if(opestate^.signname<>'') then
       pas_tree_add_item(res,pas_node_operator,opestate,false)
       else
       Dispose(opestate);
      end
     else if(c_string_check_function(tempcstr2)) and (c_string_check_class_function(tempcstr2)) then
      begin
       New(classfuncstate);
       classfuncstate^.abi:=''; classfuncstate^.align:=''; classfuncstate^.conv:='cdecl';
       classfuncstate^.isinline:=false;
       classfuncstate^.isasm:=false; classfuncstate^.ext:=true; classfuncstate^.resulttype:='';
       classfuncstate^.funcname:=''; classfuncstate^.paramcount:=0;
       classfuncstate^.isvirtual:=false; classfuncstate^.isoverride:=false;
       classfuncstate^.isgeneric:=false; classfuncstate^.genericcount:=0;
       paramindex:=0;
       tempcstr3:=tempcstr2;
       m:=1;
       while(m<=tempcstr3.Count)do
        begin
         if(tempcstr3.item[m-1]='template') then
          begin
           classfuncstate^.isgeneric:=true;
           n:=m+2; l:=m+2; layer:=0;
           while(n<=tempcstr3.count)do
            begin
             if(tempcstr3.item[n-1]='<') then inc(layer);
             if(tempcstr3.item[n-1]='>') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]='>')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               r:=1; l:=n+1;
               while(r<=tempcstr4.count)do
                begin
                 if(tempcstr4.item[r-1]='const') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='register') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='static') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='constexpr') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end;
                 inc(r);
                end;
               if(tempcstr4.item[0]='typename') then
                begin
                 c_string_delete_item(tempcstr4,1,1);
                end
               else
                begin
                 c_string_delete_item(tempcstr4,tempcstr4.count,1);
                end;
               tempstr2:=c_string_to_string(tempcstr4);
               ctype:=c_type_to_pas_type(tempstr2);
               tempstr3:=ctype.ctype; r:=1;
               while(r<=ctype.clayer)do
                begin
                 New(typestate);
                 typestate^.newname:='P'+tempstr3;
                 typestate^.oldname:=c_string_generate_from_string('^'+tempstr3,true);
                 tempstr3:='P'+tempstr3;
                 inc(r);
                end;
               inc(classfuncstate^.genericcount);
               SetLength(classfuncstate^.generictype,classfuncstate^.genericcount);
               classfuncstate^.generictype[classfuncstate^.genericcount-1]:=tempstr3;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,l-m+1); continue;
          end
         else if(tempcstr3.item[m-1]='<') then
          begin
           n:=m+1; l:=m+1; layer:=0; a:=0;
           while(n<=tempcstr3.count)do
            begin
             if(tempcstr3.item[n-1]='<') then inc(layer);
             if(tempcstr3.item[n-1]='>') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]='>')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               r:=1; l:=n+1; inc(a);
               while(r<=tempcstr4.count)do
                begin
                 if(tempcstr4.item[r-1]='const') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='register') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='static') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='constexpr') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end;
                 inc(r);
                end;
               if(tempcstr4.item[0]='typename') then
                begin
                 c_string_delete_item(tempcstr4,1,1);
                end
               else
                begin
                 c_string_delete_item(tempcstr4,tempcstr4.count,1);
                end;
               tempstr2:=c_string_to_string(tempcstr4);
               ctype:=c_type_to_pas_type(tempstr2);
               tempstr3:=ctype.ctype; r:=1;
               while(r<=ctype.clayer)do
                begin
                 New(typestate);
                 typestate^.newname:='P'+tempstr3;
                 typestate^.oldname:=
                 c_string_generate_from_string('^'+tempstr3,true);
                 tempstr3:='P'+tempstr3;
                 inc(r);
                end;
               if(a>classfuncstate^.genericcount) then
                begin
                 inc(classfuncstate^.genericcount);
                 SetLength(classfuncstate^.generictype,classfuncstate^.genericcount);
                 classfuncstate^.generictype[classfuncstate^.genericcount-1]:=tempstr3;
                end
               else
                begin
                 classfuncstate^.generictype[a-1]:=tempstr3;
                end;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,l-m+1); continue;
          end
         else if(tempcstr3.item[m-1]='static') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='inline') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.isinline:=true; continue;
          end
         else if(tempcstr3.item[m-1]='register') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='constexpr') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='const') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='virtual') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.isvirtual:=true; continue;
          end
         else if(tempcstr3.item[m-1]='override') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.isoverride:=true; continue;
          end
         else if(tempcstr3.item[m-1]='__asm') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.isasm:=true; continue;
          end
         else if(tempcstr3.item[m-1]='__cdecl') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.conv:='cdecl'; continue;
          end
         else if(tempcstr3.item[m-1]='__pascal') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.conv:='pascal'; continue;
          end
         else if(tempcstr3.item[m-1]='__stdcall') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.conv:='stdcall'; continue;
          end
         else if(tempcstr3.item[m-1]='__fastcall') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.conv:='fastcall'; continue;
          end
         else if(tempcstr3.item[m-1]='__thiscall') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.conv:='thiscall'; continue;
          end
         else if(tempcstr3.item[m-1]='EFIAPI') or (tempcstr3.item[m-1]='efiapi') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.abi:='efiapi'; continue;
          end
         else if(tempcstr3.item[m-1]='WINAPI') or (tempcstr3.item[m-1]='winapi') then
          begin
           c_string_delete_item(tempcstr3,m,1); classfuncstate^.conv:='winapi'; continue;
          end
         else if(tempcstr3.item[m-1]='__attribute__') then
          begin
           n:=m+1; l:=m+1; layer:=0;
           while(n<=tempcstr3.count) do
            begin
             if(tempcstr3.item[n-1]='(') then inc(layer);
             if(tempcstr3.item[n-1]=')') then dec(layer);
             if(tempcstr3.item[n-1]='(') and (layer=2) then
              begin
               l:=n+1;
              end
             else if(tempcstr3.item[n-1]=',') and (layer=2) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.item[0]='__ms_abi__') then
                begin
                 classfuncstate^.abi:='ms_abi_default';
                end
               else if(tempcstr4.item[0]='__sysv_abi__') then
                begin
                 classfuncstate^.abi:='sysv_abi_default';
                end;
              end
             else if(tempcstr3.item[n-1]=')') and (layer=1) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.item[0]='__ms_abi__') then
                begin
                 classfuncstate^.abi:='ms_abi_default';
                end
               else if(tempcstr4.item[0]='__sysv_abi__') then
                begin
                 classfuncstate^.abi:='sysv_abi_default';
                end;
              end;
             if(layer=0) then break;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,n-m+1);
          end
         else if(tempcstr3.item[m-1]='(') then
          begin
           n:=m+1; l:=m+1; layer:=1;
           while(n<=tempcstr3.Count)do
            begin
             if(tempcstr3.item[n-1]='(') then inc(layer);
             if(tempcstr3.item[n-1]=')') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]=')')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.count=0) then
                begin
                 l:=n+1; inc(n); continue;
                end;
               if(c_string_check_function_pointer(tempcstr4)) then
                begin
                 temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr4);
                 r:=1;
                 while(r<=temppas.temptypecount)do
                  begin
                   New(typestate);
                   typestate^:=temppas.temptype[r-1];
                   pas_tree_add_item(res,pas_node_type,typestate,false);
                   inc(r);
                  end;
                 inc(classfuncstate^.paramcount);
                 SetLength(classfuncstate^.param,classfuncstate^.paramcount);
                 classfuncstate^.param[classfuncstate^.paramcount-1]:=temppas.exp;
                 if(temppas.exp.item[0]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   classfuncstate^.param[classfuncstate^.paramcount-1],1);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   classfuncstate^.param[classfuncstate^.paramcount-1],2);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   classfuncstate^.param[classfuncstate^.paramcount-1],2);
                   Inc(paramindex);
                  end;
                end
               else
                begin
                 temppas:=convert_c_param_to_pas_param(tempcstr4);
                 r:=1;
                 while(r<=temppas.temptypecount)do
                  begin
                   New(typestate);
                   typestate^:=temppas.temptype[r-1];
                   pas_tree_add_item(res,pas_node_type,typestate,false);
                   inc(r);
                  end;
                 if(temppas.exp.count=0) then
                  begin
                   l:=n+1; inc(n); continue;
                  end;
                 inc(classfuncstate^.paramcount);
                 SetLength(classfuncstate^.param,classfuncstate^.paramcount);
                 classfuncstate^.param[classfuncstate^.paramcount-1]:=temppas.exp;
                 if(temppas.exp.item[0]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   classfuncstate^.param[classfuncstate^.paramcount-1],1);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   classfuncstate^.param[classfuncstate^.paramcount-1],2);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   classfuncstate^.param[classfuncstate^.paramcount-1],2);
                   Inc(paramindex);
                  end;
                end;
               l:=n+1;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,n-m+1);
          end;
         inc(m);
        end;
       classfuncstate^.funcname:=tempcstr3.item[tempcstr3.count-1];
       tempstr5:=''; r:=1;
       while(r<=tempcstr3.count-1) do
        begin
         tempstr5:=tempstr5+tempcstr3.item[r-1];
         if(r<tempcstr3.count-1) and (tempcstr3.item[r-1]<>'*')
         and (tempcstr3.item[r-1]<>'*') then tempstr5:=tempstr5+' ';
         inc(r);
        end;
       ctype:=c_type_to_pas_type(tempstr5); tempstr5:=ctype.ctype;
       r:=1;
       while(r<=ctype.clayer)do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr5;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr5,true);
         pas_tree_add_item(res,pas_node_type,typestate,false);
         tempstr5:='P'+tempstr5;
         inc(r);
        end;
       pas_tree_add_item(res,pas_node_class_function,classfuncstate,false);
      end
     else if(c_string_check_function(tempcstr2)) then
      begin
       New(funcstate);
       funcstate^.abi:=''; funcstate^.align:=''; funcstate^.conv:='cdecl'; funcstate^.funcinline:=false;
       funcstate^.isasm:=false; funcstate^.ext:=true; funcstate^.resulttype:='';
       funcstate^.funcname:=''; funcstate^.paramcount:=0; funcstate^.islambda:=false;
       funcstate^.isgeneric:=false; funcstate^.genericcount:=0;
       paramindex:=0;
       tempcstr3:=tempcstr2;
       m:=1;
       while(m<=tempcstr3.Count)do
        begin
         if(tempcstr3.item[m-1]='template') then
          begin
           funcstate^.isgeneric:=true;
           n:=m+2; l:=m+2; layer:=0;
           while(n<=tempcstr3.count)do
            begin
             if(tempcstr3.item[n-1]='<') then inc(layer);
             if(tempcstr3.item[n-1]='>') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]='>')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               r:=1; l:=n+1;
               while(r<=tempcstr4.count)do
                begin
                 if(tempcstr4.item[r-1]='const') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='register') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='static') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='constexpr') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end;
                 inc(r);
                end;
               if(tempcstr4.item[0]='typename') then
                begin
                 c_string_delete_item(tempcstr4,1,1);
                end
               else
                begin
                 c_string_delete_item(tempcstr4,tempcstr4.count,1);
                end;
               tempstr2:=c_string_to_string(tempcstr4);
               ctype:=c_type_to_pas_type(tempstr2);
               tempstr3:=ctype.ctype; r:=1;
               while(r<=ctype.clayer)do
                begin
                 New(typestate);
                 typestate^.newname:='P'+tempstr3;
                 typestate^.oldname:=
                 c_string_generate_from_string('^'+tempstr3,true);
                 tempstr3:='P'+tempstr3;
                 inc(r);
                end;
               inc(funcstate^.genericcount);
               SetLength(funcstate^.generictype,funcstate^.genericcount);
               funcstate^.generictype[funcstate^.genericcount-1]:=tempstr3;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,l-m+1); continue;
          end
         else if(tempcstr3.item[m-1]='<') then
          begin
           n:=m+1; l:=m+1; layer:=0; a:=0;
           while(n<=tempcstr3.count)do
            begin
             if(tempcstr3.item[n-1]='<') then inc(layer);
             if(tempcstr3.item[n-1]='>') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]='>')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               r:=1; l:=n+1; inc(a);
               while(r<=tempcstr4.count)do
                begin
                 if(tempcstr4.item[r-1]='const') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='register') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='static') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end
                 else if(tempcstr4.item[r-1]='constexpr') then
                  begin
                   c_string_delete_item(tempcstr4,r,1); continue;
                  end;
                 inc(r);
                end;
               if(tempcstr4.item[0]='typename') then
                begin
                 c_string_delete_item(tempcstr4,1,1);
                end
               else
                begin
                 c_string_delete_item(tempcstr4,tempcstr4.count,1);
                end;
               tempstr2:=c_string_to_string(tempcstr4);
               ctype:=c_type_to_pas_type(tempstr2);
               tempstr3:=ctype.ctype; r:=1;
               while(r<=ctype.clayer)do
                begin
                 New(typestate);
                 typestate^.newname:='P'+tempstr3;
                 typestate^.oldname:=
                 c_string_generate_from_string('^'+tempstr3,true);
                 tempstr3:='P'+tempstr3;
                 inc(r);
                end;
               if(a>funcstate^.genericcount) then
                begin
                 inc(funcstate^.genericcount);
                 SetLength(funcstate^.generictype,funcstate^.genericcount);
                 funcstate^.generictype[funcstate^.genericcount-1]:=tempstr3;
                end
               else
                begin
                 funcstate^.generictype[a-1]:=tempstr3;
                end;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,l-m+1); continue;
          end
         else if(tempcstr3.item[m-1]='static') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='inline') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.funcinline:=true; continue;
          end
         else if(tempcstr3.item[m-1]='constexpr') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='register') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='const') then
          begin
           c_string_delete_item(tempcstr3,m,1); continue;
          end
         else if(tempcstr3.item[m-1]='__asm') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.isasm:=true; continue;
          end
         else if(tempcstr3.item[m-1]='__cdecl') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.conv:='cdecl'; continue;
          end
         else if(tempcstr3.item[m-1]='__pascal') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.conv:='pascal'; continue;
          end
         else if(tempcstr3.item[m-1]='__stdcall') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.conv:='stdcall'; continue;
          end
         else if(tempcstr3.item[m-1]='__fastcall') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.conv:='fastcall'; continue;
          end
         else if(tempcstr3.item[m-1]='__thiscall') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.conv:='thiscall'; continue;
          end
         else if(tempcstr3.item[m-1]='EFIAPI') or (tempcstr3.item[m-1]='efiapi') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.abi:='efiapi'; continue;
          end
         else if(tempcstr3.item[m-1]='WINAPI') or (tempcstr3.item[m-1]='winapi') then
          begin
           c_string_delete_item(tempcstr3,m,1); funcstate^.conv:='winapi'; continue;
          end
         else if(tempcstr3.item[m-1]='__attribute__') then
          begin
           n:=m+1; l:=m+1; layer:=0;
           while(n<=tempcstr3.count) do
            begin
             if(tempcstr3.item[n-1]='(') then inc(layer);
             if(tempcstr3.item[n-1]=')') then dec(layer);
             if(tempcstr3.item[n-1]='(') and (layer=2) then
              begin
               l:=n+1;
              end
             else if(tempcstr3.item[n-1]=',') and (layer=2) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.item[0]='__ms_abi__') then
                begin
                 funcstate^.abi:='ms_abi_default';
                end
               else if(tempcstr4.item[0]='__sysv_abi__') then
                begin
                 funcstate^.abi:='sysv_abi_default';
                end;
              end
             else if(tempcstr3.item[n-1]=')') and (layer=1) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.item[0]='__ms_abi__') then
                begin
                 funcstate^.abi:='ms_abi_default';
                end
               else if(tempcstr4.item[0]='__sysv_abi__') then
                begin
                 funcstate^.abi:='sysv_abi_default';
                end;
              end;
             if(layer=0) then break;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,n-m+1);
          end
         else if(tempcstr3.item[m-1]='(') then
          begin
           n:=m+1; l:=m+1; layer:=1;
           while(n<=tempcstr3.Count)do
            begin
             if(tempcstr3.item[n-1]='(') then inc(layer);
             if(tempcstr3.item[n-1]=')') then dec(layer);
             if((layer=1) and (tempcstr3.item[n-1]=','))
             or((layer=0) and (tempcstr3.item[n-1]=')')) then
              begin
               tempcstr4:=c_string_copy_item(tempcstr3,l,n-l);
               if(tempcstr4.count=0) then
                begin
                 l:=n+1; inc(n); continue;
                end;
               if(c_string_check_function_pointer(tempcstr4)) then
                begin
                 temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr4);
                 r:=1;
                 while(r<=temppas.temptypecount)do
                  begin
                   New(typestate);
                   typestate^:=temppas.temptype[r-1];
                   pas_tree_add_item(res,pas_node_type,typestate,false);
                   inc(r);
                  end;
                 if(temppas.exp.count=0) then
                  begin
                   l:=n+1; inc(n); continue;
                  end;
                 inc(funcstate^.paramcount);
                 SetLength(funcstate^.param,funcstate^.paramcount);
                 funcstate^.param[funcstate^.paramcount-1]:=temppas.exp;
                 if(temppas.exp.count>0) and (temppas.exp.item[0]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   funcstate^.param[funcstate^.paramcount-1],1);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.count>1) and
                 (temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   funcstate^.param[funcstate^.paramcount-1],2);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.count>1) and
                 (temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   funcstate^.param[funcstate^.paramcount-1],2);
                   Inc(paramindex);
                  end;
                end
               else
                begin
                 temppas:=convert_c_param_to_pas_param(tempcstr4);
                 r:=1;
                 while(r<=temppas.temptypecount)do
                  begin
                   New(typestate);
                   typestate^:=temppas.temptype[r-1];
                   pas_tree_add_item(res,pas_node_type,typestate,false);
                   inc(r);
                  end;
                 inc(funcstate^.paramcount);
                 SetLength(funcstate^.param,funcstate^.paramcount);
                 funcstate^.param[funcstate^.paramcount-1]:=temppas.exp;
                 if(temppas.exp.count>0) and (temppas.exp.item[0]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   funcstate^.param[funcstate^.paramcount-1],1);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.count>1) and
                 (temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   funcstate^.param[funcstate^.paramcount-1],2);
                   Inc(paramindex);
                  end
                 else if(temppas.exp.count>1) and
                 (temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
                  begin
                   c_string_insert_item('param'+IntToStr(paramindex),
                   funcstate^.param[funcstate^.paramcount-1],2);
                   Inc(paramindex);
                  end;
                 l:=n+1;
                end;
              end;
             inc(n);
            end;
           c_string_delete_item(tempcstr3,m,n-m+1);
          end;
         inc(m);
        end;
       funcstate^.funcname:=tempcstr3.item[tempcstr3.count-1];
       tempstr5:=''; r:=1;
       while(r<=tempcstr3.count-1) do
        begin
         tempstr5:=tempstr5+tempcstr3.item[r-1];
         if(r<tempcstr3.count-1) and (tempcstr3.item[r-1]<>'*')
         and (tempcstr3.item[r-1]<>'*') then tempstr5:=tempstr5+' ';
         inc(r);
        end;
       ctype:=c_type_to_pas_type(tempstr5); tempstr5:=ctype.ctype;
       r:=1;
       while(r<=ctype.clayer)do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr5;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr5,true);
         pas_tree_add_item(res,pas_node_type,typestate,false);
         tempstr5:='P'+tempstr5;
         inc(r);
        end;
       pas_tree_add_item(res,pas_node_function,funcstate,false);
      end
     else
      begin
       k:=1; tempstr:='';
       while(k<=tempcstr.Count)do
        begin
         tempstr:=tempstr+tempcstr.item[k-1];
         if(k<tempcstr.count) then tempstr:=tempstr+' ';
         inc(k);
        end;
       k:=1;
       while(k<=tempcstr6.count) do
        begin
         if(tempcstr6.item[k-1]<>'*') then break;
         tempstr:=tempstr+'*';
         inc(k);
        end;
       c_string_delete_item(tempcstr6,1,k-1);
       ctype:=c_type_to_pas_type(tempstr); tempstr:=ctype.ctype;
       k:=1;
       while(k<=ctype.clayer)do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
         pas_tree_add_item(res,pas_node_type,typestate,false);
         tempstr:='P'+tempstr;
         inc(k);
        end;
       New(varstate);
       varstate^.varext:=true;
       varstate^.vararrayc:=0;
       varstate^.vartype:=tempstr;
       varstate^.varname:=tempcstr6.item[0];
       varstate^.varhavevalue:=false;
       l:=2; r:=2; layer:=0;
       while(l<=tempcstr6.count)do
        begin
         if(tempcstr6.item[l-1]='[') then inc(layer);
         if(tempcstr6.item[l-1]=']') then dec(layer);
         if(layer=0) and (tempcstr6.item[l-1]=']') then
          begin
           inc(varstate^.vararrayc);
           SetLength(varstate^.vararrayd,varstate^.vararrayc);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,l+1,r-l-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(varstate^.vararrayd[varstate^.vararrayc-1].count<>0) then
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           r:=l+1;
          end;
         inc(l);
        end;
       pas_tree_add_item(res,pas_node_variable,varstate,false);
      end;
     inc(i);
    end;
  end
 else if(orgtree^.treetype=c_node_function) then
  begin
   paramindex:=0;
   New(funcstate);
   funcstate^.islambda:=false;
   funcstate^.funcname:=Pc_function(orgtree^.content)^.funcname;
   if(Pc_function(orgtree^.content)^.funcabi='ms_abi') then
   funcstate^.abi:='ms_abi_default'
   else if(Pc_function(orgtree^.content)^.funcabi='sysv_abi') then
   funcstate^.abi:='sysv_abi_default'
   else
   funcstate^.abi:='';
   funcstate^.conv:=Pc_function(orgtree^.content)^.funcconv;
   funcstate^.funcinline:=Pc_function(orgtree^.content)^.funcinline;
   funcstate^.ext:=false;
   funcstate^.align:=convert_c_number_to_pas_number(Pc_function(orgtree^.content)^.funcalign);
   funcstate^.funcalias:=Pc_function(orgtree^.content)^.funcalias;
   funcstate^.funcname:=Pc_function(orgtree^.content)^.funcname;
   funcstate^.isasm:=Pc_function(orgtree^.content)^.isasm;
   funcstate^.genericcount:=0;
   i:=1;
   funcstate^.isgeneric:=Pc_function(orgtree^.content)^.generichave;
   if(funcstate^.isgeneric=false) then goto l3;
   len1:=Pc_function(orgtree^.content)^.genericcount;
   len2:=Pc_function(orgtree^.content)^.genericspeccount;
   len3:=Max(len1,len2);
   while(i<=len3) do
    begin
     if(i>len1) then tempcstr.count:=0
     else tempcstr:=Pc_function(orgtree^.content)^.genericitem[i-1];
     if(i>len2) then tempcstr2.count:=0
     else tempcstr2:=Pc_function(orgtree^.content)^.genericspec[i-1];
     if(tempcstr2.count>0) then
      begin
       if(tempcstr2.count>1) then c_string_delete_item(tempcstr2,2,1);
       tempstr:=c_string_to_string(tempcstr2,false);
      end
     else
      begin
       if(tempcstr.count>1) then c_string_delete_item(tempcstr,2,1);
       tempstr:=c_string_to_string(tempcstr,false);
      end;
     ctype:=c_type_to_pas_type(tempstr);
     tempstr2:=ctype.ctype; j:=1;
     while(j<=ctype.clayer)do
      begin
       New(typestate);
       typestate^.newname:='P'+tempstr2;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(j);
      end;
     inc(funcstate^.genericcount);
     SetLength(funcstate^.generictype,funcstate^.genericcount);
     funcstate^.generictype[funcstate^.genericcount-1]:=tempstr2;
     inc(i);
    end;
   l3:
   ctype:=c_type_to_pas_type(Pc_function(orgtree^.content)^.resulttype);
   tempstr:=ctype.ctype; i:=1;
   while(i<=ctype.clayer)do
    begin
     New(typestate);
     typestate^.newname:='P'+tempstr;
     typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
     pas_tree_add_item(res,pas_node_type,typestate,false);
     tempstr:='P'+tempstr;
     inc(i);
    end;
   funcstate^.resulttype:=tempstr;
   funcstate^.paramcount:=Pc_function(orgtree^.content)^.paramcount;
   SetLength(funcstate^.param,Pc_function(orgtree^.content)^.paramcount);
   i:=1;
   while(i<=funcstate^.paramcount)do
    begin
     if(c_string_check_function_pointer(Pc_function(orgtree^.content)^.param[i-1])=false) then
      begin
       temppas:=convert_c_param_to_pas_param(Pc_function(orgtree^.content)^.param[i-1]);
      end
     else
      begin
       temppas:=convert_c_func_pointer_to_pas_func_pointer(Pc_function(orgtree^.content)^.param[i-1]);
      end;
     j:=1;
     while(j<=temppas.temptypecount)do
      begin
       New(typestate);
       typestate^:=temppas.temptype[j-1];
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(j);
      end;
     funcstate^.param[i-1]:=temppas.exp;
     if(temppas.exp.count>0) and (temppas.exp.item[0]=':') then
      begin
       c_string_insert_item('param'+IntToStr(paramindex),funcstate^.param[i-1],1);
       Inc(paramindex);
      end
     else if(temppas.exp.count>1) and
     (temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
      begin
       c_string_insert_item('param'+IntToStr(paramindex),funcstate^.param[i-1],2);
       Inc(paramindex);
      end
     else if(temppas.exp.count>1) and
     (temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
      begin
       c_string_insert_item('param'+IntToStr(paramindex),funcstate^.param[i-1],2);
       Inc(paramindex);
      end;
     inc(i);
    end;
   pas_tree_add_item(res,pas_node_function,funcstate,false);
   if(orgtree^.count>0) then convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
  end
 else if(orgtree^.treetype=c_node_class_function) then
  begin
   paramindex:=0;
   New(classfuncstate);
   classfuncstate^.ext:=false;
   classfuncstate^.funcname:=Pc_class_function(orgtree^.content)^.funcname;
   if(Pc_class_function(orgtree^.content)^.funcabi='ms_abi') then
   classfuncstate^.abi:='ms_abi_default'
   else if(Pc_class_function(orgtree^.content)^.funcabi='sysv_abi') then
   classfuncstate^.abi:='sysv_abi_default'
   else
   classfuncstate^.abi:='';
   classfuncstate^.funcalias:=Pc_class_function(orgtree^.content)^.funcalias;
   classfuncstate^.align:=convert_c_number_to_pas_number(Pc_class_function(orgtree^.content)^.funcalign);
   classfuncstate^.conv:=Pc_class_function(orgtree^.content)^.funcconv;
   if(ctree^.treetype=c_node_class) then
   classfuncstate^.hostname:=Pc_class(ctree^.content)^.classname
   else
   classfuncstate^.hostname:=Pc_class_function(orgtree^.content)^.hostclassname;
   classfuncstate^.isabstract:=Pc_class_function(orgtree^.content)^.isabstract;
   classfuncstate^.isconstructor:=Pc_class_function(orgtree^.content)^.isconstructor;
   classfuncstate^.isinline:=Pc_class_function(orgtree^.content)^.isdestructor;
   classfuncstate^.isoverride:=Pc_class_function(orgtree^.content)^.isoverride;
   classfuncstate^.isdestructor:=Pc_class_function(orgtree^.content)^.isdestructor;
   classfuncstate^.isvirtual:=Pc_class_function(orgtree^.content)^.isvirtual;
   classfuncstate^.isasm:=Pc_class_function(orgtree^.content)^.isasm;
   i:=1;
   classfuncstate^.isgeneric:=Pc_class_function(orgtree^.content)^.generichave;
   classfuncstate^.genericcount:=0;
   if(classfuncstate^.isgeneric=false) then goto l4;
   len1:=Pc_class_function(orgtree^.content)^.genericcount;
   len2:=Pc_class_function(orgtree^.content)^.genericspeccount;
   len3:=Max(len1,len2);
   while(i<=len3) do
    begin
     if(i>len1) then tempcstr.count:=0
     else tempcstr:=Pc_class_function(orgtree^.content)^.genericitem[i-1];
     if(i>len2) then tempcstr2.count:=0
     else tempcstr2:=Pc_class_function(orgtree^.content)^.genericspec[i-1];
     if(tempcstr2.count>0) then
      begin
       if(tempcstr2.count>1) then c_string_delete_item(tempcstr2,2,1);
       tempstr:=c_string_to_string(tempcstr2,false);
      end
     else
      begin
       if(tempcstr.count>1) then c_string_delete_item(tempcstr,2,1);
       tempstr:=c_string_to_string(tempcstr,false);
      end;
     ctype:=c_type_to_pas_type(tempstr);
     tempstr2:=ctype.ctype; j:=1;
     while(j<=ctype.clayer)do
      begin
       New(typestate);
       typestate^.newname:='P'+tempstr2;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(j);
      end;
     inc(classfuncstate^.genericcount);
     SetLength(classfuncstate^.generictype,classfuncstate^.genericcount);
     classfuncstate^.generictype[classfuncstate^.genericcount-1]:=tempstr2;
     inc(i);
    end;
   l4:
   ctype:=c_type_to_pas_type(Pc_class_function(orgtree^.content)^.resulttype);
   tempstr:=ctype.ctype; i:=1;
   while(i<=ctype.clayer)do
    begin
     New(typestate);
     typestate^.newname:='P'+tempstr;
     typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
     pas_tree_add_item(res,pas_node_type,typestate,false);
     tempstr:='P'+tempstr;
     inc(i);
    end;
   classfuncstate^.resulttype:=tempstr;
   classfuncstate^.paramcount:=Pc_class_function(orgtree^.content)^.paramcount;
   SetLength(classfuncstate^.param,classfuncstate^.paramcount);
   i:=1;
   while(i<=classfuncstate^.paramcount)do
    begin
     if(c_string_check_function_pointer(Pc_class_function(orgtree^.content)^.param[i-1])=false) then
      begin
       temppas:=convert_c_param_to_pas_param(Pc_class_function(orgtree^.content)^.param[i-1]);
      end
     else
      begin
       temppas:=convert_c_func_pointer_to_pas_func_pointer(
       Pc_class_function(orgtree^.content)^.param[i-1]);
      end;
     j:=1;
     while(j<=temppas.temptypecount)do
      begin
       New(typestate);
       typestate^:=temppas.temptype[j-1];
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(j);
      end;
     classfuncstate^.param[i-1]:=temppas.exp;
     if(temppas.exp.count>0) and (temppas.exp.item[0]=':') then
      begin
       c_string_insert_item('param'+IntToStr(paramindex),
       classfuncstate^.param[i-1],1);
       Inc(paramindex);
      end
     else if(temppas.exp.count>1) and
     (temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
      begin
       c_string_insert_item('param'+IntToStr(paramindex),
       classfuncstate^.param[i-1],2);
       Inc(paramindex);
      end
     else if(temppas.exp.count>1) and
     (temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
      begin
       c_string_insert_item('param'+IntToStr(paramindex),
       classfuncstate^.param[i-1],2);
       Inc(paramindex);
      end;
     inc(i);
    end;
   pas_tree_add_item(res,pas_node_class_function,classfuncstate,false);
   if(orgtree^.count>0) then
    begin
     if(ctree^.treetype=c_node_class) then
     pas_tree_add_item(res,pas_node_class_function,classfuncstate,false);
    end;
   if(Pc_class_function(orgtree^.content)^.funchaveinit=true) then
    begin
     tempres:=res^.child+res^.count-1;
     for i:=1 to Pc_class_function(orgtree^.content)^.funcinitcount do
      begin
       New(expstate);
       expstate^.content:=
       convert_c_init_to_pas_expression(Pc_class_function(orgtree^.content)^.funcinit[i-1]).exp;
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
      end;
    end;
   if(orgtree^.count>0) then
    begin
     convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
    end;
  end
 else if(orgtree^.treetype=c_node_operator) then
  begin
   paramindex:=0;
   New(opestate);
   if(Pc_operator(orgtree^.content)^.abi='ms_abi') then
   opestate^.abi:='ms_abi_default'
   else if(Pc_operator(orgtree^.content)^.abi='sysv_abi') then
   opestate^.abi:='sysv_abi_default'
   else
   opestate^.abi:='';
   opestate^.conv:=Pc_operator(orgtree^.content)^.conv;
   opestate^.ext:=false;
   opestate^.alias:=Pc_operator(orgtree^.content)^.opealias;
   opestate^.align:=Pc_operator(orgtree^.content)^.align;
   opestate^.isinline:=Pc_operator(orgtree^.content)^.isinline;
   opestate^.isoverride:=Pc_operator(orgtree^.content)^.isoverride;
   opestate^.isvirtual:=Pc_operator(orgtree^.content)^.isvirtual;
   if(Pc_operator(orgtree^.content)^.opesign='!=') then
   opestate^.signname:='<>'
   else if(Pc_operator(orgtree^.content)^.opesign='&&') then
   opestate^.signname:='and'
   else if(Pc_operator(orgtree^.content)^.opesign='||') then
   opestate^.signname:='or'
   else if(Pc_operator(orgtree^.content)^.opesign='<<') then
   opestate^.signname:='shl'
   else if(Pc_operator(orgtree^.content)^.opesign='>>') then
   opestate^.signname:='shr'
   else if(Pc_operator(orgtree^.content)^.opesign='%') then
   opestate^.signname:='mod'
   else if(Pc_operator(orgtree^.content)^.opesign='!') then
   opestate^.signname:='not'
   else if(Pc_operator(orgtree^.content)^.opesign='&') then
   opestate^.signname:='@'
   else if(Pc_operator(orgtree^.content)^.opesign='|') then
   opestate^.signname:='or'
   else if(Pc_operator(orgtree^.content)^.opesign='^') then
   opestate^.signname:='xor'
   else if(Pc_operator(orgtree^.content)^.opesign='=') then
   opestate^.signname:=':='
   else if(Pc_operator(orgtree^.content)^.opesign='+') then
   opestate^.signname:='+'
   else if(Pc_operator(orgtree^.content)^.opesign='-') then
   opestate^.signname:='-'
   else if(Pc_operator(orgtree^.content)^.opesign='*') then
   opestate^.signname:='*'
   else if(Pc_operator(orgtree^.content)^.opesign='/') then
   opestate^.signname:='/'
   else
   opestate^.signname:='';
   if(opestate^.signname<>'') then
    begin
     opestate^.isgeneric:=Pc_operator(orgtree^.content)^.generichave;
     opestate^.genericcount:=0;
     if(opestate^.isgeneric=false) then goto l5;
     len1:=Pc_operator(orgtree^.content)^.genericcount;
     len2:=Pc_operator(orgtree^.content)^.genericspeccount;
     len3:=Max(len1,len2);
     while(i<=len3) do
      begin
       if(i>len1) then tempcstr.count:=0
       else tempcstr:=Pc_operator(orgtree^.content)^.genericitem[i-1];
       if(i>len2) then tempcstr2.count:=0
       else tempcstr2:=Pc_operator(orgtree^.content)^.genericspec[i-1];
       if(tempcstr2.count>0) then
        begin
         if(tempcstr2.count>1) then c_string_delete_item(tempcstr2,2,1);
         tempstr:=c_string_to_string(tempcstr2,false);
        end
       else
        begin
         if(tempcstr.count>1) then c_string_delete_item(tempcstr,2,1);
         tempstr:=c_string_to_string(tempcstr,false);
        end;
       ctype:=c_type_to_pas_type(tempstr);
       tempstr2:=ctype.ctype; j:=1;
       while(j<=ctype.clayer)do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr2;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
         pas_tree_add_item(res,pas_node_type,typestate,false);
         inc(j);
        end;
       inc(opestate^.genericcount);
       SetLength(opestate^.generictype,opestate^.genericcount);
       opestate^.generictype[opestate^.genericcount-1]:=tempstr2;
       inc(i);
      end;
     l5:
     ctype:=c_type_to_pas_type(Pc_operator(orgtree^.content)^.operestype);
     tempstr:=ctype.ctype; i:=1;
     while(i<=ctype.clayer)do
      begin
       New(typestate);
       typestate^.newname:='P'+tempstr;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
       pas_tree_add_item(res,pas_node_type,typestate,false);
       tempstr:='P'+tempstr;
       inc(i);
      end;
     opestate^.resulttype:=tempstr;
     opestate^.paramcount:=Pc_operator(orgtree^.content)^.opeparamcount;
     SetLength(opestate^.param,opestate^.paramcount);
     i:=1;
     while(i<=opestate^.paramcount)do
      begin
       if(c_string_check_function_pointer(Pc_operator(orgtree^.content)^.opeparam[i-1])=false) then
        begin
         temppas:=convert_c_param_to_pas_param(Pc_operator(orgtree^.content)^.opeparam[i-1]);
        end
       else
        begin
         temppas:=convert_c_func_pointer_to_pas_func_pointer(Pc_operator(orgtree^.content)^.opeparam[i-1]);
        end;
       j:=1;
       while(j<=temppas.temptypecount)do
        begin
         New(typestate);
         typestate^:=temppas.temptype[j-1];
         pas_tree_add_item(res,pas_node_type,typestate,false);
         inc(j);
        end;
       opestate^.param[i-1]:=temppas.exp;
       if(temppas.exp.count>0) and (temppas.exp.item[0]=':') then
        begin
         c_string_insert_item('param'+IntToStr(paramindex),
         opestate^.param[i-1],1);
         Inc(paramindex);
        end
       else if(temppas.exp.count>1) and
       (temppas.exp.item[0]='const') and (temppas.exp.item[1]=':') then
        begin
         c_string_insert_item('param'+IntToStr(paramindex),
         opestate^.param[i-1],2);
         Inc(paramindex);
        end
       else if(temppas.exp.count>1) and
       (temppas.exp.item[0]='var') and (temppas.exp.item[1]=':') then
        begin
         c_string_insert_item('param'+IntToStr(paramindex),
         opestate^.param[i-1],2);
         Inc(paramindex);
        end;
       inc(i);
      end;
     opestate^.resultname:='res';
     pas_tree_add_item(res,pas_node_operator,opestate,false);
     if(orgtree^.count>0) then
      begin
       pas_tree_add_item(res,pas_node_operator,opestate,false);
       convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
      end;
    end
   else Dispose(opestate);
  end
 else if(orgtree^.treetype=c_node_goto_or_label) then
  begin
   if(Pc_goto_or_label(orgtree^.content)^.islabel=true) then
    begin
     New(ldstate);
     ldstate^.name:=Pc_goto_or_label(orgtree^.content)^.name;
     pas_tree_add_item(res,pas_node_label_declare,ldstate,false);
    end;
   New(golstate);
   golstate^.islabel:=Pc_goto_or_label(orgtree^.content)^.islabel;
   golstate^.name:=Pc_goto_or_label(orgtree^.content)^.name;
   pas_tree_add_item(res,pas_node_goto_or_label,golstate,false);
  end
 else if(orgtree^.treetype=c_node_ifdef) then
  begin
   New(ifdefstate);
   ifdefstate^.deftype:=Pc_ifdef(orgtree^.content)^.deftype;
   temppas:=convert_c_ifdef_condition_to_pas(Pc_ifdef(orgtree^.content)^.condition);
   ifdefstate^.condition:=temppas.exp;
   pas_tree_add_item(res,pas_node_ifdef,ifdefstate,false);
  end
 else if(orgtree^.treetype=c_node_if_statement) then
  begin
   temppas:=convert_c_expression_to_pas_expression(Pc_if_statement(orgtree^.content)^.condition,res);
   i:=1;
   while(i<=temppas.temptypecount) do
    begin
     New(typestate);
     typestate^:=temppas.temptype[i-1];
     pas_tree_add_item(res,pas_node_type,typestate,false);
     inc(i);
    end;
   i:=1;
   while(i<=temppas.formercount)do
    begin
     New(expstate);
     expstate^.content:=temppas.formerexp[i-1];
     pas_tree_add_item(res,pas_node_expression,expstate,false);
     inc(i);
    end;
   New(ifstate);
   if(ii<=ctree^.count-1) and (Pc_if_statement(orgtree^.content)^.iftype<2) then
    begin
     orgtree2:=ctree^.child+ii;
     if(orgtree2^.treetype=c_node_if_statement) and
     (Pc_if_statement(orgtree2^.content)^.iftype>0)
     then ifstate^.havenext:=true;
    end;
   ifstate^.iftype:=Pc_if_statement(orgtree^.content)^.iftype;
   ifstate^.condition:=temppas.exp;
   c_string_delete_unnecessary_bracket(ifstate^.condition);
   pas_tree_add_item(res,pas_node_if_statement,ifstate,false);
   tempres:=res^.child+res^.count-1; tempres^.count:=0; tempres^.child:=nil; i:=1;
   while(i<=temppas.lattercount)do
    begin
     New(expstate);
     expstate^.content:=temppas.latterexp[i-1];
     pas_tree_add_item(tempres,pas_node_expression,expstate,false);
     inc(i);
    end;
   if(orgtree^.count>0) then convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
  end
 else if(orgtree^.treetype=c_node_loop_statement) then
  begin
   if(Pc_loop_statement(orgtree^.content)^.looptype=0) then
    begin
     temppas:=convert_c_statement_to_pas_statement(
     Pc_loop_statement(orgtree^.content)^.init,res);
     i:=1;
     while(i<=temppas.temptypecount) do
      begin
       New(typestate);
       typestate^:=temppas.temptype[i-1];
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(i);
      end;
     i:=1;
     while(i<=temppas.formercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.formerexp[i-1];
       pas_tree_add_item(res,pas_node_expression,expstate,false);
       inc(i);
      end;
     New(expstate);
     expstate^.content:=temppas.exp;
     pas_tree_add_item(res,pas_node_expression,expstate,false);
     temppas:=convert_c_expression_to_pas_expression(
     Pc_loop_statement(orgtree^.content)^.condition,res);
     New(loopstate);
     loopstate^.condition:=temppas.exp;
     c_string_delete_unnecessary_bracket(loopstate^.condition);
     loopstate^.looptype:=pas_node_loop_while;
     pas_tree_add_item(res,pas_node_loop_statement,loopstate,false);
     tempres:=res^.child+res^.count-1; i:=1;
     while(i<=temppas.temptypecount) do
      begin
       New(typestate);
       typestate^:=temppas.temptype[i-1];
       pas_tree_add_item(tempres,pas_node_type,typestate,false);
       inc(i);
      end;
     tempres:=res^.child+res^.count-1; i:=1;
     while(i<=temppas.formercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.formerexp[i-1];
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
       inc(i);
      end;
     if(orgtree^.count>0) then convert_c_tree_to_pas_tree(orgtree,tempres);
     tempres:=res^.child+res^.count-1; i:=1;
     while(i<=temppas.formercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.formerexp[i-1];
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
       inc(i);
      end;
     temppas:=convert_c_step_to_pas_expression(Pc_loop_statement(orgtree^.content)^.step,res);
     tempres:=res^.child+res^.count-1; i:=1;
     while(i<=temppas.temptypecount) do
      begin
       New(typestate);
       typestate^:=temppas.temptype[i-1];
       pas_tree_add_item(tempres,pas_node_type,typestate,false);
       inc(i);
      end;
     i:=1;
     while(i<=temppas.formercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.formerexp[i-1];
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
       inc(i);
      end;
     i:=1;
     while(i<=temppas.lattercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.latterexp[i-1];
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
       inc(i);
      end;
    end
   else
    begin
     temppas:=convert_c_expression_to_pas_expression(
     Pc_loop_statement(orgtree^.content)^.condition,res);
     i:=1;
     while(i<=temppas.temptypecount) do
      begin
       New(typestate);
       typestate^:=temppas.temptype[i-1];
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(i);
      end;
     New(loopstate);
     loopstate^.condition:=temppas.exp;
     c_string_delete_unnecessary_bracket(loopstate^.condition);
     loopstate^.looptype:=Pc_loop_statement(orgtree^.content)^.looptype;
     pas_tree_add_item(res,pas_node_loop_statement,loopstate,false);
     tempres:=res^.child+res^.count-1; i:=1;
     while(i<=temppas.formercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.formerexp[i-1];
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
       inc(i);
      end;
     if(orgtree^.count>0) then convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
     tempres:=res^.child+res^.count-1; i:=1;
     while(i<=temppas.lattercount)do
      begin
       New(expstate);
       expstate^.content:=temppas.latterexp[i-1];
       pas_tree_add_item(tempres,pas_node_expression,expstate,false);
       inc(i);
      end;
    end;
  end
 else if(orgtree^.treetype=c_node_include) then
  begin
   if(Pc_include(orgtree^.content)^.incname.item[0]<>'stdio') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'stdafx') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'stdlib') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'stdarg') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'errno') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'sys') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'string') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'cstdio') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'cstdlib') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'cstring') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'locale') and
   (Pc_include(orgtree^.content)^.incname.item[0]<>'iostream') then
    begin
     New(usesstate);
     i:=1;
     while(i<=Pc_include(orgtree^.content)^.incname.count)
     and (Pc_include(orgtree^.content)^.incname.item[i-1]<>'.') do inc(i);
     if(i>Pc_include(orgtree^.content)^.incname.count) then
     tempcstr:=Pc_include(orgtree^.content)^.incname
     else
     tempcstr:=c_string_copy_item(Pc_include(orgtree^.content)^.incname,1,i-1);
     usesstate^.usesname:=c_string_to_string(tempcstr);
     pas_tree_add_item(res,pas_node_uses,usesstate,false);
    end;
  end
 else if(orgtree^.treetype=c_node_namespace) then
  begin
   if(Pc_namespace(orgtree^.content)^.spacename<>'') then
    begin
     New(classstate);
     classstate^.classname:=Pc_namespace(orgtree^.content)^.spacename;
     classstate^.inheritcount:=0;
     classstate^.isgeneric:=false;
     classstate^.genericcount:=0;
     pas_tree_add_item(res,pas_node_class,classstate,false);
     convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
    end
   else convert_c_tree_to_pas_tree(orgtree,res);
  end
 else if(orgtree^.treetype=c_node_return) then
  begin
   temppas:=convert_c_expression_to_pas_expression(Pc_return(orgtree^.content)^.retvalue,res);
   i:=1;
   while(i<=temppas.temptypecount) do
    begin
     New(typestate);
     typestate^:=temppas.temptype[i-1];
     pas_tree_add_item(res,pas_node_type,typestate,false);
     inc(i);
    end;
   i:=1;
   while(i<=temppas.formercount)do
    begin
     New(expstate);
     expstate^.content:=temppas.formerexp[i-1];
     pas_tree_add_item(res,pas_node_expression,expstate,false);
     inc(i);
    end;
   i:=1;
   while(i<=temppas.lattercount)do
    begin
     New(expstate);
     expstate^.content:=temppas.latterexp[i-1];
     pas_tree_add_item(res,pas_node_expression,expstate,false);
     inc(i);
    end;
   New(retstate);
   retstate^.retvalue:=temppas.exp;
   pas_tree_add_item(res,pas_node_return,retstate,false);
  end
 else if(orgtree^.treetype=c_node_struct) then
  begin
   i:=1; len:=orgtree^.count;
   while(i<=len)do
    begin
     if((orgtree^.child+i-1)^.treetype=c_node_class_function) then break
     else if((orgtree^.child+i-1)^.treetype=c_node_class_tag) then break;
     inc(i);
    end;
   if(i<=len)then
    begin
     New(classstate);
     classstate^.isgeneric:=false;
     classstate^.genericcount:=0;
     classstate^.inheritcount:=0;
     if(Pc_struct(orgtree^.content)^.structtname<>'') then
     classstate^.classname:=Pc_struct(orgtree^.content)^.structtname
     else
      begin
       classstate^.classname:='class'+IntToStr(newclassindex);
       inc(newclassindex);
      end;
     if(Pc_struct(orgtree^.content)^.generichave=true) then
      begin
       classstate^.isgeneric:=true;
       len1:=Pc_struct(orgtree^.content)^.genericcount;
       len2:=Pc_struct(orgtree^.content)^.genericspeccount;
       len3:=Max(len1,len2);
       while(i<=len3) do
        begin
         if(i>len1) then tempcstr.count:=0
         else tempcstr:=Pc_struct(orgtree^.content)^.genericitem[i-1];
         if(i>len2) then tempcstr2.count:=0
         else tempcstr2:=Pc_struct(orgtree^.content)^.genericspec[i-1];
         if(tempcstr2.count>0) then tempstr:=c_string_to_string(tempcstr2,false)
         else tempstr:=c_string_to_string(tempcstr,false);
         ctype:=c_type_to_pas_type(tempstr);
         tempstr2:=ctype.ctype; j:=1;
         while(j<=ctype.clayer)do
          begin
           New(typestate);
           typestate^.newname:='P'+tempstr2;
           typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
           pas_tree_add_item(res,pas_node_type,typestate,false);
           inc(j);
          end;
         inc(classstate^.genericcount);
         SetLength(classstate^.generictype,classstate^.genericcount);
         classstate^.generictype[classstate^.genericcount-1]:=tempstr2;
         inc(i);
        end;
       end
      else classstate^.isgeneric:=false;
     pas_tree_add_item(res,pas_node_class,classstate,false);
     convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
     i:=1; len:=Pc_struct(orgtree^.content)^.varcount;
     while(i<=len)do
      begin
       tempcstr:=Pc_struct(orgtree^.content)^.varname[i-1];
       j:=1; count:=0; tempstr:=classstate^.classname;
       while(j<=tempcstr.count) and (tempcstr.item[j-1]='*') do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
         tempstr:='P'+tempstr;
         pas_tree_add_item(res,pas_node_type,typestate,false);
         inc(count);
         inc(j);
        end;
       if(ctree^.treetype<>c_node_struct) and (ctree^.treetype<>c_node_class)
       and(ctree^.treetype<>c_node_namespace) then
        begin
         New(varstate);
         varstate^.varname:=tempcstr.item[j-1];
         varstate^.vartype:=tempstr;
         varstate^.vararrayc:=0;
         inc(j); k:=j; layer:=0;
         while(j<=tempcstr.count)do
          begin
           if(tempcstr.item[j-1]='[') then inc(layer);
           if(tempcstr.item[j-1]=']') then dec(layer);
           if(layer=0) then
            begin
             inc(varstate^.vararrayc);
             SetLength(varstate^.vararrayd,varstate^.vararrayc);
             tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,j+1,k-j-1));
             tempnum:=c_string_convert_integer(tempstr6);
             if(varstate^.vararrayd[varstate^.vararrayc-1].count<>0) then
              begin
               varstate^.vararrayd[varstate^.vararrayc-1]:=
               c_string_generate_from_string('0..'+tempstr6+'-1',true);
              end
             else if(tempnum=-1) then
              begin
               varstate^.vararrayd[varstate^.vararrayc-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               varstate^.vararrayd[varstate^.vararrayc-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
             k:=j+1;
            end;
           inc(j);
          end;
         varstate^.varhavevalue:=Pc_struct(orgtree^.content)^.varhavevalue[i-1];
         if(varstate^.varhavevalue) then
          begin
           varstate^.varvalue:=Pc_struct(orgtree^.content)^.varvalue[i-1];
           covarr:=convert_c_value_to_pas_value(glopastree,tempstr,varstate^.vararrayc,
           varstate^.varvalue);
           for n:=1 to varstate^.vararrayc do
            begin
             if(varstate^.vararrayd[n-1].Count=0) then
              begin
               varstate^.vararrayd[n-1]:=c_string_generate_from_string(
               '0..'+IntToStr(covarr.arrd[n-1]-1),true);
              end
             else
              begin
                tempstr6:=c_string_to_string(varstate^.vararrayd[n-1]);
                tempnum:=c_string_convert_integer(tempstr6);
                if(tempnum=-1) then
                 begin
                  varstate^.vararrayd[n-1]:=c_string_generate_from_string('0..0',true);
                 end
                else
                 begin
                  varstate^.vararrayd[n-1]:=
                  c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
                end;
              end;
            end;
          end
         else
          begin
           varstate^.varvalue.count:=0;
          end;
        pas_tree_add_item(res,pas_node_variable,varstate,false);
       end
      else
       begin
        New(memstate);
        if(ctree^.treetype=c_node_class) and (Pc_class(ctree^.content)^.classname<>'') then
        memstate^.memclass:=Pc_class(ctree^.content)^.classname
        else if(ctree^.treetype=c_node_namespace) and
        (Pc_namespace(ctree^.content)^.spacename<>'') then
        memstate^.memclass:=Pc_namespace(ctree^.content)^.spacename
        else
        memstate^.memclass:='';
        memstate^.memname:=tempcstr.item[j-1];
        memstate^.memtype:=tempstr;
        memstate^.memarraycount:=0;
        inc(j); k:=j; layer:=0;
        while(j<=tempcstr.count)do
         begin
          if(tempcstr.item[j-1]='[') then inc(layer);
          if(tempcstr.item[j-1]=']') then dec(layer);
          if(layer=0) then
           begin
            inc(memstate^.memarraycount);
            SetLength(memstate^.memarray,memstate^.memarraycount);
            tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,m+1,j-m-1));
            tempnum:=c_string_convert_integer(tempstr6);
            if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
             begin
              memstate^.memarray[memstate^.memarraycount-1]:=
              c_string_generate_from_string('0..'+tempstr6+'-1',true);
             end
            else if(tempnum=-1) then
             begin
              memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
             end
            else
             begin
              memstate^.memarray[memstate^.memarraycount-1]:=
              c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
             end;
            k:=j+1;
           end;
          inc(j);
         end;
        pas_tree_add_item(res,pas_node_member,memstate,false);
       end;
      inc(i);
     end;
     goto l2;
    end;
   New(recstate);
   if(Pc_struct(orgtree^.content)^.pack>0) then recstate^.recordtype:=1
   else if(Pc_struct(orgtree^.content)^.pack=0) then recstate^.recordtype:=0;
   if(Pc_struct(orgtree^.content)^.structtype) then recstate^.recordunion:=true
   else recstate^.recordunion:=false;
   recstate^.isgeneric:=Pc_struct(orgtree^.content)^.generichave;
   i:=1; len:=orgtree^.Count;
   while(i<=len)do
    begin
     if((orgtree^.child+i-1)^.treetype=c_node_member) then
      begin
       j:=1;
       while(j<=Pc_member((orgtree^.child+i-1)^.content)^.membercount) do
        begin
         if((orgtree^.child+i-1)^.treetype=c_node_member) and
         (Pc_member((orgtree^.child+i-1)^.content)^.memberbit[j-1]<>0) then break;
         inc(j);
        end;
       if(j<=Pc_member((orgtree^.child+i-1)^.content)^.membercount) then break;
      end;
     inc(i);
    end;
   if(i<=len) then recstate^.recordtype:=2;
   if(Pc_struct(orgtree^.content)^.generichave=true) then
    begin
     recstate^.isgeneric:=true;
     len1:=Pc_struct(orgtree^.content)^.genericcount;
     len2:=Pc_struct(orgtree^.content)^.genericspeccount;
     len3:=Max(len1,len2);
     while(i<=len3) do
      begin
       if(i>len1) then tempcstr.count:=0
       else tempcstr:=Pc_struct(orgtree^.content)^.genericitem[i-1];
       if(i>len2) then tempcstr2.count:=0
       else tempcstr2:=Pc_struct(orgtree^.content)^.genericspec[i-1];
       if(tempcstr2.count>0) then tempstr:=c_string_to_string(tempcstr2,false)
       else tempstr:=c_string_to_string(tempcstr,false);
       ctype:=c_type_to_pas_type(tempstr);
       tempstr2:=ctype.ctype; j:=1;
       while(j<=ctype.clayer)do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr2;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr2,true);
         pas_tree_add_item(res,pas_node_type,typestate,false);
         inc(j);
        end;
       inc(recstate^.genericcount);
       SetLength(recstate^.generictype,recstate^.genericcount);
       recstate^.generictype[recstate^.genericcount-1]:=tempstr2;
       inc(i);
      end;
    end
   else recstate^.isgeneric:=false;
   if(Pc_struct(orgtree^.content)^.structdefnamecount=0) then
    begin
     if(Pc_struct(orgtree^.content)^.structtname<>'') then
      begin
       recstate^.recordname:=Pc_struct(orgtree^.content)^.structtname;
      end
     else
      begin
       recstate^.recordname:='rec'+IntToStr(newrecindex);
       inc(newrecindex);
      end;
     pas_tree_add_item(res,pas_node_record,recstate,false);
    end
   else if(Pc_struct(orgtree^.content)^.structdefnamecount=1) then
    begin
     if(Pc_struct(orgtree^.content)^.structdefname[0].count=1) then
      begin
       recstate^.recordname:=Pc_struct(orgtree^.content)^.structdefname[0].item[0];
      end
     else if(Pc_struct(orgtree^.content)^.structtname<>'') then
      begin
       recstate^.recordname:=Pc_struct(orgtree^.content)^.structtname;
      end
     else
      begin
       recstate^.recordname:='rec'+IntToStr(newrecindex);
       inc(newrecindex);
      end;
     pas_tree_add_item(res,pas_node_record,recstate,false);
     if(Pc_struct(orgtree^.content)^.structdefname[0].count>1) then
      begin
       tempstr:=recstate^.recordname;
       for i:=1 to Pc_struct(orgtree^.content)^.structdefname[0].count-2 do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
         tempstr:='P'+tempstr;
        end;
       tempstr2:=Pc_struct(orgtree^.content)^.structdefname[0].item
       [Pc_struct(orgtree^.content)^.structdefname[0].count-1];
       New(typestate);
       typestate^.newname:=tempstr2;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
      end;
    end
   else if(Pc_struct(orgtree^.content)^.structdefnamecount>1) then
    begin
     if(Pc_struct(orgtree^.content)^.structtname<>'') then
      begin
       recstate^.recordname:=Pc_struct(orgtree^.content)^.structtname;
      end
     else
      begin
       recstate^.recordname:='rec'+IntToStr(newrecindex);
       inc(newrecindex);
      end;
     pas_tree_add_item(res,pas_node_record,recstate,false);
     for j:=1 to Pc_struct(orgtree^.content)^.structdefnamecount do
      begin
       if(Pc_struct(orgtree^.content)^.structdefname[j-1].count>1) then
        begin
         tempstr:=recstate^.recordname;
         for i:=1 to Pc_struct(orgtree^.content)^.structdefname[j-1].count-2 do
          begin
           New(typestate);
           typestate^.newname:='P'+tempstr;
           typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
           tempstr:='P'+tempstr;
          end;
         tempstr2:=Pc_struct(orgtree^.content)^.structdefname[j-1].item
         [Pc_struct(orgtree^.content)^.structdefname[j-1].count-1];
         New(typestate);
         typestate^.newname:=tempstr2;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
        end;
      end;
    end;
   convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
   i:=1; len:=Pc_struct(orgtree^.content)^.varcount;
   while(i<=len)do
    begin
     tempcstr:=Pc_struct(orgtree^.content)^.varname[i-1];
     j:=1; count:=0; tempstr:=recstate^.recordname;
     while(j<=tempcstr.count) and (tempcstr.item[j-1]='*') do
      begin
       New(typestate);
       typestate^.newname:='P'+tempstr;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
       tempstr:='P'+tempstr;
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(count);
       inc(j);
      end;
     if(ctree^.treetype<>c_node_struct) and (ctree^.treetype<>c_node_class)
     and(ctree^.treetype<>c_node_namespace) then
      begin
       New(varstate);
       varstate^.varname:=tempcstr.item[j-1];
       varstate^.vartype:=tempstr;
       varstate^.vararrayc:=0;
       inc(j); k:=j; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) then
          begin
           inc(varstate^.vararrayc);
           SetLength(varstate^.vararrayd,varstate^.vararrayc);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,j+1,k-j-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(varstate^.vararrayd[varstate^.vararrayc-1].count<>0) then
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           k:=j+1;
          end;
         inc(j);
        end;
       varstate^.varhavevalue:=Pc_struct(orgtree^.content)^.varhavevalue[i-1];
       if(varstate^.varhavevalue) then
        begin
         varstate^.varvalue:=Pc_struct(orgtree^.content)^.varvalue[i-1];
         covarr:=convert_c_value_to_pas_value(glopastree,tempstr,varstate^.vararrayc,varstate^.varvalue);
         for n:=1 to varstate^.vararrayc do
          begin
           if(varstate^.vararrayd[n-1].Count=0) then
            begin
             varstate^.vararrayd[n-1]:=c_string_generate_from_string(
             '0..'+IntToStr(covarr.arrd[n-1]-1),true);
            end
           else
            begin
             tempstr6:=c_string_to_string(varstate^.vararrayd[n-1]);
             tempnum:=c_string_convert_integer(tempstr6);
             if(tempnum=-1) then
              begin
               varstate^.vararrayd[n-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               varstate^.vararrayd[n-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
            end;
          end;
        end
       else
        begin
         varstate^.varvalue.count:=0;
        end;
       pas_tree_add_item(res,pas_node_variable,varstate,false);
      end
     else
      begin
       New(memstate);
       if(ctree^.treetype=c_node_class) and (Pc_class(ctree^.content)^.classname<>'') then
       memstate^.memclass:=Pc_class(ctree^.content)^.classname
       else if(ctree^.treetype=c_node_namespace) and
       (Pc_namespace(ctree^.content)^.spacename<>'') then
       memstate^.memclass:=Pc_namespace(ctree^.content)^.spacename
       else
       memstate^.memclass:='';
       memstate^.memname:=tempcstr.item[j-1];
       memstate^.memtype:=tempstr;
       memstate^.memarraycount:=0;
       inc(j); k:=j; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) then
          begin
           inc(memstate^.memarraycount);
           SetLength(memstate^.memarray,memstate^.memarraycount);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,m+1,j-m-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           k:=j+1;
          end;
         inc(j);
        end;
       pas_tree_add_item(res,pas_node_member,memstate,false);
      end;
     inc(i);
    end;
  end
 else if(orgtree^.treetype=c_node_statement) then
  begin
   i:=1; len:=Pc_statement(orgtree^.content)^.varcount;
   while(i<=len)do
    begin
     tempcstr:=Pc_statement(orgtree^.content)^.varname[i-1];
     tempcstr2:=c_string_generate_from_string(Pc_statement(orgtree^.content)^.statetype,false);
     c_string_insert_string(tempcstr,tempcstr2,tempcstr2.count+1);
     if(c_string_check_function_pointer(tempcstr2)) then
      begin
       temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr2);
       j:=1;
       while(j<=temppas.temptypecount)do
        begin
         New(typestate);
         typestate^:=temppas.temptype[j-1];
         inc(j);
        end;
       New(varstate);
       varstate^.varname:=temppas.exp.item[0];
       varstate^.vartype:=temppas.exp.item[2];
       varstate^.vararrayc:=0;
       varstate^.varext:=false;
       varstate^.varhavevalue:=Pc_statement(orgtree^.content)^.varbool[i-1];
       if(varstate^.varhavevalue) then
        begin
         varstate^.varvalue:=Pc_statement(orgtree^.content)^.varvalue[i-1];
         covarr:=convert_c_value_to_pas_value(glopastree,tempstr,varstate^.vararrayc,varstate^.varvalue);
         for n:=1 to varstate^.vararrayc do
          begin
           if(varstate^.vararrayd[n-1].Count=0) then
            begin
             varstate^.vararrayd[n-1]:=c_string_generate_from_string(
             '0..'+IntToStr(covarr.arrd[n-1]-1),true);
            end
           else
            begin
             tempstr6:=c_string_to_string(varstate^.vararrayd[n-1]);
             tempnum:=c_string_convert_integer(tempstr6);
             if(tempnum=-1) then
              begin
               varstate^.vararrayd[n-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               varstate^.vararrayd[n-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
            end;
          end;
        end;
       pas_tree_add_item(res,pas_node_variable,varstate,false);
      end
     else
      begin
       j:=1; count:=0;
       ctype:=c_type_to_pas_type(Pc_statement(orgtree^.content)^.statetype);
       tempstr:=ctype.ctype;
       while(j<=tempcstr.count) and (tempcstr.item[j-1]='*') do
        begin
         New(typestate);
         typestate^.newname:='P'+tempstr;
         typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
         tempstr:='P'+tempstr;
         pas_tree_add_item(res,pas_node_type,typestate,false);
         inc(count);
         inc(j);
        end;
       New(varstate);
       varstate^.varname:=tempcstr.item[j-1];
       varstate^.vartype:=tempstr;
       varstate^.vararrayc:=0;
       varstate^.varext:=false;
       inc(j); k:=j; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) and (tempcstr.item[j-1]=']') then
          begin
           inc(varstate^.vararrayc);
           SetLength(varstate^.vararrayd,varstate^.vararrayc);
           tempcstr:=c_string_copy_item(tempcstr,k+1,j-k-1);
           tempstr:=c_string_to_string(tempcstr);
           tempnum:=c_string_convert_integer(tempstr);
           if(tempnum=-1) then
            begin
             if(varstate^.vararrayd[varstate^.vararrayc-1].count>0) then
              begin
               tempcstr3:=c_string_generate_from_string('0..',true);
               c_string_insert_item('-',tempcstr3,3);
               c_string_insert_item('1',tempcstr3,4);
               c_string_insert_string(varstate^.vararrayd[varstate^.vararrayc-1],tempcstr3,3);
               varstate^.vararrayd[varstate^.vararrayc-1]:=tempcstr3;
              end
             else
              begin
               varstate^.vararrayd[varstate^.vararrayc-1]:=
               c_string_generate_from_string('0..0',true);
              end;
            end
           else
            begin
             varstate^.vararrayd[varstate^.vararrayc-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           k:=j+1;
          end;
         inc(j);
        end;
       varstate^.varhavevalue:=Pc_statement(orgtree^.content)^.varbool[i-1];
       if(varstate^.varhavevalue) then
        begin
         varstate^.varvalue:=Pc_statement(orgtree^.content)^.varvalue[i-1];
         covarr:=convert_c_value_to_pas_value(glopastree,tempstr,varstate^.vararrayc,varstate^.varvalue);
         for n:=1 to varstate^.vararrayc do
          begin
           if(varstate^.vararrayd[n-1].Count=0) then
            begin
             varstate^.vararrayd[n-1]:=c_string_generate_from_string(
             '0..'+IntToStr(covarr.arrd[n-1]-1),true);
            end
           else
            begin
             tempstr6:=c_string_to_string(varstate^.vararrayd[n-1]);
             tempnum:=c_string_convert_integer(tempstr6);
             if(tempnum=-1) then
              begin
               varstate^.vararrayd[n-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               varstate^.vararrayd[n-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
            end;
          end;
        end;
       pas_tree_add_item(res,pas_node_variable,varstate,false);
      end;
     inc(i);
   end;
  end
 else if(orgtree^.treetype=c_node_typedef) then
  begin
   tempcstr:=Pc_typedef(orgtree^.content)^.oldvalue;
   tempcstr3:=Pc_typedef(orgtree^.content)^.newvalue;
   tempcstr2:=tempcstr3;
   c_string_insert_string(tempcstr,tempcstr2,1);
   if(c_string_check_function_pointer(tempcstr2)) then
    begin
     temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr2,true);
     i:=1; len:=temppas.temptypecount;
     while(i<=len)do
      begin
       New(typestate);
       typestate^:=temppas.temptype[i-1];
       pas_tree_add_item(res,pas_node_type,typestate,false);
       inc(i);
      end;
    end
   else
    begin
     tempstr:='';
     i:=1; len:=tempcstr.count;
     while(i<=len)do
      begin
       tempstr:=tempstr+tempcstr.item[i-1];
       if(i<len) and (tempcstr.item[i-1]<>'*') and (tempcstr.item[i]<>'*') then
       tempstr:=tempstr+' ';
       inc(i);
      end;
     ctype:=c_type_to_pas_type(tempstr);
     j:=1; tempstr:=ctype.ctype;
     while(j<=ctype.clayer) do
      begin
       inc(j);
       New(typestate);
       typestate^.newname:='P'+tempstr;
       typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
       tempstr:='P'+tempstr;
       pas_tree_add_item(res,pas_node_type,typestate,false);
      end;
     j:=2; k:=2; layer:=0; tempstr2:='';
     while(j<=tempcstr3.count)do
      begin
       if(tempcstr3.item[j-1]='[') then inc(layer);
       if(tempcstr3.item[j-1]=']') then dec(layer);
       if(tempcstr3.item[j-1]=']') and (layer=0) then
        begin
         if(tempstr2='') then tempstr2:='array[';
         tempcstr2:=c_string_copy_item(tempcstr3,k+1,j-k-1);
         m:=1; tempstr3:='';
         while(m<=tempcstr2.count)do
          begin
           tempstr3:=tempstr3+tempcstr2.item[m-1]; inc(m);
          end;
         if(j-k-1<0) then tempstr2:=tempstr2+'0..0' else tempstr2:=tempstr2+'0..'+tempstr3+'-1';
         if(j<tempcstr3.count) and (tempcstr.item[j]='[') then tempstr2:=tempstr2+',';
         k:=j+1;
        end;
       inc(j);
      end;
     if(tempstr2='') then tempstr2:=tempstr else tempstr2:=tempstr2+'] of '+tempstr;
     New(typestate);
     typestate^.newname:=tempcstr3.item[0];
     typestate^.oldname:=c_string_generate_from_string(tempstr2,true);
     pas_tree_add_item(res,pas_node_type,typestate,false);
    end;
  end
 else if(orgtree^.treetype=c_node_class_member) then
  begin
   i:=1; len:=Pc_class_member(orgtree^.content)^.membercount;
   while(i<=len)do
    begin
     New(memstate);
     if(ctree^.treetype=c_node_class) then tempstr:=Pc_class(ctree^.content)^.classname else tempstr:='';
     memstate^.memclass:=tempstr;
     tempcstr:=Pc_class_member(orgtree^.content)^.membername[i-1];
     tempcstr3:=tempcstr;
     if(Pc_class_member(orgtree^.content)^.memberbit[i-1]=0) then
      begin
       tempcstr2:=c_string_generate_from_string(Pc_class_member(orgtree^.content)^.membertype,false);
       c_string_insert_string(tempcstr2,tempcstr,1);
       if(c_string_check_function_pointer(tempcstr)) then
        begin
         temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr);
         k:=1;
         while(k<=temppas.temptypecount)do
          begin
           New(typestate);
           typestate^:=temppas.temptype[k-1];
           pas_tree_add_item(res,pas_node_type,typestate,false);
           inc(k);
          end;
         memstate^.memname:=temppas.exp.item[0];
         memstate^.memtype:=temppas.exp.item[2];
         memstate^.memarraycount:=0;
        end
       else
        begin
         tempstr3:=Pc_class_member(orgtree^.content)^.membertype;
         k:=1; count:=0;
         while(k<=tempcstr3.count) and (tempcstr3.item[k-1]='*') do
          begin
           inc(count); inc(k); tempstr3:=tempstr3+'*';
          end;
         ctype:=c_type_to_pas_type(tempstr2);
         memstate^.memname:=tempcstr3.item[k-1];
         j:=1; tempstr:=ctype.ctype;
         while(j<=ctype.clayer) do
          begin
           New(typestate);
           typestate^.newname:='P'+tempstr;
           typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
           tempstr:='P'+tempstr;
           pas_tree_add_item(res,pas_node_type,typestate,false);
           inc(j);
          end;
         memstate^.memtype:=tempstr; memstate^.memarraycount:=0;
         j:=k+1; m:=k+1; layer:=0;
         while(j<=tempcstr3.count)do
          begin
           if(tempcstr3.item[j-1]='[') then inc(layer);
           if(tempcstr3.item[j-1]=']') then dec(layer);
           if(layer=0) and (tempcstr3.item[j-1]=']') then
            begin
             inc(memstate^.memarraycount);
             SetLength(memstate^.memarray,memstate^.memarraycount);
             tempstr6:=c_string_to_string(c_string_copy_item(tempcstr3,m+1,j-m-1));
             tempnum:=c_string_convert_integer(tempstr6);
             if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
              begin
               memstate^.memarray[memstate^.memarraycount-1]:=
               c_string_generate_from_string('0..'+tempstr6+'-1',true);
              end
             else if(tempnum=-1) then
              begin
               memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               memstate^.memarray[memstate^.memarraycount-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
             m:=j+1;
           end
          else if(layer=0) then break;
          inc(j);
         end;
        end;
      end
     else
      begin
       tempstr:='0..'+
       IntToStr(Ceil(Power(2,Pc_class_member(orgtree^.content)^.memberbit[i-1]))-1);
       tempstr2:=tempstr;
       k:=1; count:=0;
       while(k<=tempcstr.count) and (tempcstr.item[k-1]='*') do
        begin
         inc(count); inc(k); tempstr2:='P'+tempstr2;
        end;
       memstate^.memtype:=tempstr2;
       memstate^.memname:=tempcstr.item[k-1];
       memstate^.memarraycount:=0;
       j:=k+1; m:=k+1; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) and (tempcstr.item[j-1]=']') then
          begin
           inc(memstate^.memarraycount);
           SetLength(memstate^.memarray,memstate^.memarraycount);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,m+1,j-m-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           m:=j+1;
          end
         else if(layer=0) then break;
         inc(j);
        end;
      end;
     pas_tree_add_item(res,pas_node_member,memstate,false);
     inc(i);
    end;
  end
 else if(orgtree^.treetype=c_node_member) then
  begin
   i:=1; len:=Pc_member(orgtree^.content)^.membercount;
   while(i<=len)do
    begin
     New(memstate);
     memstate^.memclass:='';
     tempcstr:=Pc_member(orgtree^.content)^.membername[i-1];
     tempcstr3:=tempcstr;
     if(Pc_member(orgtree^.content)^.memberbit[i-1]=0) then
      begin
       tempcstr2:=c_string_generate_from_string(Pc_member(orgtree^.content)^.membertype,false);
       c_string_insert_string(tempcstr2,tempcstr,1);
       if(c_string_check_function_pointer(tempcstr)) then
        begin
         temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr);
         k:=1;
         while(k<=temppas.temptypecount)do
          begin
           New(typestate);
           typestate^:=temppas.temptype[k-1];
           pas_tree_add_item(res,pas_node_type,typestate,false);
           inc(k);
          end;
         memstate^.memname:=temppas.exp.item[0];
         memstate^.memtype:=temppas.exp.item[2];
         memstate^.memarraycount:=0;
        end
       else
        begin
         tempstr2:=Pc_member(orgtree^.content)^.membertype;
         k:=1; count:=0;
         while(k<=tempcstr3.count) and (tempcstr3.item[k-1]='*') do
          begin
           inc(count); inc(k); tempstr2:=tempstr2+'*';
          end;
         memstate^.memname:=tempcstr3.item[k-1];
         ctype:=c_type_to_pas_type(tempstr2);
         j:=1; tempstr:=ctype.ctype;
         while(j<=ctype.clayer) do
          begin
           New(typestate);
           typestate^.newname:='P'+tempstr;
           typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
           tempstr:='P'+tempstr;
           pas_tree_add_item(res,pas_node_type,typestate,false);
           inc(j);
          end;
         memstate^.memtype:=tempstr; memstate^.memarraycount:=0;
         j:=k+1; m:=k+1; layer:=0;
         while(j<=tempcstr3.count)do
          begin
           if(tempcstr3.item[j-1]='[') then inc(layer);
           if(tempcstr3.item[j-1]=']') then dec(layer);
           if(layer=0) and (tempcstr3.item[j-1]=']') then
            begin
             inc(memstate^.memarraycount);
             SetLength(memstate^.memarray,memstate^.memarraycount);
             tempstr6:=c_string_to_string(c_string_copy_item(tempcstr3,m+1,j-m-1));
             tempnum:=c_string_convert_integer(tempstr6);
             if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
              begin
               memstate^.memarray[memstate^.memarraycount-1]:=
               c_string_generate_from_string('0..'+tempstr6+'-1',true);
              end
             else if(tempnum=-1) then
              begin
               memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
              end
             else
              begin
               memstate^.memarray[memstate^.memarraycount-1]:=
               c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
              end;
             m:=j+1;
           end
          else if(layer=0) then break;
          inc(j);
         end;
       end;
      end
     else
      begin
       tempstr:='0..'+
       IntToStr(Ceil(Power(2,Pc_member(orgtree^.content)^.memberbit[i-1]))-1);
       tempstr2:=tempstr;
       k:=1; count:=0;
       while(k<=tempcstr.count) and (tempcstr.item[k-1]='*') do
        begin
         inc(count); inc(k); tempstr2:='P'+tempstr2;
        end;
       memstate^.memtype:=tempstr2;
       memstate^.memname:=tempcstr.item[k-1];
       memstate^.memarraycount:=0;
       j:=k+1; m:=k+1; layer:=0;
       while(j<=tempcstr.count)do
        begin
         if(tempcstr.item[j-1]='[') then inc(layer);
         if(tempcstr.item[j-1]=']') then dec(layer);
         if(layer=0) and (tempcstr.item[j-1]=']') then
          begin
           inc(memstate^.memarraycount);
           SetLength(memstate^.memarray,memstate^.memarraycount);
           tempstr6:=c_string_to_string(c_string_copy_item(tempcstr,m+1,j-m-1));
           tempnum:=c_string_convert_integer(tempstr6);
           if(memstate^.memarray[memstate^.memarraycount-1].count<>0) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+tempstr6+'-1',true);
            end
           else if(tempnum=-1) then
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=c_string_generate_from_string('0..0',true);
            end
           else
            begin
             memstate^.memarray[memstate^.memarraycount-1]:=
             c_string_generate_from_string('0..'+IntToStr(tempnum-1),true);
            end;
           m:=j+1;
          end
         else if(layer=0) then break;
         inc(j);
        end;
      end;
     pas_tree_add_item(res,pas_node_member,memstate,false);
     inc(i);
    end;
  end
 else if(orgtree^.treetype=c_node_define) then
  begin
   if(Pc_define(orgtree^.content)^.defhavevalue=false)
   and (Pc_define(orgtree^.content)^.defname.count=1) then
    begin
     New(defstate);
     defstate^.defname:=Pc_define(orgtree^.content)^.defname;
     if(Pc_define(orgtree^.content)^.defstate=true) then defstate^.deftype:=1 else defstate^.deftype:=0;
     pas_tree_add_item(res,pas_node_define,defstate,false);
    end;
  end
 else if(orgtree^.treetype=c_node_lambda_expression) then
  begin
   New(funcstate);
   funcstate^.funcname:=Pc_lambda_expression(orgtree^.content)^.funcname;
   funcstate^.paramcount:=0;
   funcstate^.islambda:=true;
   funcstate^.isgeneric:=false;
   funcstate^.genericcount:=0;
   funcstate^.abi:='';
   funcstate^.align:='';
   funcstate^.conv:='';
   funcstate^.funcalias:='';
   funcstate^.funcinline:=false;
   funcstate^.ext:=false;
   funcstate^.isasm:=false;
   funcstate^.isgeneric:=false;
   i:=1; len:=Pc_lambda_expression(orgtree^.content)^.parametercount;
   for i:=1 to len do
    begin
     inc(funcstate^.paramcount);
     SetLength(funcstate^.param,funcstate^.paramcount);
     tempcstr:=Pc_lambda_expression(orgtree^.content)^.parameteritem[i-1];
     if(c_string_check_function_pointer(tempcstr)) then
     temppas:=convert_c_func_pointer_to_pas_func_pointer(tempcstr)
     else temppas:=convert_c_param_to_pas_param(tempcstr);
     for j:=1 to temppas.temptypecount do
      begin
       New(typestate);
       typestate^:=temppas.temptype[j-1];
       pas_tree_add_item(res,pas_node_type,typestate,false);
      end;
     funcstate^.param[i-1]:=temppas.exp;
    end;
   funcstate^.paramcaptureindex:=funcstate^.paramcount;
   i:=1; len:=Pc_lambda_expression(orgtree^.content)^.capturecount;
   funcstate^.resulttype:='';
   ctype:=c_type_to_pas_type(Pc_lambda_expression(orgtree^.content)^.rettype);
   i:=1; tempstr:=ctype.ctype;
   while(i<=ctype.clayer)do
    begin
     New(typestate);
     typestate^.newname:='P'+tempstr;
     typestate^.oldname:=c_string_generate_from_string('^'+tempstr,true);
     tempstr:='P'+tempstr;
     inc(i);
    end;
   i:=1; len:=Pc_lambda_expression(orgtree^.content)^.capturecount;
   temppas.formercount:=0; strlist.count:=0;
   while(i<=len)do
    begin
     tempcstr:=Pc_lambda_expression(orgtree^.content)^.captureitem[i-1];
     j:=1;
     while(j<=tempcstr.count)do
      begin
       if(tempcstr.item[j-1]='mutable') or (tempcstr.item[j-1]='MUTABLE') then
        begin
         c_string_delete_item(tempcstr,j,1); continue;
        end
       else if(tempcstr.item[j-1]='const') or (tempcstr.item[j-1]='CONST') then
        begin
         c_string_delete_item(tempcstr,j,1); continue;
        end
       else if(tempcstr.item[j-1]='register') or (tempcstr.item[j-1]='REGISTER') then
        begin
         c_string_delete_item(tempcstr,j,1); continue;
        end
       else if(tempcstr.item[j-1]='static') or (tempcstr.item[j-1]='STATIC') then
        begin
         c_string_delete_item(tempcstr,j,1); continue;
        end
       else if(tempcstr.item[j-1]='constexpr') or (tempcstr.item[j-1]='CONSTEXPR') then
        begin
         c_string_delete_item(tempcstr,j,1); continue;
        end;
       inc(j);
      end;
     inc(i);
     if(tempcstr.count=1) and (tempcstr.item[0]='=') then
      begin
       bool1:=true; continue;
      end
     else if(tempcstr.count=1) and (tempcstr.item[0]='&') then
      begin
       bool2:=true; continue;
      end
     else if(tempcstr.count>1) and (tempcstr.item[0]='=') then
      begin
       c_string_delete_item(tempcstr,1,1);
       j:=res^.count;
       while(j>0)do
        begin
         tempres:=res^.child+res^.count-1;
         if(tempres^.treetype=pas_node_variable) and
         (Ppas_variable(tempres^.content)^.varname=tempcstr.item[0]) then
          begin
           k:=Ppas_variable(tempres^.content)^.vararrayc;
           m:=1; tempstr:='';
           while(m<=k)do
            begin
             if(m=1) then tempstr:='array[';
             tempstr:=tempstr+c_string_to_string(Ppas_variable(tempres^.content)^.vararrayd[m-1]);
             if(m<k) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
             inc(m);
            end;
           if(k>0) then
            begin
             New(typestate);
             typestate^.newname:='arr'+IntToStr(newarrayindex);
             inc(newarrayindex);
             typestate^.oldname:=
             c_string_generate_from_string(tempstr+Ppas_variable(tempres^.content)^.vartype,true);
            end
           else
            begin
             tempcstr2:=c_string_generate_from_string(':'+Ppas_variable(tempres^.content)^.vartype,true);
             c_string_insert_item(tempcstr.item[0],tempcstr2,1);
             inc(funcstate^.paramcount);
             SetLength(funcstate^.param,funcstate^.paramcount);
             funcstate^.param[funcstate^.paramcount-1]:=tempcstr2;
            end;
          end;
         dec(j);
        end;
      end
     else if(tempcstr.count>1) and (tempcstr.item[0]='&') then
      begin
       c_string_delete_item(tempcstr,1,1);
       j:=res^.count;
       while(j>0)do
        begin
         tempres:=res^.child+res^.count-1;
         if(tempres^.treetype=pas_node_variable) and
         (Ppas_variable(tempres^.content)^.varname=tempcstr.item[0]) then
          begin
           k:=Ppas_variable(tempres^.content)^.vararrayc;
           m:=1; tempstr:='';
           while(m<=k)do
            begin
             if(m=1) then tempstr:='array[';
             tempstr:=tempstr+c_string_to_string(Ppas_variable(tempres^.content)^.vararrayd[m-1]);
             if(m<k) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
             inc(m);
            end;
           if(k>0) then
            begin
             New(typestate);
             typestate^.newname:='arr'+IntToStr(newarrayindex);
             inc(newarrayindex);
             typestate^.oldname:=
             c_string_generate_from_string(tempstr+Ppas_variable(tempres^.content)^.vartype,true);
            end
           else
            begin
             tempcstr2:=c_string_generate_from_string(':'+Ppas_variable(tempres^.content)^.vartype,true);
             c_string_insert_item(tempcstr.item[0],tempcstr2,1);
             c_string_insert_item('var',tempcstr2,1);
             inc(funcstate^.paramcount);
             SetLength(funcstate^.param,funcstate^.paramcount);
             funcstate^.param[funcstate^.paramcount-1]:=tempcstr2;
            end;
          end;
         dec(j);
        end;
      end
     else
      begin
       k:=2;
       while(k<=tempcstr.count) do
        begin
         if(tempcstr.item[k-1]='=') then break;
         inc(k);
        end;
       if(k>=tempcstr.count) then
        begin
         while(j>0)do
          begin
           tempres:=res^.child+res^.count-1;
           if(tempres^.treetype=pas_node_variable) and
           (Ppas_variable(tempres^.content)^.varname=tempcstr.item[0]) then
            begin
             k:=Ppas_variable(tempres^.content)^.vararrayc;
             m:=1; tempstr:='';
             while(m<=k)do
              begin
               if(m=1) then tempstr:='array[';
               tempstr:=tempstr+c_string_to_string(Ppas_variable(tempres^.content)^.vararrayd[m-1]);
               if(m<k) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
               inc(m);
              end;
             if(k>0) then
              begin
               New(typestate);
               typestate^.newname:='arr'+IntToStr(newarrayindex);
               inc(newarrayindex);
               typestate^.oldname:=
               c_string_generate_from_string(tempstr+Ppas_variable(tempres^.content)^.vartype,true);
              end
             else
              begin
               tempcstr2:=c_string_generate_from_string(':'+Ppas_variable(tempres^.content)^.vartype,true);
               c_string_insert_item(tempcstr.item[0],tempcstr2,1);
               inc(funcstate^.paramcount);
               SetLength(funcstate^.param,funcstate^.paramcount);
               funcstate^.param[funcstate^.paramcount-1]:=tempcstr2;
              end;
            end;
           dec(j);
          end;
        end
       else
        begin
         k:=c_string_divide_type_and_name(tempcstr);
         if(k>0)then
          begin
           tempstr:=c_string_to_string(c_string_copy_item(tempcstr,1,k-1));
           ctype:=c_type_to_pas_type(tempstr);
           tempstr2:=ctype.ctype;
           for j:=1 to ctype.clayer do
            begin
             New(typestate);
             typestate^.newname:='P'+tempstr2;
             typestate^.oldname:=
             c_string_generate_from_string('^'+tempstr2,true);
             tempstr2:='P'+tempstr2;
             pas_tree_add_item(res,pas_node_type,typestate,false);
            end;
           c_string_delete_item(tempcstr,1,k-2);
          end;
         inc(temppas.formercount);
         SetLength(temppas.formerexp,temppas.formercount);
         temppas.formerexp[temppas.formercount-1]:=
         convert_c_expression_to_pas_expression(tempcstr,res).exp;
        end;
      end;
     inc(strlist.count);
     SetLength(strlist.item,strlist.count);
     strlist.item[strlist.count-1]:=tempcstr;
    end;
   funcstate^.resulttype:=tempstr;
   if(bool1=true) then
    begin
     j:=res^.count;
     while(j>0)do
      begin
       tempres:=res^.child+res^.count-1;
       if(tempres^.treetype=pas_node_variable) then
        begin
         k:=funcstate^.paramcount;
         while(k>0)do
          begin
           if(funcstate^.param[k-1].item[0]='var') then
            begin
             if(funcstate^.param[k-1].item[1]=Ppas_variable(tempres^.content)^.varname) then break;
            end
           else
            begin
             if(funcstate^.param[k-1].item[0]=Ppas_variable(tempres^.content)^.varname) then break;
            end;
           dec(k);
          end;
         if(k>0) then
          begin
           dec(j); continue;
          end;
         k:=Ppas_variable(tempres^.content)^.vararrayc;
         m:=1; tempstr:='';
         while(m<=k)do
          begin
           if(m=1) then tempstr:='array[';
           tempstr:=tempstr+c_string_to_string(Ppas_variable(tempres^.content)^.vararrayd[m-1]);
           if(m<k) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
           inc(m);
          end;
         if(k>0) then
          begin
           New(typestate);
           typestate^.newname:='arr'+IntToStr(newarrayindex);
           inc(newarrayindex);
           typestate^.oldname:=
           c_string_generate_from_string(tempstr+Ppas_variable(tempres^.content)^.vartype,true);
          end
         else
          begin
           tempcstr2:=c_string_generate_from_string(':'+Ppas_variable(tempres^.content)^.vartype,true);
           c_string_insert_item(tempcstr.item[0],tempcstr2,1);
           c_string_insert_item('var',tempcstr2,1);
           inc(funcstate^.paramcount);
           SetLength(funcstate^.param,funcstate^.paramcount);
           funcstate^.param[funcstate^.paramcount-1]:=tempcstr2;
          end;
        end;
       dec(j);
      end;
    end;
   if(bool2=true) then
    begin
     j:=res^.count;
     while(j>0)do
      begin
       tempres:=res^.child+res^.count-1;
       if(tempres^.treetype=pas_node_variable) then
        begin
         k:=funcstate^.paramcount;
         while(k>0)do
          begin
           if(funcstate^.param[k-1].item[0]='var') then
            begin
             if(funcstate^.param[k-1].item[1]=Ppas_variable(tempres^.content)^.varname) then break;
            end
           else
            begin
             if(funcstate^.param[k-1].item[0]=Ppas_variable(tempres^.content)^.varname) then break;
            end;
           dec(k);
          end;
         if(k>0) then
          begin
           dec(j); continue;
          end;
         k:=Ppas_variable(tempres^.content)^.vararrayc;
         m:=1; tempstr:='';
         while(m<=k)do
          begin
           if(m=1) then tempstr:='array[';
           tempstr:=tempstr+c_string_to_string(Ppas_variable(tempres^.content)^.vararrayd[m-1]);
           if(m<k) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
           inc(m);
          end;
         if(k>0) then
          begin
           New(typestate);
           typestate^.newname:='arr'+IntToStr(newarrayindex);
           inc(newarrayindex);
           typestate^.oldname:=
           c_string_generate_from_string(tempstr+Ppas_variable(tempres^.content)^.vartype,true);
          end
         else
          begin
           tempcstr2:=c_string_generate_from_string(':'+Ppas_variable(tempres^.content)^.vartype,true);
           c_string_insert_item(tempcstr.item[0],tempcstr2,1);
           inc(funcstate^.paramcount);
           SetLength(funcstate^.param,funcstate^.paramcount);
           funcstate^.param[funcstate^.paramcount-1]:=tempcstr2;
          end;
        end;
       dec(j);
      end;
    end;
   pas_tree_add_item(res,pas_node_function,funcstate,false);
   tempres:=res^.child+res^.count-1;
   for i:=1 to temppas.formercount do
    begin
     New(expstate);
     expstate^.content:=temppas.formerexp[i-1];
     pas_tree_add_item(tempres,pas_node_expression,expstate,false);
    end;
   if(orgtree^.count>0) then convert_c_tree_to_pas_tree(orgtree,res^.child+res^.count-1);
  end;
 l2:
 if(ii<ctree^.count)then
  begin
   inc(ii); goto l1;
  end;
 if(ctree^.treetype=c_node_root) then rehandle_pas_tree_parent(res);
 if(ctree^.treetype=c_node_root) then convert_c_tree_to_pas_tree:=res
 else convert_c_tree_to_pas_tree:=nil;
end;
procedure destruct_pas_tree(var pastree:Ppas_tree);
var i:SizeInt;
    temptree:Ppas_tree;
begin
 if(pointer_vaild(pastree)=false) then
  begin
   pastree:=nil; exit;
  end;
 i:=1;
 while(i<=pastree^.count) do
  begin
   temptree:=pastree^.child+i-1;
   destruct_pas_tree(temptree);
   inc(i);
  end;
 if(pointer_vaild(pastree^.content)) then
  begin
   if(pastree^.treetype=pas_node_asm) then Dispose(Ppas_asm(pastree^.content))
   else if(pastree^.treetype=pas_node_asm_code) then Dispose(Ppas_asm_code(pastree^.content))
   else if(pastree^.treetype=pas_node_case_of_statement) then
   Dispose(Ppas_case_of_statement(pastree^.content))
   else if(pastree^.treetype=pas_node_case_of_sub_statement) then
   Dispose(Ppas_case_of_sub_statement(pastree^.content))
   else if(pastree^.treetype=pas_node_class) then
   Dispose(Ppas_class(pastree^.content))
   else if(pastree^.treetype=pas_node_class_tag) then
   Dispose(Ppas_class_tag(pastree^.content))
   else if(pastree^.treetype=pas_node_const) then
   Dispose(Ppas_const(pastree^.content))
   else if(pastree^.treetype=pas_node_define) then
   Dispose(Ppas_define(pastree^.content))
   else if(pastree^.treetype=pas_node_enum) then
   Dispose(Ppas_enum(pastree^.content))
   else if(pastree^.treetype=pas_node_expression) then
   Dispose(Ppas_expression(pastree^.content))
   else if(pastree^.treetype=pas_node_function) then
   Dispose(Ppas_function(pastree^.content))
   else if(pastree^.treetype=pas_node_goto_or_label) then
   Dispose(Ppas_goto_or_label(pastree^.content))
   else if(pastree^.treetype=pas_node_ifdef) then
   Dispose(Ppas_ifdef(pastree^.content))
   else if(pastree^.treetype=pas_node_if_statement) then
   Dispose(Ppas_if_statement(pastree^.content))
   else if(pastree^.treetype=pas_node_label_declare) then
   Dispose(Ppas_label_declare(pastree^.content))
   else if(pastree^.treetype=pas_node_loop_statement) then
   Dispose(Ppas_loop_statement(pastree^.content))
   else if(pastree^.treetype=pas_node_member) then
   Dispose(Ppas_member(pastree^.content))
   else if(pastree^.treetype=pas_node_operator) then
   Dispose(Ppas_operator(pastree^.content))
   else if(pastree^.treetype=pas_node_record) then
   Dispose(Ppas_record(pastree^.content))
   else if(pastree^.treetype=pas_node_return) then
   Dispose(Ppas_return(pastree^.content))
   else if(pastree^.treetype=pas_node_type) then
   Dispose(Ppas_type(pastree^.content))
   else if(pastree^.treetype=pas_node_uses) then
   Dispose(Ppas_uses(pastree^.content))
   else if(pastree^.treetype=pas_node_variable) then
   Dispose(Ppas_variable(pastree^.content));
   pastree^.content:=nil;
  end;
 if(pointer_vaild(pastree^.child)) then
  begin
   if(pastree^.treetype<>pas_node_none) and (pastree^.count>0) then FreeMem(pastree^.child);
   pastree^.child:=nil;
  end;
 pastree^.count:=0;
 pastree^.treetype:=pas_node_none;
 if(pastree^.treetype=pas_node_root) then FreeMem(pastree);
end;
procedure pas_tree_copy(const srctree:Ppas_tree;var desttree:Ppas_tree;spec:byte=0);
var i,j,k,m,n,len,len1,len2,len3:SizeInt;
    bool:boolean;
    temptree,tempdestree,tempdectree:Ppas_tree;
begin
 if(srctree=nil) then exit;
 i:=1; len:=srctree^.count;
 if(desttree=nil) then desttree:=initialize_pas_tree;
 if(srctree^.count>0) and (spec<>1) and (spec<>3) then
  begin
   desttree^.count:=0;
   desttree^.child:=nil;
   for i:=1 to srctree^.count do
    begin
     temptree:=srctree^.child+i-1;
     if(temptree^.treetype=pas_node_ifdef) and (codenoifdef=true) then continue;
     if(Pointer_vaild(temptree^.content)=false) or (temptree^.treetype=pas_node_none) then continue;
     if(spec=2) then
      begin
       if(temptree^.treetype=pas_node_variable) or (temptree^.treetype=pas_node_const) or
       (temptree^.treetype=pas_node_enum) or (temptree^.treetype=pas_node_record) or
       (temptree^.treetype=pas_node_class) or (temptree^.treetype=pas_node_enum) or
       (temptree^.treetype=pas_node_uses) or (temptree^.treetype=pas_node_label_declare)
       or (temptree^.treetype=pas_node_class_function)
       or (temptree^.treetype=pas_node_function) or (temptree^.treetype=pas_node_operator) then
       continue;
       if(temptree^.treetype=pas_node_ifdef) and (codenoifdef=true) then continue;
      end
     else if(spec=4) and
     ((srctree^.treetype=pas_node_class) or (srctree^.treetype=pas_node_record)) then
      begin
       if(codenoifdef) and (temptree^.treetype=pas_node_class_function) then
        begin
         j:=desttree^.count;
         while(j>0)do
          begin
           tempdectree:=desttree^.child+j-1;
           if(tempdectree^.treetype=temptree^.treetype) and
           (Ppas_class_function(tempdectree^.content)^.funcname=
           Ppas_class_function(temptree^.content)^.funcname)then
            begin
             k:=1;
             len1:=Ppas_class_function(tempdectree^.content)^.paramcount;
             len2:=Ppas_class_function(temptree^.content)^.paramcount;
             if(len1<>len2) then
              begin
               dec(j); continue;
              end;
             while(k<=len2)do
              begin
               if(c_string_compare(Ppas_class_function(tempdectree^.content)^.param[k-1],
               Ppas_class_function(temptree^.content)^.param[k-1],1)=false) then break;
               inc(k);
              end;
             if(k<=len2) then
              begin
               dec(j); continue;
              end;
             k:=1;
             len1:=Length(Ppas_class_function(tempdectree^.content)^.generictype);
             len2:=Length(Ppas_class_function(temptree^.content)^.generictype);
             if(len1<>len2) then
              begin
               dec(j); continue;
              end;
             while(k<=len2)do
              begin
               if(Ppas_class_function(tempdectree^.content)^.generictype[k-1]<>
               Ppas_class_function(tempdectree^.content)^.generictype[k-1])
               or (length(Ppas_class_function(tempdectree^.content)^.generictype[k-1])<>
               length(Ppas_class_function(tempdectree^.content)^.generictype[k-1])) then break;
               inc(k);
              end;
             if(k<=len2) then
              begin
               dec(j); continue;
              end
             else break;
            end;
           dec(j);
          end;
         if(j>0) then continue;
        end
       else if(codenoifdef) and (temptree^.treetype=pas_node_member) then
        begin
         j:=desttree^.count;
         while(j>0)do
          begin
           tempdectree:=desttree^.child+j-1;
           if(tempdectree^.treetype=temptree^.treetype) and
           (Ppas_member(tempdectree^.content)^.memname=Ppas_member(tempdectree^.content)^.memname) then
            begin
             break;
            end;
           dec(j);
          end;
         if(j>0) then continue;
        end;
       inc(desttree^.count);
       ReallocMem(desttree^.child,desttree^.count*sizeof(pas_tree));
       tempdestree:=desttree^.child+desttree^.count-1;
       tempdestree^.parent:=desttree;
       tempdestree^.part:=false;
       tempdestree^.treetype:=pas_node_none;
       tempdestree^.content:=nil;
       tempdestree^.child:=nil;
       tempdestree^.count:=0;
       pas_tree_copy(temptree,tempdestree,3);
       continue;
      end;
     inc(desttree^.count);
     ReallocMem(desttree^.child,desttree^.count*sizeof(pas_tree));
     tempdestree:=desttree^.child+desttree^.count-1;
     tempdestree^.parent:=desttree;
     tempdestree^.part:=false;
     tempdestree^.treetype:=pas_node_none;
     tempdestree^.content:=nil;
     tempdestree^.child:=nil;
     tempdestree^.count:=0;
     pas_tree_copy(temptree,tempdestree,spec);
    end;
  end
 else
  begin
   desttree^.child:=nil;
   desttree^.count:=0;
  end;
 if(srctree^.treetype<>pas_node_root) and (Pointer_vaild(srctree^.content)=false) then
  begin
   desttree^.treetype:=pas_node_none;
   if(spec<2) then desttree^.part:=srctree^.part
   else if(spec=2) then desttree^.part:=true
   else desttree^.part:=false;
   desttree^.content:=nil;
   exit;
  end;
 desttree^.treetype:=srctree^.treetype;
 if(spec<2) then desttree^.part:=srctree^.part
 else if(spec=2) then desttree^.part:=true
 else desttree^.part:=false;
 if(srctree^.treetype=pas_node_root) then
  begin
   desttree^.treetype:=pas_node_root;
   desttree^.content:=nil;
  end
 else if(srctree^.treetype=pas_node_asm) then
  begin
   New(Ppas_asm(desttree^.content));
   Ppas_asm(desttree^.content)^.count:=Ppas_asm(srctree^.content)^.count;
   SetLength(Ppas_asm(desttree^.content)^.code,Ppas_asm(srctree^.content)^.count);
   for i:=1 to Ppas_asm(srctree^.content)^.count do
    begin
     Ppas_asm(desttree^.content)^.code[i-1]:=Ppas_asm(srctree^.content)^.code[i-1];
    end;
  end
 else if(srctree^.treetype=pas_node_asm_code) then
  begin
   New(Ppas_asm_code(desttree^.content));
   Ppas_asm_code(desttree^.content)^.code:=Ppas_asm_code(srctree^.content)^.code;
  end
 else if(srctree^.treetype=pas_node_case_of_statement) then
  begin
   New(Ppas_case_of_statement(desttree^.content));
   Ppas_case_of_statement(desttree^.content)^.exp:=Ppas_case_of_statement(srctree^.content)^.exp;
  end
 else if(srctree^.treetype=pas_node_case_of_sub_statement) then
  begin
   New(Ppas_case_of_sub_statement(desttree^.content));
   SetLength(Ppas_case_of_sub_statement(desttree^.content)^.cexp,
   Ppas_case_of_sub_statement(srctree^.content)^.ccount);
   for i:=1 to Ppas_case_of_sub_statement(srctree^.content)^.ccount do
    begin
     Ppas_case_of_sub_statement(desttree^.content)^.cexp[i-1]:=
     Ppas_case_of_sub_statement(srctree^.content)^.cexp[i-1];
    end;
  end
 else if(srctree^.treetype=pas_node_class) then
  begin
   New(Ppas_class(desttree^.content));
   Ppas_class(desttree^.content)^.classname:=Ppas_class(srctree^.content)^.classname;
   Ppas_class(desttree^.content)^.inheritcount:=Ppas_class(srctree^.content)^.inheritcount;
   SetLength(Ppas_class(desttree^.content)^.inheritclass,Ppas_class(desttree^.content)^.inheritcount);
   for i:=1 to Ppas_class(srctree^.content)^.inheritcount do
    begin
     Ppas_class(desttree^.content)^.inheritclass[i-1]:=
     Ppas_class(srctree^.content)^.inheritclass[i-1];
    end;
   Ppas_class(desttree^.content)^.isgeneric:=Ppas_class(srctree^.content)^.isgeneric;
   if(Ppas_class(desttree^.content)^.isgeneric=true) then
    begin
     SetLength(Ppas_class(desttree^.content)^.generictype,
     Ppas_class(srctree^.content)^.genericcount);
     for i:=1 to Ppas_class(srctree^.content)^.genericcount do
      begin
       Ppas_class(desttree^.content)^.generictype[i-1]:=
       Ppas_class(srctree^.content)^.generictype[i-1];
      end;
    end;
  end
 else if(srctree^.treetype=pas_node_class_function) then
  begin
   New(Ppas_class_function(desttree^.content));
   Ppas_class_function(desttree^.content)^.ext:=
   Ppas_class_function(srctree^.content)^.ext;
   Ppas_class_function(desttree^.content)^.abi:=
   Ppas_class_function(srctree^.content)^.abi;
   Ppas_class_function(desttree^.content)^.conv:=
   Ppas_class_function(srctree^.content)^.conv;
   Ppas_class_function(desttree^.content)^.align:=
   Ppas_class_function(srctree^.content)^.align;
   Ppas_class_function(desttree^.content)^.funcalias:=
   Ppas_class_function(srctree^.content)^.funcalias;
   Ppas_class_function(desttree^.content)^.funcname:=
   Ppas_class_function(srctree^.content)^.funcname;
   Ppas_class_function(desttree^.content)^.hostname:=
   Ppas_class_function(srctree^.content)^.hostname;
   Ppas_class_function(desttree^.content)^.isabstract:=
   Ppas_class_function(srctree^.content)^.isabstract;
   Ppas_class_function(desttree^.content)^.isinline:=
   Ppas_class_function(srctree^.content)^.isinline;
   Ppas_class_function(desttree^.content)^.isoverride:=
   Ppas_class_function(srctree^.content)^.isoverride;
   Ppas_class_function(desttree^.content)^.isvirtual:=
   Ppas_class_function(srctree^.content)^.isvirtual;
   Ppas_class_function(desttree^.content)^.isconstructor:=
   Ppas_class_function(srctree^.content)^.isconstructor;
   Ppas_class_function(desttree^.content)^.isdestructor:=
   Ppas_class_function(srctree^.content)^.isdestructor;
   Ppas_class_function(desttree^.content)^.isasm:=
   Ppas_class_function(srctree^.content)^.isasm;
   Ppas_class_function(desttree^.content)^.resulttype:=
   Ppas_class_function(srctree^.content)^.resulttype;
   Ppas_class_function(desttree^.content)^.paramcount:=
   Ppas_class_function(srctree^.content)^.paramcount;
   SetLength(Ppas_class_function(desttree^.content)^.param,
   Ppas_class_function(srctree^.content)^.paramcount);
   for i:=1 to Ppas_class_function(srctree^.content)^.paramcount do
    begin
     Ppas_class_function(desttree^.content)^.param[i-1]:=
     Ppas_class_function(srctree^.content)^.param[i-1];
    end;
   Ppas_class_function(desttree^.content)^.isgeneric:=Ppas_class_function(srctree^.content)^.isgeneric;
   if(Ppas_class_function(desttree^.content)^.isgeneric=true) then
    begin
     len:=Length(Ppas_class_function(srctree^.content)^.generictype);
     Ppas_class_function(desttree^.content)^.genericcount:=len;
     SetLength(Ppas_class_function(desttree^.content)^.generictype,len);
     for i:=1 to len do
      begin
       Ppas_class_function(desttree^.content)^.generictype[i-1]:=
       Ppas_class_function(srctree^.content)^.generictype[i-1];
      end;
    end;
  end
 else if(srctree^.treetype=pas_node_class_tag) then
  begin
   New(Ppas_class_tag(desttree^.content));
   Ppas_class_tag(desttree^.content)^.tagtype:=Ppas_class_tag(srctree^.content)^.tagtype;
  end
 else if(srctree^.treetype=pas_node_const) then
  begin
   New(Ppas_const(desttree^.content));
   Ppas_const(desttree^.content)^.constname:=Ppas_const(srctree^.content)^.constname;
   Ppas_const(desttree^.content)^.consttype:=Ppas_const(srctree^.content)^.consttype;
   Ppas_const(desttree^.content)^.constcount:=Ppas_const(srctree^.content)^.constcount;
   Ppas_const(desttree^.content)^.consthavevalue:=Ppas_const(srctree^.content)^.consthavevalue;
   if(Ppas_const(desttree^.content)^.consthavevalue) then
   Ppas_const(desttree^.content)^.constvalue:=Ppas_const(srctree^.content)^.constvalue
   else
   Ppas_const(desttree^.content)^.constvalue.Count:=0;
   i:=1; len:=Ppas_const(desttree^.content)^.constcount;
   SetLength(Ppas_const(desttree^.content)^.constarray,Ppas_const(desttree^.content)^.constcount);
   for i:=1 to len do
    begin
     Ppas_const(desttree^.content)^.constarray[i-1]:=Ppas_const(srctree^.content)^.constarray[i-1];
    end;
  end
 else if(srctree^.treetype=pas_node_define) then
  begin
   New(Ppas_define(desttree^.content));
   Ppas_define(desttree^.content)^.defname:=Ppas_define(srctree^.content)^.defname;
   Ppas_define(desttree^.content)^.deftype:=Ppas_define(srctree^.content)^.deftype;
  end
 else if(srctree^.treetype=pas_node_enum) then
  begin
   New(Ppas_enum(desttree^.content));
   Ppas_enum(desttree^.content)^.enumname:=Ppas_enum(srctree^.content)^.enumname;
   Ppas_enum(desttree^.content)^.enumcount:=Ppas_enum(srctree^.content)^.enumcount;
   SetLength(Ppas_enum(desttree^.content)^.enumcontent,Ppas_enum(desttree^.content)^.enumcount);
   i:=1; len:=Ppas_enum(desttree^.content)^.enumcount;
   for i:=1 to len do
    begin
     Ppas_enum(desttree^.content)^.enumcontent[i-1]:=Ppas_enum(srctree^.content)^.enumcontent[i-1];
    end;
  end
 else if(srctree^.treetype=pas_node_expression) then
  begin
   New(Ppas_expression(desttree^.content));
   Ppas_expression(desttree^.content)^.content:=Ppas_expression(srctree^.content)^.content;
   if(length(Ppas_expression(desttree^.content)^.content.item)=0) then
    begin
     DisPose(Ppas_expression(desttree^.content));
     desttree^.treetype:=pas_node_none;
     desttree^.content:=nil;
    end;
  end
 else if(srctree^.treetype=pas_node_function) then
  begin
   New(Ppas_function(desttree^.content));
   Ppas_function(desttree^.content)^.abi:=Ppas_function(srctree^.content)^.abi;
   Ppas_function(desttree^.content)^.align:=Ppas_function(srctree^.content)^.align;
   Ppas_function(desttree^.content)^.conv:=Ppas_function(srctree^.content)^.conv;
   Ppas_function(desttree^.content)^.ext:=Ppas_function(srctree^.content)^.ext;
   Ppas_function(desttree^.content)^.funcalias:=Ppas_function(srctree^.content)^.funcalias;
   Ppas_function(desttree^.content)^.funcinline:=Ppas_function(srctree^.content)^.funcinline;
   Ppas_function(desttree^.content)^.funcname:=Ppas_function(srctree^.content)^.funcname;
   Ppas_function(desttree^.content)^.isasm:=Ppas_function(srctree^.content)^.isasm;
   Ppas_function(desttree^.content)^.resulttype:=Ppas_function(srctree^.content)^.resulttype;
   Ppas_function(desttree^.content)^.paramcount:=Ppas_function(srctree^.content)^.paramcount;
   SetLength(Ppas_function(desttree^.content)^.param,Ppas_function(srctree^.content)^.paramcount);
   for i:=1 to Ppas_function(srctree^.content)^.paramcount do
    begin
     Ppas_function(desttree^.content)^.param[i-1]:=Ppas_function(srctree^.content)^.param[i-1];
    end;
   Ppas_function(desttree^.content)^.isgeneric:=Ppas_function(srctree^.content)^.isgeneric;
   if(Ppas_function(desttree^.content)^.isgeneric=true) then
    begin
     len:=Length(Ppas_function(srctree^.content)^.generictype);
     Ppas_function(desttree^.content)^.genericcount:=len;
     SetLength(Ppas_function(desttree^.content)^.generictype,len);
     for i:=1 to len do
      begin
       Ppas_function(desttree^.content)^.generictype[i-1]:=
       Ppas_function(srctree^.content)^.generictype[i-1];
      end;
    end;
  end
 else if(srctree^.treetype=pas_node_goto_or_label) then
  begin
   New(Ppas_goto_or_label(desttree^.content));
   Ppas_goto_or_label(desttree^.content)^.islabel:=Ppas_goto_or_label(srctree^.content)^.islabel;
   Ppas_goto_or_label(desttree^.content)^.name:=Ppas_goto_or_label(srctree^.content)^.name;
  end
 else if(srctree^.treetype=pas_node_ifdef) then
  begin
   New(Ppas_ifdef(desttree^.content));
   Ppas_ifdef(desttree^.content)^.condition:=Ppas_ifdef(srctree^.content)^.condition;
   Ppas_ifdef(desttree^.content)^.deftype:=Ppas_ifdef(srctree^.content)^.deftype;
  end
 else if(srctree^.treetype=pas_node_if_statement) then
  begin
   New(Ppas_if_statement(desttree^.content));
   Ppas_if_statement(desttree^.content)^.condition:=
   Ppas_if_statement(srctree^.content)^.condition;
   Ppas_if_statement(desttree^.content)^.iftype:=
   Ppas_if_statement(srctree^.content)^.iftype;
   Ppas_if_statement(desttree^.content)^.havenext:=
   Ppas_if_statement(srctree^.content)^.havenext;
  end
 else if(srctree^.treetype=pas_node_label_declare) then
  begin
   New(Ppas_label_declare(desttree^.content));
   Ppas_label_declare(desttree^.content)^.name:=Ppas_label_declare(srctree^.content)^.name;
  end
 else if(srctree^.treetype=pas_node_loop_statement) then
  begin
   New(Ppas_loop_statement(desttree^.content));
   Ppas_loop_statement(desttree^.content)^.condition:=Ppas_loop_statement(srctree^.content)^.condition;
   Ppas_loop_statement(desttree^.content)^.looptype:=Ppas_loop_statement(srctree^.content)^.looptype;
  end
 else if(srctree^.treetype=pas_node_member) then
  begin
   New(Ppas_member(desttree^.content));
   Ppas_member(desttree^.content)^.memclass:=Ppas_member(srctree^.content)^.memclass;
   Ppas_member(desttree^.content)^.memname:=Ppas_member(srctree^.content)^.memname;
   Ppas_member(desttree^.content)^.memtype:=Ppas_member(srctree^.content)^.memtype;
   Ppas_member(desttree^.content)^.memarraycount:=Ppas_member(srctree^.content)^.memarraycount;
   SetLength(Ppas_member(desttree^.content)^.memarray,Ppas_member(srctree^.content)^.memarraycount);
   for i:=1 to Ppas_member(desttree^.content)^.memarraycount do
    begin
     Ppas_member(desttree^.content)^.memarray[i-1]:=Ppas_member(srctree^.content)^.memarray[i-1];
    end;
  end
 else if(srctree^.treetype=pas_node_operator) then
  begin
   New(Ppas_operator(desttree^.content));
   Ppas_operator(desttree^.content)^.abi:=Ppas_operator(srctree^.content)^.abi;
   Ppas_operator(desttree^.content)^.alias:=Ppas_operator(srctree^.content)^.alias;
   Ppas_operator(desttree^.content)^.align:=Ppas_operator(srctree^.content)^.align;
   Ppas_operator(desttree^.content)^.isinline:=Ppas_operator(srctree^.content)^.isinline;
   Ppas_operator(desttree^.content)^.isoverride:=Ppas_operator(srctree^.content)^.isoverride;
   Ppas_operator(desttree^.content)^.isvirtual:=Ppas_operator(srctree^.content)^.isvirtual;
   Ppas_operator(desttree^.content)^.signname:=Ppas_operator(srctree^.content)^.signname;
   Ppas_operator(desttree^.content)^.resulttype:=Ppas_operator(srctree^.content)^.resulttype;
   Ppas_operator(desttree^.content)^.paramcount:=Ppas_operator(srctree^.content)^.paramcount;
   i:=1; len:=Ppas_operator(srctree^.content)^.paramcount;
   SetLength(Ppas_operator(desttree^.content)^.param,len);
   for i:=1 to len do
    begin
     Ppas_operator(desttree^.content)^.param[i-1]:=Ppas_operator(srctree^.content)^.param[i-1];
    end;
   Ppas_operator(desttree^.content)^.isgeneric:=Ppas_operator(srctree^.content)^.isgeneric;
   if(Ppas_operator(desttree^.content)^.isgeneric=true) then
    begin
     len:=Length(Ppas_operator(srctree^.content)^.generictype);
     Ppas_operator(desttree^.content)^.genericcount:=len;
     SetLength(Ppas_operator(desttree^.content)^.generictype,len);
     for i:=1 to len do
      begin
       Ppas_operator(desttree^.content)^.generictype[i-1]:=
       Ppas_operator(srctree^.content)^.generictype[i-1];
      end;
    end;
  end
 else if(srctree^.treetype=pas_node_record) then
  begin
   New(Ppas_record(desttree^.content));
   Ppas_record(desttree^.content)^.recordname:=Ppas_record(srctree^.content)^.recordname;
   Ppas_record(desttree^.content)^.recordtype:=Ppas_record(srctree^.content)^.recordtype;
   Ppas_record(desttree^.content)^.recordunion:=Ppas_record(srctree^.content)^.recordunion;
   Ppas_record(desttree^.content)^.isgeneric:=Ppas_record(srctree^.content)^.isgeneric;
   if(Ppas_record(desttree^.content)^.isgeneric=true) then
    begin
     SetLength(Ppas_record(desttree^.content)^.generictype,Ppas_record(srctree^.content)^.genericcount);
     for i:=1 to Ppas_record(srctree^.content)^.genericcount do
      begin
       Ppas_record(desttree^.content)^.generictype[i-1]:=
       Ppas_record(srctree^.content)^.generictype[i-1];
      end;
    end;
  end
 else if(srctree^.treetype=pas_node_return) then
  begin
   New(Ppas_return(desttree^.content));
   Ppas_return(desttree^.content)^.retvalue:=Ppas_return(srctree^.content)^.retvalue;
  end
 else if(srctree^.treetype=pas_node_type) then
  begin
   New(Ppas_type(desttree^.content));
   Ppas_type(desttree^.content)^.newname:=Ppas_type(srctree^.content)^.newname;
   Ppas_type(desttree^.content)^.oldname:=Ppas_type(srctree^.content)^.oldname;
  end
 else if(srctree^.treetype=pas_node_uses) then
  begin
   New(Ppas_uses(desttree^.content));
   Ppas_uses(desttree^.content)^.usesname:=Ppas_uses(srctree^.content)^.usesname;
  end
 else if(srctree^.treetype=pas_node_variable) then
  begin
   New(Ppas_variable(desttree^.content));
   Ppas_variable(desttree^.content)^.varext:=Ppas_variable(srctree^.content)^.varext;
   Ppas_variable(desttree^.content)^.varname:=Ppas_variable(srctree^.content)^.varname;
   Ppas_variable(desttree^.content)^.varhavevalue:=Ppas_variable(srctree^.content)^.varhavevalue;
   if(Ppas_variable(desttree^.content)^.varhavevalue) then
   Ppas_variable(desttree^.content)^.varvalue:=Ppas_variable(srctree^.content)^.varvalue;
   Ppas_variable(desttree^.content)^.vartype:=Ppas_variable(srctree^.content)^.vartype;
   Ppas_variable(desttree^.content)^.vararrayc:=Ppas_variable(srctree^.content)^.vararrayc;
   i:=1; len:=Ppas_variable(desttree^.content)^.vararrayc;
   SetLength(Ppas_variable(desttree^.content)^.vararrayd,len);
   for i:=1 to len do
    begin
     Ppas_variable(desttree^.content)^.vararrayd[i-1]:=Ppas_variable(srctree^.content)^.vararrayd[i-1];
    end;
  end
 else
  begin
   desttree^.treetype:=pas_node_none;
   desttree^.content:=nil;
  end;
end;
procedure pas_tree_insert_item(var basetree:Ppas_tree;const index:SizeInt;const inserttree:Ppas_tree);
var i:SizeInt;
    temptree:Ppas_tree;
begin
 if(index>basetree^.count+1) then exit;
 i:=basetree^.count+1;
 ReallocMem(basetree^.child,sizeof(pas_tree)*(basetree^.count+1));
 while(i>index)do
  begin
   (basetree^.child+i)^:=(basetree^.child+i-1)^;
   dec(i);
  end;
 inc(basetree^.count,1);
 temptree:=basetree^.child+index-1;
 temptree^.parent:=basetree;
 temptree^.part:=inserttree^.part;
 temptree^.treetype:=inserttree^.treetype;
 temptree^.content:=nil;
 temptree^.child:=nil;
 temptree^.count:=0;
 pas_tree_copy(inserttree,temptree);
end;
procedure pas_tree_delete_item(var basetree:Ppas_tree;const index:SizeInt);
var i:SizeInt;
    temptree:Ppas_tree;
begin
 if(index>basetree^.count) then exit;
 temptree:=basetree^.child+index-1;
 destruct_pas_tree(temptree);
 i:=index;
 while(i<basetree^.count)do
  begin
   (basetree^.child+i-1)^:=(basetree^.child+i)^;
   inc(i);
  end;
 ReallocMem(temptree^.child,sizeof(pas_tree)*(basetree^.count-1));
 dec(basetree^.count,1);
end;
procedure pas_tree_merge_class(var basetree:Ppas_tree;const addtree:Ppas_tree);
var i,j,k,m,n:SizeInt;
    index1,index2,index3,index4,index5,index6,curindex:SizeInt;
    temptree,temptree2:Ppas_tree;
begin
 i:=1; index1:=0; index2:=0; index3:=0;
 while(i<=basetree^.count)do
  begin
   temptree:=basetree^.child+i-1;
   if(temptree^.treetype=pas_node_class_tag) then
    begin
     if(Pc_class_tag(temptree^.content)^.tagtype=0) then
      begin
       index1:=i+1;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=1) then
      begin
       index2:=i+1;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=2) then
      begin
       index3:=i+1;
      end;
    end;
   inc(i);
  end;
 if(index1=0) then
  begin
   index1:=1; index2:=i+1;
  end;
 j:=1; index4:=0; k:=1; m:=1; n:=1;
 while(i<=addtree^.count)do
  begin
   temptree:=addtree^.child+i-1;
   if(temptree^.treetype=pas_node_class_tag) then
    begin
     if(Pc_class_tag(temptree^.content)^.tagtype=0) then
      begin
       index4:=i+1;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=1) then
      begin
       index5:=i+1;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=2) then
      begin
       index6:=i+1;
      end;
    end;
   inc(i);
  end;
 if(index4=0) then
  begin
   index4:=1; index5:=i+1;
  end;
 curindex:=1;
 while(i<=addtree^.count)do
  begin
   temptree:=addtree^.child+i-1;
   if(temptree^.treetype=pas_node_class_tag) then
    begin
     if(Pc_class_tag(temptree^.content)^.tagtype=0) then
      begin
       curindex:=1;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=1) then
      begin
       curindex:=2;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=2) then
      begin
       curindex:=3;
      end;
    end
   else if(curindex>0) then
    begin
     if(curindex=1) then
      begin
       pas_tree_insert_item(basetree,index1+k-1,addtree^.child+i-1);
       inc(k); inc(index2); inc(index3);
      end
     else if(curindex=2) then
      begin
       pas_tree_insert_item(basetree,index2+m-1,addtree^.child+i-1);
       inc(m); inc(index3);
      end
     else if(curindex=3) then
      begin
       pas_tree_insert_item(basetree,index3+i-1,addtree^.child+i-1);
       inc(n);
      end;
    end;
   inc(i);
  end;
 {Search for virtual function and delete it}
 curindex:=1;
 while(i<=basetree^.count)do
  begin
   temptree:=basetree^.child+i-1;
   if(temptree^.treetype=pas_node_class_tag) then
    begin
     if(Pc_class_tag(temptree^.content)^.tagtype=0) then
      begin
       curindex:=1;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=1) then
      begin
       curindex:=2;
      end
     else if(Pc_class_tag(temptree^.content)^.tagtype=2) then
      begin
       curindex:=3;
      end;
    end
   else if(temptree^.treetype=pas_node_class_function) and
   (Ppas_class_function(temptree^.content)^.isvirtual=true) and (curindex>0) then
    begin
     j:=i+1;
     while(j<=basetree^.count)do
      begin
       temptree2:=basetree^.child+j-1;
       if(temptree2^.treetype=pas_node_class_function)
       and (Ppas_class_function(temptree^.content)^.funcname=
       Ppas_class_function(temptree2^.content)^.funcname) and
       (Ppas_class_function(temptree^.content)^.isvirtual=false) then
        begin
         break;
        end;
       inc(j);
      end;
     if(j<=basetree^.count) then
      begin
       pas_tree_delete_item(basetree,i);
      end;
    end;
   inc(i);
  end;
end;
function pas_tree_search_for_list(list:pas_tree_list;searchitem:Ppas_tree;
ifdefcond:cov_ifdef;specindex:byte=0):SizeInt;
var i,j,k,len,len2,iend,count:SizeInt;
begin
 count:=length(list.tree);
 for i:=count downto 1 do
  begin
   if(pointer_vaild(list.tree[i-1])=false) then continue;
   if(pointer_vaild(list.tree[i-1]^.content)=false) then continue;
   j:=1; iend:=Min(ifdefcond.count,list.ifdef[i-1].count);
   while(j<=iend)do
    begin
     if(c_string_compare(list.ifdef[i-1].condition[j-1],ifdefcond.condition[j-1])=false) then break;
     inc(j);
    end;
   if(j<=iend) then continue;
   if(searchitem^.treetype=pas_node_record) and (list.tree[i-1]^.treetype=pas_node_record) then
    begin
     if(Ppas_record(searchitem^.content)^.recordname=
     Ppas_record(list.tree[i-1]^.content)^.recordname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_class) and (list.tree[i-1]^.treetype=pas_node_class) then
    begin
     if(Ppas_class(searchitem^.content)^.classname=
     Ppas_class(list.tree[i-1]^.content)^.classname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_type) and (list.tree[i-1]^.treetype=pas_node_type) then
    begin
     if(Ppas_type(searchitem^.content)^.newname
     =Ppas_type(list.tree[i-1]^.content)^.newname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_enum) and (list.tree[i-1]^.treetype=pas_node_enum) then
    begin
     if(Ppas_enum(searchitem^.content)^.enumname=
     Ppas_enum(list.tree[i-1]^.content)^.enumname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_uses) and (list.tree[i-1]^.treetype=pas_node_uses) then
    begin
     if(Ppas_uses(searchitem^.content)^.usesname=
     Ppas_uses(list.tree[i-1]^.content)^.usesname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_class_function)
   and (list.tree[i-1]^.treetype=pas_node_class_function) then
    begin
     k:=1;
     len:=Min(Ppas_class_function(searchitem^.content)^.paramcount,
     Ppas_class_function(list.tree[i-1]^.content)^.paramcount);
     len2:=Max(Ppas_class_function(searchitem^.content)^.paramcount,
     Ppas_class_function(list.tree[i-1]^.content)^.paramcount);
     while(k<=len)do
      begin
       if(c_string_compare(Ppas_class_function(searchitem^.content)^.param[k-1],
       Ppas_class_function(list.tree[i-1]^.content)^.param[k-1],1)=false) then break;
       inc(k);
      end;
     if(k<=len) or (len<>len2) then continue;
     if(Ppas_class_function(searchitem^.content)^.isgeneric=
     Ppas_class_function(list.tree[i-1]^.content)^.isgeneric) then
      begin
       k:=1;
       len:=Min(Ppas_class_function(searchitem^.content)^.genericcount,
       Ppas_class_function(list.tree[i-1]^.content)^.genericcount);
       len2:=Max(Ppas_class_function(searchitem^.content)^.genericcount,
       Ppas_class_function(list.tree[i-1]^.content)^.genericcount);
       while(k<=len)do
        begin
         if(Ppas_class_function(searchitem^.content)^.generictype[k-1]<>
         Ppas_class_function(list.tree[i-1]^.content)^.generictype[k-1]) then break;
         inc(k);
        end;
       if(k<=len) or (len<>len2) then continue;
      end;
     if(Ppas_class_function(searchitem^.content)^.hostname=
     Ppas_class_function(list.tree[i-1]^.content)^.hostname) and
     (Ppas_class_function(searchitem^.content)^.funcname=
     Ppas_class_function(list.tree[i-1]^.content)^.funcname)
     and (searchitem^.count=0) and
     (searchitem^.count=list.tree[i-1]^.count) and (specindex=1) then exit(i)
     else if(Ppas_class_function(searchitem^.content)^.hostname=
     Ppas_class_function(list.tree[i-1]^.content)^.hostname) and
     (Ppas_class_function(searchitem^.content)^.funcname=
     Ppas_class_function(list.tree[i-1]^.content)^.funcname)
     and (searchitem^.count>0) and
     (searchitem^.count=list.tree[i-1]^.count) and (specindex=2) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_function)
   and (list.tree[i-1]^.treetype=pas_node_function) then
    begin
     k:=1;
     len:=Min(Ppas_function(searchitem^.content)^.paramcount,
     Ppas_function(list.tree[i-1]^.content)^.paramcount);
     len2:=Max(Ppas_function(searchitem^.content)^.paramcount,
     Ppas_function(list.tree[i-1]^.content)^.paramcount);
     while(k<=len)do
      begin
       if(c_string_compare(Ppas_function(searchitem^.content)^.param[k-1],
       Ppas_function(list.tree[i-1]^.content)^.param[k-1],1)=false) then break;
       inc(k);
      end;
     if(k<=len) or (len<>len2) then continue;
     if(Ppas_function(searchitem^.content)^.isgeneric=
     Ppas_function(list.tree[i-1]^.content)^.isgeneric) then
      begin
       k:=1;
       len:=Min(Ppas_function(searchitem^.content)^.genericcount,
       Ppas_function(list.tree[i-1]^.content)^.genericcount);
       len2:=Max(Ppas_function(searchitem^.content)^.genericcount,
       Ppas_function(list.tree[i-1]^.content)^.genericcount);
       while(k<=len)do
        begin
         if(Ppas_function(searchitem^.content)^.generictype[k-1]<>
         Ppas_function(list.tree[i-1]^.content)^.generictype[k-1]) then break;
         inc(k);
        end;
       if(k<=len) or (len<>len2) then continue;
      end;
     if(Ppas_function(searchitem^.content)^.funcname=
     Ppas_function(list.tree[i-1]^.content)^.funcname)
     and (searchitem^.count=0) and
     (searchitem^.count=list.tree[i-1]^.count) and (specindex=1) then exit(i)
     else if(Ppas_function(searchitem^.content)^.funcname=
     Ppas_function(list.tree[i-1]^.content)^.funcname)
     and (searchitem^.count>0) and
     (searchitem^.count=list.tree[i-1]^.count) and (specindex=2) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_operator)
   and (list.tree[i-1]^.treetype=pas_node_operator) then
    begin
     k:=1;
     len:=Min(Ppas_operator(searchitem^.content)^.paramcount,
     Ppas_operator(list.tree[i-1]^.content)^.paramcount);
     len2:=Max(Ppas_operator(searchitem^.content)^.paramcount,
     Ppas_operator(list.tree[i-1]^.content)^.paramcount);
     while(k<=len)do
      begin
       if(c_string_compare(Ppas_operator(searchitem^.content)^.param[k-1],
       Ppas_operator(list.tree[i-1]^.content)^.param[k-1],1)=false) then break;
       inc(k);
      end;
     if(k<=len) or (len<>len2) then continue;
     if(Ppas_operator(searchitem^.content)^.isgeneric=
     Ppas_operator(list.tree[i-1]^.content)^.isgeneric) then
      begin
       k:=1;
       len:=Min(Ppas_operator(searchitem^.content)^.genericcount,
       Ppas_operator(list.tree[i-1]^.content)^.genericcount);
       len2:=Max(Ppas_operator(searchitem^.content)^.genericcount,
       Ppas_operator(list.tree[i-1]^.content)^.genericcount);
       while(k<=len)do
        begin
         if(Ppas_operator(searchitem^.content)^.generictype[k-1]<>
         Ppas_operator(list.tree[i-1]^.content)^.generictype[k-1]) then break;
         inc(k);
        end;
       if(k<=len) or (len<>len2) then continue;
      end;
     if(Ppas_operator(searchitem^.content)^.signname=
     Ppas_operator(list.tree[i-1]^.content)^.signname)
     and (searchitem^.count=0) and
     (searchitem^.count=list.tree[i-1]^.count) and (specindex=1) then exit(i)
     else if(Ppas_operator(searchitem^.content)^.signname=
     Ppas_operator(list.tree[i-1]^.content)^.signname)
     and (searchitem^.count>0) and
     (searchitem^.count=list.tree[i-1]^.count) and (specindex=2) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_const)
   and (list.tree[i-1]^.treetype=pas_node_const) then
    begin
     if(Ppas_const(searchitem^.content)^.constname=
     Ppas_const(list.tree[i-1]^.content)^.constname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_variable)
   and (list.tree[i-1]^.treetype=pas_node_variable) then
    begin
     if(Ppas_variable(searchitem^.content)^.varname=
     Ppas_variable(list.tree[i-1]^.content)^.varname) then exit(i);
    end
   else if(searchitem^.treetype=pas_node_label_declare)
   and (list.tree[i-1]^.treetype=pas_node_label_declare) then
    begin
     if(Ppas_label_declare(searchitem^.content)^.name=
     Ppas_label_declare(list.tree[i-1]^.content)^.name) then exit(i);
    end;
  end;
 pas_tree_search_for_list:=0;
end;
procedure pas_tree_get_list(const roottree:Ppas_tree;var list:pas_tree_list;specindex:byte=0;init:boolean=true);
var i,j,k,layer:SizeInt;
    basetree,temptree,temptree2:Ppas_tree;
    tempifdef:cov_ifdef;
    bool:SizeInt;
begin
 if(init) then
  begin
   list.count:=0; SetLength(list.tree,0);
  end;
 tempifdef.count:=0;
 if(roottree^.count>0) then
  begin
   layer:=0;
   for i:=1 to roottree^.count do
    begin
     if(list.count<0) then list.count:=0;
     basetree:=roottree^.child+i-1;
     if(pointer_vaild(basetree)=false) then continue;
     if(basetree^.treetype=pas_node_ifdef) and (codenoifdef=false) then
      begin
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
       if(Ppas_ifdef(basetree^.content)^.deftype=5) and (layer>0) then
        begin
         dec(tempifdef.count);
         SetLength(tempifdef.condition,tempifdef.count);
         dec(layer);
        end
       else if(Ppas_ifdef(basetree^.content)^.deftype<=2) then
        begin
         inc(tempifdef.count);
         SetLength(tempifdef.condition,tempifdef.count);
         tempifdef.condition[tempifdef.count-1]:=Ppas_ifdef(basetree^.content)^.condition;
         inc(layer);
        end;
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
      end
     else if(basetree^.treetype=pas_node_define) and (codenoifdef=false) and (specindex=0) then
      begin
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_label_declare) and (specindex=5) then
      begin
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_uses) and (specindex=1) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) and (layer=0) then continue;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_type) and (specindex=2) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) and (layer=0) then continue;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_record) and (specindex=2) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) and (layer=0) then continue;
       temptree:=basetree;
       pas_tree_get_list(temptree,list,specindex,false);
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_class) and (specindex=2) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) and (layer=0) then continue;
       temptree:=basetree;
       pas_tree_get_list(temptree,list,specindex,false);
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       temptree:=list.tree[length(list.tree)-1];
       j:=length(list.tree)-1;
       while(j>0)do
        begin
         k:=2;
         temptree2:=list.tree[j-1];
         while(Ppas_class(temptree^.content)^.inheritcount>=2) and
         (k<=Ppas_class(temptree^.content)^.inheritcount) and
         (temptree2^.treetype=pas_node_class) and
         (Ppas_class(temptree2^.content)^.classname=
         Ppas_class(temptree^.content)^.inheritclass[k-1]) do
          begin
           pas_tree_merge_class(temptree,temptree2);
           inc(k);
          end;
         dec(j);
        end;
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_enum) and (specindex=2) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) then break;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_const) and (specindex=3) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) then continue;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_variable) and (specindex=4) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef);
       if(bool>0) and (layer=0) then
        begin
         if(Ppas_variable(basetree^.content)^.varext=false) and
         (Ppas_variable(list.tree[bool-1]^.content)^.varext=true) then
          begin
           dec(list.count);
           Delete(list.tree,bool-1,1);
          end
         else
          begin
           continue;
          end;
        end;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_function) and (specindex>=6) and (specindex<=7) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef,specindex-5);
       if(bool>0) and (layer=0) then
        begin
         if(Ppas_function(basetree^.content)^.ext=false) and
         (Ppas_function(list.tree[bool-1]^.content)^.ext=true) then
          begin
           dec(list.count);
           Delete(list.tree,bool-1,1);
          end
         else
          begin
           continue;
          end;
        end;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_class_function) and (specindex=7) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef,specindex-5);
       if(bool>0) and (layer=0) then
        begin
         if(Ppas_class_function(basetree^.content)^.ext=false) and
         (Ppas_class_function(list.tree[bool-1]^.content)^.ext=true) then
          begin
           dec(list.count);
           Delete(list.tree,bool-1,1);
          end
         else
          begin
           continue;
          end;
        end;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.treetype=pas_node_operator) and (specindex>=6) and (specindex<=7) then
      begin
       bool:=pas_tree_search_for_list(list,basetree,tempifdef,specindex-5);
       if(bool>0) and (layer=0) then
        begin
         if(Ppas_operator(basetree^.content)^.ext=false) and
         (Ppas_operator(list.tree[bool-1]^.content)^.ext=true) then
          begin
           dec(list.count);
           Delete(list.tree,bool-1,1);
          end
         else
          begin
           continue;
          end;
        end;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
       SetLength(list.ifdef,length(list.tree)+1);
       list.ifdef[length(list.tree)-1]:=tempifdef;
      end
     else if(basetree^.count>0) and (specindex>=1) and (specindex<=7) then
      begin
       if(specindex>=3) and (specindex<=5) and (roottree^.treetype=pas_node_root) then continue;
       pas_tree_get_list(basetree,list,specindex,false);
      end
     else if(specindex=8) then
      begin
       if(basetree^.treetype=pas_node_variable)
       or (basetree^.treetype=pas_node_const) or (basetree^.treetype=pas_node_enum)
       or (basetree^.treetype=pas_node_record) or (basetree^.treetype=pas_node_class)
       or (basetree^.treetype=pas_node_enum) or (basetree^.treetype=pas_node_uses)
       or (basetree^.treetype=pas_node_label_declare)
       or (basetree^.treetype=pas_node_class_function)
       or (basetree^.treetype=pas_node_function)
       or (basetree^.treetype=pas_node_operator) then continue;
       inc(list.count);
       SetLength(list.tree,length(list.tree)+1);
       pas_tree_copy(basetree,list.tree[length(list.tree)-1]);
      end;
    end;
  end;
 i:=1;
 list.count:=length(list.tree);
 while(i<=list.count)do
  begin
   if(pointer_vaild(list.tree[i-1])=false) then
    begin
     destruct_pas_tree(list.tree[i-1]);
     Delete(list.tree,i-1,1); Delete(list.ifdef,i-1,1); dec(list.count); continue;
    end;
   if(list.tree[i-1]^.treetype=pas_node_none) then
    begin
     destruct_pas_tree(list.tree[i-1]);
     Delete(list.tree,i-1,1); Delete(list.ifdef,i-1,1); dec(list.count); continue;
    end;
   inc(i);
  end;
 i:=1; j:=1;
 list.count:=length(list.tree);
 while(i<=list.count)do
  begin
   if(i<=0) then
    begin
     i:=1; continue;
    end;
   if(pointer_vaild(list.tree[i-1])=true) and (pointer_vaild(list.tree[i-1]^.content)=true)
   and (list.tree[i-1]^.treetype=pas_node_ifdef)
   and (Ppas_ifdef(list.tree[i-1]^.content)^.deftype<=2) then
    begin
     j:=i+1;
     if(j<=list.count) and (list.tree[j-1]^.treetype=pas_node_ifdef) and
     (Ppas_ifdef(list.tree[j-1]^.content)^.deftype=5)then
      begin
       destruct_pas_tree(list.tree[j-1]);
       Delete(list.tree,j-1,1); Delete(list.ifdef,j-1,1);
       dec(list.count,1); dec(i,1); continue;
      end;
     while(j<=list.count)do
      begin
       if(pointer_vaild(list.tree[j-1])=true) and (pointer_vaild(list.tree[j-1]^.content)=true) and
       (list.tree[j-1]^.treetype=pas_node_ifdef) and
       (Ppas_ifdef(list.tree[j-1]^.content)^.deftype>=3) and
       (Ppas_ifdef(list.tree[j-1]^.content)^.deftype<=4) then inc(j)
       else break;
      end;
     if(j<=list.count) and (list.tree[j-1]^.treetype=pas_node_ifdef) and
     (Ppas_ifdef(list.tree[j-1]^.content)^.deftype=5) then
      begin
       for k:=j downto i do destruct_pas_tree(list.tree[k-1]);
       Delete(list.tree,i-1,j-i+1); Delete(list.ifdef,i-1,j-i+1);
       dec(list.count,j-i+1); dec(i); continue;
      end
     else if(j>list.count) then
      begin
       for k:=j-1 downto i do destruct_pas_tree(list.tree[k-1]);
       Delete(list.tree,i-1,j-i); Delete(list.ifdef,i-1,j-i);
       dec(list.count,j-i); dec(i); continue;
      end
     else
      begin
       i:=j+1; continue;
      end;
    end
   else if(pointer_vaild(list.tree[i-1])=true) and (pointer_vaild(list.tree[i-1]^.content)=true)
   and (list.tree[i-1]^.treetype=pas_node_ifdef)
   and (Ppas_ifdef(list.tree[i-1]^.content)^.deftype>=3)
   and (Ppas_ifdef(list.tree[i-1]^.content)^.deftype<=4) then
    begin
     j:=i+1;
     if(j<=list.count) and (list.tree[j-1]^.treetype=pas_node_ifdef) and
     (Ppas_ifdef(list.tree[j-1]^.content)^.deftype>=3) and
     (Ppas_ifdef(list.tree[j-1]^.content)^.deftype<=4) then
      begin
       for k:=j-1 downto i do destruct_pas_tree(list.tree[k-1]);
       Delete(list.tree,i-1,j-i); Delete(list.ifdef,i-1,j-i);
       dec(list.count,j-i); dec(i); continue;
      end
     else if(j<=list.count) and (list.tree[j-1]^.treetype=pas_node_ifdef) and
     (Ppas_ifdef(list.tree[j-1]^.content)^.deftype=5) then
      begin
       for k:=j downto i do destruct_pas_tree(list.tree[k-1]);
       Delete(list.tree,i-1,j-i); Delete(list.ifdef,i-1,j-i);
       dec(list.count,j-i); dec(i); continue;
      end
     else if(j>list.count) then
      begin
       for k:=j-1 downto i do destruct_pas_tree(list.tree[k-1]);
       Delete(list.tree,i-1,j-i); Delete(list.ifdef,i-1,j-i);
       dec(list.count,j-i); dec(i); continue;
      end
     else
      begin
       i:=j+1; continue;
      end;
    end;
   inc(i);
  end;
end;
procedure pas_tree_reconstruct(const orgtree:Ppas_tree;var desttree:Ppas_tree);
var tempdeflist,tempuseslist,tempreclist,tempconstlist,tempvarlist,tempfuncdlist:pas_tree_list;
    templabellist,tempfunclist,tempcodeseglist:pas_tree_list;
    temptree:Ppas_tree;
    i:SizeInt;
    res:Ppas_tree;
begin
 tempdeflist.count:=0;
 tempuseslist.count:=0;
 tempreclist.count:=0;
 tempconstlist.count:=0;
 tempvarlist.count:=0;
 templabellist.count:=0;
 tempfuncdlist.count:=0;
 tempfunclist.count:=0;
 tempcodeseglist.count:=0;
 if(desttree=nil) then
  begin
   res:=initialize_pas_tree; res^.treetype:=pas_node_root;
   pas_tree_get_list(orgtree,tempdeflist,0);
   pas_tree_get_list(orgtree,tempuseslist,1);
   pas_tree_get_list(orgtree,tempreclist,2);
   pas_tree_get_list(orgtree,tempconstlist,3);
   pas_tree_get_list(orgtree,tempvarlist,4);
   pas_tree_get_list(orgtree,templabellist,5);
   if(species=1) then pas_tree_get_list(orgtree,tempfuncdlist,6);
   pas_tree_get_list(orgtree,tempfunclist,7);
   tempdeflist.count:=length(tempdeflist.tree);
   tempuseslist.count:=length(tempuseslist.tree);
   tempreclist.count:=length(tempreclist.tree);
   tempconstlist.count:=length(tempconstlist.tree);
   tempvarlist.count:=length(tempvarlist.tree);
   if(species=1) then tempfuncdlist.count:=length(tempfuncdlist.tree);
   tempfunclist.count:=length(tempfunclist.tree);
   {Handle the define}
   for i:=1 to tempdeflist.count do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempdeflist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to tempdeflist.count do
    begin
     destruct_pas_tree(tempdeflist.tree[i-1]);
    end;
   {Handle the uses}
   for i:=1 to tempuseslist.count do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempuseslist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to tempuseslist.count do
    begin
     destruct_pas_tree(tempuseslist.tree[i-1]);
    end;
   {Handle the record}
   for i:=1 to tempreclist.count do
    begin
     if(tempreclist.tree[i-1]^.treetype=pas_node_type) and
     (Ppas_type(tempreclist.tree[i-1]^.content)^.oldname.count=1) and
     (Ppas_type(tempreclist.tree[i-1]^.content)^.oldname.item[0]='^') then continue;
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempreclist.tree[i-1],temptree,4);
     temptree^.part:=false;
    end;
   for i:=1 to tempreclist.count do
    begin
     destruct_pas_tree(tempreclist.tree[i-1]);
    end;
   {Handle the const}
   for i:=1 to tempconstlist.count do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempconstlist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to tempconstlist.count do
    begin
     destruct_pas_tree(tempconstlist.tree[i-1]);
    end;
   {Handle the variable}
   for i:=1 to tempvarlist.count do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempvarlist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to tempvarlist.count do
    begin
     destruct_pas_tree(tempvarlist.tree[i-1]);
    end;
   {Handle the label declaration}
   for i:=1 to templabellist.count do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(templabellist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to templabellist.count do
    begin
     destruct_pas_tree(templabellist.tree[i-1]);
    end;
   {Handle the function declare}
   if(species=1) then
    begin
     for i:=1 to tempfuncdlist.count do
      begin
       inc(res^.count);
       ReallocMem(res^.child,res^.count*sizeof(pas_tree));
       temptree:=res^.child+res^.count-1;
       temptree^.content:=nil;
       temptree^.treetype:=tempfuncdlist.tree[i-1]^.treetype;
       temptree^.child:=nil;
       temptree^.count:=0;
       pas_tree_copy(tempfuncdlist.tree[i-1],temptree,3);
       temptree^.part:=false;
      end;
     for i:=1 to tempfuncdlist.count do
      begin
       destruct_pas_tree(tempfuncdlist.tree[i-1]);
      end;
    end;
   {Handle the function details}
   for i:=1 to tempfunclist.count do
    begin
     if(tempfunclist.tree[i-1]^.treetype=pas_node_none) then continue;
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     temptree^.content:=nil;
     temptree^.treetype:=tempfunclist.tree[i-1]^.treetype;
     temptree^.child:=nil;
     temptree^.count:=0;
     if(tempfunclist.tree[i-1]^.treetype<>pas_node_ifdef) then
     pas_tree_reconstruct(tempfunclist.tree[i-1],temptree)
     else
     pas_tree_copy(tempfunclist.tree[i-1],temptree,1);
     temptree^.part:=true;
    end;
   for i:=1 to tempfunclist.count do
    begin
     destruct_pas_tree(tempfunclist.tree[i-1]);
    end;
   rehandle_pas_tree_parent(res);
   desttree:=res;
  end
 else
  begin
   res:=desttree;
   pas_tree_copy(orgtree,res,1);
   res^.part:=true;
   {Handle the const}
   pas_tree_get_list(orgtree,tempconstlist,3);
   tempconstlist.count:=length(tempconstlist.tree);
   for i:=1 to length(tempconstlist.tree) do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempconstlist.tree[i-1],temptree);
     temptree^.part:=false;
    end;
   for i:=1 to length(tempconstlist.tree) do
    begin
     destruct_pas_tree(tempconstlist.tree[i-1]);
    end;
   {Handle the variable}
   pas_tree_get_list(orgtree,tempvarlist,4);
   tempvarlist.count:=length(tempvarlist.tree);
   for i:=1 to length(tempvarlist.tree) do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempvarlist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to length(tempvarlist.tree) do
    begin
     destruct_pas_tree(tempvarlist.tree[i-1]);
    end;
   {Handle the label declaration}
   pas_tree_get_list(orgtree,templabellist,5,false);
   templabellist.count:=length(templabellist.tree);
   for i:=1 to length(templabellist.tree) do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(templabellist.tree[i-1],temptree,3);
     temptree^.part:=false;
    end;
   for i:=1 to length(templabellist.tree) do
    begin
     destruct_pas_tree(templabellist.tree[i-1]);
    end;
   {Handle the code Segment}
   tempcodeseglist.count:=0;
   pas_tree_get_list(orgtree,tempcodeseglist,8);
   tempcodeseglist.count:=length(tempcodeseglist.tree);
   for i:=1 to tempcodeseglist.count do
    begin
     inc(res^.count);
     ReallocMem(res^.child,res^.count*sizeof(pas_tree));
     temptree:=res^.child+res^.count-1;
     pas_tree_copy(tempcodeseglist.tree[i-1],temptree,2);
     temptree^.part:=true;
    end;
   for i:=1 to tempcodeseglist.count do
    begin
     destruct_pas_tree(tempcodeseglist.tree[i-1]);
    end;
  end;
end;
function generate_blank_string(blankcount:word):string;
var i:word;
    res:string;
begin
 res:=''; i:=1;
 while(i<=blankcount)do
  begin
   res:=res+' ';
   inc(i);
  end;
 generate_blank_string:=res;
end;
function generate_blank_string_from_string(str:string):string;
var i:word;
    res:string;
begin
 res:=''; i:=1;
 while(i<=length(str))do
  begin
   res:=res+' ';
   inc(i);
  end;
 generate_blank_string_from_string:=res;
end;
function pas_tree_get_previous_tree(pastree:Ppas_tree;baseindex:SizeInt;specindex:byte=0):Ppas_tree;
var temptree,res:Ppas_tree;
    i:SizeInt;
begin
 i:=baseindex-1;
 while(i>0)do
  begin
   temptree:=pastree^.child+i-1;
   if(temptree^.treetype<>pas_node_ifdef) then break;
   if(specindex=0) then
    begin
     if(temptree^.treetype=pas_node_uses) then break;
    end
   else if(specindex=1) then
    begin
     if(temptree^.treetype=pas_node_record) or (temptree^.treetype=pas_node_type)
     or(temptree^.treetype=pas_node_enum) or (temptree^.treetype=pas_node_class) then break;
    end
   else if(specindex=2) then
    begin
     if(temptree^.treetype=pas_node_const) then break;
    end
   else if(specindex=3) then
    begin
     if(temptree^.treetype=pas_node_variable) then break;
    end
   else if(specindex=4) then
    begin
     if(temptree^.treetype=pas_node_label_declare) then break;
    end
   else if(specindex=5) then
    begin
     if(temptree^.treetype=pas_node_asm) then break;
    end
   else if(specindex=6) then
    begin
     if(temptree^.treetype=pas_node_asm_code) then break;
    end;
   dec(i);
  end;
 if(i=0) then res:=nil else res:=pastree^.child+i-1;
 pas_tree_get_previous_tree:=res;
end;
function pas_variable_compare(const varstate1,varstate2:Ppas_variable):boolean;
var i,len:SizeInt;
begin
 i:=1;
 if(varstate1^.varhavevalue=true) or (varstate1^.varext=true) then exit(false);
 if(varstate1^.vartype=varstate2^.vartype) and (varstate1^.vararrayc=varstate2^.vararrayc) then
  begin
   i:=1; len:=varstate1^.vararrayc;
   while(i<=len)do
    begin
     if(c_string_compare(varstate1^.vararrayd[i-1],varstate2^.vararrayd[i-1])=false) then break;
     inc(i);
    end;
   if(i>len) then pas_variable_compare:=true else pas_variable_compare:=false;
  end
 else pas_variable_compare:=false;
end;
function pas_tree_get_next_tree(pastree:Ppas_tree;baseindex:SizeInt;specindex:byte=0):Ppas_tree;
var temptree,res:Ppas_tree;
    i:SizeInt;
begin
 i:=baseindex+1;
 while(i<pastree^.count)do
  begin
   temptree:=pastree^.child+i-1;
   if(temptree^.treetype<>pas_node_ifdef) then break;
   if(specindex=0) then
    begin
     if(temptree^.treetype=pas_node_uses) then break;
    end
   else if(specindex=1) then
    begin
     if(temptree^.treetype=pas_node_record) or (temptree^.treetype=pas_node_type)
     or(temptree^.treetype=pas_node_enum) or (temptree^.treetype=pas_node_class) then break;
    end
   else if(specindex=2) then
    begin
     if(temptree^.treetype=pas_node_const) then break;
    end
   else if(specindex=3) then
    begin
     if(temptree^.treetype=pas_node_variable) then break;
    end
   else if(specindex=4) then
    begin
     if(temptree^.treetype=pas_node_label_declare) then break;
    end
   else if(specindex=5) then
    begin
     if(temptree^.treetype=pas_node_asm) then break;
    end
   else if(specindex=6) then
    begin
     if(temptree^.treetype=pas_node_asm_code) then break;
    end
   else if(specindex=7) then
    begin
     if(temptree^.treetype=pas_node_if_statement) then break;
    end;
   inc(i);
  end;
 if(i>pastree^.count) then res:=nil else res:=pastree^.child+i-1;
 pas_tree_get_next_tree:=res;
end;
function convert_pas_tree_to_string(pastree:Ppas_tree;blankcount:SizeInt=0):string;
var i,ii,ii2,ii3,len:SizeInt;
    tempstr:string;
    temptree,temptree2,temptree3:Ppas_tree;
    codeseg:boolean;
    res:string;
label l1,l2;
begin
 res:=''; codeseg:=false; ii3:=0;
 if(pastree=nil) then exit(res);
 if(pastree^.treetype=pas_node_root) and (species=0) then
  begin
   res:='program '+codename+';'#10;
  end
 else if(pastree^.treetype=pas_node_root) and (species=1) then
  begin
   res:='unit '+codename+';'#10;
   res:=res+'interface'#10;
  end
 else if(pastree^.treetype=pas_node_root) and (species=2) then
  begin
   res:='library '+codename+';'#10;
  end;
 if(pastree^.treetype=pas_node_class_function) or (pastree^.treetype=pas_node_function)
 or(pastree^.treetype=pas_node_operator) then
  begin
   if(pastree^.count=0) and (pastree^.parent^.treetype=pas_node_root) then
    begin
     res:=res+generate_blank_string(blankcount)+'begin'#10
     +generate_blank_string(blankcount)+'end;'#10; codeseg:=true;
     exit(res);
    end;
  end;
 ii:=1;
 if(pastree^.count=0) then goto l2;
 l1:
 temptree:=pastree^.child+ii-1;
 if(Pointer_vaild(temptree^.content)=false) then goto l2;
 if(temptree^.treetype=pas_node_function) or (temptree^.treetype=pas_node_operator) then
  begin
   if(pastree^.treetype<>pas_node_root) then goto l2;
  end
 else if(temptree^.treetype=pas_node_class_function) then
  begin
   if(pastree^.treetype<>pas_node_root) and (pastree^.treetype<>pas_node_class) then goto l2;
  end
 else if(temptree^.treetype=pas_node_uses) then
  begin
   if(pastree^.treetype<>pas_node_root) then goto l2;
  end
 else if(temptree^.treetype=pas_node_enum) or (temptree^.treetype=pas_node_type)
 or (temptree^.treetype=pas_node_record) or (temptree^.treetype=pas_node_class) then
  begin
   if(pastree^.treetype<>pas_node_root) then goto l2;
  end
 else if(temptree^.treetype=pas_node_variable) or (temptree^.treetype=pas_node_const) then
  begin
   if(pastree^.treetype<>pas_node_root) and (pastree^.treetype<>pas_node_function)
   and (pastree^.treetype<>pas_node_class_function)
   and (pastree^.treetype<>pas_node_operator) then goto l2;
  end;
 if(pastree^.treetype=pas_node_class_function) or (pastree^.treetype=pas_node_function)
 or(pastree^.treetype=pas_node_operator) then
  begin
   if(codeseg=false) and (temptree^.part=true) then
    begin
     res:=res+generate_blank_string(blankcount)+'begin'#10; codeseg:=true;
    end;
  end
 else if(pastree^.treetype=pas_node_root) and (species=1) then
  begin
   if(codeseg=false) and (temptree^.part=true) and (pastree^.treetype=pas_node_root) then
    begin
     res:=res+generate_blank_string(blankcount)+'implementation'#10; codeseg:=true;
    end;
  end;
 if(pastree^.treetype=pas_node_root) then
  begin
   inc(debugindex);
   //if(debugindex=ii) then writeln(ii,' ',temptree^.treetype);
  end;
 if(temptree^.treetype=pas_node_type) then
  begin
   res:=res+generate_blank_string(blankcount);
   temptree2:=pas_tree_get_previous_tree(pastree,ii,1);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_class)
   and (temptree2^.treetype<>pas_node_record) and (temptree2^.treetype<>pas_node_type)
   and (temptree2^.treetype<>pas_node_enum)) then
   tempstr:='type '+Ppas_type(temptree^.content)^.newname+'='+
   c_string_to_string(Ppas_type(temptree^.content)^.oldname)
   else tempstr:='     '+Ppas_type(temptree^.content)^.newname+'='+
   c_string_to_string(Ppas_type(temptree^.content)^.oldname);
   if(Ppas_type(temptree^.content)^.oldname.count>0) and
   (Ppas_type(temptree^.content)^.oldname.item[Ppas_type(temptree^.content)^.oldname.count-1]<>';') then
   tempstr:=tempstr+';'#10
   else
   tempstr:=tempstr+#10;
   res:=res+tempstr;
  end
 else if(temptree^.treetype=pas_node_asm) then
  begin
   temptree2:=pas_tree_get_previous_tree(pastree,ii,5);
   temptree3:=pas_tree_get_next_tree(pastree,ii,5);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_asm)) then
    begin
     res:=res+generate_blank_string(blankcount)+#10+'asm'#10;
    end;
   i:=1;
   while(i<=Ppas_asm(temptree^.content)^.count)do
    begin
     res:=res+generate_blank_string(blankcount+1)+
     c_string_to_string(Ppas_asm(temptree^.content)^.code[i-1])+#10;
     inc(i);
    end;
   if(temptree3=nil) or ((temptree3<>nil) and (temptree3^.treetype<>pas_node_asm)) then
    begin
     res:=res+generate_blank_string(blankcount)+'end;'#10;
    end;
  end
 else if(temptree^.treetype=pas_node_asm_code) then
  begin
   temptree2:=pas_tree_get_previous_tree(pastree,ii,6);
   temptree3:=pas_tree_get_next_tree(pastree,ii,6);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_asm)) then
    begin
     res:=res+generate_blank_string(blankcount)+'asm'#10;
    end;
   res:=res+generate_blank_string(blankcount+1)+
   c_string_to_string(Ppas_asm_code(temptree^.content)^.code)+#10;
   if(temptree3=nil) or ((temptree3<>nil) and (temptree3^.treetype<>pas_node_asm)) then
    begin
     res:=res+generate_blank_string(blankcount)+'end;'#10;
    end;
  end
 else if(temptree^.treetype=pas_node_case_of_statement) then
  begin
   res:=res+generate_blank_string(blankcount)+'case '+
   c_string_to_string(Ppas_case_of_statement(temptree^.content)^.exp)+' of'#10;
   i:=1;
   res:=res+convert_pas_tree_to_string(temptree^.child+i-1,blankcount);
   res:=res+generate_blank_string(blankcount)+'end;'#10;
  end
 else if(temptree^.treetype=pas_node_case_of_sub_statement) then
  begin
   res:=res+generate_blank_string(blankcount);
   i:=1; len:=Ppas_case_of_sub_statement(temptree^.content)^.ccount;
   while(i<=len)do
    begin
     res:=res+c_string_to_string(Ppas_case_of_sub_statement(temptree^.content)^.cexp[i-1]);
     if(i<len) then res:=res+',' else res:=res+':';
     inc(i);
    end;
   i:=1; len:=temptree^.count;
   res:=res+generate_blank_string(blankcount)+#10'begin'#10;
   res:=res+convert_pas_tree_to_string(temptree^.child+i-1,blankcount+1);
   res:=res+generate_blank_string(blankcount)+'end;'#10;
  end
 else if(temptree^.treetype=pas_node_class) and (pastree^.treetype=pas_node_root) then
  begin
   res:=res+generate_blank_string(blankcount);
   temptree2:=pas_tree_get_previous_tree(pastree,ii,1);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_class)
   and (temptree2^.treetype<>pas_node_record) and (temptree2^.treetype<>pas_node_type)
   and (temptree2^.treetype<>pas_node_enum)) then
   tempstr:='type ' else tempstr:='     ';
   if(Ppas_class(temptree^.content)^.isgeneric=true) then
    begin
     tempstr:=tempstr+'generic '+Ppas_class(temptree^.content)^.classname;
     for i:=1 to Ppas_class(temptree^.content)^.genericcount do
      begin
       if(i=1) then tempstr:=tempstr+'<';
       tempstr:=tempstr+Ppas_class(temptree^.content)^.generictype[i-1];
       if(i<Ppas_class(temptree^.content)^.genericcount) then tempstr:=tempstr+','
       else tempstr:=tempstr+'>';
      end;
    end
   else tempstr:=tempstr+Ppas_class(temptree^.content)^.classname;
   tempstr:=tempstr+'=';
   len:=length(tempstr);
   if(Ppas_class(temptree^.content)^.inheritcount>=1) then
   res:=res+generate_blank_string(blankcount)+tempstr+'class('
   +Ppas_class(temptree^.content)^.inheritclass[0]+')'#10
   else
   res:=res+generate_blank_string(blankcount)+tempstr+'class'#10;
   if(temptree^.count>0) then res:=res+convert_pas_tree_to_string(temptree,blankcount+len);
   res:=res+generate_blank_string(blankcount+len)+'end;'#10;
  end
 else if(temptree^.treetype=pas_node_class_function) then
  begin
   res:=res+generate_blank_string(blankcount);
   if(Ppas_function(temptree^.content)^.isgeneric) then res:=res+'generic ';
   if(Ppas_class_function(temptree^.content)^.resulttype='') then
    begin
     if(pastree^.treetype=pas_node_root) then
      begin
       if(Ppas_class_function(temptree^.content)^.isdestructor) then
       res:=res+'destructor '+Ppas_class_function(temptree^.content)^.hostname+'.'+
       Ppas_class_function(temptree^.content)^.funcname
       else if(Ppas_class_function(temptree^.content)^.isconstructor) then
       res:=res+'constructor '+Ppas_class_function(temptree^.content)^.hostname+'.'+
       Ppas_class_function(temptree^.content)^.funcname
       else
       res:=res+'procedure '+Ppas_class_function(temptree^.content)^.hostname+'.'+
       Ppas_class_function(temptree^.content)^.funcname;
      end
     else
      begin
       if(Ppas_class_function(temptree^.content)^.isdestructor) then
       res:=res+'destructor '+Ppas_class_function(temptree^.content)^.funcname
       else if(Ppas_class_function(temptree^.content)^.isconstructor) then
       res:=res+'constructor '+Ppas_class_function(temptree^.content)^.funcname
       else
       res:=res+'procedure '+Ppas_class_function(temptree^.content)^.funcname;
      end;
     if(Ppas_class_function(temptree^.content)^.isgeneric=true) then
      begin
       for i:=1 to Ppas_class_function(temptree^.content)^.genericcount do
        begin
         if(i=1) then res:=res+'<';
         res:=res+Ppas_class_function(temptree^.content)^.generictype[i-1];
         if(i<Ppas_class_function(temptree^.content)^.genericcount) then res:=res+','
         else res:=res+'>';
        end;
      end;
     i:=1; len:=Ppas_class_function(temptree^.content)^.paramcount;
     while(i<=len)do
      begin
       if(i=1) then res:=res+'(';
       res:=res+c_string_to_string(Ppas_class_function(temptree^.content)^.param[i-1]);
       if(i<len) then res:=res+';' else res:=res+')';
       inc(i);
      end;
     res:=res+';';
     if(Ppas_class_function(temptree^.content)^.abi<>'') then
     res:=res+Ppas_class_function(temptree^.content)^.abi+';';
     if(Ppas_class_function(temptree^.content)^.conv<>'') then
     res:=res+Ppas_class_function(temptree^.content)^.conv+';';
     if(Ppas_class_function(temptree^.content)^.isinline) then
     res:=res+'inline;';
     if(Ppas_class_function(temptree^.content)^.isabstract) then
     res:=res+'abstract;'
     else if(Ppas_class_function(temptree^.content)^.isvirtual) then
     res:=res+'virtual;';
     if(Ppas_class_function(temptree^.content)^.isoverride) then
     res:=res+'override;';
     if(Ppas_class_function(temptree^.content)^.ext) then
     res:=res+'external;';
     if(Ppas_class_function(temptree^.content)^.funcalias<>'') and (temptree^.count>0) then
     res:=res+'[alias:'+Ppas_class_function(temptree^.content)^.funcalias+'];';
     res:=res+#10;
    end
   else
    begin
     if(pastree^.treetype=pas_node_root) then
      begin
       if(Ppas_class_function(temptree^.content)^.isdestructor) then
       res:=res+'destructor '+Ppas_class_function(temptree^.content)^.hostname+'.'+
       Ppas_class_function(temptree^.content)^.funcname
       else if(Ppas_class_function(temptree^.content)^.isconstructor) then
       res:=res+'constructor '+Ppas_class_function(temptree^.content)^.hostname+'.'+
       Ppas_class_function(temptree^.content)^.funcname
       else
       res:=res+'function '+Ppas_class_function(temptree^.content)^.hostname+'.'+
       Ppas_class_function(temptree^.content)^.funcname;
      end
     else
      begin
       if(Ppas_class_function(temptree^.content)^.isdestructor) then
       res:=res+'destructor '+Ppas_class_function(temptree^.content)^.funcname
       else if(Ppas_class_function(temptree^.content)^.isconstructor) then
       res:=res+'constructor '+Ppas_class_function(temptree^.content)^.funcname
       else
       res:=res+'function '+Ppas_class_function(temptree^.content)^.funcname;
      end;
     if(Ppas_class_function(temptree^.content)^.isgeneric=true) then
      begin
       for i:=1 to Ppas_class_function(temptree^.content)^.genericcount do
        begin
         if(i=1) then res:=res+'<';
         res:=res+Ppas_class_function(temptree^.content)^.generictype[i-1];
         if(i<Ppas_class_function(temptree^.content)^.genericcount) then res:=res+','
         else res:=res+'>';
        end;
      end;
     i:=1; len:=Ppas_class_function(temptree^.content)^.paramcount;
     while(i<=len)do
      begin
       if(i=1) then res:=res+'(';
       res:=res+c_string_to_string(Ppas_class_function(temptree^.content)^.param[i-1]);
       if(i<len) then res:=res+';' else res:=res+')';
       inc(i);
      end;
     res:=res+':'+Ppas_class_function(temptree^.content)^.resulttype+';';
     if(Ppas_class_function(temptree^.content)^.abi<>'') then
     res:=res+Ppas_class_function(temptree^.content)^.abi+';';
     if(Ppas_class_function(temptree^.content)^.conv<>'') then
     res:=res+Ppas_class_function(temptree^.content)^.conv+';';
     if(Ppas_class_function(temptree^.content)^.isinline) then
     res:=res+'inline;';
     if(Ppas_class_function(temptree^.content)^.isabstract) then
     res:=res+'abstract;'
     else if(Ppas_class_function(temptree^.content)^.isvirtual) then
     res:=res+'virtual;';
     if(Ppas_class_function(temptree^.content)^.isoverride) then
     res:=res+'override;';
     if(Ppas_class_function(temptree^.content)^.ext) then
     res:=res+'external;';
     if(Ppas_class_function(temptree^.content)^.funcalias<>'') and (temptree^.count>0) then
     res:=res+'[alias:'+Ppas_class_function(temptree^.content)^.funcalias+'];';
     res:=res+#10;
    end;
   res:=res+convert_pas_tree_to_string(temptree,blankcount+1);
  end
 else if(temptree^.treetype=pas_node_class_tag) then
  begin
   res:=res+generate_blank_string(blankcount);
   case (Ppas_class_tag(temptree^.content)^.tagtype) of
   0:res:=res+'public'#10;
   1:res:=res+'private'#10;
   2:res:=res+'protected'#10;
   end;
  end
 else if(temptree^.treetype=pas_node_const) then
  begin
   res:=res+generate_blank_string(blankcount);
   temptree2:=pas_tree_get_previous_tree(pastree,ii,2);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_const)) then
   res:=res+'const '+Ppas_const(temptree^.content)^.constname+':'
   else res:=res+'     '+Ppas_const(temptree^.content)^.constname+':';
   i:=1; len:=Ppas_const(temptree^.content)^.constcount;
   while(i<=len)do
    begin
     if(i=1) then res:=res+'array[';
     res:=res+c_string_to_string(Ppas_const(temptree^.content)^.constarray[i-1]);
     if(i<len) then res:=res+',' else res:=res+'] of ';
     inc(i);
    end;
   res:=res+Ppas_const(temptree^.content)^.consttype;
   if(Ppas_const(temptree^.content)^.consthavevalue) then
   res:=res+'='+c_string_to_string(Ppas_const(temptree^.content)^.constvalue)+';'#10
   else res:=res+';'#10;
  end
 else if(temptree^.treetype=pas_node_define) then
  begin
   res:=res+generate_blank_string(blankcount)+'{$DEFINE '+
   c_string_to_string(Ppas_define(temptree^.content)^.defname)+'}'#10;
  end
 else if(temptree^.treetype=pas_node_enum) and (pastree^.treetype=pas_node_root) then
  begin
   res:=res+generate_blank_string(blankcount);
   temptree2:=pas_tree_get_previous_tree(pastree,ii,1);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_class)
   and (temptree2^.treetype<>pas_node_record) and (temptree2^.treetype<>pas_node_type)
   and (temptree2^.treetype<>pas_node_enum)) then
   tempstr:='type '+Ppas_enum(temptree^.content)^.enumname+'='
   else tempstr:='     '+Ppas_enum(temptree^.content)^.enumname+'=';
   res:=res+tempstr+'(';
   i:=1; len:=Ppas_enum(temptree^.content)^.enumcount;
   while(i<=len)do
    begin
     res:=res+c_string_to_string(Ppas_enum(temptree^.content)^.enumcontent[i-1]);
     if(i<len) then res:=res+',';
     inc(i);
    end;
   res:=res+');'#10;
  end
 else if(temptree^.treetype=pas_node_expression) then
  begin
   if(Ppas_expression(temptree^.content)^.content.count>0) then
    begin
     res:=res+generate_blank_string(blankcount)+
     c_string_to_string(Ppas_expression(temptree^.content)^.content)+';'#10;
    end;
  end
 else if(temptree^.treetype=pas_node_function) then
  begin
   res:=res+generate_blank_string(blankcount);
   if(Ppas_function(temptree^.content)^.isgeneric) then res:=res+'generic ';
   if(Ppas_function(temptree^.content)^.resulttype='') then
    begin
     res:=res+'procedure '+Ppas_function(temptree^.content)^.funcname;
     if(Ppas_function(temptree^.content)^.isgeneric=true) then
      begin
       for i:=1 to Ppas_function(temptree^.content)^.genericcount do
        begin
         if(i=1) then res:=res+'<';
         res:=res+Ppas_function(temptree^.content)^.generictype[i-1];
         if(i<Ppas_function(temptree^.content)^.genericcount) then tempstr:=tempstr+','
         else res:=res+'>';
        end;
      end;
     i:=1; len:=Ppas_function(temptree^.content)^.paramcount;
     while(i<=len)do
      begin
       if(i=1) then res:=res+'(';
       res:=res+c_string_to_string(Ppas_function(temptree^.content)^.param[i-1]);
       if(i<len) then res:=res+';' else res:=res+')';
       inc(i);
      end;
     res:=res+';';
     if(Ppas_function(temptree^.content)^.abi<>'') then
     res:=res+Ppas_function(temptree^.content)^.abi+';';
     if(Ppas_function(temptree^.content)^.conv<>'') then
     res:=res+Ppas_function(temptree^.content)^.conv+';';
     if(Ppas_function(temptree^.content)^.ext) then
     res:=res+'external'+';';
     if(Ppas_function(temptree^.content)^.funcalias<>'') and (temptree^.count>0) then
     res:=res+'[alias:'+Ppas_function(temptree^.content)^.funcalias+'];';
     res:=res+#10;
    end
   else
    begin
     res:=res+'function '+Ppas_function(temptree^.content)^.funcname;
     if(Ppas_function(temptree^.content)^.isgeneric=true) then
      begin
       for i:=1 to Ppas_function(temptree^.content)^.genericcount do
        begin
         if(i=1) then res:=res+'<';
         res:=res+Ppas_function(temptree^.content)^.generictype[i-1];
         if(i<Ppas_function(temptree^.content)^.genericcount) then tempstr:=tempstr+','
         else res:=res+'>';
        end;
      end;
     i:=1; len:=Ppas_function(temptree^.content)^.paramcount;
     while(i<=len)do
      begin
       if(i=1) then res:=res+'(';
       res:=res+c_string_to_string(Ppas_function(temptree^.content)^.param[i-1]);
       if(i<len) then res:=res+';' else res:=res+')';
       inc(i);
      end;
     res:=res+':'+Ppas_function(temptree^.content)^.resulttype+';';
     if(Ppas_function(temptree^.content)^.abi<>'') then
     res:=res+Ppas_function(temptree^.content)^.abi+';';
     if(Ppas_function(temptree^.content)^.conv<>'') then
     res:=res+Ppas_function(temptree^.content)^.conv+';';
     if(Ppas_function(temptree^.content)^.ext) then
     res:=res+'external'+';';
     if(Ppas_function(temptree^.content)^.funcalias<>'') and (temptree^.count>0) then
     res:=res+'[alias:'+Ppas_function(temptree^.content)^.funcalias+'];';
     res:=res+#10;
    end;
   res:=res+convert_pas_tree_to_string(temptree,blankcount+1);
  end
 else if(temptree^.treetype=pas_node_goto_or_label) then
  begin
   res:=res+generate_blank_string(blankcount);
   if(Ppas_goto_or_label(temptree^.content)^.islabel) then
   res:=res+Ppas_goto_or_label(temptree^.content)^.name+':'#10
   else
   res:=res+'goto '+Ppas_goto_or_label(temptree^.content)^.name+';'#10
  end
 else if(temptree^.treetype=pas_node_ifdef) then
  begin
   temptree2:=pas_tree_get_previous_tree(pastree,ii);
   if(temptree2<>nil) and
   ((temptree2^.treetype=pas_node_uses) or (temptree2^.treetype=pas_node_label_declare)
   or(temptree2^.treetype=pas_node_variable) or (temptree2^.treetype=pas_node_const)) then
    begin
     if(Ppas_ifdef(temptree^.content)^.deftype=0) then
     res:=res+'{$IFDEF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'
     else if(Ppas_ifdef(temptree^.content)^.deftype=1) then
     res:=res+'{$IFNDEF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'
     else if(Ppas_ifdef(temptree^.content)^.deftype=2) then
     res:=res+'{$IF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'
     else if(Ppas_ifdef(temptree^.content)^.deftype=3) then
     res:=res+'{$ELSEIF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'
     else if(Ppas_ifdef(temptree^.content)^.deftype=4) then
     res:=res+'{$ELSE}'
     else if(Ppas_ifdef(temptree^.content)^.deftype=5) then
     res:=res+'{$ENDIF}';
    end
   else
    begin
     res:=res+generate_blank_string(blankcount);
     if(Ppas_ifdef(temptree^.content)^.deftype=0) then
     res:=res+'{$IFDEF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'#10
     else if(Ppas_ifdef(temptree^.content)^.deftype=1) then
     res:=res+'{$IFNDEF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'#10
     else if(Ppas_ifdef(temptree^.content)^.deftype=2) then
     res:=res+'{$IF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'#10
     else if(Ppas_ifdef(temptree^.content)^.deftype=3) then
     res:=res+'{$ELSEIF '+c_string_to_string(Ppas_ifdef(temptree^.content)^.condition)+'}'#10
     else if(Ppas_ifdef(temptree^.content)^.deftype=4) then
     res:=res+'{$ELSE}'#10
     else if(Ppas_ifdef(temptree^.content)^.deftype=5) then
     res:=res+'{$ENDIF}'#10;
    end;
  end
 else if(temptree^.treetype=pas_node_if_statement) then
  begin
   res:=res+generate_blank_string(blankcount);
   temptree3:=pas_tree_get_next_tree(pastree,ii,7);
   i:=1; len:=temptree^.count;
   if(Ppas_if_statement(temptree^.content)^.iftype=0) then
    begin
     res:=res+'if('+c_string_to_string(Ppas_if_statement(temptree^.content)^.condition)+')then'#10;
     res:=res+generate_blank_string(blankcount+1)+'begin'#10;
     res:=res+convert_pas_tree_to_string(temptree,blankcount+2);
     if(temptree3<>nil) and (temptree3^.treetype=pas_node_if_statement)
     and(Ppas_if_statement(temptree3^.content)^.iftype>0)then
     res:=res+generate_blank_string(blankcount+1)+'end'#10
     else
     res:=res+generate_blank_string(blankcount+1)+'end;'#10;
    end
   else if(Ppas_if_statement(temptree^.content)^.iftype=1) then
    begin
     res:=res+'else if('+c_string_to_string(Ppas_if_statement(temptree^.content)^.condition)+')then'#10;
     res:=res+generate_blank_string(blankcount+1)+'begin'#10;
     res:=res+convert_pas_tree_to_string(temptree,blankcount+2);
     if(temptree3<>nil) and (temptree3^.treetype=pas_node_if_statement)
     and(Ppas_if_statement(temptree3^.content)^.iftype>0)then
     res:=res+generate_blank_string(blankcount+1)+'end'#10
     else
     res:=res+generate_blank_string(blankcount+1)+'end;'#10;
    end
   else if(Ppas_if_statement(temptree^.content)^.iftype=2) then
    begin
     res:=res+'else'#10;
     res:=res+generate_blank_string(blankcount+1)+'begin'#10;
     res:=res+convert_pas_tree_to_string(temptree,blankcount+2);
     res:=res+generate_blank_string(blankcount+1)+'end;'#10;
    end;
  end
 else if(temptree^.treetype=pas_node_label_declare) then
  begin
   temptree2:=pas_tree_get_previous_tree(pastree,ii,4);
   temptree3:=pas_tree_get_next_tree(pastree,ii,4);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_label_declare)) then
    begin
     res:=res+generate_blank_string(blankcount);
     res:=res+'label '+Ppas_label_declare(temptree^.content)^.name;
    end
   else
    begin
     res:=res+Ppas_label_declare(temptree^.content)^.name;
    end;
   if(temptree3=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_label_declare)) then
    begin
     res:=res+';';
    end
   else
    begin
     res:=res+',';
    end;
  end
 else if(temptree^.treetype=pas_node_loop_statement) then
  begin
   res:=res+generate_blank_string(blankcount);
   if(Ppas_loop_statement(temptree^.content)^.looptype=1) then
    begin
     res:=res+'while('+c_string_to_string(Ppas_loop_statement(temptree^.content)^.condition)+')do'#10;
     res:=res+generate_blank_string(blankcount+1)+'begin'#10;
     res:=res+convert_pas_tree_to_string(temptree,blankcount+2);
     res:=res+generate_blank_string(blankcount+1)+'end;'#10;
    end
   else if(Ppas_loop_statement(temptree^.content)^.looptype=2) then
    begin
     res:=res+'repeat'#10;
     res:=res+generate_blank_string(blankcount+1)+'begin'#10;
     res:=res+convert_pas_tree_to_string(temptree,blankcount+2);
     res:=res+generate_blank_string(blankcount+1)+'end;'#10;
     res:=res+generate_blank_string(blankcount)+'until('+
     c_string_to_string(Ppas_loop_statement(temptree^.content)^.condition)+');'#10;
    end;
  end
 else if(temptree^.treetype=pas_node_member) and
 ((pastree^.treetype=pas_node_record) or (pastree^.treetype=pas_node_class)) then
  begin
   res:=res+generate_blank_string(blankcount);
   if(pastree^.treetype=pas_node_record) and (Ppas_record(pastree^.content)^.recordunion) then
   res:=res+'case '+IntToStr(ii3)+':('+Ppas_member(temptree^.content)^.memname+':'
   else
   res:=res+Ppas_member(temptree^.content)^.memname+':';
   inc(ii3);
   i:=1; len:=Ppas_member(temptree^.content)^.memarraycount;
   while(i<=len)do
    begin
     if(i=1) then res:=res+'array[';
     res:=res+c_string_to_string(Ppas_member(temptree^.content)^.memarray[i-1]);
     if(i<len) then res:=res+',' else res:=res+'] of ';
     inc(i);
    end;
   if(pastree^.treetype=pas_node_record) and (Ppas_record(pastree^.content)^.recordunion) then
   res:=res+Ppas_member(temptree^.content)^.memtype+';);'#10
   else
   res:=res+Ppas_member(temptree^.content)^.memtype+';'#10;
  end
 else if(temptree^.treetype=pas_node_operator) then
  begin
   res:=res+generate_blank_string(blankcount);
   tempstr:='operator '+Ppas_operator(temptree^.content)^.signname;
   i:=1; len:=Ppas_operator(temptree^.content)^.paramcount;
   while(i<=len)do
    begin
     if(i=1) then tempstr:=tempstr+' (';
     tempstr:=tempstr+c_string_to_string(Ppas_operator(temptree^.content)^.param[i-1]);
     if(i<len) then tempstr:=tempstr+',' else tempstr:=tempstr+') ';
     inc(i);
    end;
   tempstr:=tempstr+Ppas_operator(temptree^.content)^.resultname+':'+
   Ppas_operator(temptree^.content)^.resulttype+';';
   if(Ppas_operator(temptree^.content)^.conv<>'') then
   tempstr:=tempstr+Ppas_operator(temptree^.content)^.conv+';';
   if(Ppas_operator(temptree^.content)^.abi<>'') then
   tempstr:=tempstr+Ppas_operator(temptree^.content)^.abi+';';
   if(Ppas_operator(temptree^.content)^.ext) then
   tempstr:=tempstr+'external;';
   if(Ppas_operator(temptree^.content)^.isoverride) then
   tempstr:=tempstr+'override;';
   if(Ppas_operator(temptree^.content)^.isvirtual) then
   tempstr:=tempstr+'virtual;';
   if(Ppas_operator(temptree^.content)^.isinline) then
   tempstr:=tempstr+'inline;';
   res:=res+tempstr+#10;
   res:=res+convert_pas_tree_to_string(temptree,blankcount);
  end
 else if(temptree^.treetype=pas_node_record) and (pastree^.treetype=pas_node_root) then
  begin
   res:=res+generate_blank_string(blankcount);
   temptree2:=pas_tree_get_previous_tree(pastree,ii,1);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_class)
   and (temptree2^.treetype<>pas_node_record) and (temptree2^.treetype<>pas_node_type)
   and (temptree2^.treetype<>pas_node_enum)) then
   tempstr:='type ' else tempstr:='     ';
   if(Ppas_record(temptree^.content)^.isgeneric=true) then
    begin
     tempstr:=tempstr+'generic '+Ppas_record(temptree^.content)^.recordname;
     for i:=1 to Ppas_record(temptree^.content)^.genericcount do
      begin
       if(i=1) then tempstr:=tempstr+'<';
       tempstr:=tempstr+Ppas_record(temptree^.content)^.generictype[i-1];
       if(i<Ppas_record(temptree^.content)^.genericcount) then tempstr:=tempstr+','
       else tempstr:=tempstr+'>';
      end;
    end
   else tempstr:=tempstr+Ppas_record(temptree^.content)^.recordname;
   tempstr:=tempstr+'=';
   len:=length(tempstr);
   if(Ppas_record(temptree^.content)^.recordtype=0) and
   (Ppas_record(temptree^.content)^.recordunion=false) then
   res:=res+generate_blank_string(blankcount)+tempstr+'record'#10
   else if(Ppas_record(temptree^.content)^.recordtype=1)
   or (Ppas_record(temptree^.content)^.recordunion=true) then
   res:=res+generate_blank_string(blankcount)+tempstr+'packed record'#10
   else if(Ppas_record(temptree^.content)^.recordtype=2) then
   res:=res+generate_blank_string(blankcount)+tempstr+'bitpacked record'#10;
   res:=res+convert_pas_tree_to_string(temptree,blankcount+len);
   res:=res+generate_blank_string(blankcount+len)+'end;'#10;
  end
 else if(temptree^.treetype=pas_node_return) then
  begin
   res:=res+generate_blank_string(blankcount);
   res:=res+'exit('+c_string_to_string(Ppas_return(temptree^.content)^.retvalue)+');'#10;
  end
 else if(temptree^.treetype=pas_node_uses) and (pastree^.treetype=pas_node_root) then
  begin
   temptree2:=pas_tree_get_previous_tree(pastree,ii,4);
   temptree3:=pas_tree_get_next_tree(pastree,ii,4);
   if(temptree2=nil) or ((temptree2<>nil) and (temptree2^.treetype<>pas_node_uses)) then
    begin
     res:=res+generate_blank_string(blankcount);
     res:=res+'uses '+Ppas_label_declare(temptree^.content)^.name;
    end
   else
    begin
     res:=res+Ppas_label_declare(temptree^.content)^.name;
    end;
   if(temptree3=nil) or ((temptree3<>nil) and (temptree3^.treetype<>pas_node_uses)) then
    begin
     res:=res+';'#10;
    end
   else
    begin
     res:=res+',';
    end;
  end
 else if(temptree^.treetype=pas_node_variable) then
  begin
   temptree2:=pas_tree_get_previous_tree(pastree,ii,3);
   temptree3:=pas_tree_get_next_tree(pastree,ii,3);
   if(temptree2<>nil) and (temptree2^.treetype=pas_node_variable) then
    begin
     if(pas_variable_compare(Ppas_variable(temptree^.content),Ppas_variable(temptree2^.content)))then
      begin
       res:=res+','+Ppas_variable(temptree^.content)^.varname;
      end
     else
      begin
       res:=res+'    '+Ppas_variable(temptree^.content)^.varname;
      end;
    end
   else
    begin
     res:=res+generate_blank_string(blankcount);
     res:=res+'var '+Ppas_variable(temptree^.content)^.varname;
    end;
   if(temptree3<>nil) and (temptree3^.treetype=pas_node_variable) then
    begin
     if(pas_variable_compare(Ppas_variable(temptree^.content),Ppas_variable(temptree3^.content)))then
      begin
      end
     else
      begin
       i:=1; len:=Ppas_variable(temptree^.content)^.vararrayc; tempstr:='';
       while(i<=len)do
        begin
         if(i=1) then tempstr:='array[';
         tempstr:=tempstr+c_string_to_string(Ppas_variable(temptree^.content)^.vararrayd[i-1]);
         if(i<len) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
         inc(i);
        end;
       res:=res+':'+tempstr+Ppas_variable(temptree^.content)^.vartype+';';
       if(Ppas_variable(temptree^.content)^.varext) then res:=res+'external;';
       res:=res+#10;
      end;
    end
   else
    begin
     i:=1; len:=Ppas_variable(temptree^.content)^.vararrayc; tempstr:='';
     while(i<=len)do
      begin
       if(i=1) then tempstr:='array[';
       tempstr:=tempstr+c_string_to_string(Ppas_variable(temptree^.content)^.vararrayd[i-1]);
       if(i<len) then tempstr:=tempstr+',' else tempstr:=tempstr+'] of ';
       inc(i);
      end;
     res:=res+':'+tempstr+Ppas_variable(temptree^.content)^.vartype+';';
     if(Ppas_variable(temptree^.content)^.varext) then res:=res+'external;';
     res:=res+#10;
    end;
  end;
 l2:
 if(ii<pastree^.count) then
  begin
   inc(ii); goto l1;
  end;
 if(pastree^.treetype=pas_node_class_function) or (pastree^.treetype=pas_node_function)
 or(pastree^.treetype=pas_node_operator) then
  begin
   if(ii=pastree^.count) then
    begin
     res:=res+generate_blank_string(blankcount)+'end;'#10;
    end;
  end;
 if(pastree^.treetype=pas_node_root) and (species=0) then
  begin
   res:=res+'begin'#10;
   res:=res+'end.'#10;
  end
 else if(pastree^.treetype=pas_node_root) then
  begin
   res:=res+'end.'#10;
  end;
 convert_pas_tree_to_string:=res;
end;

end.

