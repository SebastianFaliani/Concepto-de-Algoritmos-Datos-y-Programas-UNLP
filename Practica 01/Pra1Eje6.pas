{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}

Program Pra1Eje6;
var
	legajo,canAlu,canAluSup6,canAluSup8:integer;
	promedio:real;
	
begin
	canAlu:=0;
	canAluSup6:=0;
	canAluSup8:=0;
	write('Ingrese el legajo: ');readln(legajo);
	while (legajo<>-1) do begin
		write('Ingrese el promedio: ');readln(promedio);
		canAlu:=canAlu+1;
		{Cantidad Alumnos con Promedio mayor 6.5}
		if (promedio>6.5) then
			canAluSup6:=canAluSup6+1;
		{Cantidad Alumnos con Promedio mayor 8.5 y legajo menor a 2500}
		if(promedio>8.5)and (legajo<2500) then
			canAluSup8:=canAluSup8+1;
		write('Ingrese otro Legajo: ');readln(legajo);
	end;
	writeln('La cantidad de alumnos leidos es: ',canAlu);
	writeln('La cantidad de alumnos cuyo promedio supera 6.5 es: ',canAluSup6);
	writeln('El porcentaje de alumnos destacados (supera 8.5 legajo menor que 2500) es: ',((canAluSup8*100)/canAlu):3:2);
	
end.
