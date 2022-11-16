Program Pra4Eje5;
const 
	dimF=100;
type
	vector=array[1..dimF] of integer;
	
	procedure CargarVector(var v:vector; var dimL:integer);
	var
		num:integer;
	begin
		dimL:=0;
		readln(num);
		while (num<>0) and (dimL<dimF) do begin
			dimL:=dimL+1;
			v[dimL]:=num;
			if (dimL<dimF) then
				readln(num);
		end;
	end;
	
	function posicion(x,dimL:integer; v:vector):integer;
	var
		pos:integer;
		encontrado:boolean;
	begin
		pos:=1;
		encontrado:=false;
		while (pos<=dimL) and (not encontrado) do begin
			if v[pos]=x then
				encontrado:=true
			else
				pos:=pos+1;
		end;
		if encontrado then
			posicion:=pos
		else
			posicion:=-1;
	end;
	
	procedure intercambio(x,y:integer; var v:vector);
	var
		aux:integer;
	begin
		aux:=v[x];
		v[x]:=v[y];
		v[y]:=aux;
	end;
	
	function elementoMaximo(v:vector; dimL:integer):integer;
	var
		i,max:integer;
	begin
		max:=-1;
		for i:=1 to dimL do begin
			if v[i]>max then
				max:=v[i];
		end;
		elementoMaximo:=max
	end;
	
	function elementoMinimo(v:vector; dimL:integer):integer;
	var
		i,min:integer;
	begin
		min:=32675;
		for i:=1 to dimL do begin
			if v[i]<min then
				min:=v[i];
		end;
		elementoMinimo:=min
	end;

	procedure procesar(var max,min,x,y:integer);
	var
		v:vector;
		dimL:integer;
	begin
		CargarVector(v,dimL);
		max:=elementoMaximo(v,dimL);
		x:=posicion(max,dimL,v);
		min:=elementoMinimo(v,dimL);
		y:=posicion(min,dimL,v);
		intercambio(x,y,v);
	end;

var
	max,min,x,y:integer;
begin
	procesar(max,min,x,y);
	writeln('El elemento maximo (',max,') que se encontraba en la posicion [',x,'] fue intercambiado con el elemento minimo (',min,') que se encontraba en la posicion [',y,']');
end.
