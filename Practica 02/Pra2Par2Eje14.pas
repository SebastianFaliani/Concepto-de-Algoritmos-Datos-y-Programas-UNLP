program Pra2Par2Eje14;
const
	precio=320;
type
	str30=string[30];
	rango=1..3;
	
	procedure Leer(var localidad:str30; var haSembradas:integer; var zona:rango);
	begin
		write('Localidad: ');readln(localidad);
		write('Ha. Sembrada: ');readln(haSembradas);
		write('Zona: ');readln(zona);
	end;
	
	function rendimiento(ha:integer; zona:rango):real;
	var 
		rendi:real;
	begin
		case zona of
			1:	rendi:=ha*6*precio;
			2:	rendi:=(ha*2.6)*precio;
			3:	rendi:=(ha*1.4)*precio;
		end;
		rendimiento:=rendi;
	end;
	
	procedure procesar(var tresFebrero:integer; var LocMayorRen,LocMenorRen:str30; var promedio:real);
		procedure mayor(rendi:real; localidad:str30; var LocMayorRen:str30; var MayorRen:real);
		begin
			if (rendi>mayorRen) then begin
				mayorRen:=rendi;
				LocMayorRen:=localidad;
			end;
		end;
		
		procedure menor(rendi:real; localidad:str30; var LocMenorRen:str30; var MenorRen:real);
		begin
			if (rendi<MenorRen) then begin
				MenorRen:=rendi;
				LocMenorRen:=localidad;
			end;
		end;
		
	var
		localidad:str30; 
		haSembradas,cont:integer; 
		zona:rango;
		rendi,suma:real;
		MayorRen,MenorRen:real;
	begin
		tresFebrero:=0;
		MayorRen:=-1;
		MenorRen:=99999;
		cont:=0;
		suma:=0;
		repeat
			Leer(localidad,haSembradas,zona);
			rendi:=rendimiento(haSembradas,zona);
			suma:=suma+rendi;
			cont:=cont+1;
			if (localidad='Tres de Febrero') and ( rendi>10000) then
				tresFebrero:=tresFebrero+1;
			mayor(rendi,localidad,LocMayorRen,MayorRen);
			menor(rendi,localidad,LocMenorRen,MenorRen);
		until (haSembradas=900) and (localidad='saladillo');
		promedio:=suma/cont;
	end;

var
	tresFebrero:integer;
	LocMayorRen,LocMenorRen:str30;
	promedio:real;
begin
	procesar(tresFebrero,LocMayorRen,LocMenorRen,promedio);
	writeln(tresFebrero);
	writeln(LocMayorRen);
	writeln(LocMenorRen);
	writeln(promedio:8:2);
end.
