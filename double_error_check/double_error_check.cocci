@f@
expression E;
identifier pr;
expression list es;
@@
for(...;...;...){
... when != break;
    when != continue;
-	if (E) break;
+	if (E){
+		pr(es);
+		break;
+	}
... when != break;
    when != continue;
}
- if(E) pr(es);

@w@
expression E;
identifier pr;
expression list es;
@@
while(...){
... when != break;
    when != continue;
-	if (E) break;
+	if (E){
+		pr(es);
+		break;
+	}
... when != break;
    when != continue;
}
- if(E) pr(es);
