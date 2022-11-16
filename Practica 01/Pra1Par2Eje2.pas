program Pra1Par2Eje2;
const
	fin=10;
var
	i,max,num,pos:integer;
begin
	max:=-32765;
	for i:=1 to fin do begin
		write('Ingrese un numero: ');readln(num);
		if (num>max)then begin
			max:=num;
			pos:=i;
		end;
	end;
	writeln('El mayor numero leido fue el ',max, ' en la posicion ', pos);
end.
