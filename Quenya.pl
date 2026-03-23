% Base de conocimiento con estados y caracteres
grafo(a, b, 'A').
grafo(b, c, n).
grafo(b, d, m).
grafo(c, e, a).
grafo(c, f, c).
grafo(c, g, d).
grafo(d, h, i).
grafo(e, i, r).
grafo(f, j, a).
grafo(h, k, l).
grafo(i, l, y).
grafo(l, z, a).
 
% Estados de aceptacion
final(c).
final(g).
final(j).
final(k).
final(z).
 
verificar(Palabra) :-
    validar(Palabra, a).
 
validar([], Estado) :-
    final(Estado).
 
validar([Letra | Resto], Estado) :-
    grafo(Estado, Siguiente, Letra),
    validar(Resto, Siguiente).
 
amil:-
    write('Amil'), nl,
    write('Resultado: true'), nl,
    verificar(['A', m, i, l]).
 
an:-
    write('An'), nl,
    write('Resultado: true'), nl,
    verificar(['A', n]).
 
anarya:-
    write('Anarya'), nl,
    write('Resultado: true'), nl,
    verificar(['A', n, a, r, y, a]).
 
anca:-
    write('Anca'), nl,
    write('Resultado: true'), nl,
    verificar(['A', n, c, a]).
 
and_word:-
    write('And'), nl,
    write('Resultado: true'), nl,
    verificar(['A', n, d]).
 
amil_false:-
    write('amil'), nl,
    write('Resultado: false'), nl,
    verificar([a, m, i, l]).
 
hello:-
    write('hello'), nl,
    write('Resultado: false'), nl,
    verificar([h, e, l, l, o]).
 
anary:-
    write('Anary'), nl,
    write('Resultado: false'), nl,
    verificar(['A', n, a, r, y]).
 
ami:-
    write('Ami'), nl,
    write('Resultado: false'), nl,
    verificar(['A', m, i]).
 
anc:-
    write('Anc'), nl,
    write('Resultado: false'), nl,
    verificar(['A', n, c]).
