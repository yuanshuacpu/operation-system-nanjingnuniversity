#include <stdint.h>
#include <stdio.h>

int tmult_ok(int x, int y) {
  int64_t ret = (int64_t)x * (int64_t)y;
  printf("result = %8lx\n", ret);
  if (ret > INT32_MAX || ret < INT32_MIN) {
    return 0;
  } else {
    return 1;
  }
}

int main() {
  int ret = tmult_ok(-(INT32_MIN + 1), INT32_MIN);

  printf("tmult_ok = %d\n", ret);
  return 0;
}