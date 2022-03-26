program ejercicio2a;
var
	i, num, mayor, posicion: integer;
begin
	for i:= 1 to 10 do
		begin
		    writeln('Ingrese un numero');	
			read(num);
			if (i = 1) then
			begin
				mayor:= num;
				posicion:= 1
			end	
			else
				if (num > mayor) then
				begin
					mayor := num;
					posicion:= i;
			    end
		end;
	writeln('El numero mayor leido es ', mayor, 'que esta en la posicion ', posicion);
end.

