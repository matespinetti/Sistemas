program ejercicio10;

const
	cantEmpleados = 300;

type
	salarios = array [1 .. cantEmpleados] of real;

procedure cargarSalarios (var s: salarios; var dimL: integer);
var
	salario : real;
begin
	writeln('Ingrese un salario');
	read (salario);
	while ((salario <> 0) and (dimL < cantEmpleados)) do
		begin
			dimL := dimL + 1;
			s[dimL] := salario;
			writeln('Ingrese otro salario');
			read(salario);
		end;

end;

function salarioPromedio (totalSalarios : real; dimL : integer) : real;
begin
	salarioPromedio := (totalSalarios / dimL);

end;


procedure recorrerSalarios (var s : salarios; dimL : integer; porcentaje: integer);
var
	totalSalarios: real; i : integer;
begin
	totalSalarios := 0;
	for i := 1 to dimL do
		begin
			s[i] := (s[i] * (100 + porcentaje)) / 100;
			totalSalarios := totalSalarios + s[i];
		
		end;
	writeln('El salario promedio es de ', salarioPromedio(totalSalarios, dimL));
	

end;


var
	s : salarios;
	dimL : integer;

begin
	dimL := 0;
	cargarSalarios(s, dimL);
	recorrerSalarios(s, dimL, 15);


end.
