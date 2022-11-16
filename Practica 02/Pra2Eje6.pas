Program Pra2Eje6;

procedure NumMasGrande;
var 
	num,numMax:integer;
begin
	numMax:=0;
	write('Ingrese un numero: ');readln(num);
	while (num>0) do begin
		if (num mod 2)=0 then
			if (num>numMax) then
				numMax:=num;
		write('Ingrese un numero: ');readln(num);
	end;
	write('El numero par mas grande ingresado es: ',numMax);
end;

begin
	NumMasGrande;
end.
