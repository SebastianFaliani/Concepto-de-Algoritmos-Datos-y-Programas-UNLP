Program Pra4Eje12;
const
	dimF=53;
	dimFT=4;
type
	ranTipo=1..dimFT;
	str30=string[30];
	rGalaxia=record
		nombre:str30;
		tipo:ranTipo;
		masa:integer;
		distancia:integer;
	end;
	
	vGalaxias=array[1..dimF] of rGalaxia;
	vCont=array[ranTipo] of integer;
	
	Procedure cargarGalaxias(var v:vGalaxias);
		procedure LeerGalaxia(var g:rGalaxia);
		begin
			with g do begin
				write('Nombre: ');readln(nombre);
				write('Tipo [1..4]: ');readln(tipo);
				write('Masa: ');readln(masa);
				write('Distancia: ');readln(distancia);
			end;
		end;
	var
		g:rGalaxia;
		i:integer;
	begin
		for i:=1 to dimF do begin
			LeerGalaxia(g);
			v[i]:=g;
		end;
	end;

	procedure Inicializar(var vC:vCont);
	var
		i:ranTipo;
	begin
		for i:=1 to dimFT do
			vC[i]:=0;
	end;

	procedure CanTipo(tipo:ranTipo; var vC:vCont);
	begin
		vC[tipo]:=vC[tipo]+1;
	end;
	
	Procedure masaAcumulada(nombre:str30; masa:integer; var sumaMasaTotal,sumaMasa:integer);
	begin
		sumaMasaTotal:=sumaMasaTotal+masa;
		if (nombre='Via Lactea') or (nombre='Andromeda') or (nombre='Triangulo') then
			sumaMasa:=sumaMasa+masa;
	end;
	
	function PorcMasaAcumulada(sumaMasaTotal,sumaMasa:integer):real;
	begin
		PorcMasaAcumulada:=(sumaMasa*100)/sumaMasaTotal;
	end;
	
	procedure noIrregular(tipo:ranTipo; distancia:integer; var cantNoIrregular:integer);
	begin
		if (tipo<>4) and (distancia<20)then
			cantNoIrregular:=cantNoIrregular+1;
	end;
	
	Procedure MayorMenorMasa(nombre:str30; masa:integer; 
													var maxNom1,maxNom2,minNom1,minNom2:str30; var maxMasa1,maxMasa2,minMasa1,minMasa2:integer);
	begin
		if (masa>maxMasa1) then begin
			maxMasa2:=maxMasa1;
			maxMasa1:=masa;
			maxNom2:=maxNom1;
			maxNom1:=nombre;
		end
		else
		if (masa>maxMasa2) then begin
			maxMasa2:=masa;
			maxNom2:=nombre;
		end;
	
		if (masa<minMasa1) then begin
			minMasa2:=minMasa1;
			minMasa1:=masa;
			minNom2:=minNom1;
			minNom1:=nombre;
		end
		else
		if (masa<minMasa2) then begin
			minMasa2:=masa;
			minNom2:=nombre;
		end;
	end;
	
	procedure procesar(v:vGalaxias; dimL:integer; var vC:vCont; var sumaMasa,cantNoIrregular:integer; var PorcMasa:real;
											var maxNom1,maxNom2,minNom1,minNom2:str30);
	var
		i,sumaMasaTotal:integer;
		maxMasa1,maxMasa2,minMasa1,minMasa2:integer;
	begin
		Inicializar(vC);
		sumaMasaTotal:=0;
		sumaMasa:=0;
		maxMasa1:=-1;
		minMasa1:=32765;
		for i:=1 to dimL do begin
			CanTipo(v[i].tipo,vC);
			masaAcumulada(v[i].nombre,v[i].masa,sumaMasaTotal,sumaMasa);
			noIrregular(v[i].tipo,v[i].distancia,cantNoIrregular);
			MayorMenorMasa(v[i].nombre,v[i].masa,maxNom1,maxNom2,minNom1,minNom2,maxMasa1,maxMasa2,minMasa1,minMasa2);
		end;
		PorcMasa:=PorcMasaAcumulada(sumaMasaTotal,sumaMasa);
	end;
	
	procedure imprimir(vC:vCont;dimL:integer);
	var 
		i:integer;
	begin
		for i:=1 to dimL do
			writeln('Tipo ',i,': [',vC[i],'] Galaxias');
	end;
	
var
	v:vGalaxias;
	vC:vCont;
	sumaMasa,cantNoIrregular:integer;
	PorcMasa:real;
	maxNom1,maxNom2,minNom1,minNom2:str30;
begin
	cargarGalaxias(v);
	procesar(v,dimF,vC,sumaMasa,cantNoIrregular,PorcMasa,maxNom1,maxNom2,minNom1,minNom2);
	imprimir(vC,dimFT);
	writeln('La masa total acumulada de las 3 galaxias principales (Via Lactea, Andromeda y Triangulo) es: ',sumaMasa);
	writeln('El porcentaje que esto representa respecto a la masa de todas las galaxias es: ',PorcMasa:3:2);
	writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 20 es: ',cantNoIrregular);
	writeln('El nombre de las dos galaxias con mayor masa son: ',maxNom1,' - ',maxNom2);
	writeln('El nombre de las dos galaxias con menor masa son: ',minNom1,' - ',minNom2);
end.
	
	
	
	
