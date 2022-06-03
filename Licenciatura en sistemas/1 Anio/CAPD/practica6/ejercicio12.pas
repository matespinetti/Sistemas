program ejercicio12;
type
	dispositivo = record
		versionAndroid : real;
		tamanoPantalla : real;
		cantRam : real;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : dispositivo;
		sig : lista;
	
	end;
	

procedure leerDispositivo (var d: dispositivo);
begin
	writeln('Ingrese la version de android del dispositivo');
	readln(d.versionAndroid);
	writeln('Ingrese el tamano de pantalla del dispositivo');
	readln(d.tamanoPantalla);
	writeln('Ingrese la cantidad de ram del dispositivo');
	readln(d.cantRam);
end;


procedure agregarAtras (var pi : lista; d : dispositivo);
var
	nuevo, aux : lista;
	

begin;
	new (nuevo);
	nuevo^.elem := d;
	nuevo^.sig := nil;

	if (pi = nil) then
		pi := nuevo
	else
		begin
			aux := pi;
			while (aux^.sig <> nil) do
				begin
					aux := aux^.sig;
				
				end;
		
			
			aux^.sig := nuevo;
			nuevo^.sig := nil;
		
		end;



end;

	
	
procedure cargarDispositivos (var pi : lista);
var
	i : integer;
	d : dispositivo;

begin
	for i := 1 to 5 do
		begin
			leerDispositivo (d);
			agregarAtras(pi, d);
		
		end;


end;


function tamanoPromedio (tamTotal : real; cant : integer) : real;
begin
	tamanoPromedio := tamTotal / cant;

end;

procedure procesar (pi : lista);
var
	versionActual, tamTotal : real;
	aux : lista;
	cantPorVersion, cantMemoriaPulgadas, cantDispositivos : integer;
begin

	aux := pi;
	cantMemoriaPulgadas := 0;
	cantDispositivos := 0;
	tamTotal := 0;
	while (aux <> nil ) do
		begin
			cantPorVersion := 0;
			versionActual := aux^.elem.versionAndroid;
			while ((aux <> nil) and (aux^.elem.versionAndroid = versionActual)) do
				begin
					cantPorVersion := cantPorVersion + 1;
					cantDispositivos := cantDispositivos + 1;
					tamTotal := tamTotal + pi^.elem.tamanoPantalla;
					if ((aux^.elem.cantRam > 3) and (aux^.elem.tamanoPantalla <= 5)) then
						cantMemoriaPulgadas := cantMemoriaPulgadas + 1;
					aux := aux^.sig;
					
				end;
		
			writeln('La cantidad de dispositivos de la version de android ', versionActual, ' es de ', cantPorVersion);
		end;
	
	
	writeln('La cantidad de dispositivos con mas de 3gb de emoria y pantallas de a lo suma 5 pulgadas es de ', cantMemoriaPulgadas);	
	writeln('El tamano promedio de pantalla de todos los dispositivos es de ', tamanoPromedio(tamTotal, cantDispositivos))
end;


var
	pi : lista;

begin
	pi := nil;
	cargarDispositivos (pi);
	procesar(pi);

end.



