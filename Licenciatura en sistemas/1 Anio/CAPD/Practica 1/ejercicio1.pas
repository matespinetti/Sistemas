
program ejercicio1;
var
  Num1, Num2: integer;
begin
  write('Inserte un numero');
  read(Num1);
  write('Inserte otro numero');
  read(Num2);
  if (Num1 > Num2) then
    write('El primer numero es mayor que el segundo')
  else if (Num1<Num2) then
    write('El segundo numero es mayor que el primero')
  else 
    write('Los numeros son iguales');
end.
