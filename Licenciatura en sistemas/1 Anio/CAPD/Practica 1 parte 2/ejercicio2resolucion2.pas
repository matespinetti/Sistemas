program ejercicio2Res2;
var
	num, max, i, max_pos: integer;
begin
	for i:= 1 to 10 do
		begin
			writeln('Ingrese un numero');
			read (num);
			case i of 
				1 : max := num;
				else 
					begin
						if (num >= max) then
							begin
								max := num;
								max_pos:= i;
							end;
					end;
			end;
		end;
		
		
	writeln('El numero mayor leido es', max, ' que esta en la posicion ', max_pos);		
	
END.

