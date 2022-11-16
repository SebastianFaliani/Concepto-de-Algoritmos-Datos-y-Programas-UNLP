program Pra2AdiEje3;
const
	fin=5;
type
	rango=1..fin;
	str30=string[30];
	procedure Leer( var codigo:rango; var precio:real);
	begin
		readln(codigo);
		readln(precio);
	end;
	
	procedure masBarato(codigo:rango;precio:real; var codMin1,codMin2:rango; var precioMin1,precioMin2:real);
	begin
		if (precio<precioMin1) then begin
			precioMin2:=precioMin1;
			precioMin1:=precio;
			codMin2:=codMin1;
			codMin1:=codigo;
		end
		else if (precio<precioMin2) then begin
			precioMin2:=precio;
			codMin2:=codigo;
		end;
	end;
	
	function esPar(num:integer):boolean;
	begin
		esPar:=(num mod 2)=0;
	end;
	
	procedure procesar(var cod1,cod2:rango;var cant:integer);
	var
		codigo:rango;
		precio,precioMin1,precioMin2:real;
		i:integer;
	begin
		precioMin1:=999999;
		cant:=0;
		for i:=1 to fin do begin
			Leer(codigo,precio);
			masBarato(codigo,precio,cod1,cod2,precioMin1,precioMin2);
			if(precio>16) and (esPar(codigo)) then begin
				cant:=cant+1;
			end;
		end;
	end;

var
	cod1,cod2:rango;
	cant:integer;
begin
	procesar(cod1,cod2,cant);
	writeln(cod1,' ' ,cod2);
	writeln(cant);
end.
