@@ expression E; constant C; @@
(
  !E & !C
|
- !E & C
+ !(E & C)
)
