program ejercicio5;

type
	auto = record
		marca : string;
		modelo : string;
		precio : real;
	end;

procedure leerAuto (var a : auto);
begin
	writeln('Ingrese la marca del auto');
	readln(a.marca);
	writeln('Ingrese el modelo del auto');
	readln(a.modelo);
	writeln('Ingrese el precio del auto');
	readln(a.precio);
end;

function calcularPromedio (cantAutos : integer; precioTotal : real): real;
begin
	calcularPromedio := (precioTotal / cantAutos);
end;

procedure maxAuto(var auto1 : auto; var autoMaximo : auto) ;
begin
	if (auto1.precio > autoMaximo.precio) then
		begin
			autoMaximo.precio := auto1.precio;
			autoMaximo.marca := auto1.marca;
			autoMaximo.modelo := auto1.modelo;
		end;

end;
var
	auto1: auto; autoMaximo: auto;
	marcaActual: string;
	cantAutos : integer; 
	precioTotal: real;
	

begin
	autoMaximo.precio := -1;
	leerAuto(auto1);
	while (auto1.marca <> 'ZZZ') do
		begin
			marcaActual := auto1.marca;
			cantAutos := 0;
			precioTotal := 0;
			while (auto1.marca = marcaActual) do
				begin
					maxAuto (auto1, autoMaximo);
					cantAutos := cantAutos + 1;
					precioTotal := precioTotal + auto1.precio;
					leerAuto(auto1);
				end;
			writeln('El promedio de la marca ', marcaActual, ' es de ', calcularPromedio(cantAutos, precioTotal):1:2);
			
		end;	
	writeln('La marca y modelo del auto mas caro es ', autoMaximo.marca, ' y ', autoMaximo.modelo);
end.			
