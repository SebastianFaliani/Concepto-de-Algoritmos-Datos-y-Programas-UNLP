Program Pra4Par2Eje3;
const
	dimF=200;
	dimFM=31;
type
	ranMes=1..dimFM;
	str30=string[30];
	
	rViaje=record
		dia:ranMes;
		monto:real;
		distancia:integer;
	end;
	
	vViajes=array[1..dimF] of rViaje;
	vContMes=array[ranMes] of integer;
	
	procedure cargarViajes(var vV:vViajes; var dimL:integer);
		procedure LeerViaje(var rV:rViaje);
		begin
			with rV do begin
				write('Distancia: ');readln(distancia);
				if (distancia<>0) then begin
					write('Dia: ');readln(dia);
					write('Monto: ');readln(monto);
				end
			end;
		end;
	var
		rV:rViaje;
	begin
		dimL:=0;
		LeerViaje(rV);
		while (rv.distancia<>0) and (dimL<dimF) do begin
			dimL:=dimL+1;
			vV[dimL]:=rV;
			if (dimL<dimF) then
				LeerViaje(rV);
		end;
	end;

	procedure procesar(vV:vViajes; dimL:integer; var montoP:real; var minDistancia,minDia:integer; var vCM:vContMes);
		procedure menorDinero(rV:rViaje; var rVmim:rViaje);
		begin
			if (rV.monto<rVmim.monto) then begin
				rVmim.monto:=rV.monto;
				rVmim.distancia:=rV.distancia;
				rVmim.dia:=rV.dia;
			end;
		end;
		procedure IniciarCont(var vCM:vContMes);
		var
			i:integer;
		begin
			for i:=1 to dimFM do 
				vCM[i]:=0;
		end;

	var
		i:integer;
		sumaMontos:real;
		rVmim:rViaje;
	begin
		rVmim.monto:=32765;
		sumaMontos:=0;
		IniciarCont(vCM);
		for i:=1 to dimL do begin
			sumaMontos:=sumaMontos + vV[i].monto;
			menorDinero(vV[i],rVmim);
			vCM[vV[i].dia]:=vCM[vV[i].dia]+1;
		end;
		montoP:=sumaMontos/dimL;
		minDistancia:=rVmim.distancia;
		minDia:=rVmim.dia;
	end;

	procedure EliminarDist100(var vV:vViajes; var dimL:integer);
		procedure Buscar(vV:vViajes; distancia,dimL:integer; var pos:integer; var ok:boolean);
		begin
			while (pos<=dimL) and (vV[pos].distancia<>distancia) do
				pos:=pos+1;
			if (pos<=dimL) and (vV[pos].distancia=distancia) then
				ok:=true
			else
				ok:=false;
		end;
	
	var 
		i,pos:integer;
		ok:boolean;
	begin
		pos:=1;
		while (pos<=dimL) do begin
			Buscar(vV,100,dimL,pos,ok);
			if ok then begin
				for i:=pos to dimL-1 do 
					vV[i]:=vV[i+1];
				dimL:=dimL-1;
			end;
		end;
	end;
	
	procedure ImprimirCont(vCM:vContMes);
	var 
		i:integer;
	begin
		for i:=1 to dimFM do
			writeln('[',i,']: ',vCM[i]);
	end;

	{procedure PruebaImpresion(vV:vViajes ;dimL:integer);
	var 
		i:integer;
	begin
		for i:=1 to dimL do
			writeln('Viajes: [',i,']: ',vV[i].dia,' - ',vV[i].monto:4:2,' - ',vV[i].distancia);
	end;}

var
	vV:vViajes; 
	dimL,minDistancia,minDia:integer;
	montoP:real;
	vCM:vContMes;
	
begin
	cargarViajes(vV,dimL);
	procesar(vV,dimL,montoP,minDistancia,minDia,vCM);
	writeln('Monto promedio transportado: ',montoP:4:2);
	writeln('Distancia recorrida y dia del viaje que transporto menos dinero: ',minDistancia,' - ',minDia);
	ImprimirCont(vCM);
	//PruebaImpresion(vV,dimL);
	EliminarDist100(vV,dimL);
	//PruebaImpresion(vV,dimL);
end.
