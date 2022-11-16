Program Pra1AaEje1;

var
	codigo,inversiones,i, maxCod,canInv:integer;
	monto, suma, prom, maxInv:real;

begin
	maxInv:=0;
	canInv:=0;
	repeat
		write('Ingrese un codigo de empresa: ');readln(codigo);
		write('Ingrese la cant. de inversiones: ');readln(inversiones);
		suma:=0;
		prom:=0;
		for i:=1 to inversiones do begin
			write('Ingrese el monto de cada inversion: ');readln(monto);
			suma:=suma + monto;
			
		end;
		prom:=suma/inversiones;
		if (suma> maxInv) then begin
			maxInv:=suma;
			maxCod:=codigo;
		end;
		if (suma>50000) then
			canInv:=canInv+1;
		writeln('Resultado del analisis: Empresa ',codigo,' Monto promedio ',prom:8:2);
	until (codigo=100);
	writeln('');
	writeln('La empresa ',maxCod,' es la que mayor dinero posee invertido ($',maxInv:8:2,').');
	writeln('Hay ',canInv,' empresas con inversiones por mas de $50000')
end.
