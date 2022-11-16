{ Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional}

Program Pra0Eje2;
var
	num1,num2,res:integer;
begin
	res:=0;
	write('Ingrese el primer numero: ');readln(num1);
	write('Ingrese el segundo numero: ');readln(num2);
	res:=num1+num2;
	writeln('Utilizando una variable adicional: ', res);
	writeln('Sin utilizar una variable adicional: ', num1+num2);
end.
