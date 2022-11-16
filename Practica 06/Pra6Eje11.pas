program Pra6Eje11;
const
	dimF=10;
type
	str20=string[20];
	rango=1..dimF;
	rAlumno=record
		nro:integer;
		apellido:str20;
		nota:real;
	end;
	lstAlumnos=^nodo;
	nodo=record
		alumno:rAlumno;
		sig:lstAlumnos;
	end;
	vMejoresDiez=array[rango] of rAlumno;
	
	procedure Inicializar(var vM:vMejoresDiez);
	var
		i:rango;
	begin
		for i:=1 to dimF do
			vM[i].nota:=-1;
	end;
	
	procedure LeerAlumno(var rA:rAlumno);
	begin
		with rA do begin
			write('Nro: '); readln(nro);
			if nro<>0 then begin
				write('Apellido: '); readln(apellido);
				write('Nota: '); readln(nota);
			end;
		end;
	end;

	procedure Agregar (var l:lstAlumnos; rA:rAlumno);
	var
		aux:lstAlumnos;
	begin
		new(aux);
		aux^.alumno:=rA;
		aux^.sig:=l;
		l:=aux
	end;

	procedure CargarLista(var l:lstAlumnos);
	var
		rA:rAlumno;
	begin
		LeerAlumno(rA);
		while rA.nro<>0 do begin
			Agregar(l,rA);
			LeerAlumno(rA);
		end;
	end;

	procedure DiezMejores(var vM:vMejoresDiez; rA:rAlumno);
	var
		i,j:integer;
	begin
		i:=1;
		while (i<=dimF) and (rA.nota<=vM[i].nota) do
			i:=i+1;
		if (i<=dimF) then begin
			for j:=dimF downto i do
				vM[j]:=vM[j-1];
			vM[i]:=rA;
		end;
	end;

	procedure procesar(l:lstAlumnos; var vM:vMejoresDiez);
	begin
		Inicializar(vM);
		while l<>nil do begin
			DiezMejores(vM,l^.alumno);
			l:=l^.sig;
		end;
	end;
	
	procedure Imprimir(vM:vMejoresDiez);
	var
		i:rango;
	begin
		for i:=1 to dimF do
			writeln('Apellido: ', vM[i].apellido,' Nota[',vM[i].nota:2:2,']');
	end;
	
var
	l:lstAlumnos; 
	vM:vMejoresDiez;
begin
	l:=nil;
	CargarLista(l);
	procesar(l,vM);
	Imprimir(vM);
end.
