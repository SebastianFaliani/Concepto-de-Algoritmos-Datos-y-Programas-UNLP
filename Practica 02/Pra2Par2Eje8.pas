program Pra2Par2Eje8;
const 
	Fin=100;
type
	str30=string[30];
	
	procedure Leer(var codigo:integer; var precio:real; var tipo:str30);
	begin
		write('Ingrese el codigo: ');readln(codigo);
		write('Ingrese el precio: ');readln(precio);
		write('Ingrese el tipo: ');readln(tipo);
	end;
	
	procedure masBarato(codigo:integer; precio:real; var cod1,cod2:integer; var precio1,precio2:real);
	begin
		if (precio<precio1) then 
			begin
				precio2:=precio1;
				cod2:=cod1;
				precio1:=precio;
				cod1:=codigo;
			end
		else if (precio<precio2) then begin
				precio2:=precio;
				cod2:=codigo;
		end;
	end;
	
	procedure pantalonCaro(codigo:integer; precio:real; var cod1:integer; var precio1:real);
	begin
		if (precio>precio1) then begin
			precio1:=precio;
			cod1:=codigo;
		end
	end;
	
	procedure procesar(var CodMasBarato1,CodMasBarato2,CodPantalonCaro:integer; var precioPromedio:real);
	var 
		i,codigo:integer;
		precio,precioMasBarato1,precioMasBarato2,precioPantalonCaro, sumaPrecio:real;
		tipo:str30;
	begin
		precioMasBarato1:=32766;
		precioPantalonCaro:=-1;
		sumaPrecio:=0;
		for i:=1 to Fin do begin
			Leer(codigo,precio,tipo);
			masBarato(codigo,precio,CodMasBarato1,CodMasBarato2,precioMasBarato1,precioMasBarato2);
			if tipo='pantalon' then
				pantalonCaro(codigo,precio,CodPantalonCaro,precioPantalonCaro);
			sumaPrecio:=sumaPrecio + precio;
		end;
		precioPromedio:=sumaprecio/Fin;
	end;
	
var
	CodMasBarato1,CodMasBarato2,CodPantalonCaro:integer;
	precioPromedio:real;
begin
	CodMasBarato1:=-1;
	CodPantalonCaro:=-1;
	precioPromedio:=0;
	procesar(CodMasBarato1,CodMasBarato2,CodPantalonCaro,precioPromedio);
	writeln('Codigo de los dos productos mas baratos: (', CodMasBarato1,') (',CodMasBarato2,')');
	writeln('Codigo del producto de tipo pantalon mas caro: (', CodPantalonCaro,')');
	writeln('Precio promedio: ', precioPromedio:6:2);
end.
