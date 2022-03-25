program ejercicio4;
var
  a, b, contador: real;
begin
  contador:= 1;
  read(a);
  repeat
    read(b);
    contador:= contador + 1;
  until ((b =2*a) or (contador >10));
  
  if not(b= 2*a) then
    write('No se ha ingresado el doble de A');
end.
