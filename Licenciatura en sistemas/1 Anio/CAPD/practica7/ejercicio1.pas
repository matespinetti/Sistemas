program ejercicio1;
type
	RANGOCODIGOGENERO = 1..5;
	
	persona = record
		dni : Longint;
		apellido : string;
		nombre : string;
		edad : integer;
		codigoGenero : RANGOCODIGOGENERO;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : persona;
		sig : lista;
	
	end;
	
	contadorGenero = array [RANGOCODIGOGENERO] of integer;

procedure leerPersona (var p : persona);
begin
	writeln('Ingrese el dni de la persona');
	readln(p.dni);
	writeln('Ingrese el apellido de la persona');
	readln(p.apellido);
	writeln('Ingrese el nombre de la persona');
	readln(p.nombre);
	writeln('Ingrese la edad de la persona');
	readln(p.edad);
	writeln('Ingrese el codigo de genero musical de la persona');
	readln(p.codigoGenero);



end;


procedure agregarAtras (var pi : lista; var pu: lista; p : persona);
var
	nuevo: lista;

begin
	new (nuevo);
	nuevo^.elem := p;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		begin
			pi := nuevo;
			pu := nuevo
		end
	else
		begin
			pu^.sig := nuevo;
			pu := nuevo;
		end;

end;

procedure cargarPersonas (var pi : lista; var pu: lista);
var
	p : persona;
begin
	repeat
		leerPersona (p);
		agregarAtras (pi, pu, p);
	until (p.dni = 33555444);

end;


procedure descomponerNumero (dni : integer; var cantP : integer; var cantI : integer);
var
	dig : integer;
begin
	cantP := 0; cantI := 0;
	while (dni <> 0) do
		begin
			dig := dni MOD 10;
			if ((dig mod 2) = 0) then
				cantP := cantP + 1
			else
				cantI := cantI + 1;
				
			dni := dni DIV 10;
		
		end;


end;
function masPares(dni : integer): boolean;
var
	 cantDPares, cantDImpares : integer;
	
begin
	descomponerNumero (dni, cantDPares, cantDImpares);
	masPares := (cantDPares > cantDImpares);
end;


procedure inicializarContador (c: contadorGenero);
var
	i : integer;
begin
	for i := 1 to 5 do
		c[i] := 0;


end;


procedure procesar (pi : lista; var c: contadorGenero);
var
	aux : lista;
	cantPares : integer;
begin
	inicializarContador(c);
	aux := pi;
	cantPares := 0;
	while (aux <> nil ) do
		begin
			if (masPares(aux^.elem.dni)) then
				cantPares := cantPares + 1;
			c[aux^.elem.codigoGenero] := c[aux^.elem.codigoGenero]+ 1;
			aux := aux^.sig;
		end;
	writeln('La cantidad de personas con dni con mas digitos pares que impares es ', cantPares);

end;

function cualGenero (genero : integer) : string;
var
	g : string;
begin
	case genero of
		1 : g := 'drama';
		2 : g := 'romantico';
		3 : g := 'accion';
		4 : g := 'suspenso';
		5 : g := 'terror';
	end;
	
	cualGenero := g;


end;
procedure informarGeneros (c : contadorGenero);
var
	i : integer;

begin
	for i := 1 to 5 do
		begin
			writeln('La cantidad de personas que prefieren el genero ', cualGenero(i), ' es de ', c[i]);
		
		end;
	
end;



procedure eliminarDNI (var pi : lista; dni : LongInt; var pude : boolean);
var
	act, ant : lista;
	
begin
	pude := false;
	act := pi;
	ant := pi;
	while (act <> nil) and (act^.elem.dni <> dni) do
		begin
			ant := act;
			act := act^.sig;
		
		end;
	
	if (act <> nil) then
		begin
			if (act^.elem.dni = dni) then
				begin
					if (act = pi) then
						begin
							pi^.sig := pi;
							dispose(act);
						end
					else
						begin
							ant^.sig := act^.sig;
							dispose (act);
						end;
						
					pude := true;
				end;
			
		
		end


end;


procedure informarDNIS (pi : lista);
begin
	while (pi <> nil) do
		begin
			writeln(pi^.elem.dni);
			pi := pi^.sig;
		
		end;

end;

var
	pi, pu : lista;
	c : contadorGenero;
	pudeEliminar : boolean;

begin
	cargarPersonas (pi, pu);
	procesar (pi, c);
	informarGeneros (c);
	eliminarDNI(pi, 2, pudeEliminar );
	if (pudeEliminar) then
		informarDNIS(pi)
	else
		writeln ('No se pudo eliminar ya que el elemento no estaba en la lista');
end.
