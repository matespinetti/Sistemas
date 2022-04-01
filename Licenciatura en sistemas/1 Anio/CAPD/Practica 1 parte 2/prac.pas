program sumas;
var
	a, b, res : integer;
	
function jorge(a : integer ; b: integer): integer;
	var
		resultado : integer;
	begin
		resultado := a + b;
		jorge := resultado;
	end;


begin
	read(a);
	read(b);
	res := jorge(a, b);
	writeln(res);
end.
