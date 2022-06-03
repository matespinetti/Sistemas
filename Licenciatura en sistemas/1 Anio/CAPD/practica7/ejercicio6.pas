program ejercicio6;
const
	dimFCategoria = 7;
type
	categoriaObjeto = 1..dimFCategoria;
	
	objeto = record
		codigo : integer;
		categoria : categoriaObjeto;
		nombre : string;
		distanciaTierra : LongInt;
		nombreDescubridor : string;
		anoDescubrimiento : integer;
	end;
	
	
	max = record
		max1 : integer;
		max2 : integer;
		max1Codigo : integer;
		max2Codigo : integer;
	end;

	listaObjetos = ^nodo;
	
	nodo = record
		elem : objeto;
		sig : listaObjetos;
	end;
	
	contadorCategorias = array [categoriaObjeto] of integer;
	
procedure leerObjeto (var o : objeto);
begin
	writeln ('Ingrese el codigo del objeto');
	readln (o.codigo);
	writeln ('Ingrese la categoria del  objeto');
	readln (o.categoria);
	writeln ('Ingrese el nombre del objeto');
	readln (o.nombre);
	writeln ('Ingrese la distancia a la tierra del objeto');
	readln (o.distanciaTierra);
	writeln ('Ingrese el nombre del descubridor del objeto');
	readln (o.nombreDescubridor);
	writeln ('Ingrese el ano de descubrimiento del objeto');
	readln (o.anoDescubrimiento);


end;

procedure agregarObjeto (var pi : listaObjetos; var pu : listaObjetos; var o : objeto);
var
	nuevo : listaObjetos;

begin
	new (nuevo);
	nuevo^.elem := o;
	nuevo^.sig := nil;
	
	if (pi = nil) then
		begin
			pi := nuevo;
			pu := nuevo;
		
		end
	else
		begin
			pu^.sig := nuevo;
			pu := nuevo;
		
		end;



end;

procedure cargarObjetos (var pi: listaObjetos; var pu: listaObjetos );
var
	o : objeto;

begin
	leerObjeto (o);
	while (o.codigo <> -1) do
		begin
			agregarObjeto (pi, pu, o);
			leerObjeto (o);
		end;


end;


procedure masLejanos (distancia : integer; codigo : integer;  var m : max);
begin
	if (distancia > m.max1) then
		begin
			m.max2 := m.max1;
			m.max2Codigo := m.max1Codigo;
			m.max1 := distancia;
			m.max1Codigo := codigo;
		
		end
	else
		if (distancia > m.max2) then
			begin
				m.max2 := distancia;
				m.max2Codigo := codigo;
			
			end;


end;


procedure inicializarContador (var c : contadorCategorias);
var
	i: integer;
begin
	for i := 1 to dimFCategoria do
		c[i] := 0;


end;

procedure descomponerNumero (codigo : integer; var cantPares : integer; var cantImpares : integer);
var
	dig : integer;
begin
	cantPares := 0;
	cantImpares := 0;
	while (codigo <> 0 ) do
		begin
			dig := codigo MOD 10;
			if ((dig MOD 2) = 0) then
				cantPares := cantPares + 1
			else
				cantImpares := cantImpares + 1;
				
			codigo := codigo DIV 10;
		
		
		end;


end;

function tieneMasPares (codigo : integer) : boolean;
var
	cantP, cantI : integer;
begin
	descomponerNumero (codigo, cantP, cantI);
	tieneMasPares := (cantP > cantI)

end;


procedure procesar ( pi : listaObjetos; var m : max; var cantGalileo : integer; var c: contadorCategorias);
var
	aux : listaObjetos;

begin
	inicializarContador(c);
	cantGalileo := 0;
	m.max1 := -1;
	aux := pi;
	while (aux <> nil) do
		begin
			masLejanos (aux^.elem.distanciaTierra, aux^.elem.codigo, m);
			
			if ((aux^.elem.nombreDescubridor = 'Galileo Galilei') and (aux^.elem.anoDescubrimiento < 1600)) then
				cantGalileo := cantGalileo + 1;
			
			c[aux^.elem.categoria] :=  c[aux^.elem.categoria] + 1;
			
			if ((aux^.elem.categoria = 1) and (tieneMasPares (aux^.elem.codigo))) then
				writeln ('La estrella de nombre ', aux^.elem.nombre, ' tiene un codigo que tiene mas digitos pares que impares');
				
			aux := aux^.sig;
		end;




end;


procedure informarCategorias (c : contadorCategorias);
var
	i: integer;

begin
	for i := 1 to dimFCategoria do
		begin
			writeln ('La cantidad de objetos de la categoria ', i, ' es de ', c[i]);
		
		end;


end;
var
	pi, pu : listaObjetos;
	m : max;
	cantGalileo : integer;
	c: contadorCategorias;

begin
	cargarObjetos (pi, pu);
	procesar (pi, m, cantGalileo, c);
	writeln ('Los codigos de los dos objetos mas lejanos del a tierra son ', m.max1Codigo, ' y ', m.max2Codigo);
	writeln ('La cantidad de planetas descubiertos por galileo galilei antes de 1600 es de ', cantGalileo);
	informarCategorias(c);
	

end.
