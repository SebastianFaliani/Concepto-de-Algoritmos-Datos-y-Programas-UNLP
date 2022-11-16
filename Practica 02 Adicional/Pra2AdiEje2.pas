program Pra2AdiEje2;
const
	fin=3;
	procedure Leer(var x,y:integer);
	begin
		readln(x);
		readln(y);
	end;

	function sumar(x,y:integer):longint;
	begin
		sumar:=x+y;
	end;
	
	function multiplicar(x,y:integer):longint;
	begin
		multiplicar:=x*y;
	end;
	
	procedure procesar();
	var
		suma,producto:longint;
		i,j,x,y:integer;
	begin
		for i:=1 to fin do begin
			suma:=0;
			producto:=1;
			Leer(x,y);
			if (x<Y) then
				for j:=x to y do begin
					suma:=sumar(suma,j);
					producto:=multiplicar(producto,j);
				end;
			writeln(suma);
			writeln(producto);
		end;
	end;
	
begin
	procesar();
end.	
