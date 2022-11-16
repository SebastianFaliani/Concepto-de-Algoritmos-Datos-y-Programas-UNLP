program Pra1Par2Eje8a;
const
	fin=31;
type 
	mes=1..fin;
var
	monto,ventaXdia,ventaXmes:real;
	diaV,i:mes;
	maxV,cont:integer;
begin
	ventaXmes:=0;
	maxV:=-1;
	for i:=1 to fin do begin
		ventaXdia:=0;
		write('Ingrese el monto: ');readln(monto);
		cont:=0;
		while (monto<>0) do begin
			cont:=cont+1;
			ventaXdia:=ventaXdia+monto;
			write('Ingrese el monto: ');readln(monto);
		end;
		writeln('La venta para el dia ',i, ' es: ',ventaXdia:4:2);
		if (cont>maxV) then begin
			maxV:=cont;
			diaV:=i;
		end;
		ventaXmes:=ventaXmes + ventaXdia;
	end;
	writeln('La venta para el mes es: ',ventaXmes:4:2);
	writeln('El dia con mayor ventas en el mes es: ',diaV);
end.
