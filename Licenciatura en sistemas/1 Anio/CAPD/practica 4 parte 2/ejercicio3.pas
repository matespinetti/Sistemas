program ejercicio3;
const
	dimF = 200;
type
	TIPODIA = 1..31;
	viaje = record
		diaMes : TIPODIA;
		monto : real;
		distancia : real;
	end;

	viajes = array [1 .. dimF] of viaje;
	
	
procedure leerViaje (var v: viaje);
begin
	writeln('Ingrese el dia del mes');
	readln(v.diaMes);
	writeln('Ingrese el monto de dinero transportado');
	readln(v.monto);
	writeln('Ingrese la distancia recorrida por el camiom');
	readln(v.distancia);


end;

procedure cargarViajes (var v: viajes; var dimL : integer);
var
	vj : viaje;
begin
	dimL := 0;
	leerViaje(vj);
	while ((dimL <= dimF) and (vj.distancia <> 0)) do
		begin
			dimL := dimL + 1;
			v[dimL] := vj;
			leerViaje(vj);

		end;


end;

function calcularMontoPromedio (montoTotal: real; dimL : integer): real;
begin
	calcularMontoPromedio := (montoTotal / dimL);
end;



procedure minimoMonto (v : viaje; var min: viaje);
begin
	if (v.monto < min.monto) then
		min := v;

end;


procedure procesar (v: viajes; dimL : integer; var montoPromedio : real; var min: viaje );
var
	i : integer;
	montoTotal : real;
begin
	montoTotal := 0;
	for i := 1 to dimL do
		begin
			montoTotal := montoTotal + v[i].monto;
			minimoMonto(v[i], min);
			
		end;
	montoPromedio := calcularMontoPromedio(montoTotal, dimL);
	
				
		
end;




