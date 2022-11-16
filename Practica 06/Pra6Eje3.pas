program Pra6Eje3;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;

	procedure armarNodo(var L: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := L;
		L := aux;
	end;
	
	//Ejercicio 1.c)
	procedure imprimir(L:lista);
	begin
		while (L<>nil) do begin
			writeln(L^.num);
			L:=L^.sig;
		end;
	end;
	
	//Ejercicio 1.d)
	procedure Incremtar(L:lista; num:integer);
	begin
		while (L<>nil) do begin
			L^.num:=L^.num + num;
			L:=L^.sig;
		end;
	end;
	
	//Ejercicio 3.a)
	Procedure armarNodoModificadoI(var L: lista; v: integer);
	var
		aux,act : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := nil;
		if (L=nil) then
			L := aux
		else 
		begin
			act:=L;
			while (act^.sig<>nil) do
				act:=act^.sig;
			act^.sig:=aux;
		end;
	end;
	
	//Ejercicio 3.b)
	Procedure armarNodoModificadoII(var L,Ult: lista; v: integer);
	var
		aux : lista;
	begin
		new(aux);
		aux^.num := v;
		aux^.sig := nil;
		if (L=nil) then
			L := aux
		else 
			Ult^.sig:=aux;
		Ult:=aux;
	end;
	
var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	write('Ingrese un numero: ');readln(valor);
	while (valor <> 0) do begin
		armarNodo(pri,valor);
		write('Ingrese un numero :');readln(valor);
	end;
	imprimir(pri);
	write('Incremento: ');readln(valor);
	Incremtar(pri, valor);
	imprimir(pri);
end.
