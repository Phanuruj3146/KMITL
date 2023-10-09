#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/mman.h>

int main() {
    const int SIZE = 8192;
    const char *name = "OS";

    int shm_fd;
    void *ptr;

    shm_fd = shm_open(name, O_RDONLY, 0666);
    ptr = mmap(0, SIZE, PROT_READ, MAP_SHARED, shm_fd, 0);

    if (strcmp((char *)ptr, "Error") == 0) {
        printf("Error: Invalid argument.\n");
    } else {
        printf("The result is %s\n", (char *)ptr);
    }

    shm_unlink(name);

    return 0;
}
