program ejercicio7;
const
	dimFMaterias = 24;
type
	rangoMaterias = 1.. dimFMaterias;
	rangoNota = 0..10;
	
	vectorNotas = array [rangoMaterias] of rangoNota;

	alumno = record
		numeroAlumno : integer;
		apellido : string;
		nombre : string;
		correo : string;
		anoIngreso : integer;
		anoEgreso : integer;
		notas : vectorNotas;
	end;
	
	listaAlumnos = ^nodo;
	
	nodo = record
		elem : alumno;
		sig : listaAlumnos;
	end;
	


procedure cargarNotas (var n: vectorNotas);
var
	i: integer;
begin
	for i := 1 to dimFMaterias do
		begin
			writeln ('Escribi la nota del alumno');
			readln (n[i])
		end;


end;


procedure ordenarNotas (var n : vectorNotas);
var
	i, j, p, elem : integer;

begin
	for i:= 1 to (dimFMaterias - 1) do 
		begin
			elem := n[i];
			p := i;
			
			for j := i+1 to dimFMaterias do
				begin
					if n[j] > n[i] then
						p := j;
				end;
				
			elem := n[p];
			n[p] := n[i];
			n[i] := elem;
		
	
		end;
end;


procedure leerAlumno (var a : alumno);
begin
	writeln ('Ingrese el numero de alumno');
	readln(a.numeroAlumno);
	writeln ('Ingrese el apellido del alumno');
	readln(a.apellido);
	writeln ('Ingrese el nombre del alumno');
	readln(a.nombre);
	writeln ('Ingrese la direccion de correo electronico');
	readln(a.correo);
	writeln ('Ingrese el ano de ingreso');
	readln(a.anoIngreso);
	writeln ('Ingrese el ano de egreso');
	readln(a.anoEgreso);
	cargarNotas (a.notas);
	ordenarNotas (a.notas);

end;

procedure agregarAlumno (var pi : listaAlumnos ; var pu : listaAlumnos; var o : alumno);
var
	nuevo : listaAlumnos;

begin
	new (nuevo);
	nuevo^.elem := o;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		begin
			pi := nuevo;
			pu := nuevo;
		
		end
	else
		begin
			pu^.sig := nuevo;
			pu := nuevo;
		
		end;



end;

procedure cargarAlumnos (var pi : listaAlumnos; var pu : listaAlumnos);
var
	a : alumno;

begin
	leerAlumno (a);
	while (a.numeroAlumno <> -1) do
		begin
			agregarAlumno (pi, pu, a);
			leerAlumno(a);
		
		end;



end;


function calcularPromedio (notas : vectorNotas) : real;
var
	i : integer;
	sumaTotal : real;

begin
	sumaTotal := 0;
	for i := 1 to dimFMaterias do
		sumaTotal := sumaTotal + notas[i];
		
	calcularPromedio := sumaTotal / dimFMaterias;

end;

procedure procesar (pi : listaAlumnos);
var
	aux : listaAlumnos;


begin
	aux := pi; 
	while (aux <> nil) do
		begin
			writeln (' El promedio de notas obtenido por el alumno de nombre ', aux^.elem.nombre, ' y apellido ', aux^.elem.apellido, ' es de ', calcularPromedio(aux^.elem.notas));
			
		
		
		
		
			aux := aux^.sig;
		end;



end;


var
	pi, pu : listaAlumnos;

begin
	cargarAlumnos (pi, pu);
	procesar(pi);

end.
		
		
