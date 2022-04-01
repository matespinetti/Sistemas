program ejercicio8resolucion3;
var
	dia, cantVentas : integer;
	monto, montoTotal : real;
begin
	montoTotal := 0;
	for dia:= 1 to 2 do 
		begin
			cantVentas := 0;
			writeln('Ingrese el monto del producto');
			read (monto);
			while (monto <> 0) do
				begin
					montoTotal := montoTotal + monto;
					cantVentas := cantVentas + 1;
					writeln('Ingrese el monto');
					read (monto);
				end;
			writeln('La cantidad de ventas del dia es ', cantVentas);
		end;
	writeln('El monto total acumulado es ', montoTotal:1:2);
			
end.	
