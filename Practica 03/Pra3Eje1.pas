program Pra3Eje1;
type
	str20 = string[20];
	alumno = record
		codigo : integer;
		nombre : str20;
		promedio : real;
	end;

	procedure leer(var alu : alumno);
	begin
		write('Ingrese el codigo del alumno: '); readln(alu.codigo);
		if (alu.codigo <> 0) then begin
			write('Ingrese el nombre del alumno: '); readln(alu.nombre);
			write('Ingrese el promedio del alumno: '); readln(alu.promedio);
		end;
	end;

	procedure maxPromedio(prom:real; nombre:str20; var maxProm:real; var maxNom:str20);
	begin
		if (prom>maxProm) then begin
			maxProm:=prom;
			maxNom:=Nombre;
		end;
	end;
{ declaración de variables del programa principal }
var
	a : alumno;
	cant: integer;
	maxProm:real;
	maxNom:str20;
{ cuerpo del programa principal }
begin
	cant:=0;
	maxProm:=-1;
	maxNom:=' ';
	leer(a);
	while (a.codigo<>0) do begin
		cant:=cant+1;
		maxPromedio(a.promedio,a.nombre,maxProm,maxNom);
		leer(a);
	end;
	writeln(cant);
	writeln (maxNom);
end.
