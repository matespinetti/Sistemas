program ejercicio4;
const
  pi = 3.14;
var
  D, R, A, P: real;
 
begin
  read(D);
  R:= D / 2;
  A:= pi * R * R;
  P:= D * pi;
  writeln('El radio es ', R:1:2, ' ,el area es ', A:1:2, ' y el perimetro es ', P:1:2);
end.


