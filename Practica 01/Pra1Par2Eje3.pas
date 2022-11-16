program Pra1Par2Eje3;
const
	nota7=7;
type
	str30=string[30];
	notas=1..10;
var
	nombre: str30;
	nota:notas;
	cont7,cont8:integer;
begin
	cont7:=0;
	cont8:=0;
	repeat
		write('Ingrese el nombre: ');readln(nombre);
		write('Ingrese la nota: ');readln(nota);
		if(nota>nota7) then
			cont8:=cont8+1
		else
			if (nota=nota7) then
				cont7:=cont7+1;
	until (nombre='Zidane Zinedine');
	writeln('La cantidad de alumnos aprobados (nota 8 o mayor) son: ', cont8);
	writeln('La cantidad de alumnos que obtuvieron un 7 como nota son: ', cont7);
end.
	
