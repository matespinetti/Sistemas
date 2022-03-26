program ejercicio4;
var
	num, min1, min2, i : integer;
begin
	for i:= 1 to 6 do
		begin
		    writeln('Escribe un numero');
			read(num);
			if (i = 1) then
			begin
				min1:= num;
				min2:= num;
			end
			else
			begin
				if (num < min1) then
					min1:= num;
			    if ((num > min1) and (num < min2)) then
					min2:= num;
			end    
		end;
	writeln('Los numeros minimos leidos son ', min2, ' y ', min1)
end.
