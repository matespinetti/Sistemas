program ejercicio8;
const
	cantAlumnos = 5;
	ano = 2022;
type
	alumno = record
		nroInscripcion : integer;
		dni : integer;
		apellido : string;
		nombre : string;
		aNacimiento : integer;
		edad : integer;
	end;
	

	alumnos = array [1.. cantAlumnos] of alumno;

procedure leerAlumno (var a : alumno);
begin
	writeln('Ingrese  el numero de inscripcion');
	readln(a.nroInscripcion);
	writeln('Ingrese el dni');
	readln(a.dni);
	writeln('Ingrese el apellido');
	readln(a.apellido);
	writeln('Ingrese el nombre');
	readln(a.nombre);
	writeln('Ingrese  el ano de nacimiento');
	readln(a.aNacimiento);
	a.edad := ano - a.aNacimiento; 
	
end;

procedure cargarAlumno (var a : alumnos);
var
	i : integer;
begin
	for i := 1 to cantAlumnos do
		begin
			leerAlumno (a[i]);
		end;

end;

function todosPares (dni : integer): boolean;
var
	digito, cantImpares: integer; 
begin
	cantImpares := 0;
	while (dni <> 0) do
		begin
			digito := dni mod 10;
			if (digito mod 2 = 1) then
				cantImpares := cantImpares + 1;
			dni := dni div 10;
		end;
	todosPares := (cantImpares = 0)

end;

procedure ordenarMaximo (a : alumno; var max1:alumno; var max2: alumno);
begin
	if (a.edad > max1.edad) then
		begin
			max2 := max1;
			max1 := a;
		end
	else
		if (a.edad > max2.edad) then
				max2 := a;
		

end;
procedure recorrerArray (a : alumnos; var cantPares: integer; var max1: alumno; var max2: alumno);
var
	i : integer;
begin
	max1.edad := -1;
	cantPares := 0;
	for i := 1 to cantAlumnos do
		begin
			if (todosPares(a[i].dni)) then
				cantPares := cantPares + 1;
			ordenarMaximo(a[i], max1, max2);
			
		end;

end;

function calcularPromedio (cantPares : integer) : real;
begin
	calcularPromedio := ((cantPares/ cantAlumnos) * 100);

end;


var
	max1, max2 : alumno;
	alumnos1 : alumnos; 
	cantPares : integer;
begin
	cargarAlumno (alumnos1);
	recorrerArray(alumnos1, cantPares, max1, max2);
	writeln('El promedio de alumnos con todos los digitos pares del dni es de ', calcularPromedio(cantPares));
	writeln('El apellido y nombre de los alumnos con mayor edad es ', max2.nombre, '', max2.apellido, ' y ', max1.nombre, '', max1.apellido);


end.
