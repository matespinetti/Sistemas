program ejercicio2;
var
	i, num, mayor: integer;
begin
	for i:= 1 to 10 do
		begin
		    writeln('Ingrese un numero');	
			read(num);
			if (i = 1) then
				mayor:= 10
			else
				if (num > mayor) then
					mayor := num;
		end;
	writeln('El numero mayor leido es ', mayor);
end.
