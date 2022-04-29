program ejercicio11;
type
	vuelo = record
		codigoAvion : integer;
		paisSalida : string;
		paisLlegada : string;
		cantKilometros : integer;
		porcentajeOcupacion : real;
	end;
	
	maxKilometrosRecorridos = record
		max1 : integer;
		max2 : integer;
		max1Codigo : integer;
		max2Codigo : integer;
	end;
	
	minKilometrosRecorridos = record
		min1 : integer;
		min2 : integer;
		min1Codigo: integer;
		min2Codigo : integer;
	end;


procedure leerVuelo(var v: vuelo);
begin
	writeln('Ingrese el codigo del avion');
	readln(v.codigoAvion);
	writeln('Ingrese el pais de salida');
	readln(v.paisSalida);
	writeln('Ingrese pais de llegada');
	readln(v.paisLlegada);
	writeln('Ingrese la cantidad de kilometros recorridos');
	readln(v.cantKilometros);
	writeln('Ingrese el porcentaje de ocupacion del avion');
	readln(v.porcentajeOcupacion);

end;


procedure calcularMinKilometros (codigoActual : integer; cantKilometros : integer ; var min : minKilometrosRecorridos);
	begin
		if (cantKilometros < min.min1) then
			begin
				min.min2 := min.min1;
				min.min2Codigo := min.min1Codigo;
				min.min1 := cantKilometros;
				min.min1Codigo := codigoActual;
			end
		else
			if (cantKilometros < min.min2) then
				begin
					min.min2 := cantKilometros;
					min.min2Codigo := codigoActual;
					
				
				end;
	
	end;

procedure calcularMaxKilometros (codigoActual : integer; cantKilometros : integer ; var max : maxKilometrosRecorridos);
	begin
		if (cantKilometros > max.max1) then
			begin
				max.max2 := max.max1;
				max.max2Codigo := max.max1Codigo;
				max.max1 := cantKilometros;
				max.max1Codigo := codigoActual;
			end
		else
			if (cantKilometros > max.max2) then
				begin
					max.max2 := cantKilometros;
					max.max2Codigo := codigoActual;
					
				end;
	
	end;

procedure calcularMaxPaisesDiferentes (cant : integer; codigo : integer; var max : integer; var maxCodigo : integer);
begin
	if (cant > max) then
		begin
			max := cant;
			maxCodigo := codigo;
		end;
end;
 
var
	v : vuelo; 
	minKm : minKilometrosRecorridos;
	maxKm : maxKilometrosRecorridos; 
	paisActualSalida: string;
	codigoActual, cantTotalKilometros, cantPaisesDiferentes, maxPaisesDiferentes, maxPaisesDiferentesCodigo, cant, cantOce: integer;
	

begin
	minKm.min1 := 30000;
	maxKm.max1 := -1;
	maxPaisesDiferentes := -1;
	cant := 0; cantOce := 0;
	leerVuelo (v);
	
	while (v.codigoAvion <> 44) do
		begin // condicion fin
			cantTotalKilometros := 0;
			codigoActual := v.codigoAvion;
			cantPaisesDiferentes := 0;
			while ((codigoActual = v.codigoAvion) and (v. codigoAvion <> 44)) do
				begin //ordenado por codigo
					paisActualSalida:= v.paisSalida;
					while ((paisActualSalida = v.paisSalida) and (codigoActual = v.codigoAvion)) do
						begin //ordenado por pais
							cantTotalKilometros := cantTotalKilometros + v.cantKilometros;
							if ((v.cantKilometros > 5000) and (v.porcentajeOcupacion < 60)) then
								cant:= cant+ 1;
							if ((v.cantKilometros < 10000) and ((v.paisLlegada = 'Australia') or (v.paisLlegada = 'Nueva Zelanda'))) then
								cantOce := cantOce + 1;
							leerVuelo(v);
						
						end; //ordenado por pais
					cantPaisesDiferentes := cantPaisesDiferentes + 1;
						
				
				end; // ordenado por codigo
				
				calcularMinKilometros (codigoActual, cantTotalKilometros, minKm);
				calcularMaxKilometros (codigoActual, cantTotalKilometros, maxKm);
				calcularMaxPaisesDiferentes (cantPaisesDiferentes, codigoActual, maxPaisesDiferentes, maxPaisesDiferentesCodigo);
				
		
		
		end; // condicion fin

	writeln('El codigo de los dos aviones que mas kilometros recorrieron son ', maxKm.max2Codigo, ' con una cantidad de kms de ', maxKm.max2, ' y ', maxKm.max1Codigo, ' con una cantidad de kms recorridos de ', maxKm.max1 );
	writeln ('El codigo del avion que salio de mas paises diferentes es ', maxPaisesDiferentesCodigo, 'con una cantidad de paises de ', maxPaisesDiferentes);
	writeln('La cantidad de vuelos de mas de 5000km que no alcanzan 60% son ', cant);
	writeln('La cantidad de vuelos de menos de 10000km que llegan a Australia o Nueva Zelanda son ', cantOce);
	
	
	
end.
