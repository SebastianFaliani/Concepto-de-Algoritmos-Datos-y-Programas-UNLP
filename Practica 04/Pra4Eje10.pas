Program Pra4Eje10;
const
	dimF=300;
type
	vSalario=array[1..dimF] of real;
	
	procedure CargarVectorSalarios(var v:vSalario; var dimL:integer);
	var 
		sueldo:real;
	begin
		dimL:=0;
		write('Sueldo: ');readln(sueldo);
		while (sueldo<>0) and (dimL<dimF) do begin
			dimL:=dimL+1;
			v[dimL]:=sueldo;
			if dimL<dimF then begin
				write('Sueldo: ');readln(sueldo);
			end;
		end;
	end;
	
	procedure incremento(var v:vSalario; dimL:integer; inc:real);
		function aumento(sueldo:real; inc:real):real;
		begin
			aumento:=(sueldo+(sueldo*inc)/100);
		end;
		
	var
		i:integer;
	begin
		for i:=1 to dimL do
			v[i]:=aumento(v[i],inc);
	end;
	
	function SueldoProm(v:vSalario; dimL:integer):real;
	var
		i:integer;
		suma:real;
	begin
		suma:=0;
		for i:=1 to dimL do
			suma:=suma+v[i];
		SueldoProm:=suma/dimL;
	end;
var
	v:vSalario;
	dimL:integer;
	
begin
	CargarVectorSalarios(v,dimL);
	incremento(v,dimL,15);
	writeln('El sueldo promedio de los empleados de la empresa es: ',SueldoProm(v,dimL));
end.
