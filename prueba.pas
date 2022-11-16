program Pra3Eje1;
type
	str20=string[20];
	rSocio=record
		nro:integer;
		nombre:str20;
		edad:integer
	end;

	arbol=^nodo;
	nodo=record
		dato:rSocio;
		HI:arbol;
		HD:arbol;
	end;
	
	//PUNTO a
	procedure CargarArbol(var a:arbol);
		procedure LeerSocio(var rS:rSocio);
		begin
			rS.nro:=random(101);
		end;
		
		procedure Cargar(var a:arbol; rS:rSocio);
		begin
			if (a=nil) then begin
				new(a);
				a^.dato:=rS;
				a^.HI:=nil;
				a^.HD:=nil;
			end
			else
				if (rS.nro<a^.dato.nro) then
					Cargar(a^.HI,rS)
				else
					Cargar(a^.HD,rS);
		end;
		
	VAR
		rS:rSocio;
	BEGIN
		a:=nil;
		LeerSocio(rS);
		while (rS.nro<>0) do begin
			Cargar(a,rS);
			LeerSocio(rS);
		end;
	END;
	

	Procedure SocioMasGrande(a:arbol);
		function Maximo (a:arbol):integer;
		begin
			if (a=nil) then maximo:=-1
			else if (a^.HD=nil) then maximo:=a^.dato.nro
			else maximo:=maximo(a^.HD);
		end;
		
	BEGIN
		writeln(maximo(a));
	END;
	
VAR
	a:arbol;
BEGIN
	randomize;
	CargarArbol(a);
	SocioMasGrande(a);

END.
