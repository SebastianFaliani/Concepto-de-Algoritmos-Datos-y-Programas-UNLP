Program Pra4Par2Eje2;
const
	dimF=500;
type
	str30=string[30];
	vAlumnos=array[1..dimF] of str30;
	
	procedure CargarAlumnos(var vA:vAlumnos; var dimL:integer);
	var
		nom:str30;
	begin
		dimL:=0;
		write('Nombre: ');readln(nom);
		while (nom<>'zzz') and (dimL<dimF) do begin
			dimL:=dimL+1;
			vA[dimL]:=nom;
			if (dimL<dimF) then begin
				write('Nombre: ');readln(nom);
			end;
		end;
	end;
	
	procedure buscar(vA:vAlumnos; nom:str30; dimL:integer; var pos:integer; var ok:boolean);
	begin
		pos:=1;
		while (pos<=dimL) and (vA[pos]<>nom) do 
			pos:=pos+1;
		if (pos<=dimL) and (vA[pos]=nom) then
			ok:=true
		else
			ok:=false;
	end;
	
	procedure Eliminar(nom:str30; var vA:vAlumnos; var dimL:integer; var ok:boolean);
	var 
		pos,i:integer;
	begin
		buscar(vA,nom,dimL,pos,ok);
		if ok then begin
			for i:=pos to dimL-1 do
				vA[i]:=vA[i+1];
			dimL:=dimL-1;
		end;
	end;
	
	procedure Insertar(nom:str30; pos:integer; var vA:vAlumnos; var DimL:integer; var ok:boolean);
	var 
		i:integer;
	begin
		if (pos>=1) and (pos<=dimL) and (dimL<dimF) then begin
			ok:=true;
			for i:=dimL downto pos do 
				vA[i+1]:=vA[i];
			vA[pos]:=nom;
			dimL:=dimL+1;
		end
		else
			ok:=false;
	end;
	
	procedure Agregar(nom:str30; var vA:vAlumnos; var dimL:integer;var ok:boolean); 
	begin
		if (dimL>=0) and (dimL<dimF) then begin
			ok:=true;
			dimL:=dimL+1;
			vA[dimL]:=nom;
		end
		else
			ok:=false;
	end;
	
	procedure imprimir(vA:vAlumnos ;dimL:integer);
	var 
		i:integer;
	begin
		for i:=1 to dimL do
			writeln('[',i,']: ',vA[i]);
	end;

var
	vA:vAlumnos;
	dimL,pos:integer;
	nom:str30;
	ok:boolean;
begin
	CargarAlumnos(vA,dimL);
	write('Eliminar: ');readln(nom);
	Eliminar(nom,vA,dimL,ok);
	if ok then
		writeln('Eliminado con Exito')
	else
		writeln('No Encontrado');
	write('Insertar en la pos 4: ');readln(nom);
	pos:=4;
	Insertar(nom,pos,vA,DimL,ok);
	if ok then
		writeln('Insertado con Exito')
	else
		writeln('No se pudo insertar');
	write('Agregar: ');readln(nom);
	Agregar(nom,vA,dimL,ok);
		if ok then
		writeln('Agregado con Exito')
	else
		writeln('No se pudo Agergar');
	imprimir(vA,dimL);
end.
