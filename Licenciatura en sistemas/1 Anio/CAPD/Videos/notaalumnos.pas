program notasalumnos;
type
	notaRange = -1..10;

var
	alumno, maxDia, dia : integer;
	nota, maxNota : notaRange;
begin
	
	for alumno := 1 to 30 do
		begin
				maxNota:= -1;
				for dia:= 1 to 5 do
					begin
						writeln('Ingrese la nota');
						read (nota);
						if (nota >= maxNota) then
							begin
								maxNota := nota;
								maxDia:= dia;
							end;
					
					end;
				case maxDia of 
					1: writeln('El dia que el alumno obtuvo la mayor nota es el lunes');
					2: writeln('El dia que el alumno obtuvo la mayor nota es el martes');
					3: writeln('El dia que el alumno obtuvo la mayor nota es el miercoles');
					4: writeln('El dia que el alumno obtuvo la mayor nota es el jueves');
					5: writeln('El dia que el alumno obtuvo la mayor nota es el viernes');
				end;
		end;
end.
			
	


