program ejercicio2;
type
	fecha = record
		dia : integer;
		mes : integer;
		ano: integer;
	end;
	
	casamiento = record
		fechaCasamiento : fecha;
	end;
	
procedure leerFecha(var f : fecha);
begin
	writeln('Ingrese el dia');
	readln(f.dia);
	writeln('Ingrese el mes');
	readln(f.mes);
	writeln('Ingrese el ano');
	readln(f.ano);
end;

function esVerano (mes : integer) : boolean;
begin
	esVerano := (mes = 1) or (mes = 2) or (mes = 3);

end;

function primeros10 (dia : integer): boolean;
begin

	primeros10 := (dia >= 1) and (dia <= 10)

end;
var
	casamiento1: casamiento; 
	cantVerano, cant10: integer;
begin
	cantVerano:= 0; cant10:= 0;
	leerFecha(casamiento1.fechaCasamiento);
	while(casamiento1.fechaCasamiento.ano <> 2020) do
		begin
			if (esVerano(casamiento1.fechaCasamiento.mes)) then
				cantVerano:= cantVerano + 1;
			if (primeros10(casamiento1.fechaCasamiento.dia)) then
				cant10 := cant10 + 1;
			leerFecha(casamiento1.fechaCasamiento);
		end;
	writeln('La cantidad de casamientos realizados en el verano es de ', cantVerano);
	writeln('La cantidad de casamientos realizados en los primeros 10 dias del mes es de ', cant10);
end.
