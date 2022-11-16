Program Pra4Eje11;
const
	dimF=200;
type
	str30=string[30];
	rFoto=record
		titulo:str30;
		autor:str30;
		meGusta:integer;
		clicks:integer;
		comentarios:integer;
	end;
	vFotos=array[1..dimF] of rFoto;
	vCont=array [1..dimF] of integer;
	
	procedure cargarFotos(var v:vFotos);
		procedure LeerFoto(var f:rFoto);
		begin
			with f do begin
				write('Titulo: ');readln(titulo);
				write('Autor: ');readln(autor);
				write('Me Gusta: ');readln(meGusta);
				write('Clicks: ');readln(clicks);
				write('Comentarios: ');readln(comentarios);
			end;
		end;
		
	var
		f:rFoto;
		i:integer;
	begin
		for i:=1 to dimF do begin
			LeerFoto(f);
			v[i]:=f;
		end;
	end;
	
	procedure masVista(titulo:str30; clicks:integer; var maxTitulo:str30; var maxClicks:integer);
	begin
		if (clicks>maxClicks) then begin
			maxClicks:=clicks;
			maxTitulo:=titulo;
		end;
	end;
	
	Procedure EsArt(autor,autorCompara:str30; meGusta:integer; var SumaMeGusta:integer);
	begin
		if (autor=autorCompara) then begin
			SumaMeGusta:=SumaMeGusta+meGusta;
		end;
	end;
	
	procedure procesar(v:vFotos; dimL:integer; var maxTitulo:str30; var SumaMeGusta:integer; var vC:vCont);
	var
		i,maxClicks:integer;
	begin
		maxClicks:=-1;
		SumaMeGusta:=0;
		for i:=1 to dimL do begin
			masVista(v[i].titulo,v[i].clicks,maxTitulo,maxClicks);
			EsArt(v[i].autor,'Art Vandelay',v[i].meGusta,SumaMeGusta);
			vC[i]:=v[i].comentarios;
		end;
	end;
	
	procedure imprimir(vC:vCont;dimL:integer);
	var 
		i:integer;
	begin
		for i:=1 to dimL do
			writeln('Foto ',i,': [',vC[i],'] comentarios');
	end;
	
var
	v:vFotos;
	maxTitulo:str30;
	SumaMeGusta:integer;
	vC:vCont;
begin
	cargarFotos(v);
	procesar(v,dimF,maxTitulo,SumaMeGusta,vC);
	writeln('La foto mas vista: ',maxTitulo);
	writeln('Total de Me gusta cuyo autor es “Art Vandelay”: ',SumaMeGusta);
	imprimir(vC,dimF);
end.














