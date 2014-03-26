@@
expression e;
@@

- clk_prepare(e);
- clk_enable(e);
+ clk_prepare_enable(e);

@@
expression e;
identifier r;
statement S;
@@

- r = clk_prepare(e); if (r) S
- clk_enable(e);
+ r = clk_prepare_enable(e); if (r) S

@@
expression e;
expression r;
@@

- clk_prepare(e);
  r =
- clk_enable
+ clk_prepare_enable
  (e);
  if (r) { ...
- clk_unprepare(e);
  ...
  return ...;
  }

@@
expression e;
expression r;
@@

- clk_prepare(e);
  r =
- clk_enable
+ clk_prepare_enable
  (e);

@@
expression e;
statement S;
@@

- if (clk_prepare(e)) S
- clk_enable(e);
+ if (clk_prepare_enable(e)) S

@@
expression e;
@@

- clk_prepare(e);
  if (
- clk_enable(e)
+ clk_prepare_enable(e)
  ) { ...
- clk_unprepare(e);
  ...
  return ...;
  }

@@
expression e;
statement S;
@@

- clk_prepare(e);
  if (
- clk_enable(e)
+ clk_prepare_enable(e)
  ) S

@@
expression e,r2;
identifier r1;
statement S;
@@

- r1 = clk_prepare(e); if (r1) S
  r2 =
-  clk_enable
+  clk_prepare_enable
   (e);
  if (r2) { ...
- clk_unprepare(e);
  ...
  return ...;
  }

@@
expression e,r2;
identifier r1;
statement S;
@@

- r1 = clk_prepare(e); if (r1) S
  r2 =
-  clk_enable
+  clk_prepare_enable
   (e);

@@
expression e;
statement S1;
@@

- if (clk_prepare(e)) S1
  if (
-  clk_enable
+  clk_prepare_enable
     (e)) { ...
- clk_unprepare(e);
  ...
  return ...;
  }

@@
expression e;
statement S1,S2;
@@

- if (clk_prepare(e)) S1
  if (
-  clk_enable
+  clk_prepare_enable
     (e)) S2

@@
expression e;
@@

- clk_disable(e);
- clk_unprepare(e);
+ clk_disable_unprepare(e);