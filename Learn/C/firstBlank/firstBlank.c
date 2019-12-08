#include <stdio.h>

#define MAXLINE 1000

void firstBlank(char* input, char output[]);

int
main()
{
  char fword[MAXLINE];
  char tst[] = "This is test example";

  firstBlank(tst, fword);

  printf("%s\n", tst);
  printf("%s\n", fword);

  return 0;
}

void
firstBlank(char* input, char output[])
{
  int i;

  for (i = 0; i < MAXLINE -1 && *(input+i)!= ' '; ++i){
    output[i] = input[i];
  }

  output[i] = '\0';
}
