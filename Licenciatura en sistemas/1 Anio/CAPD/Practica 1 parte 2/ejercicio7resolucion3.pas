program ejercicio7;
var
	nombre, p1, p2, u1, u2: string;
	tiempo, max1, max2, min1, min2 : real;
	i : integer;
begin
	min1 := 30000; 
	max1 := -1; max2 := -1;
	for i:= 1 to 5 do 
		begin
			writeln('Ingrese el nombre');
			readln (nombre);
			writeln('Ingrese el tiempo');
			readln (tiempo);
			if (tiempo <= min1) then
				begin
					min2 := min1;
					p2 := p1;
					min1 := tiempo;
					p1 := nombre;
			    end
			else if (tiempo <= min2) then
					begin					
						min2 := tiempo;
						p2 := nombre;
					end;
				
			
			if (tiempo >= max1) then
				begin
					max2 := max1;
					u2 := u1;
					max1 := tiempo;
					u1 := nombre;
				end
				else if (tiempo > max2) then
						begin
							max2 := tiempo;
							u2 := nombre;
						end;
			end;
	writeln('El nombre de los corredores en primer y seghundo puesto es ', p1, ' y ', p2);
	writeln('El nombre de los corredores en ultimos puestos es ', u2, ' y ', u1);

end.						
						
	
	
