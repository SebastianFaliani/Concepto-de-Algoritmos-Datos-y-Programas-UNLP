program Pra1Par2Eje8;
const
	fin=31;
type 
	mes=1..fin;
var
	monto,ventaXdia,ventaXmes:real;
	i:mes;
begin
	ventaXmes:=0;
	for i:=1 to fin do begin
		ventaXdia:=0;
		write('Ingrese el monto: ');readln(monto);
		while (monto<>0) do begin
			ventaXdia:=ventaXdia+monto;
			write('Ingrese el monto: ');readln(monto);
		end;
		writeln('La venta para el dia ',i, ' es: ',ventaXdia:4:2);
		ventaXmes:=ventaXmes + ventaXdia;
	end;
	writeln('La venta para el mes es: ',ventaXmes:4:2);
end.
