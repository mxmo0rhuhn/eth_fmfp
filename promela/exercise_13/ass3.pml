/*
 * Assignment 3
 * 
 * Implement Dekker’s algorithm – which is said to be the first known algorithm that 
 * (really) solves the mutual exclusion problem for two concurrent processes – in 
 * Promela and verify exclusivity using Spin.
 *
 * In Dekker’s algorithm, the critical section is protected by two bit-valued flags. 
 * The first one is actually a pair that is used to signal that the first and second, 
 * respectively, process is interested in entering the critical section. The other 
 * flag alternates and is used to decide which process may enter the critical section 
 * in case both are interested.
 *
 * The algorithm guarantees mutual exclusion to the critical section as well as 
 * deadlock and starvation freedom. Instead of relying on low-level test-and-set 
 * instructions or interrupts, or on signal/wait thread operations, each process 
 * uses busy waiting to detect when it may enter the critical section. This makes the 
 * algorithm highly portable between different languages and hardware architectures, 
 * but also less efficient in case of lots of contention.
 * 
 * Hint: In order to verify the exclusivity of the critical section, let mutex count 
 * the number of processes that are currently in the critical section. Then, use the 
 * following supervisor process (also known as monitor or watchdog ) to assert 
 * exclusivity:
 */

bool interested[2];

bit decide;
byte mutex;

inline critical(me) {
  printf("Proceess %d entering critical section\n", me);
  mutex = mutex + 1;
  skip;
  mutex = mutex - 1;
  printf("Proceess %d leaving critical section\n", me);
}

proctype watchdog() {
  printf("Watchdog started\n"); 
  assert(mutex < 2);
  printf("Watchdog finished\n"); 
}

proctype proc(bit me; bit other) {
  printf("Proceess %d started\n", me ); 
  interested[me] = 1;

  do
    :: interested[other] == 1 && decide != me -> interested[me] = 0; 
      printf("Proceess %d waiting for decide bit (is currently %d ) \n", me, decide); 
      decide == me ; 
      printf("Proceess %d done waiting for decide bit (is now %d ) \n", me, decide); 
      interested[me] = 1;
    :: interested[other] != 1 -> printf("Proceess %d no other process interestted. \n", me ); break;
  od

  critical(me);

  decide = other;
  interested[me] = 0;
  printf("Proceess %d finished\n", me ); 
}

init {
  printf("Init started\n"); 
  run watchdog();

  if 
    :: decide = 0;
    :: decide = 1;
  fi

  run proc(0,1);
  run proc(1,0);

  /* wait for termination */
  printf("Init finished\n"); 
}
