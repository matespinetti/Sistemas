program ejercicio14;
type
	RANGOCODALUMNO = 1..1300;
	RANGODIAMES = 1..31;
	RANGOTRANSPORTE = 1..5;
	viaje = record
		codAlumno : RANGOCODALUMNO;
		diaMes : RANGODIAMES;
		facultad : string;
		medioTransporte : RANGOTRANSPORTE;
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : viaje;
		sig : lista;
	end;
	
	contadorViajesAlumno = array [RANGOCODALUMNO] of integer;
	
	

procedure leerViaje (var v: viaje);
begin
	writeln('Ingrese el codigo del alumno que realizo el viaje');
	readln(v.codAlumno);
	writeln('Ingrese el dia del mes en que realizo el viaje');
	readln(v.diaMes);
	writeln('Ingrese la facultad a la que pertenece el alumno');
	readln(v.facultad);
	writeln('Ingrese el medio de transporte del alumno');
	readln(v.medioTransporte);

end;

procedure insertarOrdenado (var pi : lista; v: viaje);
var
	nuevo, act, ant : lista;

begin
	new(nuevo);
	nuevo^.elem := v;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
	else
		begin
			act := pi;
			ant := pi;
			while ((act <> nil) and (nuevo^.elem.codAlumno <= act^.elem.codAlumno) and (nuevo^.elem.diaMes <= act^.elem.diaMes)) do
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
	v: viaje;
begin
	leerViaje (v);
	while (v.codAlumno <> -1) do
		begin
			insertarOrdenado(pi, v);
			leerViaje(v);
		
		end;

end;
	

procedure procesar (pi : lista);
var
	aux : lista;
	alumActual : RANGOCODALUMNO;
	
begin
	aux := pi;
	
	while (aux <> nil) do
		begin
			alumActual := aux^.elem.codAlumno;
			while ( (aux <> nil) and (aux^.elem.codAlumno = alumActual)) do
				begin
					aux := aux^.sig;
				
				end;
		
		
		
		
		end;




end;
