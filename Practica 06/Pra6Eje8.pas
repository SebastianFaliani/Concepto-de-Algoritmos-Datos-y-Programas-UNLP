program Pra6Eje8;
type
	lista = ^nodo;
	nodo = record
		num : integer;
		sig : lista;
	end;
	
	procedure armarNodo(var L: lista; v: integer);
	var
		aux:lista;
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

	//Ejercicio 8)
	procedure armarNodoModificado(var L: lista; v: integer);
	var
		aux,ant,act : lista;
	begin
		new(aux);
		aux^.num:=v;
		ant:=L;
		act:=L;
		while (act<>nil) and (v<act^.num) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if ant=act then
			L:=aux
		else
			ant^.sig:=aux;
		aux^.sig:=act;
	end;

var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	write('Ingrese un numero: ');readln(valor);
	while (valor <> 0) do begin
		armarNodo(pri,valor);
		write('Ingrese un numero: ');readln(valor);
	end;
	imprimir(pri);
end.

	
	
	
