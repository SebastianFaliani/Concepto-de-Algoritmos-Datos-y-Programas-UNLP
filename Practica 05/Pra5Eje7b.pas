program Pra5Eje7b;

Type Nombre = String[50];
	Puntero = ^Nombre;
	ArrPunteros = array[1..2500] of Puntero;

	//b.2 Se reserva en Memoria dinamica (Heap)
	procedure ReservarMemoria(var v:ArrPunteros);
	var
		i:integer;
	begin
		for i:=1 to 2500 do
			new(v[i]);
	end;

	//b.3
	Procedure LeerNombre(var v:ArrPunteros);
	var 
		i:integer;
	begin
		for i:=1 to 2500 do begin
			readln(v[i]^);
		end;
	end;

Var
	Punteros: ArrPunteros;
	//b.1 El tamaño del puntero comenzar el programa es 10000(4 bytes *2500)
begin
	ReservarMemoria(Punteros);
	LeerNombre(Punteros);
end.
