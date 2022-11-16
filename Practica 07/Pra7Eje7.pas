Program Pra7Eje7;
const
	dimF=24;
type
	str20=string[20];
	str50=string[50];
	ranNotas=1..dimF;
	rNota=record
		materia:str30;
		nota:integer;
	end;
	vNotas=array[ranNotas]of rNota;
	rAlumno=record
		nro:integer;
		apellido:str20;
		nombre:str20;
		correo:str50;
		ingreso:integer;
		egreso:integer;
		notas:vNotas;
	end;
	lstAlumnos=^nodo;
	nodo=record
		alumno:rAlumno;
		sig:lstAlumnos;
	end;
	
	Procedure LeerNotas(var rN:rNota);
	begin
		with rN do begin
			readln(materia);
			readln(nota);
		end;
	end;
	
	Procedure AgregarNotaOrdenado(var vN:vNotas; dimL:integer; rN:rNota);
	var 
		pos:=integer
	begin
		pos:=1;
		While (dimL>0) and(dmiL<dimF) and (rN.nota<vN[pos].nota) do
			pos:=pos+1;
		if dimL=0 then
			vN[pos]:=rN
		else
		
		
	end;
	
	procedure LeerAlumno(var rA:rAlumno);
	var
		vN:vNotas;
	begin
		with rA do begin
			readln(nro);
			if (nro<>-1) then begin
				readln(apellido);
				readln(nombre);
				readln(correo);
				readln(ingreso);
				readln(egreso);
				LeerNotas(vN);
				notas:=vN;
			end;
		end;
	end;

begin
end.
