program Pra6Eje6;
const
	dimF=7;
type
	rango=1..dimF;
	str20=string[20];
	rSonda=record
		nombre:str20;
		duracion:integer;
		costoCons:real;
		costoMan:real;
		espectro:rango;
	end;
	vContador=array[rango] of integer;
	lstSondas=^Nodo;
	Nodo=record
		sonda:rSonda;
		sig:lstSondas;
	end;
	
	//Inicializo el Contador en cero
	procedure Inicializar(var vC:vContador);
	var
		i:rango;
	begin
		for i:=1 to dimF do
			vC[i]:=0;
	end;
	
	//Se lee el registro de la sonda
	procedure LeerSonda(var rS:rSonda);
	begin
		with rS do begin
			write('Nombre:');readln(nombre);
			write('Duracion de la mision:');readln(duracion);
			write('Costo de construccion:');readln(costoCons);
			write('Costo de mantenimiento mensual:');readln(costoMan);
			write('Rango del espectro electromagnetico [1..7]:');readln(espectro);
		end;
	end;
	
	//Agrego un nodo de Sonda en la lista 
	procedure AgregarNodo(var lst,ult:lstSondas; rS:rSonda);
	var
		aux:lstSondas;
	begin
		new(aux);
		aux^.sonda:=rS;
		aux^.sig:=Nil;
		if lst=Nil then
			lst:=aux
		else
			ult^.sig:=aux;
		ult:=aux
	end;
	
	//Genero el cargar hasta que sea la sonda GAIA
	procedure CargarNodosEnLista(var lst,ult:lstSondas; var promDuracion,promCostoCons:real);
	var
		rS:rSonda;
		sumaMeses,cantSondas:integer;
		SumaCostoCons:real;
	begin
		sumaMeses:=0;
		cantSondas:=0;
		SumaCostoCons:=0;
		repeat
			LeerSonda(rS);
			AgregarNodo(lst,ult,rS);
			sumaMeses:=sumaMeses+rS.duracion;
			SumaCostoCons:=SumaCostoCons+rS.costoCons;
			cantSondas:=cantSondas+1;
		until (rS.nombre='gaia');
		//Saco los promedio que voy a necesitar en el procedure procesar
		promDuracion:=sumaMeses/cantSondas;
		promCostoCons:=SumaCostoCons/cantSondas;
	end;
	
	//Imprimir para Probar
	procedure Imprimir(lst:lstSondas);
	begin
		while (lst<>Nil) do begin
			writeln('Nombre: ',lst^.sonda.nombre);
			lst:=lst^.sig;
		end;
	end;
	
	Procedure procesar(lst:lstSondas; promDuracion,promCostoCons:real; 
											var nomMax:str20; var vC:vContador; var cantSupDurProm:integer; var nomSupProCons:str20);
		procedure sondaMasCostos(costo:real; nombre:str20; var maxCosto:real; var nomMax:str20);
		begin
			if (costo>maxCosto)then begin
				maxCosto:=costo;
				nomMax:=nombre;
			end;
		end;
		
		function SupDurProm(duracion:integer; promDuracion:real):boolean;
		begin
			SupDurProm:=duracion>promDuracion;
		end;
		
		function SupCostoConsProm(CostoCons:real; promCostoCons:real):boolean;
		begin
			SupCostoConsProm:=CostoCons>promCostoCons;
		end;
		
	var
		maxCosto,costo:real;
	
	begin
		maxCosto:=-1;
		Inicializar(vC);
		cantSupDurProm:=0;
		while lst<>nil do begin
			//Punto a.)
			costo:=lst^.sonda.costoCons+(lst^.sonda.costoMan*lst^.sonda.duracion);
			sondaMasCostos(costo,lst^.sonda.nombre,maxCosto,nomMax);
		
			//Punto b.)
			vC[lst^.sonda.espectro]:=vC[lst^.sonda.espectro]+1;
			
			//Punto c.)
			if SupDurProm(lst^.sonda.duracion,promDuracion) then
				cantSupDurProm:=cantSupDurProm+1;
			
			//Punto d.)
			if SupCostoConsProm(lst^.sonda.CostoCons,promCostoCons) then
				writeln('El costo de construccion de la sonda [',lst^.sonda.nombre,'] supera el costo promedio');
				
			lst:=lst^.sig;
		end;
	end;
	
var
	lst,ult:lstSondas;
	nomMax:str20; 
	vC:vContador;
	promDuracion,promCostoCons:real;
	cantSupDurProm:integer;
	nomSupProCons:str20;
	
begin
	lst:=Nil;
	CargarNodosEnLista(lst,ult,promDuracion,promCostoCons);
	procesar(lst,promDuracion,promCostoCons,nomMax,vC,cantSupDurProm,nomSupProCons);
	writeln('La sonda mas costosa [',nomMax,']');
	writeln('Sondas cuya duracion estimada supera la duracion promedio [',cantSupDurProm,']');
	Imprimir(lst);
end.

