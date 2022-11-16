program Pra1Par2Eje7;
const
	fin=6;
type
	str30=string[30];
var
	i:integer;
	nombre,nomP1,nomP2,nomU1,nomU2:str30;
	tiempo,tieP1,tieP2,tieU1,tieU2:integer;
begin
	tieP1:=32765;
	nomP1:='';
	tieU1:=0;
	nomU1:='';
	for i:=1 to fin do begin
		write('Ingrese el Nombre: ');readln(nombre);
		write('Ingrese el Tiempo: ');readln(tiempo);
		if (tiempo<tieP1) then begin
			tieP2:=tieP1;
			nomP2:=nomP1;
			tieP1:=tiempo;
			nomP1:=nombre;
		end
		else
			if (tiempo<tieP2) then begin
				tieP2:=tiempo;
				nomP2:=nombre;
			end;

		if (tiempo>tieU1) then begin
			tieU2:=tieU1;
			nomU2:=nomU1;
			tieU1:=tiempo;
			nomU1:=nombre;
		end
		else
			if (tiempo>tieU2) then begin
				tieU2:=tiempo;
				nomU2:=nombre;
			end;
	end;
	writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ', nomP1,' ',nomP2);
	writeln('Los nombres de los dos pilotos que finalizaron en los dos Ultimos puestos son: ', nomU1,' ',nomU2);
end.
