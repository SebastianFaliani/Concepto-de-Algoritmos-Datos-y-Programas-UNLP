Program Pra4Par2Eje4;
const 
	dimF=1000;
type
	str30=string[30];
	rAlumno=record
		nro:integer;
		apellido:str30;
		nombre:str30;
		asistencias:integer;
	end;
	
	vAlumnos=array[1..dimF] of rAlumno;
	
	procedure LeerAlumno(var rA:rAlumno);
	begin
		with rA do begin
			write('Nro: ');readln(nro);
			write('Apellido: ');readln(apellido);
			write('Nombre: ');readln(nombre);
			write('Asistencias: ');readln(asistencias);
		end;
	end;

	Procedure CargarAlumnos(var vA:vAlumnos; var dimL:integer); //Se dispone
	begin
	end;
	
	//Modulo A
	function BuscarPosicionOrdenado(vA:vAlumnos; nro,dimL:integer):integer;
	var
		pri,pos,ult:integer;
	begin
		pri:=1;
		ult:=dimL;
		pos:=(pri+ult)div 2;
		while (vA[pos].nro<>nro) do begin
			if va[pos].nro>nro then
				ult:=pos-1
			else
				pri:=pos+1;
			pos:=(pri+ult)div 2;
		end;
		BuscarPosicionOrdenado:=pos;
	end;
	
	//Modulo B
	procedure Insertar(vA:vAlumnos;rA:rAlumno;var dimL:integer; var ok:boolean);
		function posicion(vA:vAlumnos;rA:rAlumno;dimL:integer):integer;
		var 
			pos:integer;
		begin
			if (dimL>0) then begin
				pos:=1;
				while (pos<=dimL) and (rA.nro>vA[pos].nro) do
					pos:=pos+1;
			end
			else
				pos:=0;
			posicion:=pos;
		end;
	
	var
		i,pos:integer;
	begin
		pos:=posicion(vA,rA,dimL);
		if (pos>0) and (pos<=dimL) and (dimL<dimF) then begin
			ok:=true;
			for i:=dimL to pos do 
				vA[i+1]:=vA[i];
			vA[pos]:=rA;
			dimL:=dimL+1;
		end
		else
			ok:=false;
	end;
	
	//Modulo C
	Procedure Eliminar(var vA:vAlumnos; var dimL:integer; pos:integer; var ok:boolean);
	var
		i:integer;
	begin
		if (pos>0) and (pos<=dimL)then begin
			ok:=true;
			for i:=pos to dimL-1 do
				vA[i]:=vA[i+1];
			dimL:=dimL-1;
		end
		else
			ok:=false;
	end;
	
	//Modulo D
	procedure BuscarEliminar(var vA:vAlumnos; var dimL:integer; nro:integer; var ok:boolean);
	var
		pos:integer;
	begin
		pos:=BuscarPosicionOrdenado(vA,nro,dimL);
		Eliminar(vA,dimL,pos,ok);
	end;
	
	//Modulo E
	procedure EliminarCeroAsistencias(var vA:vAlumnos; var dimL:integer; asi:integer; var ok:boolean);
		function BuscarPosicionDesordenado(var vA:vAlumnos; dimL:integer; asi:integer):integer;
		var
			pos:integer;
		begin
			if (dimL>0) then begin
				pos:=1;
				while (pos<=dimL) and (vA[pos].asistencias<>asi) do
					pos:=pos+1;
				if (pos>dimL) then
					pos:=-1;
			end
			else
				pos:=-1;
			BuscarPosicionDesordenado:=pos;
		end;
	
	var
		pos:integer;
	begin
		pos:=BuscarPosicionDesordenado(vA,dimL,asi);
		Eliminar(vA,dimL,pos,ok);
	end;
	
var
	vA:vAlumnos;
	dimL:integer;
begin
	CargarAlumnos(vA,dimL);
end.
