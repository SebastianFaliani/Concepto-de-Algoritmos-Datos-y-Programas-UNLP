program Pra4Par2AdiOp1;
const
	dimF=5000;
type
	vMontoInv=array[1..dimF] of real;
	
	rEmpresa=record
		cod:integer;
		cantInv:integer;
		montoInv:vMontoInv;
	end;
	
	vEmpresas=array[1..dimF] of rEmpresa;
	
	Procedure LeerEmpresa(var rE:rEmpresa);
		procedure LeerInv(var vMI:vMontoInv; dimL:integer);
		var
			i:integer;
		begin
			for i:=1 to dimL do begin
				write('Ingrese el monto de cada inversion: ');readln(vMI[i]);
			end;
		end;
	var 
		vMI:vMontoInv;
	begin
		with rE do begin
			write('Ingrese un codigo de empresa: ');readln(cod);
			write('Ingrese la cant. de inversiones: ');readln(cantInv);
			LeerInv(vMI,cantInv);
			montoInv:=vMI;
		end;
	end;

	procedure cargarEmpresas(var vE:vEmpresas; var dimL:integer);
	var
		rE:rEmpresa;
	begin
		dimL:=0;
		repeat
			dimL:=dimL+1;
			LeerEmpresa(rE);
			vE[dimL]:=rE;
		until (vE[dimL].cod=100);
	end;

	procedure Procesar(vE:vEmpresas; dimL:integer);
	begin
	
	end;


var
	vE:vEmpresas;
	dimL:integer; 
	
begin
	cargarEmpresas(vE,dimL);
	Procesar(vE,dimL);
	
end.
