program ejercicio2;
type
	RANGOCODIGOPOLIZA = 1..6;
	cliente = record
		codigo: integer;
		dni : Longint;
		apellido : string;
		nombre : string;
		codigoPoliza : RANGOCODIGOPOLIZA;
		montoMensual : real;
	end;
	

	lista = ^nodo;
	
	nodo = record
		elem : cliente;
		sig : lista;
	
	end;
	
	
procedure leerCliente (var c: cliente);
begin
	writeln('Ingrese el codigo del cliente');
	readln(c.codigo);
	writeln('Ingrese el dni del cliente');
	readln(c.dni);
	writeln('Ingrese el apellido del cliente');
	readln(c.apellido);
	writeln('Ingrese el nombre del cliente');
	readln(c.nombre);
	writeln('Ingrese el codigo de poliza del cliente');
	readln(c.codigoPoliza);
	writeln('Ingrese el monto mensual del cliente');
	readln(c.montoMensual);
	
end;

procedure agregarAtras (var pi : lista; var pu : lista; c : cliente);
var
	nuevo : lista;

begin
	new (nuevo);
	nuevo^.elem := c;
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
	
	
	
	
	
procedure cargarClientes (var pi : lista; var pu: lista);
var
	c : cliente;
begin
	leerCliente(c);
	while (c.codigo <> 1122) do
		begin
			agregarAtras (pi, pu, c);
			leerCliente(c);
		
		end;


end;


function calcularMontoAdicional (codigo : integer) : real;
var
	costo : real;
begin
	case codigo of
		1 : costo := 1;
		2 : costo := 2;
		3 : costo := 3;
		4 : costo := 4;
		5 : costo := 5;
		6 : costo := 6;
	end;
	
	calcularMontoAdicional := costo;

end;


procedure informarDatosCliente (c : cliente);
begin
	writeln ('El DNI del cliente es ', c.dni);
	writeln ('El apellido del cliente es ', c.apellido);
	writeln ('El nombre del cliente es ', c.nombre);
	writeln ('El monto que paga mensualmente es ', c.montoMensual + calcularMontoAdicional(c.codigoPoliza))


end;

procedure descomponerNumero (dni : LongInt; var cant9 : integer);
var
	dig : integer;
begin
	cant9 := 0;
	while (dni <> 0) do
		begin
			dig := dni MOD 10;
			if (dig = 9) then
				cant9 := cant9 + 1;
			dni := dni DIV 10;
		end;
end;


function contieneDos9 (dni : LongInt) : boolean;
var
	cant9 : integer;

begin
	descomponerNumero (dni, cant9);
	contieneDos9 := (cant9 >= 2);
end;

procedure procesar (pi : lista);
var
	aux : lista;

begin
	aux := pi;
	while (aux <> nil) do
		begin
			informarDatosCliente (aux^.elem);
			if (contieneDos9(aux^.elem.dni)) then
					writeln('El cliente con apellido ', aux^.elem.apellido, ' y nombre ', aux^.elem.nombre,  ' tiene dni con mas de 2 nueves');
					
			aux := aux^.sig;
		end;



end;

var
	pi, pu : lista;

begin
	cargarClientes (pi, pu);
	procesar (pi);


end.
