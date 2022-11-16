{Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.
De cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en
kilómetros recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura
finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión
que menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año
en que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos
impares.
Nota: Los códigos de viaje no se repiten.
}
Program Pra7Eje5;
const
	dimF=100;
type
	str30=string[30];
	str10=string[10];
	ranCamion=1..dimF;
	rCamion=record
		patente:str10;
		anio:integer;
		capacidad:real;
	end;
	vCamiones=array[ranCamion] of rCamion;
	rViaje=record
		codigo:integer;
		camion:ranCamion;
		distancia:real;
		destino:str30;
		anioViaje:integer;
		dni:longint;
	end;
	lstViajes=^nodo;
	nodo=record
		viaje:rViaje;
		sig:lstViajes;
	end;
	rCamionContador=record
		kms:real;
		patente:str10;
	end;
	vContador=array[ranCamion] of rCamionContador;

	Procedure InicializarLista(var l:lstViajes);
	begin
		l:=nil;
	end;
	
	Procedure InicializarContador(var vC:vContador);
	var
		i:integer;
	begin
		for i:=1 to dimF do
			vC[i].kms:=0;
	end;

	Procedure LeerViaje(var rV:rViaje);
	begin
		with rV do begin
			write('Codigo: ');readln(codigo);
			if (codigo<>-1) then begin
				write('Camion: ');readln(camion);
				write('Distancia: ');readln(distancia);
				write('Destino: ');readln(destino);
				write('Año del viaje: ');readln(anioViaje);
				write('DNI: ');readln(dni);
			end;
		end;
	end;
	
	Procedure AgregarViaje(var l:lstViajes; rV:rViaje);
	var
		aux:lstViajes;
	begin
		new(aux);
		aux^.viaje:=rV;
		aux^.sig:=l;
		l:=aux;
	end;
	
	Procedure CargarLista(var l:lstViajes);
	var
		rV:rViaje;
	begin
		LeerViaje(rV);
		while (rV.codigo<>-1) do begin
			AgregarViaje(l,rV);
			LeerViaje(rV);
		end;
	end;
	
	Procedure MaxyMin(vC:vContador; var patMax,patMin:str10);
	var
		i:integer;
		kmsMax,kmsMin:real;
	begin
		kmsMax:=-1;
		kmsMin:=32765;
		for i:=1 to dimF do begin
			if vC[i].kms>kmsMax then begin
				kmsMax:=vC[i].kms;
				patMax:=vC[i].patente;
			end;
			if vC[i].kms<kmsMin then begin
				kmsMin:=vC[i].kms;
				patMin:=vC[i].patente;
			end;
		end;
	end;
	
	Function ToneladasyAntiguedad(toneladas:real; antiguedad:integer):boolean;
	begin
		ToneladasyAntiguedad:=(toneladas>30.5) and (antiguedad>5);
	end;
	
	Function DigImpares(dni:integer):boolean;
	var
		dig:integer;
		impar:boolean;
	begin
		impar:=true;
		while(dni<>0) and (impar) do begin
			dig:=dni mod 10;
			if (dig mod 2)=0 then
				impar:=false;
			dni:=dni div 10;
		end;
		DigImpares:=impar;
	end;
	
	Procedure Procesar(l:lstViajes; vCa:vCamiones; var patMax,patMin:str10; var cantTonAnt:integer);
	var
		vC:vContador;
		antiguedad:integer;
	begin
		InicializarContador(vC);
		cantTonAnt:=0;
		while (l<>nil) do begin
			vC[l^.viaje.camion].kms:=vC[l^.viaje.camion].kms + l^.viaje.distancia;
			vC[l^.viaje.camion].patente:=vCa[l^.viaje.camion].patente;
			antiguedad:=l^.viaje.anioViaje - vCa[l^.viaje.camion].anio;
			if ToneladasyAntiguedad(vCa[l^.viaje.camion].capacidad,antiguedad) then
				cantTonAnt:=cantTonAnt+1;
			if DigImpares(l^.viaje.dni) then
				writeln('Codigos cuyo DNI tenga tienen solo digitos impares: ',l^.viaje.codigo);
			l:=l^.sig;
		end;
		MaxyMin(vC,patMax,patMin);
	end;

var
	l:lstViajes;
	vCa:vCamiones;
	patMax,patMin:str10;
	cantTonAnt:integer;
begin
	InicializarLista(l);
	CargarVectorCamiones(vCa); //se dispone
	CargarLista(l);
	Procesar(l,vCa,patMax,patMin,cantTonAnt);
	writeln('Camion que mas kilometros recorrio: ',patMax);
	writeln('Camion que meno kilometros recorrio: ',patMin);
	writeln('Viajes en camiones con capacidad mayor a 30,5 tn y antigüedad mayor a 5 años : ',cantTonAnt);
end.
	
