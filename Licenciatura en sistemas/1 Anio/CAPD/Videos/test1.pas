
program program1;

type
	persona = record
		dni : integer;
		apellido : string;
		nombre : string;
		ciudadNatal : string;
		fechaDeNacimiento : string;
	end;

	
procedure LeerInformacion(var registro : persona); 
	begin
		writeln('Ingrese su dni');
		readln (registro.dni);
		writeln('Ingrese su apellido');
		readln (registro.apellido);
		writeln('Ingrese su nombre');
		readln (registro.nombre);
		writeln('Ingrese su Ciudad Natal');
		readln (registro.ciudadNatal);
		writeln('Ingrese su fecha de nacimiento');
		readln (registro.fechaDeNacimiento);
	end;
	
function hayMasPar (dni : integer): boolean;
var
	resto, numEntero, cantPar, cantImpar : integer;
	begin
		cantPar:= 0; cantImpar:= 0;
		numEntero := dni;
		while (numEntero <> 0) do 
			begin
				resto := numEntero MOD 10;
				if (resto MOD 2 = 0) then
					cantPar := cantPar + 1
				else
					cantImpar := cantImpar + 1;
				numEntero := numEntero DIV 10;
			end;
		if (cantPar >= cantImpar) then
			hayMasPar := true
		else
			hayMasPar := false;
		
	
	end;

var
	cantPersonas : integer; nombre: persona;
begin
	cantPersonas := 1;
	LeerInformacion (nombre) ;
	while ((nombre.dni <> -1) or (cantPersonas = 500)) do
		begin
			cantPersonas := cantPersonas + 1;
			if ((nombre.ciudadNatal = 'La Plata') and (hayMasPar(nombre.dni))) then
				writeln (nombre.nombre, nombre.apellido);
			LeerInformacion(nombre);
		end;
		
end.
			
			
			
