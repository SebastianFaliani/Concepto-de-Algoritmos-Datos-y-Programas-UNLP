program Pra1Par2Eje4b;
var
	min1,min2,num:integer;
begin
	min1:=32765;
	write('Ingrese un numero: ');readln(num);
	while (num<>0) do begin
		if (num<min1) then begin
			min2:=min1;
			min1:=num;
		end
		else
			if (num<min2) then
				min2:=num;
		write('Ingrese un numero: ');readln(num);
	end;
	writeln('Los dos numeros minimos leidos son: ', min1,' ',min2);
end.
