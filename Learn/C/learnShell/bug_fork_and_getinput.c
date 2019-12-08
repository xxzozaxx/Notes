#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <readline/readline.h>
#include <unistd.h>
#include <sys/wait.h>

char**
get_input(char* input)
{
  char** command = malloc(8 * sizeof(char*));
  char* separator = " ";
  char* parsed;
  int index = 0;

  parsed = strtok(input, separator);

  while(parsed != NULL) {
      command[index] = parsed;
      index++;
      parsed = strtok(NULL, separator);
  }

  command[index] = NULL;
  return command;
}

int
main()
{
  pid_t child_pid;
  pid_t wait_result;
  int stat_loc;

  child_pid = fork();

  // The child process
  if (child_pid == 0) {
    printf("### Child ###\nCurrent PID: %d and Child PID: %d\n",
           getpid(), child_pid);
    //sleep(1);
  } else {
    wait_result = waitpid(child_pid, &stat_loc, WUNTRACED);
    printf("### Parent ###\nCurrent PID: %d and Child PID: %d\n",
           getpid(), child_pid);
  }

  /* Fork lesson END here */

  //char *argv[] = {"ls", "-l", "-h", "-a", NULL};
  char** argv = get_input("ls -l -h -a");
  execvp(argv[0], argv);

  return 0;
}
