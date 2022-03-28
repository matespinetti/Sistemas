program ejercicio8;
const
	mes = 31;
var
	dia, cant_ventas_dia : integer;
	monto, monto_total: real;
begin
	monto_total:= 0;
	for dia := 1 to mes do
		begin
			cant_ventas_dia:= 0;
			writeln('Ingrese el monto del producto');
			read (monto);
			while (monto <> 0) do
				begin
					cant_ventas_dia:= cant_ventas_dia + 1;
					monto_total:= monto_total + monto;
					writeln('Ingrese el monto del producto');
					read (monto);
				end;
			writeln('La cantidad de ventas del dia es de ', cant_ventas_dia)
		end;;
	writeln('El monto acumulado de todo el mes es de ', monto_total);
end.
					
			
