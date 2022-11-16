program Pra2Par2Eje10;

	procedure procesarNumeros(num:Longint; var suma_pares,cant_impares:integer);
		function es_par(num:integer):boolean;
		begin
			es_par:=(num mod 2)=0;
		end;
	
	var
		dig:integer;
	begin
		suma_pares:=0;
		cant_impares:=0;
		while (num<>0) do begin
			dig:=num mod 10;
			if es_par(num) then
				suma_pares:=suma_pares+ dig
			else
				cant_impares:=cant_impares+1;
			num:=num div 10;
		end;
	end;
	
	procedure procesar;
	var
		num:longint;
		suma_pares,cant_impares:integer;
	begin
		repeat
			readln(num);
			procesarNumeros(num,suma_pares,cant_impares);
			writeln(suma_pares);
			writeln(cant_impares);
		until(num=123456);
	end;
	
begin
	procesar;
end.
