program ejercicio3;
type
	viaje = record
		numero : integer;
		codigoAuto : integer;
		direccionOrigen : string;
		direccionDestino : string;
		kilometros : integer;
	end;
	
	
	max = record
		max1: integer;
		max1Codigo : integer;
		max2 : integer;
		max2Codigo : integer;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : viaje;
		sig :lista;
	
	end;
	
	
procedure leerViaje (var v: viaje);
begin
	writeln('Ingrese el numero del viaje');
	readln(v.numero);
	writeln('Ingrese el codigo del auto');
	readln(v.codigoAuto);
	writeln('Ingrese la direccion de origen');
	readln(v.direccionOrigen);
	writeln('Ingrese la direccion de destino');
	readln(v.direccionDestino);
	writeln('Ingrese la cantidad de kilometros recorridos');
	readln(v.kilometros);

end;


procedure insertarViaje (var pi : lista; v : viaje);
var
	nuevo, ant, act : lista;

begin
	new (nuevo);
	nuevo^.elem := v;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
	else
		begin
			act := pi;
			ant := pi;
			while (act <> nil) and (v.codigoAuto <= act^.elem.codigoAuto) do
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


procedure cargarViajes (var pi : lista);
var
	v : viaje;
	
begin
	leerViaje (v);
	while (v.numero <> -1) do
		begin
			insertarViaje (pi, v);
			leerViaje(v);
		
		end;



end;

procedure maxKMRecorridos (km : integer; codigo : integer; var m : max);
begin
	if (km >= m.max1 ) then
		begin
			m.max2 := m.max1;
			m.max2Codigo := m.max1Codigo;
			m.max1 := km;
			m.max1Codigo := codigo;
		
		end
	else
		if (km >= m.max2) then
			begin
				m.max2 := km;
				m.max2Codigo := codigo;
			
			end;


end;


function supera5Kilometros (kmViaje : integer) : boolean;
begin
	supera5Kilometros := (kmViaje >= 5);

end;



procedure insertarViajesMasDe5 (var pi : lista; v: viaje);
var
	nuevo, act, ant : lista;
begin
	new (nuevo);
	nuevo^.elem := v;
	nuevo^.sig := nil;

	if (pi = nil ) then
		pi := nuevo
	else
		begin
			act := pi; ant := pi;
			while ((act <> nil) and (v.numero <= act^.elem.numero)) do
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
procedure procesar (pi : lista; var listaMasDe5 : lista ; var m : max);
var
	aux : lista;
	codigoActual, kilometrosPorCodigo : integer;
	

begin
	aux := pi;
	m.max1 := -1;
	while (aux <> nil) do
		begin
			kilometrosPorCodigo := 0;
			codigoActual := aux^.elem.codigoAuto;
			while (aux^.elem.codigoAuto = codigoActual) do
				begin
					kilometrosPorCodigo := kilometrosPorCodigo + aux^.elem.kilometros;
					if (supera5Kilometros(aux^.elem.kilometros)) then
						insertarViajesMasDe5(listaMasDe5, aux^.elem);
					aux := aux^.sig;
				end;
			
			maxKMRecorridos(kilometrosPorCodigo, codigoActual, m);
		end;

	


end;


procedure informarLista (pi : lista);
begin
	while (pi <> nil) do
		begin
			writeln ('El numero de viaje del viaje que excedio los 5km es de ', pi^.elem.numero);
			pi := pi^.sig;
		
		end;

end;



var
	pi, listaMasDe5 : lista;
	m : max;
	
begin
	cargarViajes (pi);
	procesar (pi, listaMasDe5, m);
	
	informarLista (listaMasDe5);
	
	writeln ('Los codigos de auto que mas kilometros recorrieron son  ', m.max1Codigo, ', que recorrio ', m.max1, ' kilometros y ', m.max2Codigo, ' que recorrio ', m.max2, ' kilometros.' );


end.
