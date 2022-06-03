program ejercicio13;
const
	dimF = 2;
type
	RANGOROL = 1..4;
	RANGOUSUARIOS = 1.. dimF;
	usuario = record
		email : string;
		rol : RANGOROL;
		revista : string;
		cantDias : integer;
	end;
	
	
	usuarios = array [RANGOUSUARIOS] of usuario;
	
	contadorRoles = array [RANGOROL] of integer;
	lista = ^nodo;
	
	nodo = record
		elem : usuario;
		sig : lista;
	end;
	
	
procedure leerUsuario (var u: usuario);
begin
	writeln('Ingrese el email del usuario');
	readln(u.email);
	writeln('Ingrese el rol del usuario (del 1 al 4)');
	readln(u.rol);
	writeln('Ingrese la revista en la que participa el usuario');
	readln(u.revista);
	writeln('Ingrese la cantidad de dias desde el ultimo acceso');
	readln(u.cantDias);
end;


procedure cargarUsuarios (var u: usuarios);
var
	i : integer;

begin
	for i := 1 to dimF do
		begin
			leerUsuario(u[i]);
		end;

end;

procedure insertarOrdenado (var pi: lista; u : usuario);
var
	nuevo, act, ant : lista;

begin
	new(nuevo);
	nuevo^.elem := u;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
	else
		begin
			act := pi;
			ant := pi;
			while ((act <> nil) and (nuevo^.elem.cantDias < act^.elem.cantDias)) do
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


procedure inicializarContadorRoles (var c: contadorRoles);
var
	i : integer;

begin
	for i := 1 to 4 do
		begin
			c [i]:= 0;
		end;



end;
procedure procesar (u: usuarios; var listaEconomica: lista; var c: contadorRoles);
var
	i : integer;
	

begin
	inicializarContadorRoles (c);
	for i := 1 to dimF do
		begin
			if (u[i].revista = 'Economica') then
				insertarOrdenado(listaEconomica, u[i]);
				
			c[u[i].rol] := c[u[i].rol] + 1;
		
		end;
end;




procedure imprimirRevistaEconomica (pi : lista);
begin
	while (pi <> nil) do
		begin
			writeln('El nombre de usuario es ', pi^.elem.email, ' y la cantidad de dias desde el ultimo acceso es de ', pi^.elem.cantDias);
			pi := pi^.sig;
			
		end;

end;

procedure informarUsuariosPorRol (c : contadorRoles);
var
	i : integer;

begin
	for i := 1 to 4 do
		begin
			writeln('La cantidad de usuarios del rol ', i, ' es de ', c[i]);
		
		end;

end;

var
	pi : lista;
	u : usuarios;
	c : contadorRoles;
	

begin
	cargarUsuarios (u);
	procesar (u, pi, c);
	imprimirRevistaEconomica (pi);
	informarUsuariosPorRol(c);

end.








