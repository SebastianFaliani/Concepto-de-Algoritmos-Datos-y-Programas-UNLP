program Pra5Eje6c;
const
	dimF=1828;
type
	str20=string[20];
	rProducto=record
		codigo:integer;
		descripcion:str20;
		precio:real;
	end;
	vProductos=array[1..dimF] of rProducto;
	
	prtProductos=^vProductos;
	
	procedure CargarVectorProductos (var vP:vProductos);
		Procedure LeerProducto(var rP:rProducto);
		begin
			with rP do begin
				write('Codigo: ');readln(codigo);
				write('Descripcion: ');readln(descripcion);
				write('Precio: ');readln(precio);
			end;
		end;
	
	var
		i:integer;
		
	begin
		for i:=1 to dimF do begin
			LeerProducto(vP[i]);
		end;
	end;
	
	procedure CargarProductos (var pP:prtProductos);
	begin
		CargarVectorProductos (pP^);
	end;
	
var
	//50kb = 51.200 bytes
	//Se ocuparian 4 bytes del puntero de Memoria Estatica 
	//Y 51.184 bytes del vector que se guarda en la direccion a la que apunta el puntero en Memoria Dinamica (1828 x 28 bytes)
	pP:prtProductos;
begin
	new(pP);
	CargarProductos (pP);
end.
