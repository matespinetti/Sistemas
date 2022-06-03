program sumadorDeBinariosr8;
type

	numBinario = array [1 .. 8] of LongInt;


procedure descomponerNumero (num : LongInt; var binario : numBinario);
var
	dig, i : integer;
begin
	for i := 8 downto 1 do
		begin
			dig := num mod 10;
			binario [i] := dig;
			num := num DIV 10;
		
		
		end;

end;

procedure inicializarContador (var res : numBinario);
var
	i : integer;

begin
	for i := 1 to 8 do
		res[i] := 0;



end;
procedure SumarBinarios (n1 : numBinario; n2 : numBinario; var resultado : numBinario; var Z: boolean; var V: boolean; var N: boolean; var C: boolean);
var
	i : integer;
	suma : integer;
	carry : numBinario;
begin
	inicializarContador(carry);
	Z := false;
	V := false;
	N := false;
	C := false;
	for i := 8 downto 1 do
		begin
			
			suma := n1[i] + n2[i]+ carry[i];
			
			if (suma <= 1) then
				resultado[i] := suma
			else
				begin
					if (suma = 2) then
						resultado [i] := 0
					else
						resultado [i] := 1;
					if (i > 1) then
						carry[i-1] := 1
					else
						C := true;
				
		
				end;

		end;
		

end;

procedure imprimirNumero (num : numBinario);
var
	i : integer;

begin
	for i := 1 to 8 do
		begin
			write (num[i]);
		
		end;


end;


function esCero (res : numBinario) : boolean;
var
	ok : boolean;
	i : integer;
begin
	ok := true;
	i := 1;
	
	while ((i <= 8) and (ok)) do
		begin
			if (res [i] <> 0) then
				ok := false;
			i := i + 1;
		
		end;
	
	esCero := ok;
end;

procedure procesar (var num1 : numBinario; var num2 : numBinario; var res : numBinario; var z : boolean; var v: boolean; var n : boolean; var c: boolean) ;
var
	n1, n2 : LongInt;

	
begin
	writeln ('Ingrese un numero binario (Hasta 8 bits)');
	readln (n1);
	writeln (' Ingrese el numero binario a sumar (Hasta 8 bits)');
	readln (n2);
	inicializarContador (res);
	descomponerNumero(n1, num1);
	descomponerNumero(n2, num2);
	sumarBinarios (num1, num2, res, z, v, n, c);
	if (res[1] = 1) then
		n := true;
	if (esCero(res)) then
		z := true;
	if (((num1[1] = 1) and (num2[1] = 1) and (res[1] = 0)) or ((num1[1]=0) and (num2[1]= 0) and (res[1] = 1))) then
		v := true;
	
	
	
end;



function elevado (num : integer; exponente : integer) : integer;
var
	resultado : integer;
	i : integer;
begin
	if (exponente = 0) then
		resultado := 1
	else
		begin
			if (exponente = 1) then
				resultado := num
			
			else
				resultado := num;
				for i := 1 to (exponente - 1) do
					begin
						resultado := resultado * num;
					
					end;
		end;


	elevado := resultado;
end;

function binarioADecimal (bin : numBinario) : integer;
var
	i, expo, resParcial, res  : integer;
	
begin
	res := 0;
	expo := 0;
	for i := 8 downto 1 do
		begin
			resParcial := bin[i] * elevado(2, expo);
			res := res + resParcial;
			expo := expo + 1;
		
		end;

	binarioADecimal := res;


end;


procedure interpretarComoCa2 (bin : numBinario; var ca2 : numBinario);
var
	i : integer;
	z,v,n,c : boolean;
	aSumar, ca1 : numBinario;
	
begin
	inicializarContador(aSumar);
	aSumar[8] := 1;
	for i := 1 to 8 do
		begin
			if (bin[i] = 0) then
				ca1[i] := 1
			
			else
				if (bin[i] = 1) then
					ca1[i] := 0;
		
		end;

	sumarBinarios (ca1, aSumar, ca2, z,v,n,c);


end;

var
	n1, n2, res, ca2N1, ca2N2, ca2Res  : numBinario;
	i : integer;
	z, v , n, c : boolean;

begin
	
	procesar (n1, n2, res, z,v,n,c);
	
	writeln ('Resultado : ');
	imprimirNumero (res);
	if (c) then
		writeln (' Hay carry en la operacion');
	if (n) then
		writeln ('El resultado es negativo');
	if (z) then
		writeln ('El resultado de la suma es 0');
	if (v) then
		writeln ('Hay overflow en la suma, por lo tanto el resultado decimal es incorrecto');
		
	
	writeln ('INTERPRETADO EN BSS :');
	
	writeln ('El operando 1 en BSS es ', binarioADecimal (n1));
	writeln('El operando 2 en BSS es ', binarioADecimal (n2));
	writeln ('El resultado en BSS es ', binarioADecimal (res));
	
	writeln ('INTERPRETADO EN CA2');
	
	if ((n1[1] = 1)) then
		begin
			interpretarComoCa2(n1, ca2N1);
			n1 := ca2N1;
			writeln('El operando 1 es ', -(binarioADecimal(n1)));
		end

	else
		writeln ('El operando 1 es ', binarioADecimal(n1));
	
	if ((n2[1] = 1)) then
		begin
			interpretarComoCa2 (n2, ca2N2);
			n2 := ca2N2;
			writeln('El operando 2 es ', -(binarioADecimal (n2)));
		end
	else
		writeln ('El operando 2 es ', binarioADecimal(n2));
		
	if (res[1]= 1) then
		begin
			interpretarComoCa2 (res, ca2Res);
			res := ca2Res;
			writeln('El resultado es ', - (binarioADecimal(res)));
		end
	else
		writeln('El resultado es ', (binarioADecimal(res)));
	
		
end.
