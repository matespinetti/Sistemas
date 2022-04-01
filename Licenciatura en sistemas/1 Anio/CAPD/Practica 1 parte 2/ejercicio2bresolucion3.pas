program ejercicio2bresolucion3;
var
	num, max, pos_max, i : integer;
begin
	max:= -30000;
	for i := 1 to 10 do
		begin
			writeln('Ingrese un numero');
			read (num);
			if (num >= max) then
				begin
					max := num;
					pos_max := i;
				end
		end;
	writeln(' El numero maximo es ', max, 'que esta en la posicion ', pos_max);

end.
