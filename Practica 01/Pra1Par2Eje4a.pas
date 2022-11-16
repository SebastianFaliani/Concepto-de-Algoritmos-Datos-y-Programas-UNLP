program Pra1Par2Eje4a;
var
	min1,min2,num:integer;
begin
	min1:=32765;
	repeat
		write('Ingrese un numero: ');readln(num);
		if (num<min1) then begin
			min2:=min1;
			min1:=num;
		end
		else
			if (num<min2) then
				min2:=num;
	until (num=0);
	writeln('Los dos numeros minimos leidos son: ', min1,' ',min2);
end.
