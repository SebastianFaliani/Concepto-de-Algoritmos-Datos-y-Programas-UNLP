Program Pra4Eje6;
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
	
	Procedure PosMaxMin(v:vector; dimL:integer;var posMax,posMin:integer);
	var
		max,min,i:integer;
	begin
		max:=-1;
		min:=32675;
		for i:=1 to dimL do begin
			if v[i]>max then begin
				max:=v[i];
				posMax:=i;
			end;
			if v[i]<min then begin
				min:=v[i];
				posMin:=i;
			end;
		end;
	end;
	

	procedure procesar(var posMax,posMin:integer);
	var
		v:vector;
		dimL:integer;
	begin
		CargarVector(v,dimL);
		PosMaxMin(v,dimL,posMax,posMin);
	end;

var
	posMax,posMin:integer;
begin
	procesar(posMax,posMin);
	writeln('La posicion del maximo es [',posMax,']');
	writeln('La posicion del minimo es [',posMin,']');
end.
