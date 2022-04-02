// para cada empresa leo codigo, cantidad de inversienes y el monto de cada una de las inversiones. Finaliza con codigo 100, que debe procesarse. 
//Informar: monto promedio de sus inversiones, codigo de la empresa con mayor monto total invertido, cantidad de empresas con inversiones de mas de 500000
program actividad1;
var
	codigo, cantidadInversiones, mas_de_50, i, maxCodigo : integer;
	monto, montoPromedio, totalInversiones, maxMontoTotal: real;
begin
	mas_de_50:= 0;
	maxMontoTotal := -1;
	
	repeat
		totalInversiones:= 0;
		writeln('Ingrese el codigo de la empresa');
		readln (codigo);
		writeln('Ingrese la cantidad de inversiones');
		readln (cantidadInversiones);
		
		for i := 1 to cantidadInversiones do
			begin
				writeln('Ingrese el monto de cada inversion');
				read(monto);
				totalInversiones:= totalInversiones + monto;
					
			end;
			
		montoPromedio := totalInversiones / cantidadInversiones;
		if (totalInversiones > maxMontoTotal) then
			begin
				maxMontoTotal := totalInversiones;
				maxCodigo:= codigo;
		if (totalInversiones > 50000) then
			mas_de_50 := mas_de_50 + 1;
			
			end;
			
		writeln ('El monto promedio de las inversiones de la empresa codigo ', codigo, ' es ', montoPromedio:1:2);
		
	until (codigo = 100);
	
	writeln('La empresa con el mayor monto total invertido es la empresa ', maxCodigo);
	writeln('Hay ', mas_de_50, ' empresas con inversiones por mas de 50.000' );
end.
	
