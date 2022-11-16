program Pra3Eje2;
type
	rDia=1..31;
	rMes=1..12;
	ranio=2017..2018;
	
	tFecha=record
		dia:rdia;
		mes:rMes;
		anio:rAnio;
	end;
	
	procedure Leer(var f:tFecha);
	begin
		with f do begin
			readln(anio);
			if (anio<>2018) then begin
				readln(dia);
				readln(mes);
			end;
		end;
	end;
	
	function Verano(f:tFecha):boolean;
	var
		cumple:boolean;
	begin
		cumple:=false;
		with f do begin
			if(anio=2017) and (mes=12) and (dia>20)  then
				cumple:=true
			else
				if (anio=2017) and (mes=3) and (dia<21)  then
					cumple:=true
				else
					if (anio=2017) and ((mes=1) or (mes=2))  then
						cumple:=true;
		end;
		Verano:=cumple;
	end;
	
	function Diez(f:tFecha):boolean;
	begin
		Diez:=(f.anio=2017) and (f.dia>=1) and (f.dia<=10);
	end;
		
var
	fecha:tFecha;
	cantVer,cantDiez:integer;
begin
	cantVer:=0;
	cantDiez:=0;
	Leer (fecha);
	while (fecha.anio <> 2018) do begin
		if (Verano(fecha)) then
			cantVer:=cantVer +1;
		if (Diez(fecha)) then
			cantDiez:=cantDiez + 1;
		Leer (fecha);
	end;
	writeln(cantVer);
	writeln(cantDiez);
end.
