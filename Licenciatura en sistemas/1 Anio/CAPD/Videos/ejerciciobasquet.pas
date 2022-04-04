program ejerciciobasquet;
var
	jugador, dni, max1_dni, max2_dni : integer;
	altura, max1, max2 : real;
begin
	max1 := -1; 
	for jugador := 1 to 5 do
		begin
			writeln('Ingrese la altura del jugador');
			readln(altura);
			writeln('Ingrese el dni del jugador');
			readln(dni);
			if (altura >= max1) then
				begin
					max2 := max1;
					max2_dni := max1_dni;
					max1 := altura;
					max1_dni := dni;
				end
			else
				if (altura >= max2) then
					begin
						max2:= altura;
						max2_dni:= dni;
					end;
			end;
	writeln('Los dni de los dos jugadores mas altos son ', max1_dni, ' y ', max2_dni);
	
end.
		
						
