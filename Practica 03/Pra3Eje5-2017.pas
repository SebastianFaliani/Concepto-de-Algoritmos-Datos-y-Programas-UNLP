program Pra3Eje5_2017;
type
	str30=string[30];
	tElectro=record
		codigo:integer;
		tipo:str30;
		marca:str30;
		cliente:str30;
		falla:str30;
		monto:real;
	end;
	
	procedure LeerElectro(var e:tElectro);
	begin
		with e do begin
			write('Codigo: ');readln(codigo);
			if (codigo<>-1) then begin
				write('Tipo: ');readln(tipo);
				write('Marca: ');readln(marca);
				write('Cliente: ');readln(cliente);
				write('Falla: ');readln(falla);
				write('Monto: ');readln(monto);
			end;
		end;
	end;
	
	procedure mayorMarca(marca:str30; cant:integer; var maxMarca:str30; var maxCant:integer);
	begin
		if (cant>maxCant) then begin
			maxCant:=cant;
			MaxMarca:=marca;
		end;
	end;
	
	function licuadora50(tipo:str30;monto:real):boolean;
	begin
		licuadora50:=(tipo='licuadora') and (monto>=50);
	end;

	procedure procesar(var maxMarca:str30; var cantLic:integer);
	var
		e:tElectro;
		marcaAct:str30;
		cantMarca,maxCant:integer;
		MontoTotal:real;
	begin
		maxCant:=-1;
		cantLic:=0;
		LeerElectro(e);
		while (e.codigo<>-1) do begin
			cantMarca:=0;
			MontoTotal:=0;
			marcaAct:=e.marca;
			while (e.codigo<>-1) and (marcaAct=e.marca)do begin
				cantMarca:=cantMarca+1;
				MontoTotal:=MontoTotal+ e.monto;
				if licuadora50(e.tipo,e.monto) then
					cantLic:=cantLic+1;
				LeerElectro(e);
			end;
			mayorMarca(marcaAct,cantMarca,maxMarca,maxCant);
			writeln(marcaAct,' Monto Total: ',MontoTotal);
		end;
	
	end;
	
var
	maxMarca:str30;
	cantLic:integer;
begin
	procesar(maxMarca,cantLic);
	writeln('Marca con mayor cantidad de electrodomesticos en reparacion: ', maxMarca);
	writeln('Cantidad de licuadoras cuyo monto de reparacion es al menos 50 pesos: ', cantLic);
end.
