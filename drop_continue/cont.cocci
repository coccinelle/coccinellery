@@
statement S;
@@

while (...) {
  ...
  if (...)
  {
+   DROP_ME();
    S
-   continue;
  }
}

@@
statement S;
@@

for (...;...;...) {
  ...
  if (...)
  {
+   DROP_ME();
    S
-   continue;
  }
}

@@
statement S;
@@
  if (...)
- {
-   DROP_ME();
    S
- }

@@
@@

while (...) {
  ...
  if (...) {
    ...
-   continue;
  }
}

@@
@@

for (...;...;...) {
  ...
  if (...) {
    ...
-   continue;
  }
}
