#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <semaphore.h>
#include <unistd.h>

#define NUM_PHILOSOPHERS 5
#define NUM_FORKS 5

pthread_t philosophers[NUM_PHILOSOPHERS];
sem_t forks[NUM_FORKS];

void *philosopher(void *arg) {
    int id = *(int *)arg;
    int left_fork = id;
    int right_fork = (id + 1) % NUM_FORKS;
    
    while (1) {
        printf("Philosopher %d is thinking.\n", id);
        // think for random time
        sleep(rand() % 3); 
        
        printf("Philosopher %d is hungry.\n", id);
        
        sem_wait(&forks[left_fork]);
        printf("Philosopher %d picked up fork %d.\n", id, left_fork);
        
        sem_wait(&forks[right_fork]);
        printf("Philosopher %d picked up fork %d.\n", id, right_fork);
        
        printf("Philosopher %d is eating.\n", id);
        // eat for random time
        sleep(rand() % 3);  
        
        sem_post(&forks[left_fork]);
        printf("Philosopher %d released fork %d.\n", id, left_fork);
        sem_post(&forks[right_fork]);
        printf("Philosopher %d released fork %d.\n", id, right_fork);
    }
}

int main() {
    int i;
    int ids[NUM_PHILOSOPHERS];
    
    for (i = 0; i < NUM_FORKS; i++) {
        sem_init(&forks[i], 0, 1);
    }
    
    for (i = 0; i < NUM_PHILOSOPHERS; i++) {
        ids[i] = i;
        pthread_create(&philosophers[i], NULL, philosopher, &ids[i]);
    }
    
    for (i = 0; i < NUM_PHILOSOPHERS; i++) {
        pthread_join(philosophers[i], NULL);
    }
    
    return 0;
}
