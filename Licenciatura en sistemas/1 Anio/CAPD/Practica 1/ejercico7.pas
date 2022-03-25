program ejercicio9;
var
  num1, total: integer;
  car:char;
begin
    writeln('Ingrese un caracter de suma o resta');
    read (car);
	if ((car = '+') or (car = '-')) then
	  begin
	    writeln('ingrese un numero');
		read(num1);
		total := num1;
		while( num1 <> 0 ) do
			begin
			writeln('ingrese otro numero');
			read(num1);
			if (car = '+') then
				total:= total+ num1
			else
				total:= total - num1;
			
			end;
	    writeln('El resultado de la operacion es de ', total);
	   end
	else
	  writeln('se ha ingresado un caracter que no corresponde');
    
end.
