PROGRAM ejercicio10;
const
	dimFCultivos = 4;
type
	RANGOCULTIVOS = 1..dimFCultivos;
	cultivo = record
		tipo : string;
		cantHectareas : integer;
		cantMeses : integer;
	end;
	
	vectorCultivos = array [RANGOCULTIVOS] of cultivo;
	empresa = record
		codigo : integer;
		nombre : string;
		estado : string;
		ciudad : string;
		cultivos : vectorCultivos;
		dimL : integer;
	end;
	
	listaEmpresas = ^nodo;
	
	nodo = record
		elem : empresa;
		sig : listaEmpresas;
	end;
	
	
	
procedure leerCultivo (var c: cultivo);
begin
	writeln('Ingrese el tipo de cultivo');
	writeln(c.tipo);
	writeln('Ingrese la cantidad de hectareas que ocupa');
	writeln(c.cantHectareas);
	writeln('Ingrese la cantidad de meses que lleva el ciclo de cultivo');
	writeln(c.cantMeses);

end;

procedure cargarCultivos (var v: vectorCultivos; var dimL : integer);
var
	c: cultivo;
begin
	dimL := 0;
	leerCultivo (c);
	while ((c.cantHectareas <> 0) and (dimL <= dimFCultivos)) do
		begin
			dimL := dimL + 1;
			v[dimL] := c;
			leerCultivo(c);
		
		end;
end;

procedure leerEmpresa (var e: empresa);
begin
	writeln ('Ingrese el codigo de la empresa');
	readln(e.codigo);
	writeln ('Ingrese el nombre de la empresa');
	readln(e.nombre);
	writeln ('Ingrese si la empresa es estatal o privada');
	readln(e.estado);
	writeln ('Ingrese el nombre de la ciudad donde esta radicada');
	readln(e.ciudad);
	cargarCultivos (e.cultivos, e.dimL);
	
end;


procedure agregarEmpresa (var pi : listaEmpresas; e: empresa);
var
	nuevo : listaEmpresas;

begin
	new (nuevo);
	nuevo^.elem := e;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
	else
		begin
			nuevo^.sig := pi;
			pi := nuevo;
		end;


end;

procedure cargarEmpresas (var pi : listaEmpresas);
var
	e : empresa;

begin
	leerEmpresa (e);
	while (e.codigo <> -1) do
		begin
			agregarEmpresa(pi, e);
			leerEmpresa(e);
		
		end;
	
end;

function cultivaTrigo (c : vectorCultivos; dimL : integer) : boolean;
var
	i: integer;
	cultivaT : boolean;
begin
	cultivaT := false;
	i:= 1;
	while ((i <= dimL) and not(cultivaT)) do
		begin
			if (c[i].tipo = 'Trigo') then
				cultivaT := true;
			i := i + 1;
		
		end;

	cultivaTrigo := cultivaT;

end;

procedure descomponerNumero (codigoE : integer; var cant0 : integer);
var
	dig : integer;
begin
	cant0 := 0;
	while (codigoE <> 0) do
		begin
			dig := codigoE MOD 10;
			if (dig = 0) then
				cant0 := cant0 + 1;
			codigoE := codigoE DIV 10;
		end;	
end;


function tieneAlMenosDosCeros (codigoE : integer) : boolean;
var
	cant0 : integer;
begin
	descomponerNumero (codigoE, cant0);
	tieneAlMenosDosCeros := (cant0 >=2);

end;


procedure hectareasSojaPorEmpresa (c: vectorCultivos; dimL : integer; var totalHectareas : integer; var hectareasSoja : integer);
var
  i : integer;
begin
	for i := 1 to dimL do
		begin
			if (c[i].tipo = 'Soja') then
				hectareasSoja := hectareasSoja + c[i].cantHectareas;
			totalHectareas := totalHectareas + c[i].cantHectareas; 
		
		end;


end;

function tiempoCultivoMaiz (c: vectorCultivos; dimL : integer ) : integer;
var
	tiempo, i : integer;
begin
	tiempo := 0;
	for i := 1 to dimL do
		begin
			if (c[i].tipo = 'Maiz') then
				tiempo := tiempo + c[i].cantMeses;
		
		end;
	tiempoCultivoMaiz := tiempo;

end;

procedure calcularMaxTiempoMaiz (codigo : integer; tiempoMaiz : integer; var maxTiempo : integer; var maxCodigo : integer);
begin
	if (tiempoMaiz > maxTiempo) then
		begin
			maxTiempo := tiempoMaiz;
			maxCodigo := codigo;
		end;


end;

procedure procesar (pi : listaEmpresas; var hectareasSoja : integer; var totalHectareas : integer; var maxCodigoMaiz : integer);
var
	aux : listaEmpresas;
	maxTiempoMaiz, tiempoMaiz : integer;
begin
	maxTiempoMaiz := -1;
	totalHectareas := 0;
	hectareasSoja := 0;
	aux := pi;
	while (aux <> nil) do
		begin
			if (aux^.elem.ciudad = 'San Miguel Del Monte') and (cultivaTrigo(aux^.elem.cultivos, aux^.elem.dimL) and (tieneAlMenosDosCeros(aux^.elem.codigo))) then
				writeln ('El nombre de la empresa que cumple las tres condiciones es ', aux^.elem.nombre);
			hectareasSojaPorEmpresa (aux^.elem.cultivos, aux^.elem.dimL, totalHectareas, hectareasSoja);
			tiempoMaiz := tiempoCultivoMaiz(aux^.elem.cultivos, aux^.elem.dimL);
			calcularMaxTiempoMaiz (aux^.elem.codigo, tiempoMaiz, maxTiempoMaiz, maxCodigoMaiz);
			aux := aux^.sig;
		end;

end;

function porcentajeHectareasSoja (hs : integer; th : integer) : real;
begin
	porcentajeHectareasSoja := ((hs/th) * 100);

end;
var
	pi : listaEmpresas;
	hectareasSoja, totalHectareas, maxCodigoMaiz : integer;

begin
	cargarEmpresas(pi);
	procesar (pi, hectareasSoja, totalHectareas, maxCodigoMaiz);
	writeln ('La cantidad de hectareas dedicadas al cultivo de soja es de ', hectareasSoja, ' que representa un  ', porcentajeHectareasSoja(hectareasSoja, totalHectareas), ' sobre el total de hectareas ');
	writeln ('La empresa que mas tiempo le dedica al cultivo de maiz tiene codigo', maxCodigoMaiz);
	
end.
