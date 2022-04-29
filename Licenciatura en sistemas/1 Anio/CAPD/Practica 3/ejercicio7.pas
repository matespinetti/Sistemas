program ejercicio7;
type
	centroInvestigacion = record
		nombre : string;
		universidad : string;
		cantInvestigadores : integer;
		cantBecarios : integer;
	end;
	
	
	minimosBecarios = record
		min1: integer;
		min2: integer;
		min1Centro : string;
		min2Centro: string
	end;
	

procedure leerCentro (var c: centroInvestigacion);
begin
	writeln('Ingrese el nombre abreviado del centro de investigacion');
	readln(c.nombre);
	writeln('Ingrese el nombre de la universidad');
	readln(c.universidad);
	writeln('Ingrese la cantidad de investigadores');
	readln(c.cantInvestigadores);
	writeln('Ingrese la cantidad de becarios');
	readln(c.cantBecarios);
	
end;

procedure calcularMaxInvestigadores (cantInv : integer; universidad : string;  var maxInv : integer; var maxInvUniv: string);
begin
	if (cantInv > maxInv) then
		begin
			maxInv := cantInv;
			maxInvUniv := universidad;
		end;

end;


procedure calcularMinBecarios (cantBecarios : integer; centro : string; var m : minimosBecarios);
begin
	if (cantBecarios < m.min1) then
		begin
			m.min2 := m.min1;
			m.min2Centro := m.min1Centro;
			m.min1 := cantBecarios;
			m.min1Centro := centro;
		end
	else
		if (cantBecarios < m.min2) then
			begin
				m.min2 := cantBecarios;
				m.min2Centro := centro;
			
			end;


end;
var
	centro : centroInvestigacion; 
	minBecarios : minimosBecarios;
	universidadActual, maxInvUniversidad: string;
	cantCentros, cantInv, maxInv : integer;
	

begin
	maxInv := -1; minBecarios.min1:= 30000;
	leerCentro(centro);
	while(centro.cantInvestigadores <> 0) do 
		begin
			cantCentros := 0;
			cantInv:= 0;
			universidadActual := centro.universidad;
			while (universidadActual = centro.universidad) do
				begin
					cantCentros := cantCentros + 1;
					cantInv:= cantInv + centro.cantInvestigadores;
					calcularMinBecarios(centro.cantBecarios, centro.nombre, minBecarios);
					leerCentro(centro);
				
				end;
			calcularMaxInvestigadores (cantInv, universidadActual, maxInv, maxInvUniversidad);
			writeln('La cantidad de centros de la universidad ', universidadActual, ' es de ', cantCentros );
		
		end;
		
	writeln('La universidad con mayor cantidad de investigadores en sus centros es ', maxInvUniversidad, ' con ', maxInv, ' investigadores ' );
	writeln('Los dos centros con menor cantidad de becarios son ', minBecarios.min2Centro, ' con ', minBecarios.min2, ' cantidad de becarios y ', minBecarios.min1Centro, ' con ', minBecarios.min1, ' cantidad de becarios'  )
	


end.
