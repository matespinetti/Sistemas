program eercicio5;
var
	num, max, min, suma, i: integer;
begin
    suma := 0;
    i:= 1;
	repeat
	    writeln('Ingrese un numero distinto a 100');
		read(num);
		if (i = 1) then
			begin
				max:= num;
				min:= num;
			end
		else
			if (num < max) then
				min := num
			else
				max:= num;
	  suma := suma + num;
	  i:= i + 1	
	until (num = 100);
	writeln('El numero maximo leido es ', max, ' . El numero minimo leido es ', min, ' .  Y la suma de todos los numeros es ', suma )
end.		
	
