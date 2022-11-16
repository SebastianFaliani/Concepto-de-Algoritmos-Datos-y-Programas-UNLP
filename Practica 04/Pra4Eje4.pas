Program Pra4Eje4;
const 
	dimF=15;
type
	vector=array[1..dimF] of integer;
	
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
	
	function sumaVector(v:vector; dimL:integer):integer;
	var
		i,suma:integer;
	begin
		suma:=0;
		for i:=1 to dimL do
			suma:=suma+v[i];
		sumaVector:=suma;
	end;
	
	function promedio(v:vector; dimL:integer):real;
	begin
		promedio:=sumaVector(v,dimL)/dimL;
	end;
	
	function elementoMaximo(v:vector; dimL:integer):integer;
	var
		i,max,posMax:integer;
	begin
		max:=-1;
		for i:=1 to dimL do begin
			if v[i]>max then begin
				max:=v[i];
				posMax:=i;
			end;
		end;
		elementoMaximo:=posMax
	end;
	
	function elementoMinimo(v:vector; dimL:integer):integer;
	var
		i,min,posMin:integer;
	begin
		min:=32675;
		for i:=1 to dimL do begin
			if v[i]<min then
				min:=v[i]
				posMin:=i;
		end;
		elementoMinimo:=posMin;
	end;



begin

end.
