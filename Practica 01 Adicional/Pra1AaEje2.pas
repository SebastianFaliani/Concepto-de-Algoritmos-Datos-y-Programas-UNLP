Program Pra1AaEje2;
const
	examenes=5;
var
	i,legajo,cantIng,cantIngEnConRen,cantRec,cantRecEnConRen:integer;
	cantAluAproboTodo,cantAlumPromMayor65,cantAlumCero,cantAprobas:integer;
	maxLegDiez1,maxLegDiez2,maxDiez1,maxDiez2,cantDiez:integer;
	maxLegCero1,maxLegCero2,maxCero1,maxCero2,cantCero:integer;
	condicion:char;
	sumaNotas,nota,porcIngEnConRen,porcRecEnConRen:real;
begin
	cantIng:=0;
	cantIngEnConRen:=0;
	cantRec:=0;
	cantRecEnConRen:=0;
	cantAluAproboTodo:=0;
	cantAlumPromMayor65:=0;
	cantAlumCero:=0;
	maxDiez1:=0;
	maxCero1:=0;
	maxLegDiez1:=-1;
	maxLegCero1:=-1;
	write('Legajo: ');readln(legajo);
	
	while (legajo<>-1) do begin
		cantCero:=0;
		cantDiez:=0;
		sumaNotas:=0;
		cantAprobas:=0;

		write('Condicion: ');readln(condicion);
		for i:=1 to examenes do 
		begin
			write('Ingrese la nota del examen ',i,': ');readln(nota);
			if (nota=0) then
				cantCero:=cantCero+1
			else
			if nota>=4 then begin
				cantAprobas:=cantAprobas+1;
				if nota=10 then
					cantDiez:=cantDiez+1;
			end;
			sumaNotas:=sumaNotas+nota;
		end;
		
		{INGRESANTES en condiciones de rendir el parcial}
		if (condicion='I') then 
			begin
				cantIng:=cantIng+1;
				if (cantAprobas>(examenes*0.75)) then
					cantIngEnConRen:=cantIngEnConRen+1;
			end
		else 
		{RECURSANTES en condiciones de rendir el parcial}
		if (condicion='R') then
			begin
				cantRec:=cantRec+1;
				if (cantAprobas>(examenes*0.75)) then
					cantRecEnConRen:=cantRecEnConRen+1;
			end;
		
		{Aprobaron todas las autoevaluaciones}
		if cantAprobas=5 then
			cantAluAproboTodo:=cantAluAproboTodo+1;
		
		{nota promedio fue mayor a 6.5 puntos}
		if ((sumaNotas/examenes)>6.5) then
			cantAlumPromMayor65:=cantAlumPromMayor65+1;
		
		{obtuvieron cero puntos en al menos una autoevaluación}
		if cantCero>0 then
			cantAlumCero:=cantAlumCero+1;
		
		if (cantDiez>maxDiez1) then begin
			maxDiez2:=maxDiez1;
			maxDiez1:=cantDiez;
			maxLegDiez2:=maxLegDiez1;
			maxLegDiez1:=legajo;
		end
		else
			if (cantDiez>maxDiez2) then begin
				maxDiez2:=cantDiez;
				maxLegDiez2:=legajo;
			end;
			
		if (cantCero>maxCero1) then begin
			maxCero2:=maxCero1;
			maxCero1:=cantCero;
			maxLegCero2:=maxLegCero1;
			maxLegCero1:=legajo;
		end
		else
			if (cantCero>maxCero2) then begin
				maxCero2:=cantCero;
				maxLegCero2:=legajo;
			end;
		write('Legajo: ');readln(legajo);
	end;

	porcIngEnConRen:=(cantIngEnConRen*100)/cantIng;
	porcRecEnConRen:=(cantRecEnConRen*100)/cantRec;

	writeln('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial son: ',cantIngEnConRen);
	writeln('Y porcentaje sobre el total de alumnos INGRESANTES es: ',porcIngEnConRen:3:2);
	writeln('');
	writeln('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial son: ',cantRecEnConRen);
	writeln('Y porcentaje sobre el total de alumnos RECURSANTES es: ',porcRecEnConRen:3:2);
	writeln('');
	writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones (',cantAluAproboTodo,')');
	writeln('');
	writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos (',cantAlumPromMayor65,')');
	writeln('');
	writeln('Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion (',cantAlumCero,')');
	writeln('');
	writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) - (Leg: ',maxLegDiez1,')','(Leg: ',maxLegDiez2,')');
	writeln('');
	writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) - (Leg: ',maxLegCero1,')','(Leg: ',maxLegCero2,')');
	writeln('');
end.
