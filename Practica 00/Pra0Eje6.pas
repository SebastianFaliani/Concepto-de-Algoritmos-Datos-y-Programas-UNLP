{Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del 
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
189,32 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)}

Program Pra0Eje6;
var
	transaccion,dolares,precio,comision:real;
begin
	write('Ingrese Total en dolares: '); readln(dolares);
	write('Ingrese el valor del dolar: '); readln(precio);
	write('Ingrese el porcentaje de la comision: '); readln(comision);
	transaccion:=(dolares*precio)+(dolares*precio*comision)/100;
	writeln('La transaccion sera de ',transaccion:8:2 ,' pesos argentinos')
end.
