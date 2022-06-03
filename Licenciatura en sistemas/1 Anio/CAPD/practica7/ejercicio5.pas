program ejercicio5;
const
	dimFCamion = 3;
	anoActual = 2022;
type
	RANGOCAMIONES = 1..dimFCamion;
	camion = record
		patente : string;
		anoFabricacion : integer;
		capacidad : real;
	end;
	
	viaje = record
		codigoViaje: integer;
		codigoCamion: RANGOCAMIONES;
		distanciaKm : Longint;
		ciudadDestino : string;
		ano : integer;
		dniChofer : LongInt;
	end;
	
	camiones = array [RANGOCAMIONES] of camion;
	
	contadorKMRecorridos = array [RANGOCAMIONES] of real;
	listaViajes = ^nodo;
	
	nodo = record
		elem : viaje;
		sig : listaViajes;
	end;
	

procedure leerCamion (var c: camion);
begin
	writeln ('Ingrese la patente del camion');
	readln(c.patente);
	writeln('Ingrese el ano de fabricacion del camion');
	readln(c.anoFabricacion);
	writeln('Ingrese la capacidad del camion');
	readln(c.capacidad);
end;

procedure cargarCamiones (var c: camiones);
var
	i : integer;

begin
	for i := 1 to dimFCamion do 
		begin
			leerCamion (c[i]);
		end;
		
end;
		
		
		
procedure leerViaje (var v : viaje);
begin
	writeln ('Ingrese el codigo del viaje');
	readln(v.codigoViaje);
	writeln ('Ingrese el codigo del camion');
	readln(v.codigoCamion);
	writeln ('Ingrese la distancia recorrida en kilometros');
	readln(v.distanciaKm);
	writeln ('Ingrese la ciudad de destino');
	readln(v.ciudadDestino);
	writeln ('Ingrese el ano en que se realizo el viaje');
	readln(v.ano);
	writeln ('Ingrese el dni del chofer');
	readln(v.dniChofer);

end;
	

procedure agregarViaje (var pi : listaViajes; var pu: listaViajes; var v : viaje);
var
	nuevo : listaViajes;

begin
	new (nuevo);
	nuevo^.elem := v;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		begin
			pi := nuevo;
			pu := nuevo
		end
	else
		begin
			pu^.sig := nuevo;
			pu := nuevo;
		end;

end;

procedure cargarViajes (var pi : listaViajes; var pu : listaViajes);
var
	v: viaje;
begin
	leerViaje (v);
	while (v.codigoViaje <> -1) do
		begin
			agregarViaje (pi, pu, v);
			leerViaje(v);
		
		end;

end;


procedure inicializarContadorKilometros (var c: contadorKMRecorridos);
var
	i : integer;
begin
	for i := 1 to dimFCamion do
		begin
			c[i] := 0;
		end;
end;



procedure calcularMinYMaximo (c : contadorKMRecorridos; cam : camiones;  var maxP : string; var minP : string);
var
	max, min : real;
	maxC, minC : integer;
	i : integer;

begin
	max := -1;
	min := 10000000;
	for i := 1 to dimFCamion do
		begin
			if (c[i] > max) then
				begin
					max := c[i];
					maxC := i;
				
				end;
			
			if (c[i] < min) then
				begin
					min := c[i];
					minC := i;
				
				end;
		
		
		end;
		
	maxP := cam[maxC].patente;
	minP:= cam[minC].patente;

end;



function antiguedadMayorA5 (ano : integer) : boolean;
begin
	antiguedadMayorA5 := ((anoActual - ano) > 5);

end;

procedure descomponerNumero (dni : LongInt; var cantPares: integer);
var
	dig : integer;
begin
	cantPares := 0;
	while ((dni <> 0) and (cantPares = 0)) do
		begin
			dig := dni MOD 10;
			if (dig MOD 2 = 0) then
				cantPares := cantPares + 1;
			dni := dni DIV 10;
		end;


end;

function sonTodosImpares (dni : LongInt ) : boolean;
var
	cantP: integer;
begin
	descomponerNumero (dni, cantP);
	sonTodosImpares := (cantP = 0);
end;


procedure procesar (pi : listaViajes; cam : camiones;  var maxPatente : string; var minPatente : string; var cant: integer );
var
	aux : listaViajes;
	c: contadorKMRecorridos;
	

begin
	inicializarContadorKilometros (c);
	aux := pi;
	while (aux <> nil) do
		begin
			c[aux^.elem.codigoCamion] := c[aux^.elem.codigoCamion] + aux^.elem.distanciaKm;
			if ((cam[aux^.elem.codigoCamion].capacidad > 30.5) and (antiguedadMayorA5(cam[aux^.elem.codigoCamion].anoFabricacion))) then
				cant := cant + 1;
			if (sonTodosImpares (aux^.elem.dniChofer)) then
				writeln ('El codigo del viaje que es manejado por un chofer con dni todos digitos pares es ', aux^.elem.codigoViaje);
		
			aux := aux^.sig;
		end;
	
	calcularMinyMaximo(c, cam,  maxPatente, minPatente);
end;


var
	cam : camiones;
	pi, pu : listaViajes;
	maxPatente, minPatente : string;
	cantDosCondiciones : integer;

begin
	cargarCamiones (cam);
	cargarViajes (pi, pu);
	procesar (pi, cam, maxPatente, minPatente, cantDosCondiciones);
	writeln ('La patente del camion que mas kilometros recorridos posee es ', maxPatente);
	writeln ('La patente del camion que menos kilometros recorridos posee es ', minPatente);
	writeln ('La cantidad de viajes que cumplen las dos condiciones es ', cantDosCondiciones);
	
end.
