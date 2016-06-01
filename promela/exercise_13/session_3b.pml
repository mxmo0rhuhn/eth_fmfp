init {
  int x;

  if
  :: x = 1 
  :: x = 2; x = x + 2 
  fi;

  assert (x ==1 || x == 4);
  printf("Value of x is %d\n", x);
}
