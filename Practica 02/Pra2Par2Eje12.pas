program Pra2Par2Eje12;
	function esVocal(c:char):boolean;
	begin
		esVocal:= (c='a') or (c='A') or (c='e') or (c='E') or (c='i') or (c='I') 
									or (c='o') or (c='O') or (c='u') or (c='U');
	end;

	function esLetra(c:char):boolean;
	begin
		esLetra:= ((c>'a') and (c<'z')) or ((c>'A') and (c<'Z'));
	end;
	
	procedure secA(var cumple:boolean);
	var 
		c:char;
	begin
		readln(c);
		while (c<>'$') and cumple do begin
			if (not esVocal(c)) then
				cumple:=false
			else
				readln(c);
		end;
	end;

	procedure secB(var cumple:boolean);
	var 
		c:char;
	begin
		readln(c);
		while (c<>'#') and cumple do begin
			if (esVocal(c)) or (not esLetra(c))  then
				cumple:=false
			else
				readln(c);
		end;
	end;

var
	cumple:boolean;

begin
	cumple:=true;
	secA(cumple);
	if cumple then begin
		secB(cumple);
		if cumple then
			writeln('Exito Cumple!!!')
		else
			writeln('NO Cumple la Secuencia B');
	end
	else
		writeln('NO Cumple la Secuencia A')
end.
