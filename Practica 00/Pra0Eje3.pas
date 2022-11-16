{Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62}

Program Pra0Eje3;
var
	num1,num2,res:real;
begin
	res:=0;
	write('Ingrese el primer numero real: ');readln(num1);
	write('Ingrese el segundo numero real: ');readln(num2);
	res:=num1/num2;
	writeln('El resultado de dividir ', num1:2:1,' por ',num2:2:1,' es ',res:8:2);
end.
