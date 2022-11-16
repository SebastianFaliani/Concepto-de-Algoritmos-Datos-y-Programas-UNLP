{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}

Program Pra1Eje4;
var
	num,num1:real;
begin
	write('Ingrese el primer numero: ');readln(num1);
	repeat
		write('Ingrese el primer numero: ');readln(num);
	until (num=num1*2);
end.
