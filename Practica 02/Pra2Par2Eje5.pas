Program Pra2Par2Eje5;
	function Es_Doble(numA,numB:integer):boolean;
	begin
		Es_Doble:= (numA*2)=numB;
	end;
	
	procedure Leer(var numA, numB:integer);
	begin
		write('Ingrese el primer numero: ');readln(numA);
		write('Ingrese el segundo numero: ');readln(numB);
	end;

	procedure procesar (var cant,cantDoble:integer);
	var
		numA, numB:integer;
	begin
		Leer(numA,numB);
		while (numA<>0)	and	(numB<>0)	do begin
			if Es_Doble(numA,numB) then
				cantDoble:=cantDoble+1;
			cant:=cant+1;
			Leer(numA,numB);
		end;
	end;

var 
	cant,cantDoble:integer;
begin
	cant:=0;
	cantDoble:=0;
	procesar(cant,cantDoble);
	writeln('Cantidad de pares leidos: ', cant);
	writeln('Cantidad de pares en los que numB es el doble de numA: ', cantDoble);
end.
	
