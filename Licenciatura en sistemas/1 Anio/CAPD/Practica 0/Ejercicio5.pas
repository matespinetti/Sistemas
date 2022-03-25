program ejercicio5a;
var
  x, y, c, r : integer;
begin
  write('ingrese el numero de caramelos ');
  read(x);
  write('ingrese el numero de clientes ');
  read(y);
  c:= x div y;
  r:= x mod y;
  write('la cantidad de caramelos que le corresponde a cada cliente es ', c, ' y la cantidad de caramelos que me quedare es ', r);
end.
