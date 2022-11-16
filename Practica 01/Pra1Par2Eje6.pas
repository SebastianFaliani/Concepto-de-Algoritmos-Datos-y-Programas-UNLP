program Pra1Par2Eje6;
const
	fin=200;
type
	productos=0..fin;

function espar(cod:productos):boolean;
begin
	espar:= (cod mod 2)=0;
end;

var
	i,codigo,cod1,cod2,cont:productos;
	precio,min1,min2:real;
	
begin
		min1:=32765;
		cod1:=0;
		cont:=0;
		for i:=1 to fin do begin
			write('Ingrese el codigo: ');readln(codigo);
			write('Ingrese el precio: ');readln(precio);
			if (precio<min1) then begin
				min2:= min1;
				cod2:=cod1;
				min1:=precio;
				cod1:=codigo
			end
			else
				if (precio<min2) then begin
					min2:=precio;
					cod2:=codigo;
			end;
			if (precio>16)and espar(codigo) then
				cont:=cont+1
		end;
		writeln('Los codigos de los dos productos mas baratos son: ', cod1,' ',cod2);
		writeln('La cantidad de productos de mas de 16 pesos con codigo par son: ', cont);
end.
