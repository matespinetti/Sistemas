program ejercicio10;

type

	especie = record
		nombre : string;
		tiempoPromedio: integer;
		tipoPlanta: string;
		clima : string;
		paises : string;
	end;
	
	maxLongevas = record
		max1: integer;
		max2: integer;
		max1Nombre : string;
		max2Nombre : string
	end;

procedure leerEspecie(var e : especie);
begin
	writeln('Ingrese el nombre de la especie');
	readln(e.nombre);
	writeln('Ingrese el tiempo promedio de vida de la especie en meses');
	readln(e.tiempoPromedio);
	writeln('Ingrese el tipo de planta de la especie');
	readln(e.tipoPlanta);
	writeln('Ingrese el clima de la especie');
	readln(e.clima);
	writeln('Ingrese los paises en los que esta la  especie');
	readln(e.paises);

end;

procedure ordenarMaxPlantas (cantPlantas : integer; tipoPlanta : string ; var maxPlantas : integer; var maxPlantasTipo : string);
begin
	if (cantPlantas > maxPlantas) then
		begin
			maxPlantas := cantPlantas;
			maxPlantasTipo := tipoPlanta;
		
		end;

end;

procedure masLongevas (e : especie; var m : maxLongevas );
begin
	if (e.tiempoPromedio > m.max1) then
		begin
			m.max2 := m.max1;
			m.max2Nombre := m.max1Nombre;
			m.max1 := e.tiempoPromedio;
			m.max1Nombre := e.nombre;
		end
	else
		if (e.tiempoPromedio > m.max2) then
			begin
				m.max2:= e.tiempoPromedio;
				m.max2Nombre:= e.nombre;
			
			end;


end;


function esArgentina (pais : string) : boolean;
begin
		esArgentina := (pais = 'Argentina');

end;

var
	e : especie; maxL : maxLongevas;
	cantPlantas, maxCantPlantas, tiempoTotal : integer;
	maxCantPlantasTipo, tipoPlantaActual: string;

begin
	maxCantPlantas := -1; maxL.max1:= -1;
	leerEspecie(e);
	while (e.paises <> 'zzz') do
		begin // de la condicion de fin
			cantPlantas := 0;
			tiempoTotal := 0;
			tipoPlantaActual := e.tipoPlanta;
			while (tipoPlantaActual = e.tipoPlanta) do
				begin // ordenado por tipo de planta
					cantPlantas := cantPlantas + 1;
					tiempoTotal := tiempoTotal + e.tiempoPromedio;
					masLongevas(e, maxL);
					if ((esArgentina(e.paises)) and (e.clima = 'subtropical')) then
						writeln('La planta con nombre ', e.nombre, ' es nativa de Argentina con clima subtropical');
					leerEspecie(e);
				end; // ordenado por tipo de planta
			ordenarMaxPlantas (cantPlantas, tipoPlantaActual, maxCantPlantas, maxCantPlantasTipo);
			writeln('El tiempo promedio de vida de las plantas de tipo ', tipoPlantaActual, ' es de ', tiempoTotal/cantPlantas :1:2);
			
		
		end; // de la condicion de fin

	writeln('El nombre cientifico de las dos plantas mas longevas es de ', maxL.max1Nombre, ' y ' , maxL.max2Nombre);
	


end.
