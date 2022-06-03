program ejercicio4;
const
	dimFPeso = 3 ;
type
	RANGOPESO = 1 .. dimFPeso;
	vectorPeso = array [RANGOPESO] of real;
	paciente = record
		nombre : string;
		apellido : string;
		peso : vectorPeso
	end;
	
	lista = ^nodo;
	
	nodo = record
		elem : paciente;
		sig : lista;
	end;
	

procedure leerPeso (var v: vectorPeso);
var
	i: integer;
begin
	for i := 1 to dimFPeso do 
		begin
			writeln('Ingrese el peso de la semana ', i);
			readln(v[i]);
		end;

end;


procedure leerPaciente (var p: paciente );
begin
	writeln ('Ingrese el nombre de la  paciente');
	readln(p.nombre);
	writeln ('Ingrese el apellido de la  paciente');
	readln(p.apellido);
	leerPeso(p.peso);
end;


procedure agregarAtras (var pi : lista; var pu: lista; p : paciente);
var
	nuevo : lista;
begin
	new(nuevo);
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

procedure cargarPacientes (var pi : lista; var pu: lista);
var
	p: paciente;
begin
	leerPaciente (p);
	while (p.nombre <> 'Ona') do
		begin
			agregarAtras (pi, pu, p);
			leerPaciente(p);
		
		end;
		
		
end;



function mayorSemana (v : vectorPeso) : integer;
var
	i, maxSemana : integer;
	max: real;


begin
	max := -1;
	for i := 1 to dimFPeso do
		begin
			if (v[i] > max) then
				begin
					max := v[i];
					maxSemana := i;
				end;
		end;



	mayorSemana := maxSemana;
end;

procedure procesar (pi : lista);
var
	aux : lista;

begin
	aux := pi;
	while (aux <> nil) do	
		begin
			writeln('La mayor semana de la paciente de nombre ', aux^.elem.nombre, ' y apellido ', aux^.elem.apellido, ' es ', mayorSemana(aux^.elem.peso));
			writeln('El aumento de peso total es ', (aux^.elem.peso[dimFPeso] - aux^.elem.peso[1]):1:1);
			aux := aux^.sig;
		end;



end;

var
	pi, pu : lista;

begin
	cargarPacientes (pi, pu);
	procesar(pi);
end.
