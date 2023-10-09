#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/shm.h>
#include <sys/stat.h>
#include <sys/mman.h>

int main(int argc, char *argv[]) {
    const int SIZE = 8192;
    const char *name = "OS";

    int n;
    char temp[20];
    int sum = 0;

    if (argc < 2) {
        return -1;
    }

    n = atoi(argv[1]);

    if (n <= 0) {
        sprintf(temp, "%s", "Error");
    } else {
        int i;
        for (i = 1; i <= n; i++) {
            sum += i;
        }
        sprintf(temp, "%d", sum);
    }

    int shm_fd;
    void *ptr;

    shm_fd = shm_open(name, O_CREAT | O_RDWR, 0666);
    ftruncate(shm_fd, SIZE);
    ptr = mmap(0, SIZE, PROT_WRITE, MAP_SHARED, shm_fd, 0);

    sprintf(ptr, "%s", temp);

    return 0;
}
