program Pra2Par2Eje13;

	procedure secA(var cumple:boolean;var cant:integer);
	var
		c:char;
	begin
		cant:=0;
		readln(c);
		while (c<>'%') and cumple do begin
			if (c='$') then
				cumple:=false
			else begin
				cant:=cant+1;
				readln(c);
			end;
		end;
	end;

	procedure secB(var cumple:boolean;cant:integer);
	var
		c:char;
		carac,arroba:integer;
	begin
		carac:=0;
		arroba:=0;
		readln(c);
		while (c<>'*') and cumple do begin
			carac:=carac+1;
			if (c='@') then 
				arroba:=arroba+1;
			if (arroba>3) or (cant<carac)then
					cumple:=false
			else				
				readln(c);
		end;
		if (cant<>carac) then
				cumple:=false;
	end;
	
var
	cumple:boolean;
	cant:integer;
begin
	cumple:=true;
	secA(cumple,cant);
	if cumple then begin
		secB(cumple,cant);
		if cumple then
			writeln('Exito Cumple!!!')
		else
			writeln('NO Cumple la Secuencia B');
	end
	else
		writeln('NO Cumple la Secuencia A');
end.
