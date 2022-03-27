program ejercicio4;
var
	i, num, min1, min2 : integer;
begin
	for i := 1 to 5 do
		begin
			writeln('Ingrese un numero');
			read (num);
			if ( i = 1) then
				begin
					min1 := num; min2:= num;
				end
			else
				if (num <= min1) then
					begin
						min2 := min1;
						min1 := num;
					end;
		end;
	writeln('Los dos numeros minimos leidos son ', min2, ' y ', min1);
			
end.
