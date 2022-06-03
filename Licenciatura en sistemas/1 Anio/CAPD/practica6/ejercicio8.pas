program ejercicio8;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
		end;


procedure insertarNodo (var pi: lista; v: integer);
var
	nuevo, ant, act: lista;
begin
	new (nuevo);
	nuevo^.num := v;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
	else
		begin
			act := pi;
			ant := pi;
			while ((act <> nil) and (act^.num < nuevo^.num)) do
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
				if (act <> nil) then
					begin
						ant^.sig := nuevo;
						nuevo^.sig := act;
					end
				else
					begin
						ant^.sig := nuevo;
						nuevo^.sig := nil;
			
					end;
		
		end;

end;



function estaOrdenada (pi : lista) : boolean;
var
	ant, act : lista;
	cumple : boolean;
begin
	cumple := true;
	act := pi;
	ant := pi;
	while ((act <> nil) and (cumple)) do
		begin
			if (act^.num < ant^.num) then
				cumple := false;
			ant := act;
			act := act^.sig;
			
	
		end;
	
	estaOrdenada:= cumple;
end;

procedure imprimirValores (pi : lista);
begin
	while (pi <> nil) do
		begin
			writeln(pi^.num);
			pi := pi^.sig;
		
		end;


end;


var
	pri : lista;
	valor : integer;

begin
	pri := nil;
	writeln('Ingrese un numero');
	read(valor);
	while (valor <> 0) do begin
		insertarNodo(pri, valor);
		writeln('Ingrese un numero');
		read(valor);
	end;

	imprimirValores(pri);
	if (estaOrdenada(pri)) then
		writeln('Esta ordenada');
	
	
	

end.

