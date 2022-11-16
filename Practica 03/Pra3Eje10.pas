program Pra3Eje10;
const
	cEspecies=10;
type
	str30=string[30];
	tPlanta=record
		nombre:str30;
		vida:integer;
		tipo:str30;
		clima:str30;
		pais:str30;
	end;
	
	procedure LeerPlantas(var p:tPlanta);
	begin
		with p do begin
			write('Pais: ');readln(pais);
			if(pais<>'zzz') then begin
				write('Nombre: ');readln(nombre);
				write('Vida: ');readln(vida);
				write('Tipo: ');readln(tipo);
				write('Clima: ');readln(clima);				
			end;
		end;
	end;

	procedure minTipoPlanta(tipo:str30; cant:integer; var minTipo:str30; var minCant:integer);
	begin
		if (cant<minCant) then begin
			minCant:=cant;
			minTipo:=tipo;
		end;
	end;
	
	procedure masViejas(nombre:str30; vida:integer; var maxNom1,maxNom2:str30; var maxVida1,maxVida2:integer);
	begin
		if (vida>maxVida1) then begin
			maxVida2:=maxVida1;
			maxVida1:=vida;
			maxNom2:=maxNom1;
			maxNom1:=nombre;
		end
		else
		if (vida>maxVida2) then begin
			maxVida2:=vida;
			maxNom2:=nombre;
		end;
	end;

	function nativaSubtropical(pais:str30; clima:str30):boolean;
	begin
		nativaSubtropical:= (pais='Argentina') and (clima='subTropical') ;
	end;
	
	procedure masPais(nombre:str30; cant:integer; var maxNombre:str30; var maxCant:integer);
	begin
		if (cant>maxCant) then begin
			maxCant:=cant;
			maxNombre:=nombre;
		end;
	end;
	
	function promVida(suma,cant:integer):real;
	begin
		promVida:=suma/cant;
	end;
	
	procedure procesar(var minTipo,maxNom1,maxNom2,maxNombre:str30);
	var
		p:tPlanta;
		cantTipo,cantPlantaPais,sumaVida,minCant:integer;
		tipoAct,nomAct:str30;
		maxVida1,maxVida2,maxCant:integer;
	begin
		minCant:=32765;
		maxVida1:=-1;
		maxCant:=-1;
		LeerPlantas(p);
		while (p.pais<>'zzz') do begin
			tipoAct:=p.tipo;
			cantTipo:=0;
			sumaVida:=0;
			while (p.pais<>'zzz') and (tipoAct=p.tipo) do begin
				nomAct:=p.nombre;
				cantPlantaPais:=0;
				while (p.pais<>'zzz') and (tipoAct=p.tipo) and (nomAct=p.nombre) do begin
					cantTipo:=cantTipo+1;
					sumaVida:=sumaVida+p.vida;
					masViejas(p.nombre,p.vida,maxNom1,maxNom2,maxVida1,maxVida2);
					if nativaSubtropical(p.pais,p.clima) then
						writeln('Plantas Argentina con clima subtropical: ',p.nombre);
					cantPlantaPais:=cantPlantaPais+1;
					LeerPlantas(p);
				end;
				masPais(nomAct, cantPlantaPais,maxNombre,maxCant);
			end;
			minTipoPlanta(tipoAct,cantTipo,minTipo,minCant);
			writeln('El tipo de planta con menor cantidad de plantas es: ',(sumaVida/cantTipo):6:2);
		end;
	end;
	
	
var
	minTipo,maxNom1,maxNom2,maxNombre:str30;
begin
	procesar(minTipo,maxNom1,maxNom2,maxNombre);
	writeln('El tipo de planta con menor cantidad de plantas es: ',minTipo);
	writeln('El nombre cientifico de las dos plantas mas longevas es: ',maxNom1,' - ',maxNom2);
	writeln('El nombre de la planta que se encuentra en mas paises: ',maxNombre);
end.	
	
	
