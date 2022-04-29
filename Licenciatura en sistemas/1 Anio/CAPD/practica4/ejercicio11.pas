program ejercicio11;
const
	cantFotos = 200;
	
type

	foto = record
		titulo : string;
		autor : string;
		cantMG : integer;
		cantClicks : integer;
		cantComentarios : integer;
	end;
	
	fotos = array [1 .. cantFotos] of foto;

procedure leerFoto (var f: foto);
begin
	writeln('Ingrese el titulo de la foto');
	readln(f.titulo);
	writeln('Ingrese el autor de la foto');
	readln(f.autor);
	writeln('Ingrese la cantidad de me gustas');
	readln(f.cantMG);
	writeln('Ingrese la cantidad de clicks');
	readln(f.cantClicks);
	writeln('Ingrese la cantidad de comentarios');
	readln(f.cantComentarios);
end;


procedure cargarFotos (var f: fotos);
var
	i : integer;
begin
	for i := 1 to cantFotos do
		begin
			leerFoto(f[i]);
		end;
end;



procedure calcularMasVista(f : foto; var maxVista : foto);
begin
	if (f.cantMG > maxVista.cantMG) then
		maxVista.cantMG := f.cantMG;
	
end;


 
procedure recorrerFotos ( f : fotos; var maxVista : foto;);
var
	i : integer;
begin
	for i := 1 to cantFotos do
		begin
			calcularMasVista(f[i]; maxVista);
			
		
		end;


end;















