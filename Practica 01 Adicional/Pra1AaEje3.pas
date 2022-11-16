Program Pra1AaEje3;

var 
	tipo:char;
	ancho,largo,alto,radio,vol,volMax1,volMax2,promTodosCil,promTodosRec:real;
	cantRec,cantCil,cantAlto140,cantVol800:integer;
begin
	volMax1:=0;
	cantRec:=0;
	cantCil:=0;
	cantAlto140:=0;
	cantVol800:=0;
	promTodosRec:=0;
	promTodosCil:=0;
	write('Ingrese el tipo de tanque [R] [C] [Z]: ');readln(tipo);
	while (tipo<>'Z') do begin
		write('Ingrese el Alto: ');readln(alto);
		if tipo='R' then begin
			write('Ingrese el Ancho: ');readln(ancho);
			write('Ingrese el Largo: ');readln(largo);
			vol:=ancho*largo*alto;
			cantRec:=cantRec+1;
			promTodosRec:=promTodosRec+vol;
		end
		else begin
			write('Ingrese el Radio: ');readln(radio);
			vol:=pi*(radio*radio)*alto;
			cantCil:=cantCil+1;
			promTodosCil:=promTodosCil+vol;
		end;
		if (alto<1.40) then
			cantAlto140:=cantAlto140+1;
		if (vol<800) then
			cantVol800:=cantVol800+1;
		
		if (vol>volmax1) then begin
			volmax2:=volmax1;
			volmax1:=vol;
		end
		else
		if (vol>volmax2) then
			volmax2:=vol;
		
		write('Ingrese el tipo de tanque [R] [C] [Z]: ');readln(tipo);
	end;
	promTodosRec:=promTodosRec/cantRec;
	promTodosCil:=promTodosCil/cantCil;
	writeln('Volumen de los dos mayores tanques vendidos: (',volMax1:4:2,') (',volMax2:4:2,')');
	writeln('Volumen promedio de todos los tanques cilindricos vendidos: (',promTodosCil:4:2,')');
	writeln('Volumen promedio de todos los tanques rectangulares vendidos: (',promTodosRec:4:2,')');
	writeln('Cantidad de tanques cuyo alto sea menor a 1.40 metros: (',cantAlto140,')');
	writeln('Cantidad de tanques cuyo volumen sea menor a 800 metros cubicos: (',cantVol800,')');
end.
