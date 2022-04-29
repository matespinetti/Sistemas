program ejercicio7;
type
	digitos = array [1.. 10] of integer;

procedure cargarDigito (var d : digitos);
	procedure descomponerNumero (num : integer; var d : digitos);
	var 
		digito : integer;
	begin
		while (num <> 0) do
			begin
				digito := num mod 10;
				d [digito + 1] := d[digito + 1] + 1;
				num := num div 10;
			
			end;

	end;

var
	num : integer; 
begin
	writeln('Ingrese un numero');
	read (num);
	while (num <> 0) do
		begin
			descomponerNumero(num, d);
			writeln('Ingrese un numero');
			read (num);
		end;
	
end;



procedure InformarOcurrenciasyMax (d : digitos; var max : integer);
var
	i : integer;
begin
	max := -1;
	for i := 1 to 10 do 
		begin
			if (d[i] > 0) then
				writeln('La cantidad de veces que aparecio el digito', i-1, 'es de ', d[i], 'veces')
			else
				writeln ('El digito ', i-1, 'no tuvo occurencia');
			if (d [i] > max) then
				max := d[i];
		end;
end;


	

var
	d : digitos; max: integer;
begin
	cargarDigito (d);
	InformarOcurrenciasyMax(d, max);
	writeln('El digito mas leido es ', max - 1);

end.
