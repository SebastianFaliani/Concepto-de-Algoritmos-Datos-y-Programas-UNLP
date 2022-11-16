program Pra6Eje12;
type
	rDispositivo=record
		version:real;
		pantalla:integer;
		memoria:integer;
	end;
	lstDispositivos=^nodo;
	nodo=record
		dispositivo:rDispositivo;
		sig:lstDispositivos;
	end;
	
	function PuntoB(memoria,pantalla:integer):boolean;
	begin
		PuntoB:=(memoria>3)and(pantalla<=5);
	end;
	
	procedure procesar(l:lstDispositivos; var cantB:integer; var promC:real);
	var
		cantVer,cantDisp,SumaPantalla:integer;
		versionAct:real;
	begin
		cantB:=0;
		cantDisp:=0;
		SumaPantalla:=0;
		while (l<> nil) do begin
			versionAct:=l^.dispositivo.version;
			cantVer:=0;
			while (l<>nil) and (versionAct=l^.dispositivo.version) do begin
				cantVer:=cantVer+1;
				cantDisp:=cantDisp+1;
				sumaPantalla:=sumaPantalla+ l^.dispositivo.pantalla;
				if PuntoB(l^.dispositivo.memoria,l^.dispositivo.pantalla) then 
					cantB:=cantB+1;
				l:=l^.sig;
			end;
			writeln('Hay ',cantVer,' dispositivos con la version ',versionAct,' de Android');
		end;
		promC:=sumaPantalla/cantDisp;
	end;
		
var
	l:lstDispositivos;
	cantB:integer;
	promC:real;
begin
	l:=nil;
	cargarLista(l); //se dispone
	procesar(l,cantB,promC);
	writeln('Dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas: ',cantB);
	writeln('El tamaño promedio de las pantallas de todos los dispositivos: ',promC);
end.
