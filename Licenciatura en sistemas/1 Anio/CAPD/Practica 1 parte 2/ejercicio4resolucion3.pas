program ejercicio4bresolucion3;
var
	 num, min1, min2: integer;
begin
	min1 := 30000;
	writeln ('Ingrese un numero');
	read (num);
	while (num <> 0) do
		begin
			if (num <= min1) then
				begin
					min2 := min1;
					min1 := num;
				end
			else
				if (num < min2) then
					min2 := num;
			writeln ('Ingrese un numero');
			read (num);
		end;
	writeln('el numero minimo es ', min2, ' y ', min1 );

end.
		
