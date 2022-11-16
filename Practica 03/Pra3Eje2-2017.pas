program Pra3Eje2_2017;
type
	str30=string[30];
	rPuntaje=0..100;
	tExamen=record
		nombre:str30;
		continente:str30;
		puntaje:rPuntaje;
	end;
	
	procedure LeerExamen(var e:tExamen);
	begin
		with e do begin
			write('Nombre: ');readln(nombre);
			if (nombre<>'zzz') then begin
				write('Continente: ');readln(continente);
				write('Puntaje: ');readln(puntaje);
			end;
		end;
	end;

	procedure mejorExamen(e:tExamen; var maxNom1,maxNom2:str30; var maxNota1,maxNota2:rPuntaje);
	begin
		with e do begin
			if (puntaje>maxNota1) then begin
				maxNota2:=maxNota1;
				maxNota1:=puntaje;
				maxNom2:=maxNom1;
				maxNom1:=nombre;
			end
			else
			if (puntaje>maxNota2) then begin
				maxNota2:=puntaje;
				maxNom2:=nombre;
			end;
		end;
	end;
	
	procedure aprobaron(e:tExamen; var cantAmeApr:integer);
	begin
		with e do begin
			if (continente='americano') and (puntaje>=70) and (puntaje<90) then
				cantAmeApr:=cantAmeApr+1;
		end; 
	end;
	
	procedure promedioEU(e:tExamen; var cant,suma:integer);
	begin
		with e do begin
			if (continente='europeo') then begin
				cant:=cant+1;
				suma:=suma+puntaje;
			end;
		end;
	end;
	
	procedure procesar(var maxNom1,maxNom2:str30; var cantAmeApr:integer; var promedio:real);
	var
		e:tExamen;
		maxNota1,maxNota2:rPuntaje;
		cant,suma:integer;
	begin
		cant:=0;
		suma:=0;
		cantAmeApr:=0;
		maxNota1:=0;
		LeerExamen(e);
		while (e.nombre<>'zzz') do begin
			mejorExamen(e,maxNom1,maxNom2,maxNota1,maxNota2);
			aprobaron(e,cantAmeApr);
			promedioEU(e,cant,suma);
			LeerExamen(e);
		end;
		promedio:=suma/cant;
	end;
	
var
	maxNom1,maxNom2:str30;
	cantAmeApr:integer; 
	promedio:real;
begin
	procesar(maxNom1,maxNom2,cantAmeApr,promedio);
	writeln('Las dos mejor calificaciones son de: ',maxNom1,' - ',maxNom2);
	writeln('Americanos que aprobaron y no promocionaron: ',cantAmeApr);
	writeln('Puntaje promedio de los participantes europeos: ',promedio:4:2);
end.
