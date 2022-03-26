program ejercicio6;
type
	cod = 0..200;
var
	producto, cantProd: integer;
	precio, min1, min2 : real;
	codigo: cod;
	codigopar: boolean;
	
begin
	cantProd:= 0;
	for producto:= 1 to 5 do
	    begin
			writeln('Ingrese el codigo del producto');
			read (codigo);
			writeln('Ingrese el precio del producto');
			read (precio);
			if (codigo mod 2 = 0) then
				codigopar:= true;
			if (producto = 1) then
				begin	
					min1:= precio;
					min2:= precio;
				end
			else
				begin
					if (precio < min1) then
					begin
						min1:= min2;
						precio:= min1;
					end
				end;
			if ((precio > 16) and (codigopar)) then
				cantProd:= cantProd + 1;
	    end;
	writeln('Los dos productos mas baratos valen ', min2:1:2, ' y ', min1:1:2);
	writeln('La cantidad de productos de mas de 16 pesos con codigo par es ', cantProd);
end.
