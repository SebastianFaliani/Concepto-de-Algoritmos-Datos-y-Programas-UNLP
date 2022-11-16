Program Pra4Par2Eje5;
const
	dimF=500;
	dimFM='F';
	dimFC=2400; 
	DimFMD=10;
type
	str30= string[30];
	ranMonotributo='A'..dimFM;
	ranCodCiudad=1..dimFC;
	ranMes=1..12;
	ranAnio=1950..2100;
	
	rFecha=record
		mes:ranMes;
		anio:ranAnio;
	end;
	
	rCliente=record
		firma:rFecha;
		monotributo:ranMonotributo;
		ciudad:ranCodCiudad;
		monto:real;
	end;
	
	rMaxDiez=record
		maxDiez:integer;
		codCiudad:ranCodCiudad;
	end;
	
	vClientes=array[1..dimF] of rCliente;
	vMonotributos=array[ranMonotributo] of integer;
	vClientesXciudad=array[ranCodCiudad] of integer;
	vMaxDiez=array[1..DimFMD] of rMaxDiez;

	
	//Inicio el vector contador de Monotributos en cero
	procedure IniciarMonotributos(var vM:vMonotributos);
	var
		i:char;
	begin
		for i:='A' to dimFM do
			vM[i]:=0;
	end;

	
	//Inicio el vector contador de Clientes por ciudad en cero
	procedure IniciarClienteXciudad(var vC:vClientesXciudad);
	var
		i:integer;
	begin
		for i:=1 to dimFC do
			vC[i]:=0;
	end;

	
	//Inicio el vector de los mayores Diez de Clientes por ciudad en -1
	procedure IniciarMayoresDiez(var vMD:vMaxDiez);
	var
		i:integer;
	begin
		for i:=1 to DimFMD do
			vMD[i].maxDiez:=-1;
	end;

	
	//Leo el registro Cliente
	procedure LeerCliente(var rC:rCliente);
		//Leo el registro fecha
		procedure LeerFecha(var rF:rFecha);
		begin
			with rf do begin
				writeln('Fecha Contrato');
				write('   Mes [1..12]: ');readln(mes);
				write('   Anio [1950..2022]: ');readln(anio);
			end;
		end;
	var 
		rF:rFecha;
	begin
		with rC do begin
			LeerFecha(rF);
			firma:=rF;
			write('Categoria Monotributo [A..F]: ');readln(monotributo);
			write('Codigo Ciudad [1..2400]: ');readln(monotributo);
			write('Monto: ');readln(monto);
		end;
	end;

	
	//Cargo el el vector los registro de cliente
	procedure CargarClientes(var vC:vClientes);
	var
		rC:rCliente;
		i:integer;
	begin
		for i:=1 to dimF do begin
			LeerCliente(rC);
			vC[i]:=rC;
		end;
	end;


	procedure procesar(vC:vClientes; var maxAnio:ranAnio; var vMD:vMaxDiez; var ClienteSupProm:integer);
		//Devuelve el año en que se fimaron la mayor cantidad de contratos
		procedure MayorCantContratos(anioAct:ranAnio; contratos:integer; var maxAnio:ranAnio; var maxContratos:integer);
		begin
			if (contratos>maxContratos) then begin
				maxContratos:=contratos;
				maxAnio:=anioAct;
			end;
		end;
		//Devuelve un vector con el codigo de las 10 ciudades con mayor cantidad de clientes
		procedure MaxDiez(vCxC:vClientesXciudad; var vMD:vMaxDiez);
		var
			i,j,pos:integer;
		begin
			for i:=1 to dimFC do begin
				pos:=1;
				while (pos<=dimFMD) and (vCxC[i]<vMD[pos].maxDiez) do
					pos:=pos+1;
				if (pos<=dimFMD) then begin
					for j:=dimFMD downto pos do begin
						vMD[j].maxDiez:=vMD[j-1].maxDiez;
						vMD[j].codCiudad:=vMD[j-1].codCiudad;
					end;
					vMD[pos].maxDiez:=vCxC[i];
					vMD[pos].codCiudad:=i;
				end;
			end;
		end;	
		//Devuelve la cantidad de clientes que superan el monto promedio 
		function ClienteSupMontoProm(vC:vClientes;MontoPromedio:real):integer;
		var
			i,cont:integer;
		begin
			cont:=0;
			for i:=1 to dimF do
				if vC[i].monto>MontoPromedio then
					cont:=cont+1;
			ClienteSupMontoProm:=cont;
		end;
	var
		anioAct,mesAct,i:integer;
		contMes,contAnio,maxContratos:integer;
		vM:VMonotributos;
		vCxC:vClientesXciudad;
		sumaMontos,MontoPromedio:real;
	begin
		sumaMontos:=0;
		maxContratos:=-1;
		i:=1;
		IniciarMonotributos(vM);
		IniciarClienteXciudad(vCxC);
		IniciarMayoresDiez(vMD);
		while (i<=dimF) do begin
			anioAct:=vC[i].firma.anio;
			contAnio:=0;
			while (i<=dimF) and (anioAct=vC[i].firma.anio) do begin
				mesAct:=vC[i].firma.mes;
				contMes:=0;
				while (i<=dimF) and (anioAct=vC[i].firma.anio) and (mesAct=vC[i].firma.mes) do begin
					contMes:=contMes+1;
					vM[vC[i].monotributo]:=vM[vC[i].monotributo]+1;
					vCxC[vC[i].ciudad]:=vCxC[vC[i].ciudad]+1;
					sumaMontos:=sumaMontos+vC[i].monto;
					i:=i+1;
				end;
				writeln('Para el Mes [',mesAct,'] del anio [',anioAct,'] hay ',contMes,' contratos firmados');
				contAnio:=contAnio+contMes;
			end;
			writeln('El total de contratos firmados para el anio [',anioAct,'] son: ',contAnio);
			MayorCantContratos(anioAct,contAnio,maxAnio,maxContratos);
		end;
		MaxDiez(vCxC,vMD);
		MontoPromedio:=sumaMontos/dimF;
		ClienteSupProm:=ClienteSupMontoProm(vC,MontoPromedio);
	end;


	//Imprime el vector con el codigo de las 10 ciudades con mayor cantidad de clientes
	procedure ImprimirMaxDiez(v:vMaxDiez);
	var 
		i:integer;
	begin
		for i:=1 to DimFMD do
			writeln('Cod Ciudad: [',v[i].codCiudad,'] - Cantidad: [',v[i].maxDiez,']');
	end;


{*********** PROGRAMA PRINCIPAL **********}
var 
	vC:vClientes;
	vMD:vMaxDiez;
	maxAnio:ranAnio;
	ClienteSupProm:integer;
begin
	CargarClientes(vC);
	procesar(vC,maxAnio,vMD,ClienteSupProm);
	writeln('Anio en que se firmo la mayor cantidad de contratos [',maxAnio,'] ');
	ImprimirMaxDiez(vMD);
	writeln('Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes [',ClienteSupProm,'] ');
end.
