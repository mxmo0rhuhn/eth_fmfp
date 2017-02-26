1)
fibLouis 4 =  
(fibLouis (4-1) + fibLouis (4-2)) =  
(fibLouis 3 + fibLouis (4-2)) =  
((fibLouis (3 - 1) + fibLouis (3 - 2)) + fibLouis (4-2)) = 
((fibLouis (2) + fibLouis (3 - 2)) + fibLouis (4-2)) =  
(((fibLouis (2 - 1) + fibLouis (2 - 2)) + fibLouis (3 - 2)) + fibLouis (4-2)) =  
(((fibLouis (1) + fibLouis (2 - 2)) + fibLouis (3 - 2)) + fibLouis (4-2)) =  
(((1 + fibLouis (2 - 2)) + fibLouis (3 - 2)) + fibLouis (4-2)) =  
(((1 + fibLouis (0)) + fibLouis (3 - 2)) + fibLouis (4-2)) =  
(((1 + 0) + fibLouis (3 - 2)) + fibLouis (4-2)) =  
((1 + fibLouis (3 - 2)) + fibLouis (4-2)) =  
((1 + fibLouis (1)) + fibLouis (4-2)) =  
((1 + 1) + fibLouis (4-2)) =  
(2 + fibLouis (4-2)) =  
(2 + fibLouis (2)) =  
(2 + (fibLouis (2-1) + fibLouis (2-2))) =  
(2 + (fibLouis (1) + fibLouis (2 - 2))) = 
(2 + (1 + fibLouis (2 - 2))) =  
(2 + (1 + fibLouis (0))) =  
(2 + (1 + 0)) =  
(2 + 1) =  3

---------------------------------------------------
--2) 
fibEva 4 =  
fst (aux 4) =  
fst (next (aux (4 - 1))) =
fst (next (aux (3))) =
fst (next (next (aux (3-1)))) =
fst (next (next (aux (2)))) =
fst (next (next (next (aux (2 - 1))))) =
fst (next (next (next (aux (1))))) =
fst (next (next (next (next (aux (1-1)))))) =
fst (next (next (next (next (aux (0)))))) =
fst (next (next (next (next (0, 1))))) =
fst (next (next (next (1, 0 + 1 )))) =
fst (next (next (0 + 1, 1 + (0 + 1)))) =
fst (next ((1 + (0 + 1, (0 + 1) + (1 + (0 + 1)))))) =
fst ((0 + 1) + (1 + (0 + 1)), (1 + (0 + 1 + (0 + 1) + (1 + (0 + 1))))) =
(0 + 1) + (1 + (0 + 1)) =
1 + (1 + (0 + 1)) =
1 + (1 + 1) =
1 + 2 = 3
