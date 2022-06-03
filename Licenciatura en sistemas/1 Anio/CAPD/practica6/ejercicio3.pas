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
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo1(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	imprimirEnteros(pri);
	
end.

