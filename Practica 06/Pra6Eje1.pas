program Pra6Eje1;
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
	
	//c.)
	procedure imprimir(L:lista);
	begin
		while (L<>nil) do begin
			writeln(L^.num);
			L:=L^.sig;
		end;
	end;
	
	//d.) 
	procedure Incremtar(var	L:lista; num:integer);
	begin
		while (L<>nil) do begin
			L^.num:=L^.num + num;
			L:=L^.sig;
		end;
	end;
var
	pri : lista;
	valor : integer;
begin
	pri := nil;
	write('Ingrese un numero: ');readln(valor);
	while (valor <> 0) do begin
		armarNodo(pri, valor);
		write('Ingrese un numero :');readln(valor);
	end;
	imprimir(pri);
	write('Incremento: ');readln(valor);
	Incremtar(pri, valor);
	imprimir(pri);
end.
