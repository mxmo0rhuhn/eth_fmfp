/* not working */
#define EMPTY 0;
#define FULL 1;

bit stone[7];
byte goal;

inline jump(start, end) {
    stone[start] = EMPTY
    stone[end]   = FULL
}

proctype frogm(byte start) {
  do
  :: atomic {
     if
     :: (start - 1) == EMPTY -> 
        jump (start, start+1); 
        printf("F-Frog just jumped from %d to %d", start, start+1);
        start = start-1; 
     :: ( start - 2 ) == EMPTY ->
        jump (start, start-2); 
        printf("F-Frog just jumped from %d to %d", start, start-2);
        start = start-2; 
     :: skip;
     fi
  }
  :: if
     :: start > 4 -> 
        goal ++; 
        printf("F-Frog on %d : I could stay here forever", start);
        break;
     fi
  od
}

proctype frogf(byte start) {
  do
  :: atomic {
    if
     :: ( start + 1 ) == EMPTY -> 
        jump (start, start+1); 
        printf("M-Frog just jumped from %d to %d", start, start+1);
        start = start+1; 
     :: ( start + 2 ) == EMPTY ->
        jump (start, start+2); 
        printf("M-Frog just jumped from %d to %d", start, start+2);
        start = start+2; 
     :: skip;
     fi
  }
  :: if
     :: start < 4 -> 
        goal ++; 
        printf("F-Frog on %d : I could stay here forever", start);
        break;
     fi
  od
}

init {
  atomic {
    run frogf(1);
    run frogf(2);
    run frogf(3);

    run frogm(5);
    run frogm(6);
    run frogm(7);
  }

  timeout;
  
  /* This assertion will fail providing us a valid counterexample */
  assert(goal < 6); 

  printf("All went wrong");
}
