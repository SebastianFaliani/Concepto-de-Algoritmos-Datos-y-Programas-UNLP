PROGRAM Pra4Eje3;
const
	dimF=7;
type
	ranDia=1..7;
	rEntrada=record
		cod:integer;
	end;
	lista=^nodo;
	nodo=record
		dato:rEntrada;
		sig:lista;
	end;
	
	Procedure GenerarListas(var vE:vEntradas);

		Procedure LeerEntrada(var rE:rEntrada);
		begin
			rE.cod:=random(51);
		end;

		Procedure AgregarOrdenado(var l:lista;rE:rEntrada);
		var
			ant,act,aux:lista;
		Begin
			new(aux);
			aux^.dato:=rE;
			act:=l;
			while (act<>nil) and (rE.cod>l^.dato.cod) do begin
				ant:=act;
				act:=act^.sig;
			end;
			if act=l then
				l:=aux
			else
				ant^.sig:=aux;
			aux^.sig:=act;
		End;
	var
		rE:rEntrada;	
		
	Begin
		l:nil;
		LeerEntrada(rE);
		while rE.cod<>0 do begin
			AgregarOrdenado(vE[rE.dia],rE);
			LeerEntrada(rE);
		end;
	end;
	
	procedure Imprimirvector(var vE:vEntradas);
		procedure Imprimir(l:lista);
		begin
			while l<>nil do begin
				writeln(l^.dato.dia,'-',l^.dato.cod,'-' ,l^.dato.asiento,'-' ,(l^.dato.monto):6:2);
				
				l:=l^.sig;
			end;
		end;
	var
		i:integer;
	begin
		for i:=1 to dimF do begin
			if vE[i]<> nil then
				Imprimir(vE[i])
			else
				writeln('Lista Vacia [',i,']');
			readln();
		end;
	end;
	
VAR
	l:lista;
BEGIN
	Randomize;
	GenerarListas(vE);
	Imprimirvector(vE);
END.
