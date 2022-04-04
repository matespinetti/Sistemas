program programapromedios;
var
	prom, max : real;
begin
	read (prom);
	max := prom;
	while (prom <> 0) do
		begin
			if (prom >= max) then
				max := prom;
			read (prom)
		end;
	writeln('El promedio maximo es ', max);
	
end.
