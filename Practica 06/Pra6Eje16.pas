program Pra6Eje16;
type
	str30=string[30];
	rCorredor=record
		nombre:str30;
		apellido:str30;
		distancia:integer;
		tiempo:integer;
		pais:str30;
		ciudadOri:str30;
		ciudadDes:str30;
	end;
	lstCorredores=^nodo;
	nodo=record
		corredor:rCorredor;
		sig:lstCorredores;
	end;
	
	procedure LeerCorredor(var rc:rCorredor);
	begin
		with rC do begin
			write('Distancia: ');readln(distancia);
			if (distancia <>-1) then begin
				write('Apellido: ');readln(apellido);
				write('Nombre: ');readln(nombre);
				write('Tiempo: ');readln(tiempo);
				write('Pais: ');readln(pais);
				write('Ciudad de Origen: ');readln(ciudadOri);
				write('Ciudad de Destino: ');readln(ciudadDes);
			end;
		end;
	end;
	
	procedure AgregarOrdenado(var l:lstCorredores; rC:rCorredor);
	var
		aux,ant,act:lstCorredores;
	begin
		new(aux);
		aux^.corredor:=rC;
		ant:=l;
		act:=l;
		while (act<>nil) and (rC.ciudadOri>act^.corredor.ciudadOri) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (ant=act) then
			l:=aux
		else
			ant^.sig:=aux;
		aux^.sig:=act;
	end;
	
	Procedure CargarLista(var l:lstCorredores);
	var
		rC:rCorredor;
	begin
		LeerCorredor(rC);
		while (rC.distancia<>-1) do begin
			AgregarOrdenado(l,rC);
			LeerCorredor(rC);
		end;
	end;
	
	function OtraCiudad(origen,destino:str30):boolean;
	begin
		OtraCiudad:=origen=destino;
	end;
	
	procedure CiudadConMayorCanCorredores(ciudad:str30; corredores,kms:integer; var nomCiudadMax:str30; var cantCorrMax,cantKmsMax:integer);
	begin
		if corredores>cantCorrMax then begin
			cantCorrMax:=corredores;
			nomCiudadMax:=ciudad;
			cantKmsMax:=kms;
		end;
	end;
	
	procedure Procesar(l:lstCorredores; var totalC,totalD,totalT,cantKmsMax,otroOriDes:integer; var nomCiudadMax:str30; var brasilPromD,pasoProm:real);
	var
		DisBrasil,cantBrasil,paso,cantxCiudad,kmsxCuidad,cantCorrMax,cantBoston:integer;
		ciudadAct:str30;
	begin
		totalC:=0;
		totalD:=0;
		totalT:=0;
		cantBrasil:=0;
		DisBrasil:=0;
		otroOriDes:=0;
		paso:=0;
		cantBoston:=0;
		cantCorrMax:=-1;
		while (l<>nil) do begin
			ciudadAct:=l^.corredor.ciudadOri;
			totalC:=totalC+1;
			totalD:=totalD+1;
			totalT:=totalT+1;
			cantxCiudad:=0;
			kmsxCuidad:=0;
			while (l<>nil) and (ciudadAct=l^.corredor.ciudadOri) do begin
				cantxCiudad:=cantxCiudad+1;
				kmsxCuidad:=kmsxCuidad+l^.corredor.distancia;
				
				if(l^.corredor.pais='Brasil') then begin
					cantBrasil:=cantBrasil+1;
					DisBrasil:=DisBrasil+l^.corredor.distancia;
				end;
				if OtraCiudad(l^.corredor.ciudadOri,l^.corredor.ciudadDes) then
					otroOriDes:=otroOriDes+1;
				
				if (l^.corredor.ciudadOri='Boston') then begin
					paso:=l^.corredor.tiempo*l^.corredor.distancia;
					cantBoston:=cantBoston+1;
				end;
				l:=l^.sig;
			end;
			CiudadConMayorCanCorredores(ciudadAct,cantxCiudad,kmsxCuidad,nomCiudadMax,cantCorrMax,cantKmsMax);
		end;
		brasilPromD:=DisBrasil/cantBrasil;
		pasoProm:=paso/cantBoston;
	end;
	
var 
	l:lstCorredores;

	totalC,totalD,totalT,cantKmsMax,otroOriDes:integer; 
	nomCiudadMax:str30; 
	brasilPromD,pasoProm:real;


begin
	l:=nil;
	CargarLista(l);
	Procesar(l,totalC,totalD,totalT,cantKmsMax,otroOriDes,nomCiudadMax,brasilPromD,pasoProm);
end.
