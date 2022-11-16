program Pra3Eje9;
type
	str30=string[30];
	tCandidato=record
		localidad:str30;
		apellido:str30;
		votos:integer;
		votantes:integer;
	end;
	
	procedure LeerCandidato(var c:tCandidato);
	begin
		with c do begin
			write('Localidad: ');readln(localidad);
			write('Apellido: ');readln(apellido);
			write('Votos: ');readln(votos);
			write('Votantes: ');readln(votantes);
		end;
	end;
	
	procedure masVotos(apellido:str30; num:integer; var maxApe:str30; var maxNum:integer);
	begin
		if (num>maxNum) then begin
			maxNum:=num;
			maxApe:=apellido;
		end;
	end;
	
	procedure masPorcVotos(apellido:str30; num:real; var maxApePorc:str30; var maxNumPorc:real);
	begin
		if (num>maxNumPorc) then begin
			maxNumPorc:=num;
			maxApePorc:=apellido;
		end;
	end;
	
	procedure procesar(var maxApe,maxApePorc:str30);
	var
		c:tCandidato;
		porcVotos:real;
		maxNum:integer;
		maxNumPorc:real;
	begin
		maxNum:=-1;
		maxNumPorc:=-1;
		repeat
			LeerCandidato(c);
			porcVotos:=(c.votos*100)/c.votantes;
			masVotos(c.apellido,c.votos,maxApe,maxNum);
			masPorcVotos(c.apellido,porcVotos,maxApePorc,maxNumPorc);
		until(c.localidad='Zarate');
	end;

var 
	maxApe,maxApePorc:str30;
begin
	procesar(maxApe,maxApePorc);
	writeln('El intendente que obtuvo la mayor cantidad de votos: ',maxApe);
	writeln('El intendente que obtuvo la mayor porcentaje de votos: ',maxApePorc);
end.
