program ejercicio6;
var
  legajo, cantAlumnos, promMayor,AlumDestacados: integer;
  promedio,porcentajeAlumnos : real;
begin
  cantAlumnos:= 0;
  promMayor:= 0;
  alumDestacados:= 0;
  writeln ('Introduzca el legajo');
  read (legajo);
  while (legajo <> -1) do
    begin
        writeln ('Introduzca el promedio ');
		read(promedio);
		cantAlumnos:= cantAlumnos + 1;
		if (promedio > 6.5) then
			promMayor:= promMayor + 1;
		if ((promedio > 8.5) and (legajo <2500)) then
			alumDestacados:= alumDestacados + 1;
		writeln('Introduzca el legajo');
		read (legajo);
	end;
  if (alumDestacados > 0) then
    porcentajeAlumnos:= (alumDestacados/cantAlumnos) * 100;
  writeln('Se leyeron ', cantAlumnos, ' alumnos');
  writeln(promMayor, ' alumnos tienen promedio mayor a 6.5');
  
  writeln('El porcentaje de alumnos con promedio mayor a 8,5% y con legajo menor a 2500 son ', porcentajeAlumnos:1:1, '%');
  
end. 
      
    
  
