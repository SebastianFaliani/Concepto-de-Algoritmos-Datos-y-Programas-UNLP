Program Pra4Eje13;
const
	dimFT=100;
	dimFA=2022;
type
	ranAnio=1972..dimFA;
	
	vTemperaturas=array[1..dimFT] of integer;
	
	vAnios=array[ranAnio] of vTemperaturas;
	
	procedure Cargar(var vA:vAnios);
		procedure CargarTempLug(var vT:vTemperaturas);
		var
			i,temp:integer;
		begin
			for i:=1 to dimFT do begin
				write('Temperaturas: ');readln(temp);
				vT[i]:=temp;
			end;
		end;
	var
		vT:vTemperaturas;
		i:ranAnio;
	begin
		for i:=1972 to dimFA do begin
			writeln('Anio ',i);
			CargarTempLug(vT);
			va[i]:=vT;
		end;
	end;

	procedure AnioMayoTemp(Anio:ranAnio;temp:integer; var maxAnio:ranAnio; var maxTemp:integer);
	begin
		if (temp>maxTemp) then begin
			maxTemp:=temp;
			maxAnio:=Anio;
		end;
	end;

	procedure procesar(vA:vAnios; var maxAnio,maxAnio50:ranAnio);
	var
		i:ranAnio;
		j,sumaTempAnio,maxTemp,maxTemp50:integer;
	begin
		maxTemp:=-100;
		maxTemp50:=-100;
		for i:=1972 to dimFA do begin
			sumaTempAnio:=0;
			for j:=1 to dimFT do begin
				sumaTempAnio:=sumaTempAnio+ vA[i][j];
				AnioMayoTemp(i,vA[i][j],maxAnio50,maxTemp50);
			end;
			AnioMayoTemp(i,sumaTempAnio,maxAnio,maxTemp);
		end;
	end;

	
var
	vA:vAnios;
	maxAnio,maxAnio50:ranAnio;
begin
	Cargar(vA);
	procesar(vA,maxAnio,maxAnio50);
	writeln('El año con mayor temperatura promedio a nivel mundial es: ',maxAnio);
	writeln('El año con la mayor temperatura detectada en algun punto del planeta en los ultimos 50 años es: ',maxAnio50);
end.
