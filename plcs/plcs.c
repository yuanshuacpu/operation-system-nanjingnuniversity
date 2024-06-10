#include "thread.h"
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

unsigned short dp[10000][10000] = {0};
char A[10000];
char B[10000];

unsigned short Dp_Single(unsigned M, unsigned N) {
  for (int i = 1; i <= N; i++) {
    for (int j = 1; j <= M; j++) {
      // Always try to make DP code more readable
      int skip_a = dp[i - 1][j];
      int skip_b = dp[i][j - 1];
      int take_both = dp[i - 1][j - 1] + (A[i - 1] == B[j - 1]);
      //   dp[i][j] = 0;
      if (skip_a > dp[i][j]) {
        dp[i][j] = skip_a;
      }
      if (skip_b > dp[i][j]) {
        dp[i][j] = skip_b;
      }
      if (take_both > dp[i][j]) {
        dp[i][j] = take_both;
      }
    }
  }
  return dp[N][M];
}

extern int optind, opterr, optopt;
extern char *optarg;

int main(int argc, char *argv[]) {

  if (argc < 2) {
    fprintf(stderr, "Usage: %s [-T number]\n", argv[0]);
    exit(0);
  }

  int opt;
  int thread_num = 1;
  strcpy(A, "ABDC");
  strcpy(B, "ABC");
  while ((opt = getopt(argc, argv, "T:")) != -1) {
    switch (opt) {
    case 'T': {
      thread_num = atoi(optarg);
      break;
    }
    case '?': {
      fprintf(stderr, "Usage: %s [-T number]\n", argv[0]);
      exit(0);
      break;
    }
    }
  }
  if (thread_num == 1) {
    unsigned short ret = Dp_Single(3, 4);
    printf("result= %d\n", ret);
  }
}