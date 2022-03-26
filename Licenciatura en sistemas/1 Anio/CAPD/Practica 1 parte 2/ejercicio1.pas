program ejercicio1;
var 
	i, num, total: integer;
begin
	total:= 0; 
	for i := 1 to 10 do
	begin
	    writeln('Ingrese un numero');
		read (num);
		total:= total + num;
	end;
	writeln('La suma total de los numeros leidos es de ', total);
end.

