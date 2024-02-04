#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int n = 10;
    int m = 2;
    int result = 0;

    #pragma omp parallel
    {
        int tid = omp_get_thread_num();
        printf("Starting thread #%d.\n", tid);

        if(tid == 0) {
            for(int j=1; j <= 5; j++) {
                printf("Thread %d is adding %d to result %d. ", tid, j, result);
                result += j;
                printf("Now result is %d.\n", result);
            }
        } else if(tid == 1) {
            for(int k=6; k <= 10; k++) {
                printf("Thread %d is adding %d to result %d. ", tid, k, result);
                result += k;
                printf("Now result is %d.\n", result);
            }
        } else {
            printf("Thread %d does nothing.\n", tid);
        }
    }

    printf("This is from a sequential session.\n");

    return 0;
}