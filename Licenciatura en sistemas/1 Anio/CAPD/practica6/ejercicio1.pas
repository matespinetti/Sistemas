program JugamosConListas;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
		end;
procedure armarNodo(var L: lista; v: integer);
var
	aux : lista;
begin
	new(aux);
	aux^.num := v;
	aux^.sig := L;
	L := aux;
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
	pri : lista;
	valor : integer;
	v: integer;
begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;
	writeln('Ingrese un valor a incrementar');
	read(v);
	incrementar(pri,v );
	imprimirEnteros(pri);
	
end.
