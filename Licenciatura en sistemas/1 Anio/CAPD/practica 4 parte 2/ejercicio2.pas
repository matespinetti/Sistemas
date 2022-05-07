program ejercicio2a;
const
	dimF = 5;
type
	alumnos = array [1 .. dimF] of string;

procedure cargarAlumnos (var a: alumnos; var dimL: integer);
var
	nombre : string;
begin
	writeln('Ingrese un nombre');
	readln(nombre);
	dimL := 0;
	while ((dimL < dimF) and (nombre <> 'ZZZ')) do
		begin
			dimL := dimL + 1;
			a[dimL] := nombre;
			writeln('Ingrese otro nombre');
			readln (nombre);
			
		end;
end;


function buscarElemento (a : alumnos; valor : string; dimL: integer): integer;
var
	pos, i : integer; encontrado : boolean; 
begin
	encontrado := false;
	for i := 1 to dimL do
		begin
			if ((a[dimL] = valor) and not(encontrado)) then
				begin
					pos := dimL;
					encontrado := true;
				end;
		end;

	if (encontrado) then
		buscarElemento := pos
	else
		buscarElemento := -1;


end;

procedure eliminar (pos: integer; var dimL : integer; var a : alumnos; var pude : boolean);
var
	i: integer;
begin
	pude := false;
	if ((pos <= dimL) and (pos >=1)) then
		begin
			for i := pos to (dimL - 1) do
				a[i] := a[i+1];
			pude := true;
			dimL := dimL -1;
		end;
		
end;


procedure insertarNombre (nombre : string; pos : integer; var a: alumnos; var dimL : integer; var pude : boolean);
var
	i : integer;
begin
	pude := false;
	if (((dimL + 1) <= dimF) and (pos >= 1) and (pos <= dimL)) then
		begin
			for i := pos downto dimL do
				a [i+1] := a[i];
			pude := true;
			a [pos] := nombre;
			dimL := dimL + 1;
		
		end;


end;


procedure agregarNombre (nombre : string; var dimL : integer; var a : alumnos; var pude : boolean);
begin
	pude := false;
	if ((dimL + 1) <= dimF) then
		begin
			a [dimL + 1]:= nombre;
			dimL := dimL + 1;
			pude := true;
		end;

end;
var
	a : alumnos;
	dimL, pos : integer;
	valor, nombre : string;
	pudeBorrar, pudeInsertar, pudeAgregar : boolean;
	

begin
	cargarAlumnos(a, dimL);
	//writeln('Ingrese un elemento');
	//read (valor);
	//pos := buscarElemento (a, valor, dimL);
	//eliminar (pos, dimL, a, pudeBorrar);
	
	
	//writeln('Ingrese un elemento a insertar');
	//readln(nombre);
	//insertarNombre (nombre, 4, a, dimL, pudeInsertar);
	
	writeln('Ingrese un elemento a agregar');
	readln(nombre);
	agregarnombre(nombre, dimL, a, pudeAgregar);
	writeln(dimL);
	writeln(pudeAgregar);


end.

