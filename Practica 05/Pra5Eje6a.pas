program Pra5Eje6a;
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
	
var
	//50kb = 51.200 bytes
	//Se ocuparian 51.184 bytes de memoria estatica (1828 x 28 bytes)
	vP:vProductos;
begin
	CargarVectorProductos (vP);
end.
