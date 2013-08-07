int main() {
  int ret;
  ret = -1;
  while(y) {
    if (x) return ret;
    ret = foo();
    if (ret < 0) return ret;
  }
}
