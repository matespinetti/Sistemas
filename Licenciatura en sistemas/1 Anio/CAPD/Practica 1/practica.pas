program ejercicio3;
var
  minimo, maximo, medio, a, b, c: integer;
begin
  read(a);
  maximo:= a;
  minimo :=a;
  medio:= a;
  
  read(b);
  
  if (a>b) then
    minimo:=b
  else
    maximo:=b;
    
  read(c);
  if (c >= maximo) then
  begin
    medio:= maximo;
    maximo:= c;
  end  
  else if((c >= minimo) and (c < maximo)) then
    medio:= c
  else
    begin
    medio:= minimo;
    minimo := c;
    end;
  
    
  
 write(maximo, medio, minimo);
  
  

end.
