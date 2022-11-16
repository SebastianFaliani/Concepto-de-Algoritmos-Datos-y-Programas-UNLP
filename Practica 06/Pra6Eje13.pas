program Pra6Eje13;
const
	dimF=3600;
type
	str30=string[30];
	rango=1..5;
	rUsuario=record
		email:str30;
		rol:rango;
		revista:str30;
		ultAcceso:integer;
	end;
	vUsuarios=array[1..dimF] of rUsuario;
	vRol=array[rango] of integer;
	
	lstUsuariosEconomia=^nodo;
	nodo=record
		usuario:rUsuario;
		sig:lstUsuariosEconomia;
	end;
	
	procedure Inicializar(var vR:vRol);
	var
		i:integer;
	begin
		for i:=1 to 5 do
			vR[i]:=0;
	end;
	
	Procedure AgregarOrdenado(var l:lstUsuariosEconomia; rU:rUsuario);
	var
		aux,ant,act:lstUsuariosEconomia;
	begin
		new(aux);
		aux^.usuario:=rU;
		ant:=l;
		act:=l;
		while (act<>nil) and (rU.ultAcceso>act^.usuario.ultAcceso) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if ant=act then
			l:=aux
		else
			ant^.sig:=aux;
		aux^.sig:=act;
	end;
	
	procedure Maximo(email:str30; ultAcceso:integer; var mailMax1,mailMax2:str30; var accMax1,accMax2:integer);
	begin
		if ultAcceso>accMax1 then begin
			accMax2:=accMax1;
			accMax1:=ultAcceso;
			mailMax2:=mailMax1;
			mailMax1:=email;
		end
		else
		if ultAcceso>accMax1 then begin
			accMax2:=ultAcceso;
			mailMax2:=email;
		end;
	end;
	
	procedure procesar(vU:vUsuarios; var l:lstUsuariosEconomia; var vR:vRol; var mailMax1,mailMax2:str30; var dimL:integer);
	var
		i,accMax1,accMax2:integer;
	begin
		Inicializar(vR);
		dimL:=0;
		accMax1:=-1;
		for i:=1 to dimF do begin
			if (vU[i].revista='Economia') then
				AgregarOrdenado(l,vU[i]);
			vR[vU[i].rol]:=vR[vU[i].rol]+1;
			Maximo(vU[i].email,vU[i].ultAcceso,mailMax1,mailMax2,accMax1,accMax2);
		end;
	end;

var 
	l:lstUsuariosEconomia;
	vU:vUsuarios; 
	vR:vRol;
	mailMax1,mailMax2:str30;
	dimL:integer;
begin
	//CargarUsuarios(vU); //se dispone
	procesar(vU,l,vR,mailMax1,mailMax2,dimL);
end.
