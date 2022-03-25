program ejercicio5b;
const
  valorCaramelo = 1.60;
var
  x, y, c, r: integer;
  dinero: real;
begin
  write('ingrese el numero de caramelos ');
  read(x);
  write('ingrese el numero de clientes ');
  read(y);
  c:= x div y;
  dinero:= c * valorCaramelo;
  write('el dinero a cobrar es ' , dinero:1:2, '$');
end.


