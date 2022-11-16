program Pra1Par2Eje1;
const 
	fin=10;
var
    i,num,suma,cont :integer;    
begin
	suma:=0;
	cont:=0;
	for i:=1 to fin do begin
    write('Ingrese un numero: ');read(num);
    suma:=suma+num;
    if (num>5) then
			cont:=cont+1;
   end;
   writeln('La suma es: ',suma);
   writeln('Los numero mayores que 5 son: ',cont);
end.
