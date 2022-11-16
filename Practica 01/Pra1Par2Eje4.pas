program Pra1Par2Eje4;
const
	fin=10;
var
	i,min1,min2,num:integer;
begin
	min1:=32765;
	for i:=1 to fin do begin
		write('Ingrese un numero: ');readln(num);
		if (num<min1) then begin
			min2:=min1;
			min1:=num;
		end
		else
			if (num<min2) then
				min2:=num;
	end;
	writeln('Los dos numeros minimos leidos son: ', min1,' ',min2);
end.
