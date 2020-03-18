# life
An implementation of Conways Game of Life in q.

This can be run with
```
q life.q
```
for default settings. You can set either the height or width yourself with
```
q life.q -height 20 -width 20
```
or use
```
q life.q -term
```
to fit it to the size of the terminal. To change the radnom seed, use
```
q life.q -seed n
```
where `n` is a non-negative integer.
