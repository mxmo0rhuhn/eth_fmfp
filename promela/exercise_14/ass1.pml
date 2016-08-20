/*
 * Assignment 1 (Leader Election)
 * Consider the following leader election protocol. For
 * n ≥ 1, the processes P 1 , . . . , P n are located in a
 * ring topology, where each process is connected by an
 * unidirectional channel to its neighbor as outlined in
 * the figure to the right.
 *
 * To distinguish the processes, each process has a unique 
 * identifier id with 1 ≤ id ≤ n. The aim is to elect the 
 * process with the highest identifier as the leader within 
 * the ring. Therefore, each process executes the following 
 * algorithm:
 *
 * send message id
 * loop
 *   receive message m
 *   if m = id then stop
 *   if m > id then send message m
 * end loop
 * 
 * (a) Model this leader election protocol for n processes in Promela.
 * Hint: Use an array of n channels of length 1, i.e.,
 */

#define N 5 /* number of processes in the ring */
#define L 1 /* length of a channel */
chan c[N] = [L] of { byte };

/*
 * Model a process in Promela as:
 */
proctype pnode(chan _in, out; byte id) {
  printf("Hello process %d is awake.\n", id);
  
  byte leader;

/* algorithm for electing the leader ... */
  out ! id;
  _in ? leader;
  do 
    :: leader == id -> break;
    :: leader > id -> out ! leader ; _in ? leader;
    :: _in ? leader;
  od
/* By Design this doesn't terminate */

  printf("Process %d decided on %d .\n", id, leader);
}

init {
  printf("Init started\n"); 

  atomic {
    run pnode(c[4], c[0], 0); 
    run pnode(c[0], c[1], 1); 
    run pnode(c[1], c[2], 2); 
    run pnode(c[2], c[3], 3); 
    run pnode(c[3], c[4], 4); 
  }

  printf("Init finished\n"); 
}
