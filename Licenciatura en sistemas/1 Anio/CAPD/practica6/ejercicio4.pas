program ejercicio3;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
		end;
		
		
procedure armarNodo1 (var pi : lista; v : integer);
var
	nuevo, aux : lista;
begin
	new (nuevo);
	nuevo^.num := v;
	nuevo^.sig := nil;
	if (pi = nil) then
		pi := nuevo
	else
		begin
			aux := pi;
			while (aux^.sig <> nil) do
				aux := aux^.sig;
			
			aux^.sig := nuevo;
		
		end;
end;
			
			
procedure armarNodo2(var pi: lista; var pu: lista; v: integer);
var
	aux : lista;

begin
	new (aux);
	aux^.num := v;
	aux^.sig := nil;
	
	if (pi = nil) then
		begin
			pi := aux;
			pu := aux;
		
		end
	else
		begin
			pu^.sig := aux;
			pu := aux;
		end;
end;


function maximo (pi : lista) : integer;
var
	max : integer;

begin
	max := -30000;
	while (pi <> nil) do
		begin
			if (pi^.num > max) then
				max := pi^.num;
			pi := pi^.sig;
		
		end;

	maximo := max;
end;

function minimo (pi : lista) : integer;
var
	min : integer;

begin
	min := 30000;
	while (pi <> nil) do
		begin
			if (pi^.num < min) then
				min := pi^.num;
			pi := pi^.sig;
		
		end;

	minimo := min;
end;


function multiplos (pi : lista; valor : integer) : integer;
var
	cant : integer;

begin
	cant := 0;
	while (pi <> nil) do
		begin
			if ((pi^.num mod valor) = 0) then
				cant := cant + 1;
			pi := pi^.sig;
				
		end;
		
	multiplos := cant;



end;
procedure imprimirEnteros (l : lista);
begin
	while (l <> nil) do
		begin
			writeln(l^.num);
			l := l^.sig;
		end;

end;


procedure incrementar (l: lista; v : integer);
begin
	while (l <> nil) do
		begin
			l^.num := l^.num + v;
			l := l^.sig;
		
		end;

end;
var
	pri : lista; pu : lista;
	valor : integer;
	v: integer;
	valorM: integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo2(pri, pu, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirEnteros(pri);
	writeln('El maximo numero de la lista es ', maximo(pri));
	writeln('El minimo numero de la lista es ', minimo(pri));
	writeln('Ingrese un valor de multiplo');
	read (valorM);
	writeln('La cantidad de elementos que son multiplos de este numero es de ', multiplos(pri, valorM));
	
	
end.
