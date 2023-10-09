#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
    // Create a child process      
    int pid = fork();
  
    if (pid > 0) {
        printf("Parent PID is %d.\n", getpid());
        printf("My child PID is %d.\n", pid);
        sleep(20);
    }
  
    else if (pid == 0) {
        sleep(30);
        printf("I'm child process.\n");
    }
  
    return 0;
}