program Pra6Eje15;
const
	dimF=5;
type
	str30=string[30];
	rAlumno=record
		dni:longint;
		apellido:str30;
		nombre:str30;
		nota:integer;
	end;
	lstAlumnos=^nodo;
	nodo=record
		alumno:rAlumno;
		sig:lstAlumnos;
	end;
	vAlumnos=array[1..dimF] of lstAlumnos;
	vCont=array[1..dimF] of integer;
	
	procedure Inicializar(var vA:vAlumnos; var vC:vCont);
	var
		i:integer;
	begin
		for i:=1 to dimF do begin
			vA[i]:=nil;
			vC[i]:=0;
		end;
	end;

	procedure Agregar(var l:lstAlumnos; rA:rAlumno);
	var
		aux:lstAlumnos;
	begin
		new(aux);
		aux^.alumno:=rA;
		aux^.sig:=l;
		l:=aux;
	end;
	
	function Turno(vC:vCont; nota:integer):integer;
	var
		i:integer;
	begin
		if (nota>=8) then
			if (vC[1]<=vC[4]) then
				i:=1
			else
				i:=4
		else
		if(nota>=5) and (nota<8) then begin
			if (vC[2]<=vC[3]) and (vC[2]<=vC[5]) then
				i:=2
			else
			if (vC[3]<vC[2]) and (vC[3]<=vC[5]) then
				i:=3
			else
				i:=5
		end
		else
			i:=-1;
		turno:=i
	end;
	
	Procedure Procesar(l:lstAlumnos; var vA:vAlumnos; var vC:vCont);
	var
		i:integer;
	begin
		Inicializar(vA,vC);
		while (l<>nil) do begin
			i:=Turno(vC,l^.alumno.nota);
			if i<>-1 then begin
				vC[i]:=vC[i]+1;
				Agregar(vA[i],l^.alumno);
			end;
			l:=l^.sig;
		end;
	end;	

	procedure imprimir(vA:vAlumnos);
	var 
		i:integer;
	begin
		for i:=1 to dimF do begin
			writeln('******* LISTADO TURNO [',i,'] *******');
			while (vA[i]<>nil) do begin
				writeln(vA[i]^.alumno.apellido);
				vA[i]:=vA[i]^.sig;
			end;
		end;
	end;

var	
	l:lstAlumnos; 
	vA:vAlumnos; 
	vC:vCont;
begin
	l:=nil;
	CargarLista(l); //se dispone
	Procesar(l,vA,vC);
	imprimir(vA)
end.
