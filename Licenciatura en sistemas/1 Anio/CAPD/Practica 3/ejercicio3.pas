program ejercicio3;
type
	escuela = record
		cue : integer;
		nombre : string;
		cantDocentes: integer;
		cantAlumnos: integer;
		localidad : string;
	end;

procedure leer (var e : escuela);
begin
	writeln('Ingrese el cue');
	readln(e.cue);
	writeln('Ingrese el nombre de la institucion');
	readln(e.nombre);
	writeln('Ingrese la cantidad de docentes');
	readln(e.cantDocentes);
	writeln('Ingrese la cantidad de alumnos');
	readln(e.cantAlumnos);
	writeln('Ingrese la localidad');
	readln(e.localidad);

end;

function calcularRelacion (cantAlumnos : integer; cantDocentes: integer): real;
begin
	calcularRelacion:= cantAlumnos / cantDocentes
end;

function esLaPlata (localidad: string): boolean;
begin
	esLaPlata:= (localidad = 'La Plata')
end;

function esMayor (relacion : real) : boolean;
begin
	esMayor := (relacion >= 23.435);
end;

procedure ordenarMinimos (var e : escuela; relacion: real; var min1: real; var min2: real; var min1Nombre: string; var min2Nombre: string; var min1Cue: integer; var min2Cue: integer);
begin
	if (relacion < min1) then
		begin
			min2 := min1;
			min2Nombre := min1Nombre;
			min2Cue:= min2Cue;
			min1 := relacion;
			min1Nombre := e.nombre;
			min1Cue := e.cue;
		
		end
	else
		if (relacion < min2) then
			begin
				min2 := relacion;
				min2Nombre := e.nombre;
				min2Cue:= e.cue;
			
			end;
end;


var
	escuela1: escuela;
	i, cantLaPlata, min1Cue, min2Cue : integer;
	min1, min2, relacion : real; 
	min1Nombre, min2Nombre: string;

begin
	cantLaPlata:= 0; min1:= 32000; 
	for i := 1 to 2400 do begin
		leer (escuela1);
		relacion := calcularRelacion(escuela1.cantAlumnos, escuela1.cantDocentes);
		if ((esLaPlata(escuela1.localidad)) and (esMayor (relacion))) then
			cantLaPlata := cantLaPlata + 1;
		ordenarMinimos (escuela1, relacion, min1, min2, min1Nombre, min2Nombre, min1Cue, min2Cue);
	end;

	writeln('La cantidad de escuelas con localidad La Plata, con relacion mayor a establecida por la unesco es de ', cantLaPlata);
	writeln('Las escuelas con mayor relacion entre docente y alumno son ', 'nombre: ', min2Nombre, '  cue: ', min2Cue, 'y nombre: ', min1Nombre, 'y cue: ', min1Cue);
	




end.
	
