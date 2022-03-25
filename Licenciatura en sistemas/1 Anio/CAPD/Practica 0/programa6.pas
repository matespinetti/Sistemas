program ejercicio6;
var
  valorDolares, valorPesos,dolar, porcentajeComision: real;
begin
  write('Ingrese el valor de la transaccion en dolares');
  read(valorDolares);
  write('Ingrese el valor del dolar a la fecha');
  read(dolar);
  write('Ingrese el porcentaje de comision del banco');
  read(porcentajeComision);
  valorPesos:= valorDolares * dolar * (100 + porcentajeComision)/ 100;
  write('La transaccion sera de ', valorPesos:1:2, ' pesos argentinos');
  end.
  
