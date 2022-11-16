{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.}

Program Pra1Eje3;
const
	fin=3;
var
	i,num,num1,num2,num3:integer;
begin
	num3:=-32768;
	num2:=-32768;
	for i:=1 to fin do begin
		write('Ingrese un numero: '); read(num);
		if num>num3 then begin
			num1:=num2;
			num2:=num3;
			num3:=num;
		end
		else
			if num>num2 then begin
				num1:=num2;
				num2:=num;
			end
			else
				num1:=num;
	end;
	writeln(num3,' ',num2,' ',num1);
end.
