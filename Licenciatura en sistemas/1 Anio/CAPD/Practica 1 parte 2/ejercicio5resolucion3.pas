program ejercicio5;
var
	max, min, num, total : integer;
begin
	max := -30000; min:= 30000; total := 0;
	repeat
		writeln('Ingrese un numero');
		read (num);
		if (num >= max) then
			max := num;
		if (num <= min) then
			min := num;
		total := total + num;
	until (	num = 100);
	
	writeln('El numero maximo es ', max);
	writeln('El numero minimo es ', min);
	writeln(' La suma total de los numeros es ', total);

end. 
		
		
