{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}

Program Pra1Eje8;
	
	function esVocal(c:char):boolean;
	begin
		esVocal:= (c='a') or (c='e') or (c='i') or (c='o') or (c='u');;
	end;
	
var
	ca1,ca2,ca3:char;
begin
	write('Ingrese el 1er caracter: ');readln(ca1);
	write('Ingrese el 1er caracter: ');readln(ca2);
	write('Ingrese el 1er caracter: ');readln(ca3);


	if (esVocal(ca1)) and (esVocal(ca2)) and (esVocal(ca3)) then
		writeln('Las tres son vocales')
	else
		writeln('Al menos un caracter no era vocal');
end.
