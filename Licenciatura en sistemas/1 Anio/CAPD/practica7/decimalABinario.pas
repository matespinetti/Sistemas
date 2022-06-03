program DECIMALABINARIO;
type
	RANGOBINARIO = 0 .. 1;
	bit = ^nodo;
	nodo = record
		elem : RANGOBINARIO;
		sig : bit;
	end;



procedure agregarBit (var pi : bit; num : RANGOBINARIO);
var
	nuevo : bit;
begin
	new (nuevo);
	nuevo^.elem := num;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		pi := nuevo
		
	else
		begin
			nuevo^.sig := pi;
			pi := nuevo;
		end;

end;

procedure procesar (num : integer; var pi : bit);
var
	dig : integer;
begin
	while (num <> 0) do
		begin
			dig := num MOD 2;
			agregarBit(pi, dig);
			num := num div 2;
		
		end;


end;


procedure imprimirNumeroBinario (pi : bit);
begin
	while (pi <> nil) do
		begin
			write(pi^.elem);
			pi := pi^.sig;
		
		end;

end;

var
	pi : bit;
	num : integer;

begin
	writeln ('Ingrese un numero a transformar en binario');
	readln(num);
	procesar (num, pi);
	imprimirNumeroBinario(pi);

end.
