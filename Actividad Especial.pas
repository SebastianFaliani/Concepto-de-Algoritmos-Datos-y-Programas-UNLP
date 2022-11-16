Program ActividadEspecial;
const
	bucle=30;
	cMasaProton=1.0;
	cMasaElectron=0.000555556;
	cMasaNeutro=1.0005;
type
	str30=string [30];
	tAtomo=record
		protones:integer;
		electrones:integer;
		neutrones:integer;
	end;
	tElemento=record
		nombre:str30;
		atomo:tAtomo;
	end;

	procedure LeerAtomo(var a:tAtomo);
	begin
		with a do begin
			write(' Protones: ');readln(protones);
			write(' Electrones: ');readln(electrones);
			write(' Neoutrones: ');readln(neutrones);
		end;
	end;

	procedure LeerElemento(var e:tElemento);
	var
		a:tAtomo;
	begin
		with e do begin
			write('Nombre: ');readln(nombre);
			LeerAtomo(a);
			atomo:=a;
		end;
	end;
	
	function Masa(a:tAtomo):real;
	begin
		masa:=(a.protones * cMasaProton)+(a.electrones * cMasaElectron)+(a.neutrones * cMasaNeutro);
	end;
	
	function CargaAtomo(a:tAtomo):char;
	var
		car:char;
	begin
		with a do begin
			if (protones=electrones) then
				car:='N'
			else
			if (protones>electrones) then
				car:='+'
			else
				car:='-';
		end;
		CargaAtomo:=car;
	end;

	function numeroMasico(a:tAtomo):integer;
	begin
		numeroMasico:=(a.protones+a.neutrones);
	end;
	
	function isotopo(a,b:tAtomo):boolean;
	begin
		isotopo:=(a.protones=b.protones)and(b.neutrones>=a.neutrones);
	end;
	
	procedure mayorMasa(e:tElemento; var maxNom1,maxNom2:str30; var maxMasa1,maxMasa2:real);
	var 
		masaAct:real;
	begin	
		masaAct:=Masa(e.atomo);
		if (masaAct>maxMasa1) then begin
			maxMasa2:=maxMasa1;
			maxMasa1:=masaAct;
			maxNom2:=maxNom1;
			maxNom1:=e.nombre;
		end
		else
		if (masaAct>maxMasa2) then begin
			maxMasa2:=masaAct;
			maxNom2:=e.nombre;
		end;
	end;
	
	procedure MenorMasico(e:tElemento; var minE:tElemento; var minMasico:integer);
	var
		masico:integer;
	begin
		masico:=numeroMasico(e.atomo);
		if(masico<minMasico) then begin
			minMasico:=masico;
			minE:=e;
		end;
	end;

	procedure imprimirAtomo(a:tAtomo);
	begin
		with a do begin
			writeln(' ',protones);
			writeln(' ',electrones);
			writeln(' ',neutrones);
		end;
	end;

	
	procedure imprimirElemento(e:tElemento);
	begin
		writeln(e.nombre);
		imprimirAtomo(e.atomo);
	end;
	
	procedure procesar(var cantIonesPos,cantIonesNeg:integer; var maxNom1,maxNom2:str30; var minE:tElemento);
	var 
		i,minMasico:integer;
		e:tElemento;
		maxMasa1,maxMasa2:real;
	begin
		cantIonesPos:=0;
		cantIonesNeg:=0;
		maxMasa1:=-1;
		minMasico:=32765;
		for i:=1 to bucle do begin
			LeerElemento(e);
			writeln(CargaAtomo(e.atomo));
			if CargaAtomo(e.atomo)='+' then
				cantIonesPos:=cantIonesPos+1
			else
			if CargaAtomo(e.atomo)='-' then
				cantIonesNeg:=cantIonesNeg+1;
			mayorMasa(e,maxNom1,maxNom2,maxMasa1,maxMasa2);
			MenorMasico(e,minE,minMasico);	
		end;
	end;
	
var 
	cantIonesPos,cantIonesNeg:integer;
	maxNom1,maxNom2:str30;
	minE:tElemento;
begin
	procesar(cantIonesPos,cantIonesNeg,maxNom1,maxNom2,minE);
	writeln('Atomos positivos: [',cantIonesPos,'] - Atomos negativos: [',cantIonesNeg,']');
	writeln('Los dos atomos de mayor masa son: ',maxNom1,' - ',maxNom2);
	imprimirElemento(minE);
end.
