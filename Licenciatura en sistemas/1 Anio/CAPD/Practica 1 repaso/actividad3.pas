program actividad3;
const
	pi = 3.14;
var
	tipoTanque : char;
	ancho, largo, alto, radio, volumen, max1, max2, volumenPromedioC, sumaVolumenC, volumenPromedioR, sumaVolumenR  : real;
	cantTanquesC, cantTanquesR, cantMenorA140, cantMenorA800: integer;
	

begin
	max1 := -1; sumaVolumenC:= 0; cantTanquesC:= 0; sumaVolumenR := 0; cantTanquesR:= 0; cantMenorA140:= 0; cantMenorA800:= 0;
	writeln('Ingrese el tipo de tanque');
	read (tipoTanque);
	while (tipoTanque <> 'Z') do
		begin
			if (tipoTanque = 'R') then
				begin
					writeln ('Ingrese el ancho del tanque rectangular');
					readln (ancho);
					writeln ('Ingrese el largo del tanque rectangular');
					readln (largo);
					writeln ('Ingrese el alto del tanque rectangular');
					readln (alto);
					volumen := ancho * largo * alto;
					sumaVolumenR := sumaVolumenR + volumen;
					cantTanquesR := cantTanquesR + 1;
				
				end
			else
				if (tipoTanque = 'C') then
					begin
							writeln('Ingrese el alto del tanque circular');
							readln (alto);
							writeln('Ingrese el radio del tanque circular');
							readln (radio);
							volumen := pi * radio * radio * alto;
							sumaVolumenC := sumaVolumenC + volumen;
							cantTanquesC := cantTanquesC + 1;
							
					
					end;
			if (alto < 1.40) then
				cantMenorA140:= cantMenorA140 + 1;
			
			if (volumen < 800) then
				cantMenorA800 := cantMenorA800 + 1;
				
			if (volumen > max1) then
				begin
					max2 := max1;
					max1 := volumen;
				
				end
				
			else
				if (volumen > max2) then
					max2:= volumen;
			
			writeln('Ingrese el tipo de tanque');
			read (tipoTanque);
		end;
		
		
	volumenPromedioC := sumaVolumenC / cantTanquesC;
	volumenPromedioR := sumaVolumenR / cantTanquesR;
		
	
	writeln ('Los dos mayores tanques vendidos tienen volumen de ', max1:1:2, ' y ', max2:1:2, ' metros cubicos');
	writeln ('El volumen promedio de todos los tanque cilindricos vendidos es de ', volumenPromedioC:1:2);	
	writeln ('El volumen promedio de todos los tanques rectangulares vendidos es de ', volumenPromedioR:1:2);
	writeln('La cantidad de tanques con altura menor a 1.40 metros es de ', cantMenorA140);
	writeln ('La cantidad de tanques con volumen menor a 800 metros cubicos es de ', cantMenorA800);
	
	
	
	
		
		
end.
