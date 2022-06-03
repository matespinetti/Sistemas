program ejercicio11;
type
	egresado = record	
		nroAlumno: integer;
		apellido : string;
		promedio : real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : egresado;
		sig : lista;
	
	end;
	
	
procedure leerEgresado (var e : egresado);
begin
	writeln('Ingrese el nro de alumno del egresado');
	readln(e.nroAlumno);
	writeln('Ingrese el apellido del egresado');
	readln(e.apellido);
	writeln('Ingrese el promedio del egresado');
	readln(e.promedio);

end;


procedure crearLista (var pi: lista);
begin
	pi := nil;


end;
procedure insertarEgresado (var pi : lista; e : egresado);
var
	nuevo, act, ant : lista;

begin
	new (nuevo);
	nuevo^.elem := e;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
		
	else
		begin
			act := pi ; ant := pi;
			while ((act <> nil) and (act^.elem.promedio >= e.promedio)) do
				begin
					ant := act;
					act := act^.sig;
				
				end;
			
			if (act = pi) then
				begin
					nuevo^.sig := pi;
					pi := nuevo;
				end
			else
				begin
					ant^.sig := nuevo;
					nuevo^.sig := act;
			
				end;

		end;
end;	




procedure cargarEgresados (var pi : lista);
var
	e : egresado;
begin
	leerEgresado (e);
	while (e.nroAlumno <> 0 ) do
		begin
			insertarEgresado(pi, e);
			leerEgresado (e);
		end;

end;




procedure imprimirEgresados (pi : lista);
var
	contAlumnos : integer;

begin
	contAlumnos := 0;
	
	while ((pi <> nil) and (contAlumnos < 10)) do 
		begin
			contAlumnos := contAlumnos + 1;
			writeln('El alumno ', pi^.elem.apellido, ' con promedio ', pi^.elem.promedio:1:2 , ' recibira el premio ');
			pi := pi^.sig;
		end;
		

end;


var
	pi : lista;
	
begin
	pi := nil;
	cargarEgresados (pi);
	imprimirEgresados (pi);
	
end.
