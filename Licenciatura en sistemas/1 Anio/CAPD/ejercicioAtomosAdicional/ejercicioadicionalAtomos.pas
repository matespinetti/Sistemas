program ejercicioAtomicoParte1;
type
	atomo = record
		nombre : string;
		cantProtones : integer;
		cantElectrones : integer;
		cantNeutrones : integer;
		nAtomico: integer;
		nMasico : integer;
		masa : real;
		carga : string;
	end;
	
	
	atomosMaxMasa = record
		max1: real;
		max2: real;
		max1Nombre : string;
		max2Nombre : string;
	end;
	
	tablaPeriodica = array [1 .. 119] of atomo;

procedure leerAtomo (var a : atomo);
begin
	writeln('Ingrese el nombre del atomo');
	readln(a.nombre);
	writeln('Ingrese la cantidad de protones');
	readln(a.cantProtones);
	writeln('Ingrese la cantidad de electrones');
	readln(a.cantElectrones);
	writeln('Ingrese la cantidad de neutrones');
	readln(a.cantNeutrones);

end;

function calcularMasa (a : atomo) : real;
begin
	calcularMasa := (a.cantProtones + a.cantElectrones + a.cantNeutrones);
	
end;

function calcularCarga (a : atomo) : string;
var
	carga : string;
begin
	if (a.cantProtones = a.cantElectrones) then
		carga := 'Neutra'
	else
		if (a.cantProtones > a.cantElectrones) then
			carga := 'Cation'
		else
			carga := 'Anion';
	
	calcularCarga := carga;
end;

function calcularNMasico (a: atomo) : integer;
begin
	calcularNMasico := (a.cantNeutrones + a.cantProtones);

end;


function esIsotopo (a1 : atomo; a2: atomo): boolean;
begin

	esIsotopo := (a1.cantElectrones = a2.cantElectrones);

end;


procedure calcularMaxMasa (a : atomo; var max: atomosMaxMasa);
begin
	if  (a.masa > max.max1) then
		begin
			max.max2:= max.max1;
			max.max2Nombre := max.max1Nombre;
			max.max1 := a.masa;
			max.max1Nombre := a.nombre
		
		end
	else
		if (a.masa > max.max2) then
			begin
				max.max2:= a.masa;
				max.max2Nombre := a.nombre;
			end;

end;






procedure completarTablaPeriodica (a : atomo; var tabla : tablaPeriodica);
var
	pos, i : integer;
begin
	for i := 1 to 119 do
		begin
			pos := a.cantProtones;
			tabla[pos] := a;
		
		end;



end;
var
	a, minMasico : atomo; 
	maxA: atomosMaxMasa;
	i, cantCationes, cantAniones: integer;


begin
	cantCationes := 0; cantAniones := 0; 
	maxA.max1 := -1;
	
	
	for i := 1 to 2 do
		begin
			leerAtomo (a);
			a.carga := calcularCarga(a);
			a.masa := calcularMasa(a);
			if (a.carga = 'Cation') then
				cantCationes := cantCationes + 1
			else
				if (a.carga = 'Anion') then
					cantAniones := cantAniones + 1;
			calcularMaxMasa(a, maxA );
			
		end;
		
			
	
	writeln('La cantidad de atomos que son iones positivos es de ', cantCationes);
	writeln('La cantidad de atomo que son iones negativos es de ', cantAniones);
	writeln('El nombre de los dos atomos con mayor cantidad de masa es ', maxA.max2Nombre, ' y ', maxA.max1Nombre);
	

end.
