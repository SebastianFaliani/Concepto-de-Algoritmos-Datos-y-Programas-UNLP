program Pra6Eje7;
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
	
	lstSondas=^Nodo;
	Nodo=record
		sonda:rSonda;
		sig:lstSondas;
	end;

	//CargarNodosEnLista se dispone
	
	//a.)
	function cumpleCriterios(rS:rSonda):boolean;
	var
		cumple:boolean;
	begin
		if (rS.espectro<>1) then
			cumple:=(rS.costoCons>(rS.costoMan*rS.duracion))
		else
			cumple:=false;
		cumpleCriterios:=cumple;
	end;

	//Ya esta hecho en el ejercicio 6
	procedure AgregarNodo(var lst,ult:lstSondas; rS:rSonda);
	begin
	end;

	//b.)
	Procedure DosListas(lst:lstSondas; var lstC,lstNC:lstSondas);
	var 
		ultC,ultNC:lstSondas;
	begin
		while lst<>Nil do begin
			if cumpleCriterios(lst^.sonda) then
				AgregarNodo(lstC,ultC,lst^.sonda)
			else
				AgregarNodo(lstNC,ultNC,lst^.sonda);
			lst:=lst^.sig;
		end;
	end;
	
	//c.)
	procedure CostoNoCumple(lst:lstSondas);
	var 
		lstC,lstNC:lstSondas;
		costoTotal:real;
	begin
		costoTotal:=0;
		DosListas(lst,lstC,lstNC);
		while lstNC<>Nil do begin
			costoTotal:=costoTotal+(lstNC^.sonda.costoCons+(lstNC^.sonda.costoMan*lstNC^.sonda.duracion));
			lstNC:=lstNC^.sig;
		end;
		writeln('El costo total de los proyectos que no seran financiados es: ',costoTotal:2:2);
	end;
	
begin
end.
