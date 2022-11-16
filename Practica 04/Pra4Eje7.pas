Program Pra4Eje7;
const
	dimF=9;
type
	rango=0..dimF;
	vectorCont=array[rango] of integer;
	
	procedure inicializar(var v:vectorCont);
	var
		i:rango;
	begin
		for i:=0 to dimF do
			v[i]:=0;
	end;
	
	
	procedure CargarVector(var v:vectorCont);
		procedure descomponer(var v:vectorCont; num:integer);
		var 
			dig:rango;
		begin
			while (num<>0) do begin
				dig:=num mod 10;
				v[dig]:=v[dig]+1;
				num:=num div 10;
			end;
		end;

	var
		num:integer;
	begin
		inicializar(v);
		readln(num);
		while (num<>-1) do begin
			descomponer(v,num);
			readln(num);
		end;
	end;
	
	procedure masLeido(num,id:integer; var max,idMax:integer);
	begin
		if (num>max) then begin
			max:=num;
			idMax:=id;
		end;
	end;
	
	procedure procesar(var idMax,dimL:integer; var sinOcurrencias:vectorCont);
	var
		v:vectorCont;
		i,max:integer;
	begin
		max:=-1;
		dimL:=-1;
		CargarVector(v);
		for i:=0 to dimF do begin
			if (v[i]>0) then
				writeln('Numero ',i,': ',v[i],' veces')
			else
			begin
				dimL:=dimL+1;
				sinOcurrencias[dimL]:=i;
			end;
			masLeido(v[i],i,max,idMax);
		end;
	end;
	
	procedure imprimir(v:vectorCont;dimL:integer);
	var
		i:rango;
	begin
	write('Los digitos que no tuvieron ocurrencias son: ');
		for i:=0 to dimL do
			write(v[i],', ');
	end;

var
	idMax,dimL:integer;
	sinOcurrencias:vectorCont;	
begin
	procesar(idMax,dimL,sinOcurrencias);
	writeln('El digito mas leido fue el ',idMax);
	imprimir(sinOcurrencias,dimL);
end.
	
	
	
