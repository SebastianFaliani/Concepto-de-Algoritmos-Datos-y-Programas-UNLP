{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2018. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección
de destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por
código de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por
número de viaje.
}
Program Pra7Eje3;
type
	str30=string[30];
	rViaje=record
		nroViaje:integer;
		codigo:integer;
		origen:str30;
		destino:str30;
		kms:real;
	end;
	lstViajes=^nodo;
	nodo=record
		viaje:rViaje;
		sig:lstViajes;
	end;
	
	Procedure IniciarLista(var l:lstViajes);
	begin
		l:=nil;
	end;
	
	Procedure AgregarOrdenado(l:lstViajes; rV:rViaje);
	var
		aux,ant,act:lstViajes;
	begin
		new(aux);
		aux^.viaje:=rV;
		ant:=l;
		act:=l;
		while(act<>nil) and (rV.nroViaje>l^.viaje.nroViaje) do begin
			ant:= act;
			act:=act^.sig;
		end;
		if (act=ant) then
			l:=aux
		else
			ant^.sig:=aux;
		aux^.sig:=act;
	end;
	
	Procedure MasKmsRecorridos(codigo:integer; kms:real; var maxCod1,maxCod2:integer; var maxKms1,maxKms2:real);
	begin
		if(kms>maxKms1) then begin
			maxKms2:=maxKms1;
			maxKms2:=kms;
			maxCod2:=maxCod1;
			maxCod1:=codigo;
		end
		else
		if(kms>maxKms1) then begin
			maxKms2:=kms;
			maxCod2:=codigo;
		end;
	end;

	Procedure Procesar(l:lstViajes; var maxCod1,maxCod2:integer; var l5kms:lstViajes);
	var
		maxKms1,maxKms2:real;
	begin
		maxKms1:=-1;
		while(l<>nil) do begin
			MasKmsRecorridos(l^.viaje.codigo,l^.viaje.kms, maxCod1,maxCod2,maxKms1,maxKms2);
			if(l^.viaje.kms>5) then
				AgregarOrdenado(l5kms,l^.viaje);
		end;
	end;

var
	l,l5kms:lstViajes;
	maxCod1,maxCod2:integer;
begin
	IniciarLista(l);
	CargarLista(l);//se dispone
	IniciarLista(l5kms);
	Procesar(l,maxCod1,maxCod2,l5kms);
	writeln('Los dos codigos  de auto que mas kilometros recorrieron: [',maxCod1,']-[',maxCod2,']');
end.
