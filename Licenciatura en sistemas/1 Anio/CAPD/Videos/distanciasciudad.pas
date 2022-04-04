program codigociudad;
var
	distancia, codigo, max, min, max_cod, min_cod, i : integer;
begin
	max:= -1; min:= 30000;
	for i := 1 to 4 do 
		begin
			writeln ('Ingrese la distancia de la ciudad');
			readln (distancia);
			writeln('Ingrese el codigo de la ciudad');
			readln (codigo);
			if (distancia > max) then
				begin
					max := distancia;
					max_cod:= codigo;
				end;
			if (distancia < min) then
				begin
					min := distancia;
					min_cod:= codigo;
				end;
		end;
	writeln('El codigo de ciudad mas cercano es ', min_cod, ' y el codigo de ciudad mas lejano es ', max_cod);
				
end.
