@r exists@
expression E,E1;
statement S;
position p1,p2,p3;
@@

E =@p1 \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != E = E1
if (E == NULL || ...) S
... when != E = E1
if@p2 (...) {
 ... when != kfree(E)
 }
... when != E = E1
kfree@p3(E);

@ok@
position r.p2;
expression r.E;
int E1 != 0;
@@

if@p2 (...) { ... when != kfree(E)
                  when strict
return E1; }

@ script:python depends on ok @
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

save_file_name = p2[0].file
print "* TODO [[view:%s::face=ovl-face1::linb=%s::colb=%s::cole=%s][kfree:
%s::%s]]" % (save_file_name,p2[0].line,p2[0].column,p2[0].column_end,save_file_name,p2[0].line)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][before]]" % (save_file_name,p1[0].line,p1[0].column,p1[0].column_end)
print "[[view:%s::face=ovl-face2::linb=%s::colb=%s::cole=%s][after]]" % (save_file_name,p3[0].line,p3[0].column,p3[0].column_end)
