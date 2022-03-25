program ejercicio8;
var
	char1,char2,char3: char;
begin
  writeln('Ingrese un caracter');
  read(char1);
  writeln('Ingrese otro caracter');
  read(char2);
  writeln('Ingrese un tercer caracter');
  read(char3);
  
  if (((char3) and (char2) and (char3))=(('a')or('e')or('i')or('o')or('u'))) then
	writeln('Todos los caracteres ingresados son vocales');

end.
