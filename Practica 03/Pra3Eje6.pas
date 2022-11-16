program Pra3Eje6;
type
	str30=string[30];
	
	tProcesador=record
		marca:str30;
		linea:str30;
		core:integer;
		reloj:integer;
		transitor:integer;
	end;
	
	procedure LeerProcesador(var p:tProcesador);
	begin
		with p do begin
			write('Core: ');readln(core);
			if (core<>0) then begin
				write('Marca: ');readln(marca);
				write('Linea: ');readln(linea);
				write('Reloj: ');readln(reloj);
				write('Transitor: ');readln(transitor);
			end;
		end;
	end;
	
	function CoresConTransitores(core,transitores:integer):boolean;
	begin
		CoresConTransitores:=(core>2) and (transitores<=22);
	end;
	
	procedure masProcesadores(marca:str30; core:integer; 
														var maxMarca1,maxMarca2:str30; var maxCore1,maxCore2:integer);
	begin
		if (core>maxCore1) then begin
			maxCore2:=maxCore1;
			maxCore1:=core;
			maxMarca2:=maxMarca1;
			maxMarca1:=marca;
		end 
		else
		if (core>maxCore2) then begin
			maxCore2:=core;
			maxMarca2:=marca;
		end;
	end;
	
	function Multicore(core,reloj:integer; marca:str30):boolean;
	begin
		Multicore:=(core>1) and ((marca='Intel') or (marca='AMD')) and (reloj>2);
	end;
	
	procedure procesar (var maxMarca1,maxMarca2:str30; var cantProc:integer);
	var
		p:tProcesador;
		marcaAct:str30;
		maxCore1,maxCore2,sumaProc:integer;
		
	begin
		maxCore1:=-1;
		cantProc:=0;
		LeerProcesador(p);
		while (p.core <>0) do begin
			sumaProc:=0;
			marcaAct:=p.marca;
			while (p.core <>0) and (marcaAct=p.marca) do begin
				if CoresConTransitores(p.core,p.transitor) then
					writeln ('Mas de 2 cores con transistores de a lo sumo 22 nm: ',p.marca,' - ',p.linea);
				if (p.transitor=14) then
					sumaProc:=sumaProc+p.core;
				if Multicore(p.core,p.reloj,p.marca) then
					cantProc:=cantProc+1;
				LeerProcesador(p);
			end;
			masProcesadores(marcaAct,sumaProc,maxMarca1,maxMarca2,maxCore1,maxCore2);
		end;
	end;

var
	maxMarca1,maxMarca2:str30;
	cantProc:integer;
	
begin
	procesar(maxMarca1,maxMarca2,cantProc);
	writeln ('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm: (',maxMarca1,') - (',maxMarca2,')');
	writeln ('Procesadores multicore de Intel o AMD, con relojes de al menos 2 Ghz: (',cantProc,')');
end.
