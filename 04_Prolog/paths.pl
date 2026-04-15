path_limited(Start, End, MaxLen, Path) :-
    dfs_limited(Start, End, [Start], RevPath, MaxLen),
    reverse(RevPath, Path).

dfs_limited(End, End, Visited, Visited, _).

dfs_limited(Current, End, Visited, Path, MaxLen) :-
    length(Visited, L),
    L =< MaxLen,
    edge(Current, Next),
    \+ member(Next, Visited),
    dfs_limited(Next, End, [Next|Visited], Path, MaxLen).

test_case :-
    path_limited(a, d, 2, P),
    maplist(writeln, P).

task_6 :-
    once(path_limited(szczecin, przemysl, 20, P)),
    maplist(writeln, P).
