program Pra6Eje4;
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
	
	//Ejercicio 4.a)
	procedure Maximo(L:lista; var max:integer);
	begin
		max:=-32766;
		while (L<>nil) do begin
			if (L^.num>max) then
				max:=L^.num;
			L:=L^.sig;
		end;
	end;
	
	//Ejercicio 4.b)
	procedure Minimo(L:lista; var min:integer);
	begin
		min:=32765;
		while (L<>nil) do begin
			if (L^.num<min) then
				min:=L^.num;
			L:=L^.sig;
		end;
	end;
	
	//Ejercicio 4.c)
	procedure CantMultiplos(l:lista; valor:integer; var cant:integer);
		function Multiplo(num,valor:integer):boolean;
		begin	
			Multiplo:=(num mod valor)=0;
		end;
	begin
		cant:=0;
		while (l<>nil) do begin
			if Multiplo(l^.num,valor) then
				cant:=cant+1;
			l:=l^.sig;
		end;	
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
end.
