program ejercicioAlturas;
var
	altura, alt1, alt2, alt3, alt4: integer;
begin
	alt1:= 0; alt2:= 0; alt3:= 0; alt4:= 0;
	writeln('Ingrese una altura');
	read (altura);
	while (altura <> 1.59) do 
		begin
			case altura of
				100 .. 130 :  alt1:= alt1 + 1;
				131 .. 150 : alt2:= alt2 + 1; 
				
			end;
			writeln('Ingrese una altura');
			read (altura);
		end;
	writeln('La cantidad de personas que miden entre 1.00 y 1.30 es de, ', alt1);
	writeln('La cantidad de personas que miden entre 1.31 y 1.50 es de, ', alt2);
	writeln('La cantidad de personas que miden entre 1.51 y 1.89 es de, ', alt3);
	writeln('La cantidad de personas que miden mas de 1.89 es de,  ', alt4);
			
			
end.
			
		    
