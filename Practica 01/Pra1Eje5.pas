{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

Program Pra1Eje5;
var
	cont:integer;
	EsDoble:boolean;
	num,num1:real;
begin
	cont:=0;
	write('Ingrese el primer numero: ');readln(num1);
	repeat
		write('Ingrese el primer numero: ');readln(num);
		cont:=cont+1;
		EsDoble:=(num=num1*2);
	until EsDoble or (cont=10);
	if not EsDoble then
		writeln('No se ha ingresado el doble de ',num1:4:2);
end.
