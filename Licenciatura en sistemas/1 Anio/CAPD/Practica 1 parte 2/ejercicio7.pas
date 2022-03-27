program ejercicio7;
var
	auto : integer;
	tiempo, max1, max2, min1, min2: real;
	nombre, max2_nombre, max1_nombre, min1_nombre, min2_nombre : string;
begin
	for auto := 1 to 5 do 
		begin	
			writeln('Ingrese el nombre del piloto');
			readln (nombre);
			writeln('Ingrese el tiempo total que le tomo finalizar la carrera');
			readln (tiempo);
			if (auto = 1) then 
				begin
					min1:= tiempo; min2:= tiempo; max1:= tiempo; max2:= tiempo;
					max1_nombre:= nombre; min1_nombre:=nombre; min2_nombre:= nombre; max2_nombre:= nombre;
					
				end;
			if ((tiempo >= max2) and ( auto = 4)) then
				begin
					min2:= max2;
					min2_nombre:= max2_nombre;
				end;
			
				
			if (tiempo >= max1) then
				begin
					max2:= max1;
					max2_nombre:= max1_nombre;
					max1:= tiempo;
					max1_nombre:= nombre;
				end;
				
			if ((tiempo >= max2) and (tiempo < max1)) then
				begin
					max2:= tiempo;
					max2_nombre:= nombre;
				end;
				
			if ((tiempo <= min2) and ( auto = 4)) then
				begin
					max2:= min2;
					max2_nombre:= min2_nombre;
				end;
					
			if (tiempo <= min1) then
				begin
					min2:= min1;
					min2_nombre:= min1_nombre;
					min1:= tiempo;
					min1_nombre:= nombre;
				end;
				
			if ((tiempo > min1) and (tiempo <= min2)) then
				begin
					min2:= tiempo;
					min2_nombre:= nombre;
				end;
			end;
			
		writeln('Los nombres de los pilotos del 1er y 2do puesto son ', min1_nombre, ' y ', min2_nombre );
		writeln('Los nombres de los pilotos que finalizaron ultimos son ', max2_nombre, ' y ', max1_nombre);



end.
