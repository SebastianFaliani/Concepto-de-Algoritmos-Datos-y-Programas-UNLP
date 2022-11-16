{Realizar un programa que lea un número real e imprima su valor absoluto}

Program Pra1Eje2;
var
	num,absoluto:real;
begin
	write('Ingrese un numero real: ');readln(num);
	if num<0 then
		absoluto:=num*-1
	else
		absoluto:=num;
	writeln('El valor absoluto de', num:8:2,' es:',absoluto:8:2);
end.
