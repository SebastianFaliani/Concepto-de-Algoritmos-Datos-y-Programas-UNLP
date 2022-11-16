program Pra3Eje11;
type
	str30=string[30];
	tAvion=record
		codigo:integer;
		paisSalida:str30;
		paisLlegada:str30;
		kmRec:integer;
		porcOcupacion:real;
	end;
	
	procedure LeerAvion(var a:tAvion);
	begin
		with a do begin
			write('Codigo: ');readln(codigo);
			write('Pais Salida: ');readln(paisSalida);
			write('Pais Leggada: ');readln(paisLlegada);
			write('Km Recorridos: ');readln(kmRec);
			write('Porcetaje Ocupacion: ');readln(porcOcupacion);
		end;
	end;

	Procedure masKm(codigo,kmRec:integer; var maxCod1,maxCod2,maxKmRec1,maxKmRec2:integer);
	begin
		if(kmRec>maxKmRec1) then begin
			maxKmRec2:=maxKmRec1;
			maxKmRec1:=kmRec;
			maxCod2:=maxCod1;
			maxCod1:=codigo;
		end
		else
		if(kmRec>maxKmRec2) then begin
			maxKmRec2:=kmRec;
			maxCod2:=codigo;
		end;
	end;

	Procedure memosKm(codigo,kmRec:integer; var minCod1,minCod2,minKmRec1,minKmRec2:integer);
	begin
		if(kmRec<minKmRec1) then begin
			minKmRec2:=minKmRec1;
			minKmRec1:=kmRec;
			minCod2:=minCod1;
			minCod1:=codigo;
		end
		else
		if(kmRec<minKmRec2) then begin
			minKmRec2:=kmRec;
			minCod2:=codigo;
		end;
	end;
	
	Procedure masSalioPais(codigo,masSalio:integer; var maxCodSalio,maxSalio:integer);
	begin
		if(masSalio>maxSalio) then begin
			maxSalio:=masSalio;
			maxCodSalio:=codigo;
		end;
	end;
	
	function vueloMas5mil(kmRec:integer;porcOcupacion:real):boolean;
	begin
		vueloMas5mil:=(kmRec>5000)and(porcOcupacion<60);
	end;

	function vueloMenos10mil(kmRec:integer;Llegada:str30):boolean;
	begin
		vueloMenos10mil:=(kmRec>10000) and ((Llegada='Australia') or (Llegada='Nueva Zelanda'));
	end;
	
	procedure procesar(var maxCod1,maxCod2,minCod1,minCod2,maxCodSalio,cantVue5mil,cantVue10mil:integer);
	var
		a:tAvion;
		maxKmRec1,maxKmRec2,minKmRec1,minKmRec2,codAct,kmRec:integer;
		masSalio,maxSalio:integer;
		paisSalidaAct:str30;
		
	begin
		maxKmRec1:=-1;
		minKmRec1:=32765;
		cantVue5mil:=0;
		cantVue10mil:=0;
		maxSalio:=-1;
		LeerAvion(a);
		repeat
			codAct:=a.codigo;
			kmRec:=0;
			masSalio:=0;
			repeat
				paisSalidaAct:=a.paisSalida;
				repeat
					kmRec:=kmRec + a.kmRec;
					masSalio:=masSalio+1;
					if (vueloMas5mil(a.kmRec,a.porcOcupacion)) then	
						cantVue5mil:=cantVue5mil+1;
					if(vueloMenos10mil(a.kmRec,a.paisLlegada)) then
						cantVue10mil:=cantVue10mil+1;
					LeerAvion(a);
				until (a.codigo=44) or (codAct<>a.codigo) or (paisSalidaAct<>a.paisSalida);
			until (a.codigo=44) or (codAct<>a.codigo);
			writeln(masSalio,' - ',maxSalio);
			masSalioPais(codAct,masSalio,maxCodSalio,maxSalio);
			masKm(codAct,kmRec,maxCod1,maxCod2,maxKmRec1,maxKmRec2);
			memosKm(codAct,kmRec,minCod1,minCod2,minKmRec1,minKmRec2);
		until (a.codigo=44);
	end;

var 
	maxCod1,maxCod2,minCod1,minCod2,maxCodSalio:integer;
	cantVue5mil,cantVue10mil:integer;
begin
	procesar(maxCod1,maxCod2,minCod1,minCod2,maxCodSalio,cantVue5mil,cantVue10mil);
	writeln('Los dos aviones que mas kilometros recorrieron [',maxCod1 , '] - [',maxCod2,']');
	writeln('Los dos aviones que menos kilometros recorrieron [',minCod1 , '] - [',minCod2,']');
	writeln('El avion que salio desde mas paises diferentes [',maxCodSalio , ']');
	writeln('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion [',cantVue5mil , ']');
	writeln('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda [',cantVue10mil , ']');
end.
