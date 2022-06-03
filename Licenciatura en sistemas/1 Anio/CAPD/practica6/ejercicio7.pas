program ejercicio6;

type

	RANGOCATEGORIA = 1..7;
	sonda = record
		nombre : string;
		duracion : integer;
		costoConstruccion : real;
		costoMantenimiento : real;
		rango : RANGOCATEGORIA;
	end;
	
	lista = ^nodo;
	
	
	contadorRangos = array [RANGOCATEGORIA] of integer;
	nodo = record
		elem : sonda;
		sig : lista;
	
	end;
	
	max = record
		costo : real;
		nombre : string;
	end;
	
procedure leerSonda (var s : sonda);
begin
	writeln('Ingrese el nombre de la sonda');
	readln(s.nombre);
	writeln('Ingresela duracion de la sonda en meses');
	readln(s.duracion);
	writeln('Ingrese el costo de construccion de la sonda');
	readln(s.costoConstruccion);
	writeln('Ingrese el costo de mantenimiento de la  sonda');
	readln(s.costoMantenimiento);
	writeln('Ingrese el rango de categoria de la sonda (del 1 al 7)');
	readln(s.rango);

end;


procedure crearLista (var pi : lista);
begin
	pi := nil;

end;

procedure agregarAtras (var pi : lista; var pu: lista; s : sonda);
var
	nuevo : lista;

begin
	new (nuevo);
	nuevo^.elem := s;
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

function calcularPromedio (a : real; cant : integer): real;
begin

	calcularPromedio := a/cant ;

end;

procedure cargarSondas (var pi: lista; var pu: lista; var duracionPromedio : real; var costoConstruccionPromedio : real);
var
	s : sonda;
	duracionTotal: real;
	cantSondas: integer;
	costoConstruccionTotal : real;
	
begin
	cantSondas := 0;
	duracionTotal := 0;
	costoConstruccionTotal:= 0;
	leerSonda(s);
	while (s.nombre <> 'GAIA') do
		begin
			cantSondas := cantSondas + 1;
			costoConstruccionTotal := costoConstruccionTotal + s.costoConstruccion;
			duracionTotal := duracionTotal + s.duracion;
			agregarAtras(pi, pu, s);
			leerSonda(s);
		
		end;
	
	duracionPromedio := calcularPromedio(duracionTotal , cantSondas);
	costoConstruccionPromedio := calcularPromedio(costoConstruccionTotal, cantSondas);
	

end;


procedure sondaMasCostosa (costo : real; nombre : string; max1: max);
begin
	if (costo > max1.costo) then
		begin
			max1.costo := costo;
			max1.nombre := nombre;
		
		end;

end;


procedure inicializarContadorRangos(var c: contadorRangos);
var
	i : integer;
begin
	for i := 1 to 7 do
		begin
			c[i]:= 0;
		
		end;

end;



procedure informarRangos (c : contadorRangos);
var
	i : integer;
begin
	for i := 1 to 7 do
		writeln('La cantidad de sondas que se estudiaran en el rango ', i, ' es de ', c[i]);


end;


function cumpleConH2020 (s: sonda): boolean;
begin

	cumpleConH2020:= ((s.costoMantenimiento < s.costoConstruccion) and (s.rango <> 1))

end;

procedure procesar (pi : lista; duracionPromedio : real; costoConstruccionPromedio: real; var max1: max; var c: contadorRangos; var cantMayorDuracion : integer; var cumplen: lista; var noCumplen: lista);
var
	costoTotal : real;
	puCumplen: lista;
	puNoCumplen: lista;
begin
	inicializarContadorRangos(c);
	cantMayorDuracion := 0;
	while (pi <> nil) do
		begin
			
			costoTotal := pi^.elem.costoConstruccion + pi^.elem.costoMantenimiento;
			
			sondaMasCostosa (costoTotal, pi^.elem.nombre, max1);
			
			if (pi^.elem.duracion > duracionPromedio) then
				cantMayorDuracion := cantMayorDuracion + 1;
			
			if (pi^.elem.costoConstruccion > costoConstruccionPromedio) then
				writeln('El nombre de la sonda cuyo costo de construccion supera el costo de construccion promedio es ', pi^.elem.nombre);
				
			c[pi^.elem.rango] := c[pi^.elem.rango];
			
			if (cumpleConH2020(pi^.elem)) then
				agregarAtras(cumplen, puCumplen, pi^.elem)
			else
				agregarAtras(noCumplen, puNoCumplen, pi^.elem);
			pi := pi^.sig;
		end;



end;


procedure procesarNoCumplen (pi : lista; var cant: integer; var costoTotal : real);
begin
	cant := 0;
	costoTotal := 0;
	while (pi <> nil) do
		begin
			cant := cant + 1;
			costoTotal := CostoTotal + pi^.elem.costoMantenimiento + pi^.elem.costoConstruccion;
			pi := pi^.sig;
		end;


end;

	
var
	pi, pu, cumplen, noCumplen : lista;
	max1 : max;
	c: contadorRangos;
	duracionPromedio, costoConstruccionPromedio, costoTotalNoH2020: real;
	cantMayorDuracion, cantNoH2020 : integer;
	

begin
	max1.costo := -1;
	crearLista(pi);
	cargarSondas(pi, pu, duracionPromedio, costoConstruccionPromedio);
	procesar(pi, duracionPromedio, costoConstruccionPromedio, max1, c, cantMayorDuracion, cumplen, noCumplen);
	procesarNoCumplen(noCumplen, cantNoH2020, costoTotalNoH2020);
	writeln('El nombre de la sonda mas costosa es ', max1.nombre, ' con un costo total de ', max1.costo);
	informarRangos(c);
	writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es de ', cantMayorDuracion);
	writeln('La cantidad de sondas que no seran financiadas por el H2020 es de ', cantNoH2020, ' que representa un monto total de ', costoTotalNoH2020)

end.
