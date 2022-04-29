program ejercicio4;
const
	precioMinuto = 3.40;
	precioMB = 1.35;
type
	tipoLinea = record
		numeroTelefono : real;
		cantMinutos : integer;
		cantMB : integer;
		
	
	end;
	cliente = record
		codigo : integer;
		cantLineas : integer;
		linea : tipoLinea 
		
	end;


procedure leerLinea (var l : tipoLinea);
begin
	writeln('Ingrese el numero de telefono');
	readln(l.numeroTelefono);
	writeln('Ingrese la cantidad de minutos ');
	readln(l.cantMinutos);
	writeln('Ingrese la cantidad de megas consumidas');
	readln(l.cantMB);
	
end;

procedure leerCliente(var c : cliente; var totalMinutos : integer; var totalMB : integer);
var
	i: integer;
begin
	writeln('Ignrese el codigo');
	readln(c.codigo);
	writeln('Ingrese la cantidad de lineas');
	readln(c.cantLineas);
	for i := 1 to c.cantLineas do 
		begin
			leerLinea(c.linea); //leer registro linea
			totalMinutos := totalMinutos + c.linea.cantMinutos;
			totalMB := totalMB + c.linea.cantMB;
		end;
end;

function calcularMontoTotal (totalMinutos : integer; totalMB : integer) : real;
begin
	calcularMontoTotal := ((totalMinutos * precioMinuto) + (totalMB * precioMB));
end;

var //del programa
	
	cliente1 : cliente;
	totalMinutos, totalMB, i : integer;

begin
	
	for i := 1 to 9300 do begin
		totalMinutos:= 0; totalMB := 0;
		leerCliente(cliente1, totalMinutos, totalMB);
		writeln('El monto total a facturar del cliente es ', calcularMontoTotal(totalMinutos, totalMB):1:2);
	end;
	
end.
	

