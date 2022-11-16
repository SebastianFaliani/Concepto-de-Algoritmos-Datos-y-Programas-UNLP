Program Pra4Par2Eje1;
const
	dimF=500;
type
	vector=array[1..dimF] of integer;
	
	procedure CargarVector(var v:vector;var dimL:integer);
	begin
	
	end;
	
	function buscar(v:vector;n,dimL:integer):boolean;
	var
		pos:integer;
		esta:boolean;
	begin
		pos:=1;
		while (pos<=dimL) and (v[pos]<>n) do begin
			pos:=pos+1;
		end;
		if (pos<=dimL) and (v[pos]=n) then
			esta:=true
		else
			esta:=false;
		buscar:=esta;
	end;
	
	function BuscarOrdenado(v:vector;n,dimL:integer):boolean;
	var
		pri,medio,ult:integer;
		esta:boolean;
	begin
		pri:=1;
		ult:=dimL;
		medio:=(pri+ult) div 2;
		while (pri<=ult) and (v[medio]<>n) do begin
			if v[medio]>n then
				ult:= medio-1
			else
				pri:=medio+1;
			medio:=(pri+ult) div 2;	
		end;
		
		if (pri<=ult) and (v[medio]=n) then
			esta:=true
		else
			esta:=false;
		BuscarOrdenado:=esta;
	end;
	
var
	v:vector;
	n,dimL:integer;
begin
	CargarVector(v,dimL); //se Dispone
	Write('Buscar: ');Readln(n);
	writeln(Buscar(v,n,dimL));
	writeln(BuscarOrdenado(v,n,dimL));
end.
