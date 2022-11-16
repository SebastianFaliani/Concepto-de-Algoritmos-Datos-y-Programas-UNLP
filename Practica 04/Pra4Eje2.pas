Program Pra4Eje2;
const
	cant_datos = 150;
type
	vdatos = array[1..cant_datos] of real;

	procedure cargarVector(var v:vdatos; var dimL : integer);
	var
		dato:real;
	begin
		readln(dato);
		dimL:=0;
		while (dimL<cant_datos) and (dato<>0) do begin
			dimL:=dimL+1;
			v[dimL]:=dato;
			if (dimL<cant_datos) then
				readln(dato);
		end;
	end;
	
	procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
	var
		i:integer;
	begin
		for i:=1 to dimL do begin
			v[i]:=v[i]+n;
			suma:=suma+v[i];
		end;
	end;

{ programa principal }
var
	datos : vdatos;
	dim : integer;
	num, suma : real;
begin
	dim := 0;
	suma:= 0;
	cargarVector(datos,dim); { completar }
	writeln('Ingrese un valor a sumar');
	readln(num);
	modificarVectorySumar(datos,dim,num,suma);{completar}
	writeln('La suma de los valores es: ', suma);
	writeln('Se procesaron: ',dim, ' números')
end.
