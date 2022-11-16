{Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2)}

Program Pra0Eje4;
var
	diametro,radio,area,perimetro:real;
begin
	write('Ingrese el diametro del circulo: ');readln(diametro);
	radio:= (diametro)/2;
	writeln('El radio (R) del circulo: ',radio:8:2);
	area:=pi*(radio*radio);
	writeln('El area del circulo: ',area:8:2);
	perimetro:=radio*2*pi;
	writeln('El perimetro del circulo: ',perimetro:8:2);
end.
