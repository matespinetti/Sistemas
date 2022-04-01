program ejercicio2Resolucion3;
var
	num,max,i : integer;
begin
	max:= -30000;
	for i:= 1 to 10 do
		begin
			writeln(' Ingrese un numero ');
			read (num);
			if (num >= max) then
				max := num;
		end;
	writeln('El numero maximo es ', max);

end.
