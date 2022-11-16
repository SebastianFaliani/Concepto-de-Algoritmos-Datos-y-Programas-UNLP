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
	procedure armarNodoOrdenado(var L:lista; v: integer);
	var
		aux,ant,act : lista;
	begin
		new(aux);
		aux^.num:=v;
		ant:=L;
		act:=L;
		while (act<>nil) and (v>act^.num) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if ant=act then
			L:=aux
		else
			ant^.sig:=aux;
		aux^.sig:=act;
	end;

	//Ejercicio 9.a)
	function EstaOrdenada(l:lista):boolean;
		function ordenadaMenoraMayor(l:lista):boolean;	
		var
			sig:lista;
			ordenada:boolean;
		begin
			ordenada:=true;
			while (l<>nil) and ordenada do begin
				sig:=l^.sig;
				if (sig<>nil) and (l^.num<sig^.num) then
					l:=l^.sig
				else
					if (sig<>nil) then
						ordenada:=false
					else
						l:=sig;
			end;
			ordenadaMenoraMayor:=ordenada;
		end;
		function ordenadaMayoraMenor(l:lista):boolean;	
		var
			sig:lista;
			ordenada:boolean;
		begin
			ordenada:=true;
			while (l<>nil) and ordenada do begin
				sig:=l^.sig;
				if (sig<>nil) and (l^.num>sig^.num) then
					l:=l^.sig
				else
					if (sig<>nil) then
						ordenada:=false
					else
						l:=sig;
			end;
			ordenadaMayoraMenor:=ordenada;
		end;
	begin
		EstaOrdenada:=ordenadaMenoraMayor(l) or ordenadaMayoraMenor(l);
	end;

	//Ejercicio 9.b)
	procedure Eliminar (var l:lista; v:integer);
	var
		ant,act:lista;
	begin
		ant:=l;
		act:=l;
		while (act<>nil) do begin
			if (act^.num<>v) then begin
				ant:=act;
				act:=act^.sig;
			end
			else 
				if act<> nil then begin
					if ant=act then begin
						l:=act^.sig;
						ant:=act^.sig;
					end
					else
						ant^.sig:=act^.sig;
					dispose(act);
					act:=ant;
				end;
		end;
	end;
	
	//Ejercicio 9.c)
	
	procedure EntraAyB (l:lista; a,b:integer; var lRes:lista);
	begin
		while (l<>nil) do begin
			if (l^.num>a) and (l^.num<b) then 
				armarNodoOrdenado(lRes,l^.num);
			l:=l^.sig;
		end;
	end;
	
	//Ejercicio 9.d)
	procedure EntraAyBOrdAsc (l:lista; a,b:integer; var lRes:lista);
	begin
		while (l<>nil) and (l^.num<b) do begin
			if (l^.num>a) and (l^.num<b) then 
				armarNodoOrdenado(lRes,l^.num);
			l:=l^.sig;
		end;
	end;
	
	//Ejercicio 9.e)
	procedure EntraAyBOrdDesc (l:lista; a,b:integer; var lRes:lista);
	begin
		while (l<>nil) and (l^.num>a) do begin
			if (l^.num>a) and (l^.num<b) then 
				armarNodoOrdenado(lRes,l^.num);
			l:=l^.sig;
		end;
	end;
	
var
	pri, lRes : lista;
	valor : integer;
begin
	pri := nil;
	lRes:=nil;
	write('Ingrese un numero: ');readln(valor);
	while (valor <> 0) do begin
		armarNodoOrdenado(pri,valor);
		write('Ingrese un numero: ');readln(valor);
	end;
	imprimir(pri);
	writeln(EstaOrdenada(pri));
	Eliminar (pri,2);
	imprimir(pri);
	//EntraAyBOrdDesc (pri,12,16,lRes);
	  imprimir(lRes);
end.

