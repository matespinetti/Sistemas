program ejercicio3;
type
	nota = 0..10;
	
var
	nombre: string;
	notaAlumno: nota;
	aprobados, nota7: integer;
begin
    aprobados:= 0;
    nota7:= 0;
	repeat
	    writeln('Ingrese un nombre');
		readln (nombre);
		writeln('Ingrese la nota');
		readln (notaAlumno);
		if (notaAlumno >= 8) then
			aprobados:= aprobados + 1;
		if (notaAlumno = 7) then
			nota7 := nota7 + 1;
	until (nombre = 'Zidane Zinedine');
	writeln('La cantidad de alumnos aprobados con nota 8 o mayor es de', aprobados);
	writeln('La cantidad de alumnos con nota igual a 7 ', nota7);
end.
		

