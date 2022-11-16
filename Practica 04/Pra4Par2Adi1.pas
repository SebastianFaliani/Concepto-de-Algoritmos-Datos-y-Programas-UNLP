program Pra4Par2Adi1;
const
	dimF=10000;
type
	rComputadora=record
		cod:integer;
		version:real;
		paquetes:integer;
		cuentas:integer;
	end;
	
	vComputadoras=array[1..dimF] of rComputadora;
	
	procedure LeerComputadora(var rC:rComputadora);
	begin
		with rC do begin
			write('Codigo:');readln(cod);
			if (cod<>-1) then begin
				write('Version: ');readln(version);
				write('Paquetes: ');readln(paquetes);
				write('Cuentas: ');readln(cuentas);
			end;
		end;
	end;


	function Posicion(vC:vComputadoras; dimL:integer; cod:integer):integer; 
		var
			pos:integer;
		begin
			pos:=1;
			while (pos<=dimL) and (cod>vC[pos].cod) do begin
				pos:=pos+1;
			end;
			Posicion:=pos;
		end;


	procedure CargarComputadoras(var vC:vComputadoras; var dimL:integer);
		procedure insertar(var vC:vComputadoras;var dimL:integer; pos:integer; rC:rComputadora; var ok:boolean); 
		var
			i:integer;
		begin
			if (pos>=1) and (pos<=dimL) and (dimL<dimF) then begin
				ok:=true;
				for i:=dimL downTo pos do
					vC[i+1]:=vC[i]; //esto lo hace demas cuando pos y dimL valen 1
				vC[pos]:=rC;
			end
			else begin
				vC[pos]:=rC;
				ok:=false
			end;
		end;
		
	var
		rC:rComputadora;
		ok:boolean;
		pos:integer;
	begin
		LeerComputadora(rC);
		dimL:=0;
		while (dimL<dimF) and (rC.cod<>-1) do begin

			pos:=Posicion(vC,dimL,rC.cod);
			insertar(vC,dimL,pos,rC,ok);
			dimL:=dimL+1;
			LeerComputadora(rC);
		end;
	end;
	
	procedure procesar(var vC:vComputadoras; var dimL:integer; var CantVersion:integer; var promCuentas,verMaxPaq:real);
		function versiones(ver:real):boolean;
		begin
			versiones:=(ver=18.04)or (ver=16.04);
		end;
		
		procedure mayorVerPaq(ver:real; paq:integer; var verMaxPaq:real; var maxPaq:integer);
		begin
			if (paq>maxPaq) then begin
				maxPaq:=paq;
				verMaxPaq:= ver;
			end;
		end;
		
		procedure Eliminar(var vC:vComputadoras; var dimL:integer; pos:integer);
		var
			i:integer;
		begin
			if pos>0 then begin
				Write (pos,' ',dimL);
				for i:=1 to dimL-pos do
					vC[i]:=vC[pos+i];
				dimL:=dimL-pos;
			end;
		end;
		
	var
		maxPaq,i,sumaCuentas,pos:integer;
		
	begin
		maxPaq:=-1;
		CantVersion:=0;
		sumaCuentas:=0;
		pos:=0;
		for i:=1 to dimL do begin
			if versiones(vC[i].version) then
				CantVersion:=CantVersion+1;
			sumaCuentas:=sumaCuentas+vC[i].cuentas;
			mayorVerPaq(vC[i].version,vC[i].paquetes,verMaxPaq,maxPaq);
		end;
		pos:=Posicion(vC,dimL,500);
		Eliminar(vC,dimL,pos);
		promCuentas:=sumaCuentas/dimL;
	end;
	
	procedure Imprimir(vC:vComputadoras; dimL:integer);
	var 
		i:integer;
	begin
		for i:=1 to dimL do
			writeln('Cod: [',vC[i].cod,'] - version: [',(vC[i].version):2:2,']');
	end;

var 
	vC:vComputadoras;
	dimL,CantVersion:integer;
	promCuentas,verMaxPaq:real;
begin
	CargarComputadoras(vC,dimL);
	procesar(vC,dimL,CantVersion,promCuentas,verMaxPaq);
	Imprimir(vC,dimL);
end.
