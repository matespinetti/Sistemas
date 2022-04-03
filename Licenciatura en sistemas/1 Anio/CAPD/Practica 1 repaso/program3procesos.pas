//Leer para cada alumno, su legajo, su codicion (I(ingresante), r(recursante), y la nota de 5 evaluaciones. La lectura finaliza con el legajo -1.

program actividad2;

procedure CondicionRendirParcial (aprobadas : integer; var totalAlumnos: real; var cantParcial: real);
begin	
	totalAlumnos := totalAlumnos + 1;
	if (((aprobadas / 5) * 100) > 75 ) then  // mayor a 75%
						cantParcial := cantParcial + 1;
	
end;

procedure OrdenarMaximos (contadorNota :integer; var max1 : integer; var max2:integer; var legajo : integer; var max1Codigo:integer; var max2Codigo:integer);
begin
	if (contadorNota > max1) then
		begin
			max2 := max1;
			max2Codigo := max1codigo;
			max1 := contadorNota;
			max1Codigo := legajo;
		end
	else
		if (contadorNota > max2) then
			begin
				max2 := contadorNota;
				max2Codigo:= legajo;
			end;
			
end;
var
	legajo, evaluacion, cantTodasAprobadas, cantPromMayorA6, cantAlumnosNota0, max1Nota10, 
	max2Nota10, max1Nota0, max2Nota0, max1Nota10Codigo, max2Nota10Codigo, max1Nota0Codigo, max2Nota0Codigo, cantAprobadas, contadorNota10, contadorNota0  : integer;
	
	porcentajeRecursantesParcial, porcentajeIngresantesParcial, nota, sumaNotas, promedioAlumno, totalIngresantes, cantIngresantesParcial,totalRecursantes, cantRecursantesParcial : real;
	
	sacoNota0 : boolean;
	
	condicion : char;
	
begin
	totalIngresantes := 0; totalRecursantes:= 0; cantIngresantesParcial:= 0; cantRecursantesParcial:= 0; cantPromMayorA6:= 0;
	max1Nota0 := -1; max1Nota10:= -1; cantTodasAprobadas:= 0; cantAlumnosNota0 := 0;
	writeln('Ingrese el legajo del alumno');
	readln(legajo);
	
	while (legajo <> -1 ) do
		begin

			cantAprobadas := 0; // cantidad de examenes aprobados para cada alumno
			sumaNotas := 0;  // 
			sacoNota0 := false; // booleano para determinar si un alumno se saco al menos un 0 en una evaluacion
			contadorNota10 := 0; //cuenta la cantidad de examenes en las que cada alumno se saca 10
			contadorNota0 := 0; //cuenta la cantidad de examenes en las que cada alumno se saca 0
			writeln('Ingrese una I si el alumno es ingresante o una R si es recursante');
			readln(condicion);
			for evaluacion := 1 to 5 do
				begin
					writeln('Ingrese la nota de cada evaluacion');
					read(nota);
					sumaNotas := sumaNotas + nota; // para calcular el promedio			
					if (nota >= 4) then
							cantAprobadas:= cantAprobadas + 1;
					if (nota = 10) then
							contadorNota10 := contadorNota10 + 1
					else
						if (nota = 0) then
							begin
								contadorNota0 := contadorNota0 + 1;
								sacoNota0 := true;
							end;
							
				
						
					
				end;
			
			
		
			
			case condicion of 
				'I': CondicionRendirParcial(CantAprobadas, totalIngresantes, CantIngresantesParcial);
				'R': CondicionRendirParcial(CantAprobadas, totalRecursantes, CantRecursantesParcial);
			end;
			
			if (cantAprobadas = 5) then
				cantTodasAprobadas := cantTodasAprobadas + 1; // Verificar 5 aprobo las 5 evaluaciones, si es asi se suma a la variable/
			
			promedioAlumno := sumaNotas / 5;	//calcular promedio de cada alumno
			if (promedioAlumno > 6.5) then   // cantAlumnos con prom mayor a 6.5  
				cantPromMayorA6 := cantPromMayorA6 + 1;
			
			if (sacoNota0) then                                  //si el alumno saco algun 0, es decir, si saco Nota0 es verdadero, la variable suma uno
				cantAlumnosNota0 := cantAlumnosNota0 + 1;
			
			OrdenarMaximos(contadorNota0, max1Nota0, max2Nota0, legajo, max1Nota0Codigo, max2Nota0Codigo);
			OrdenarMaximos(contadorNota10, max1Nota10, max2Nota10, legajo, max1Nota10Codigo, max2Nota10Codigo);
			writeln('Ingrese el legajo del alumno')	;		
			readln (legajo);
				
			end; 
		
		porcentajeIngresantesParcial:= cantIngresantesParcial / totalIngresantes;	// Calcular Promedios
		porcentajeRecursantesParcial := cantRecursantesParcial / totalRecursantes;  //
		
		
		writeln('La cantidad de ingresantes en condiciones de rendir el parcial es de ', cantIngresantesParcial:1:0, ' que representa el ', porcentajeIngresantesParcial:1:2);
		writeln('La cantidad de recursantes en condiciones de rendir el parcial es de ', cantRecursantesParcial:1:0, ' que representa el ', porcentajeRecursantesParcial:1:2);	
		writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones es de ', cantTodasAprobadas);
		writeln('La cantidad de alumnos con nota promedio mayor a 6.5 es de ', cantPromMayorA6);
		writeln('La cantidad de alumnos que obtuvieron al menos un 0 es de ', cantAlumnosNota0);
		writeln ('El codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 es ', max1Nota10Codigo, ' y ', max2Nota10Codigo);
		writeln ('El codigo de los dos alumnos con mayor cantidad de autoevaluciones con nota 0 es ', max1Nota0Codigo, ' y ', max2Nota0Codigo);
		
		
			
	
end.	


