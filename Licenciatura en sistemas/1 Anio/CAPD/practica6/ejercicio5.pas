program ejercicio5;
type
	producto = record
		codigo : integer;
		descripcion : string;
		stockActual : integer;
		stockMinimo : integer;
		precio : real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : producto;
		sig : lista;
	end;
	
	
	min = record
		precio : real;
		codigo : integer;
	end;
	
procedure leerProducto (var p : producto);
begin
	writeln('Ingrese el codigo del producto');
	readln(p.codigo);
	writeln('Ingrese la descripcion del producto');
	readln(p.descripcion);
	writeln('Ingrese el stock actual del producto');
	readln(p.stockActual);
	writeln('Ingrese el stock minimo del producto');
	readln(p.stockMinimo);
	writeln('Ingrese el precio del producto');
	readln(p.precio);

end;

procedure crearLista (var pi : lista);
begin
	pi := nil;
end;


procedure agregarAtras (var pi : lista; var pu : lista; p : producto);
var
	nuevo : lista; 
begin
	new (nuevo);
	nuevo^.elem := p;
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


procedure cargarProductos (var pi: lista; var pu: lista);
var
	p : producto;
begin
	leerProducto(p);
	while (p.codigo <> -1) do
		begin
			agregarAtras (pi, pu, p);
			leerProducto(p);
		end;
end;


function calcularPorcentaje (cantM : integer; cantP : integer): real;
begin

	calcularPorcentaje := (cantM/ cantP) * 100;

end;


function esPar (digito : integer) : boolean;
begin
	esPar := (digito mod 2) = 0;

end;

function tieneTresDigitosPares(codigo : integer) : boolean;
var
	dig : integer;
	cantPares : integer;
begin
	cantPares := 0;
	while ((codigo <> 0) and (cantPares < 3)) do
		begin
			dig := codigo mod 10;
			if (esPar(dig)) then
				cantPares := cantPares + 1;
			codigo := codigo DIV 10;
		end;
	
	tieneTresDigitosPares := (cantPares >= 3);

end;


procedure masEconomicos (precio : real; codigo: integer; var min1: min; var min2: min);
begin
	if (precio < min1.precio) then
		begin
			min2.precio := min1.precio;
			min2.codigo := min1.codigo;
			min1.precio := precio;
			min1.codigo := codigo;
		
		end
	else
		if (precio < min2.precio) then
			begin
				min2.precio := precio;
				min2.codigo := codigo;
			
			end;
	
end;


procedure procesar (pi : lista; var porcentajeMenor : real; var min1: min; var min2: min);
var
	cantMenor : integer;
	cantProductos : integer;
begin
	min1.precio := 1000000;
	cantMenor := 0;
	cantProductos := 0;
	
	while (pi <> nil) do
		begin
			cantProductos := cantProductos + 1;
			if (pi^.elem.stockActual < pi^.elem.stockMinimo) then
				 cantMenor := cantMenor + 1;
			
			if (tieneTresDigitosPares(pi^.elem.codigo)) then
				writeln('La descripcion del producto con al menos tres digitos pares es', pi^.elem.descripcion);
			
			masEconomicos (pi^.elem.precio, pi^.elem.codigo, min1, min2);
			pi := pi^.sig;
		end;
	
	
	porcentajeMenor := calcularPorcentaje(cantMenor, cantProductos);
end;


var
	pi, pu : lista;
	porcentaje : real;
	min1, min2 : min;
	
			
begin
	crearLista(pi);
	cargarProductos(pi, pu);
	procesar(pi, porcentaje, min1, min2);
	
	writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es de ', porcentaje:1:2);
	writeln('El codigo de los dos productos mas economicos es ', min1.codigo, ' con un precio de ', min1.precio:1:2, ' y ', min2.codigo, ' con un precio de ', min2.precio:1:2 );




end.
