program ejercicio1a;
var 
	i, num, total, mayoresA5: integer;
begin
	total:= 0;
	mayoresA5:= 0;
	for i := 1 to 10 do
	begin
	    writeln('Ingrese un numero');
		read (num);
		total:= total + num;
		if (num > 5) then
		  mayoresA5 := mayoresA5 + 1;
	end;
	writeln('La suma total de los numeros leidos es de ', total);
	writeln('La cantidad de numeros mayores a 5 es de ', mayoresA5);
end.

