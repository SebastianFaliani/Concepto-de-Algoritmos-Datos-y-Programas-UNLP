{ Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La
lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede
no existir.
}
Program Pra7Eje1;
const
	dimF=5;
type
	str30=string[30];
	ranGenero=1..dimF;
	rPersona=record
		dni:longint;
		apellido:str30;
		nombre:str30;
		edad:integer;
		genero:integer;
	end;
	lstPersonas=^nodo;
	nodo=record
		persona:rPersona;
		sig:lstPersonas;
	end;
	vContador=array[ranGenero] of integer;
	
	Procedure IniciarContador(var vC:vContador);
	var
		i:integer;
	begin
		for i:=1 to dimF do
			vC[i]:=0;
	end;
	
	Procedure IniciarLista(var l:lstPersonas);
	begin
		l:=nil;
	end;
	
	Procedure LeerPersona(var rP:rPersona);
	begin
		with rP do begin
			write('Dni: ');readln(dni);
			write('Apellido: ');readln(apellido);
			write('Nombre: ');readln(nombre);
			write('Edad: ');readln(edad);
			write('Genero[1..5]: ');readln(genero);
		end;
	end;
	
	Procedure AgregarOrdenado(var l:lstPersonas; rP:rPersona);
	var
		ant,act,aux:lstPersonas;
	begin
		new(aux);
		aux^.persona:=rP;
		ant:=l;
		act:=l;
		while (act<>nil) and (rP.dni>l^.persona.dni) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if ant=act then
			l:=aux
		else
			ant^.sig:=aux;
		if  l=nil then writeln('si')else writeln(rP.dni,' ' ,l^.persona.dni);
		aux^.sig:=act;
	end;
	
	Procedure CargarLista(var l:lstPersonas);
	var
		rP:rPersona;
	begin
		repeat
			LeerPersona(rP);
			AgregarOrdenado(l,rP);
		until (rP.dni=33555444);
	end;
	
	Function MayorPares(dni:longint):boolean;
		Function EsPar(dig:integer):boolean;
		begin
			EsPar:=(dig mod 2)=0;
		end;
	var
		dig,par,impar:integer;
	begin
		par:=0;
		impar:=0;
		while(dni<>0) do begin
			dig:=dni mod 10;
			if EsPar(dig) then
				par:=par+1
			else
				impar:=impar+1;
			dni:=dni div 10;
		end;
		MayorPares:=par>impar;
	end;
	
	Procedure GeneroMasElegido(vC:vContador; var codMax1,codMax2:ranGenero);
	var
		i,cant1,cant2:integer;
	begin
		cant1:=-1;
		for i:=1 to dimF do begin
			if (vC[i]>cant1) then begin
				cant2:=cant1;
				cant1:=vC[i];
				codMax2:=codMax1;
				codMax1:=i;
			end
			else
			if (vC[i]>cant2) then begin
				cant2:=vC[i];
				codMax2:=i;
			end;
		end;
	end;
	
	Procedure Eliminar (var l:lstPersonas; dni:longint; var esta:boolean);
	var
		ant, act:lstPersonas;
	begin
		ant:=l;
		act:=l;
		while (act<>nil) and (dni< act^.persona.dni) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if (act<>nil) and (dni=act^.persona.dni) then begin
			esta:=true;
			if ant=act then
				l:=act^.sig
			else
				ant^.sig:=act^.sig;
			dispose(act);
		end
		else
			esta:=false;
	end;
	
	Procedure Procesar (l:lstPersonas; var cantDniPar:integer; var codMax1,codMax2:ranGenero);
	var
		vC:vContador;
	begin
		IniciarContador(vC);
		cantDniPar:=0;
		while (l<>nil) do begin
			if MayorPares(l^.persona.dni) then
				cantDniPar:=cantDniPar+1;
			vC[l^.persona.genero]:=vC[l^.persona.genero]+1;
			l:=l^.sig;
		end;
		GeneroMasElegido(vC,codMax1,codMax2);
	end;
	
var
	l:lstPersonas;
	cantDniPar:integer;
	codMax1,codMax2:ranGenero;
	dni:longint;
	esta:boolean;
begin
	IniciarLista(l);
	CargarLista(l);
	Procesar(l,cantDniPar,codMax1,codMax2);
	writeln('Personas cuyo DNI contiene mas digitos pares que impares: ',cantDniPar);
	writeln('Los dos codigos de genero mas elegidos: [',codMax1,']-[',codMax2,']');
	writeln('Ingrese el DNI de la Persona a eliminar: ');readln(dni);
	Eliminar(l,dni,esta);
	if esta then
		writeln('Se Elimino Correctamete')
	else
		writeln('No se encontro el DNI');
end.
