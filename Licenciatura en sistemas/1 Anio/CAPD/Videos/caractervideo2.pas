program teoria2;
var
	car: char;
	carMay, carMin, carDig, carEsp: integer;
begin
	carMay:= 0; carMin:=0; carDig:=0;  carEsp:= 0;
	writeln('Escribe un caracter distinto al =');
	read(car);
	while (car <> '=') do
		begin
			case car of

					'a'..'z' : carMin := carMin + 1;
					'A'..'Z' : carMay := carMay + 1;
					'0'..'9' : carDig := carDig + 1;
					else carEsp:= carEsp + 1;
				end;
		
			writeln('Escribe otro caracter');
			read (car);
		end;
		writeln('La cantidad de caracteres minuscula es ', carMin);
		writeln('La cantidad de caracteres mayuscula es ', carMay);
		writeln('La cantidad de caracteres digito es ', carDig);
		writeln('La cantidad de caracteres especiales es ', carEsp)
end.
