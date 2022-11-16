program Pra2Par2Eje9;
	procedure Suma_Dig(num:Longint; var cant_dig,suma:integer);
	var
		dig:integer;
	begin
		suma:=0;
		cant_dig:=0;
		while (num<>0) do begin
			dig:=num mod 10;
			suma:=suma+dig;
			cant_dig:=cant_dig + 1;
			num:=num div 10;
		end;
	end;

	procedure procesar(var total_dig:integer);
	var
		num:Longint;
		cant_dig,suma:integer;
	begin
		total_dig:=0;
		repeat
			readln(num);
			suma_Dig(num,cant_dig,suma);
			total_dig:=total_dig +cant_dig;
		until (suma=10);
	end;

var
	total_dig:integer;
begin
	procesar(total_dig);
	writeln(total_dig);
end.
