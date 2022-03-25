program ejercicio3;
var
  Num1, Num2, Num3: integer;
begin
  read(Num1);
  read(Num2);
  read(Num3);
  if ((Num1>Num2) and (Num1>Num3) and (Num2>Num3)) then
    write(Num1, Num2, Num3);
  if ((Num1>Num1) and (Num1>Num3) and (Num3>Num2)) then
    write(Num1, Num3, Num2);
  if ((Num2>Num1) and (Num2>Num3) and (Num1>Num3)) then
    write(Num2, Num1, Num3);
  if ((Num2>Num1) and (Num2>Num3) and (Num3>Num1)) then
    write(Num2, Num3, Num1);
  if ((Num3>Num1) and (Num3>Num2) and (Num1>Num2)) then
    write(Num3, Num1, Num2);
  if ((Num3>Num1) and (Num3>Num2) and (Num2>Num1)) then
    write(Num3, Num2, Num1);
  if ((Num1>Num2) and (Num2 = Num3)) then
    write(Num1, Num2, Num3);
  if ((Num1<Num2) and (Num2 = Num3)) then
    write(Num2, Num3, Num1);
    
end.
