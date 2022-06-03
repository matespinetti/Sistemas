program ejercicio10;
type
	cliente = record
		dni : integer;
		nroCliente : integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : cliente;
		sig : lista;
	
	end;
	

procedure agregarAtras (var pi : lista; var pu : lista; v: cliente);
var
	nuevo : lista;
	

begin
	new (nuevo);
	nuevo^.elem := v;
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

procedure recibirCliente (dni : integer; var pi : lista; var pu: lista);
var
	nuevoCliente : cliente;
begin
	nuevoCliente.dni := dni;
	if (pi <> nil) then
		nuevoCliente.nroCliente := pu^.elem.nroCliente + 1
	else
		nuevoCliente.nroCliente := 1;
	
	agregarAtras(pi, pu, nuevoCliente);

end;

procedure atenderCliente (var pi : lista; var c: cliente);
var
	aux : lista;
begin
	aux := pi;
	c := pi^.elem;
	pi := pi^.sig;
	dispose (aux);

end;


procedure imprimirLista (pi : lista);
begin
	if (pi <> nil) then
		while (pi <> nil) do
			begin
				writeln(pi^.elem.dni);
				pi := pi^.sig
			end
	else
		writeln('La lista esta vacia');

end;


var
	pi, pu : lista;
	c : cliente;
	dni, i : integer;
	cantClientes : integer;

begin
	writeln('Ingrese un DNI');
	readln(dni);
	cantClientes := 0;
	while (dni <> 0) do
		begin
			cantClientes := cantClientes + 1;
			recibirCliente (dni, pi, pu);
			writeln('Ingrese un DNI');
			readln(dni);
			
		end;
	
	
	for i := 1 to cantClientes do
		begin
			atenderCliente (pi, c);
			writeln('El cliente atendido tiene dni ', c.dni, ' y nro de cliente ', c.nroCliente);
		end;
	
	imprimirLista(pi);

end.

