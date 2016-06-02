/*
 * The problem of the dining philosophers illustrates common issues for concurrent 
 * programs. N philosophers sit around a circular table. Each philosopher spends 
 * her/his life thinking and eating. In the center of the table is a large 
 * platter of spaghetti. Because the spaghetti are long and tangled a philosopher 
 * must use two forks to eat them. Since the philosophers can only afford N forks, 
 * a single fork is placed between each pair of philosophers, which they have to 
 * share. Each philosopher can only reach the forks to her/his immediate left and 
 * right with her/his left and right hand, respectively.  
 *
 * (b) The deadlock can be avoided when each philosopher behaves more 
 *     deterministically to pick up the forks (not all philosophers have to behave 
 *     the same). Model your solution in Promela and use Spin to check that it is 
 *     indeed deadlock free. Is your model also starvation free (i.e., each 
 *     philosopher will eventually eat)? (You will learn how to express and check 
 *     this property by next week).
 */

#define N 5

bit fork[N];

init {
  int i = 0;
  do
  :: i < N -> atomic { 
                printf ("Philosopher %d takes a seat.\n", i);
                run philosopher(i); 
                i = i + 1
              }
  :: i == N -> break
  od
}


#define leftFork(p) p % N
#define rightFork(p) (p + 1) % N


inline pickUpLeft(p) {
  /* ... complete ... */
}

inline pickUpRight(p) {
  /* ... complete ... */
}

inline putDownLeft(p) {
  /* ... complete ... */
}

inline putDownRight(p) {
  /* ... complete ... */
}


inline think(p) {
  printf("Philosopher %d is thinking.\n", p)
}
	
inline eat(p) {
  printf("Philosopher %d is eating.\n", p)
}


proctype philosopher(int p) {
  do
  :: think(p) /* philosopher decides to think */
  :: /* philosopher decides to eat */
     /* pick up forks */
     /* ... complete ... */

     eat(p);  /* eventually eat some spaghetti from the platter */

     /* put down forks */
     /* ... complete ... */
  od
}


