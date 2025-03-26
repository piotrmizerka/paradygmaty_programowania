% Base case: factorial of 0 is 1
factorial(0, 1).

% Recursive case: N > 0
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

