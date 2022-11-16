program Pra6Eje5;
type
	str20=string[20];
	rProducto=record
		codigo:integer;
		descripcion:str20;
		stockAct:integer;
		stockMin:integer;
		precio:real;
	end;
	lstProductos=^nodo;
	nodo=record
		producto:rProducto;
		sig:lstProductos;
	end;
	
	procedure LeerProducto(var rP:rProducto);
	begin
		with rP do begin
			write('Codigo: ');readln(codigo);
			if (codigo<>-1) then begin
				write('Descripcion: ');readln(descripcion);
				write('Stock Actual: ');readln(stockAct);
				write('Stock Minimo: ');readln(stockMin);
				write('Precio: ');readln(precio);
			end;
		end;
	end;

	procedure AgregarProducto(var lP:lstProductos; rP:rProducto);
	var
		aux:lstProductos;
	begin
		new(aux);
		aux^.producto:=rP;
		aux^.sig:=lp;
		lp:=aux;
	end;
	
	procedure CargarProductos(var lP:lstProductos);
	var
		rP:rProducto;
	begin
		LeerProducto(rP);
		While (rP.codigo<>-1) do begin
			AgregarProducto(lP,rP);
			LeerProducto(rP);
		end;
	end;

	procedure procesar(lP:lstProductos; var PorcStockMin:real; var codMin1,codMin2:integer);
		function esPar(dig:integer):boolean;
		begin
			esPar:=(dig mod 2)=0;
		end;
		function tresPares(num:integer):boolean;
		var
			dig,tres:integer;
		begin
			tres:=0;
			while (num>0) and (tres<3) do begin
				dig:=num mod 10;
				if esPar(dig) then
					tres:=tres+1;
				num:=num div 10;
			end;
			tresPares:=tres=3;
		end;
		Procedure menorPrecio(codigo:integer;precio:real; var preMin1,preMin2:real; var codMin1,codMin2:integer);
		begin
			if precio<preMin1 then begin
				preMin2:=preMin1;
				preMin1:=precio;
				codMin2:=codMin1;
				codMin1:=codigo;
			end
			else
				if precio<preMin2 then begin
				preMin2:=precio;
				codMin2:=codigo;
			end;
		end;
		
	var
		preMin1,preMin2:real;
		cantProd,cantStockMin:integer;
	begin
		preMin1:=999999;
		cantProd:=0;
		cantStockMin:=0;
		while (lP<>Nil) do begin
			cantProd:=cantProd+1;
			if (lP^.producto.stockAct < lP^.producto.stockMin) then
				cantStockMin:=cantStockMin+1;
			if tresPares(lP^.producto.codigo) then
				writeln('El codigo de producto ',lP^.producto.descripcion ,' esta compuesto por al menos tres digitos pares');
			menorPrecio(lP^.producto.codigo,lP^.producto.precio,preMin1,preMin2,codMin1,codMin2);
			lP:=lP^.sig;
		end;
			PorcStockMin:=(cantStockMin*100)/cantProd;
	end;
	

var
	lP:lstProductos;
	PorcStockMin:real;
	codMin1,codMin2:integer;
begin
	lP:=Nil;
	CargarProductos(lP);
	procesar(lP,PorcStockMin,codMin1,codMin2);
	writeln('Porcentaje de productos con stock actual por debajo de su stock minimo: ',PorcStockMin:2:2);
	writeln('Codigo de los dos productos mas economicos: [',codMin1,']-[',codMin2,']');
end.
