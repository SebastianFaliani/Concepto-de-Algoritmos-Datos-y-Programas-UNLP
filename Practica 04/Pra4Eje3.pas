Program Pra4Eje3;
const 
	dimF=8;
type
	vector=array[1..dimF] of integer;
	
	procedure cargarVector(var v:vector; var dimL : integer);
	var
		num:integer;
	begin
		readln(num);
		dimL:=0;
		while (dimL<dimF) and (num<>0) do begin
			dimL:=dimL+1;
			v[dimL]:=num;
			if (dimL<dimF) then
				readln(num);
		end;
	end;
	
	Procedure ImpPriUlt(v:vector; dimL:integer);
	var
		i:integer;
	begin
		for i:=1 to dimL do 
			write(v[i],', ');
	end;
	
	Procedure ImpUltPri(v:vector; dimL:integer);
	var
		i:integer;
	begin
		for i:=dimL downto 1 do
			write(v[i],', ');
	end;
	
	Procedure ImpMitPriUlt(v:vector; dimL:integer);
	var
		i:integer;
	begin
		for i:=(dimL div 2) downto 1 do
			write(v[i],', ');
		writeln();
		for i:=(dimL div 2) to dimL do 
			write(v[i],', ');
	end;

	Procedure ImpXaY(v:vector; x,y:integer);
	var
		i:integer;
	begin
		if y>x then 
			for i:=x to y do 
				write(v[i],', ')
		else
			for i:=x downto y do 
				write(v[i],', ');
	end;

	Procedure Procesar(v:vector;dimL:integer);
	var
		x,y: integer;
	begin
		ImpPriUlt(v,dimL);
		writeln();
		ImpUltPri(v,dimL);
		writeln();
		ImpMitPriUlt(v,dimL);
		writeln();
		readln(x);
		readln(y);
		ImpXaY(v,x,y);
	end;

	Procedure ProcesarIncisoE(v:vector;dimL:integer);
	begin
		ImpXaY(v,1,dimL);
		writeln();
		ImpXaY(v,dimL,1);
		writeln();
		ImpXaY(v,(dimL div 2),1);
		writeln();
		ImpXaY(v,(dimL div 2),dimL);
		writeln();
	end;
	
var
	v : vector;
	dimL: integer;
begin
	dimL := 0;
	cargarVector(v,dimL);
	Procesar(v,dimL);
	writeln('*********************************');
	ProcesarIncisoE(v,dimL);
end.
