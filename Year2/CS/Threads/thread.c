#include <stdio.h>
#include <pthread.h>

// struct to hold the thread information
struct thread_info {
    int id; // thread id
    int lower; // lower limit
    int upper; // upper limit
    int *sum; // shared variable to store the result
    pthread_mutex_t *lock; // mutex lock to prevent race conditions
};

// thread function to compute the sum of numbers between lower and upper
void *runner(void *param) {
    struct thread_info *tinfo = (struct thread_info *) param;

    int sum = 0;
    for (int i = tinfo->lower; i <= tinfo->upper; i++) {
        sum += i;
    }

    // store the result in the shared variable
    pthread_mutex_lock(tinfo->lock);
    *(tinfo->sum) += sum;
    pthread_mutex_unlock(tinfo->lock);

    pthread_exit(NULL);
}

int main(int argc, char *argv[]) {
    int m, n;
    pthread_mutex_t lock;
    pthread_t threads[100];
    struct thread_info tinfo[100];
    int sum = 0;

    // get the inputs from the command line
    if (argc != 3) {
        printf("Usage: ./a.out <number of threads> <upper limit>\n");
        return -1;
    }

    m = atoi(argv[1]);
    n = atoi(argv[2]);

    // initialize the mutex lock
    pthread_mutex_init(&lock, NULL);

    // calculate the lower and upper limits for each thread
    int step = n / m;
    int remainder = n % m;
    int lower = 1, upper = 0;

    for (int i = 0; i < m; i++) {
        if (i < remainder) {
            upper = lower + step;
        } else {
            upper = lower + step - 1;
        }

        tinfo[i].id = i;
        tinfo[i].lower = lower;
        tinfo[i].upper = upper;
        tinfo[i].sum = &sum;
        tinfo[i].lock = &lock;

        pthread_create(&threads[i], NULL, runner, &tinfo[i]);

        lower = upper + 1;
    }

    // join the threads
    for (int i = 0; i < m; i++) {
        pthread_join(threads[i], NULL);
    }

    printf("The sum of 1 to %d is %d\n", n, sum);

    // destroy the mutex lock
    pthread_mutex_destroy(&lock);

    return 0;
}
