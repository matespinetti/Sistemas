program ejercicio6;

type

	microprocesador = record
		marca : string;
		linea : string;
		cantNucleos : integer;
		velocidad : real;
		tamTransitor : integer;
	end;
	
	maximosTransitores = record
		max1: integer;
		max2: integer;
		max1Marca : string;
		max2Marca: string;

	end;
	

procedure leerProcesador (var p : microprocesador);
begin
	writeln('Ingrese la marca del procesador');
	readln(p.marca);
	writeln('Ingrese la linea del procesador');
	readln(p.linea);
	writeln('Ingrese la cantidad de nucleos del procesador');
	readln(p.cantNucleos);
	writeln('Ingrese la velocidad del procesador');
	readln(p.velocidad);
	writeln('Ingrese el tamano del transitor en mm');
	readln(p.tamTransitor);

end;

procedure ordenarMaximos( cantTransitoresMarca : integer; marca : string  ;var maxTransitor : maximosTransitores);
begin
	if ( cantTransitoresMarca > maxTransitor.max1) then
		begin
			maxTransitor.max2 := maxTransitor.max1;
			maxTransitor.max2Marca := maxTransitor.max1Marca;
			maxTransitor.max1 := cantTransitoresMarca;
			maxTransitor.max1Marca := marca;
		end
	else
		if (cantTransitoresMarca > maxTransitor.max2 ) then
			begin
				maxTransitor.max2:= cantTransitoresMarca;
				maxTransitor.max2Marca := marca
			end;

end;

function esMulticore (nucleos : integer) : boolean;
begin
	esMulticore := (nucleos >= 2);
end;
var
	procesador : microprocesador;
	marcaActual : string;
	cantTransitores14Marca, cantMult : integer;
	maxTransitor: maximosTransitores;
begin
	maxTransitor.max1 := -1; // variable para contener los maximos
	cantMult := 0;
	leerProcesador (procesador);
	while (procesador.cantNucleos <> 0) do
		begin
			cantTransitores14Marca:= 0;  // transitores de 14nm por marca
			marcaActual := procesador.marca;
			while (marcaActual = procesador.marca) do
				begin
					if ((procesador.cantNucleos >= 2) and (procesador.tamTransitor <= 22)) then
						writeln('El procesador de la marca ', procesador.marca, ', linea  ', procesador.linea, ' tiene mas de 2 cores con transitores de a lo sumo 22nm');
					if (procesador.tamTransitor = 14) then
						cantTransitores14Marca := cantTransitores14Marca + 1;
					if ((esMulticore(procesador.cantNucleos)) and ((marcaActual = 'Intel') or (marcaActual = 'AMD')) and (procesador.velocidad >= 2)) then
						cantMult := cantMult + 1;
					leerProcesador(procesador);
				end;
				
			ordenarMaximos (cantTransitores14Marca, marcaActual , maxTransitor);
			writeln()
		end;
			
	writeln('Las dos marcas con mayor cantidad de procesadores con transitores de 14nm son ', maxTransitor.max1Marca, ' y ' , maxTransitor.max2Marca);
	writeln('La cantidad de procesadores multicore es de ', cantMult);



end.
	
