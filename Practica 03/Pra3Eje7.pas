program Pra3Eje7;
type
	str30=string[30];
	str6=string[6];
	
	tCentro=record
		nombre:str6;
		universidad:str30;
		investigadores:integer;
		becarios:integer;
	end;
	
	procedure LeerCentros(var c:tCentro);
	begin
		with c do begin
			write('Investigadores: ');readln(investigadores);
			if (investigadores<>0) then begin
				write('Nombre: ');readln(nombre);
				write('Universidad: ');readln(universidad);
				write('Becarios: ');readln(becarios);
			end;
		end;
	end;

	procedure minBecarios (nombre:str6; becarios:integer; 
													var minNom1,minNom2:str6; var minBecario1,minBecario2:integer);
	begin
		if (becarios<minBecario1) then begin
			minBecario2:=minBecario1;
			minBecario1:=becarios;
			minNom2:=minNom1;
			minNom1:=nombre;
		end
		else
		if (becarios<minBecario2) then begin
			minBecario2:=becarios;
			minNom2:=nombre;
		end;
	end;
	
	procedure masInvestigadores(universidad:str30; investigadores:integer; 
															var maxUniversidad:str30; var maxInvestigadores:integer );
	begin
		if (investigadores>maxInvestigadores) then begin
			maxInvestigadores:=investigadores;
			maxUniversidad:=universidad;
		end;
	end;
	
	procedure procesar(var maxUniversidad:str30; var minNom1,minNom2:str6);
	var
		c:tCentro;
		minBecario1,minBecario2:integer;
		uniAct:str30;
		maxInvestigadores,cantCentros,sumaInv:integer;
		
	begin
		minBecario1:=32765;
		maxInvestigadores:=-1;
		LeerCentros(c);
		while (c.investigadores<>0) do begin
			cantCentros:=0;
			sumaInv:=0;
			uniAct:=c.universidad;
			while (c.investigadores<>0) and (uniAct=c.universidad) do begin
				cantCentros:=cantCentros+1;
				sumaInv:=sumaInv+c.investigadores;
				minBecarios (c.nombre,c.becarios,minNom1,minNom2,minBecario1,minBecario2);
				LeerCentros(c);
			end;
			writeln('Cantidad total de centros: ',cantCentros);
			masInvestigadores(uniAct,sumaInv,maxUniversidad,maxInvestigadores);
		end;
	end;
var
	maxUniversidad:str30;
	minNom1,minNom2:str6;
begin	
	procesar(maxUniversidad,minNom1,minNom2);
	writeln('Universidad con mayor cantidad de investigadores en sus centros: ',maxUniversidad);
	writeln('Los dos centros con menor cantidad de becarios: ',minNom1,' - ',minNom2);
end.
	
	
	
	
	
	
	
	
	
	
	
