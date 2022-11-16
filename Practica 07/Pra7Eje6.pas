{ El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1:
estrellas, 2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto
(1..7), nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y
año de su descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos
los datos.
B. Una vez leída y almacenada toda la información, se pide calcular e informar:
I. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
II. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
III. La cantidad de objetos observados por cada categoría.
IV. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.
}
Program Pra7Eje6;
const
	dimF=7;
type
	str30=string[30];
	ranCategoria=1..dimF;
	rObjeto=record
		codigo:integer;
		categoria:ranCategoria;
		nombre:str30;
		distancia:real;
		descubridor:str30;
		anio:integer;
	end;
	lstObjetos=^nodo;
	nodo=record
		objeto:rObjeto;
		sig:lstObjetos;
	end;
	vContador=array[ranCategoria] of integer;
	
	Procedure InicializarContador(var vC:vContador);
	var 
		i:integer;
	begin
		for i:=1 to dimF do
			vC[i]:=0;
	end;
	
	Procedure LeerObjeto(var rO:rObjeto);
	begin
		with rO do begin
			write('Camion: ');readln(codigo);
			if (codigo<>-1) then begin
				write('Categoria: ');readln(categoria);
				write('Nombre: ');readln(nombre);
				write('Distancia: ');readln(distancia);
				write('Descubridor: ');readln(descubridor);
				write('Año: ');readln(anio);
			end;
		end;
	end;
	
	Procedure AgregarObjeto(var l,ult:lstObjetos; rO:rObjeto);
	var
		aux:lstObjetos;
	begin
		new(aux);
		aux^.objeto:=rO;
		aux^.sig:=nil;
		if l=nil then
			l:=aux
		else
			ult^.sig:=aux;
		ult:=aux;
	end;
	
	Procedure CargarLista(var l:lstObjetos);
	var
		rO:rObjeto;
		ult:lstObjetos;
	begin
		LeerObjeto(rO);
		while (rO.codigo<>-1) do begin
			AgregarObjeto(l,ult,rO);
			LeerObjeto(rO);
		end;
	end;
	
	Procedure MasLejanos(codigo:integer; distancia:real; var codmax1,codMax2:integer; var disMax1,disMax2:real);
	begin
		if (distancia>disMax1) then begin
			disMax2:=disMax1;
			disMax1:=distancia;
			codMax2:=codMax1;
			codMax1:=codigo;
		end
		else
		if (distancia>disMax2) then begin
			disMax2:=distancia;
			codMax2:=codigo;
		end;
	end;
	
	Function Galileo(nombre:str30;anio:integer):boolean;
	begin
		Galileo:=(nombre='Galileo Galilei') and (anio<1600);
	end;
	
	Function MasPares(codigo:integer):boolean;
		Function EsPar(dig:integer):boolean;
		begin
			EsPar:=(dig mod 2)=0;
		end;
	var
		dig,par,impar:integer;
	begin
		par:=0;
		impar:=0;
		while (codigo<>0) do begin
			dig:=codigo mod 10;
			if EsPar(dig) then
				par:=par+1
			else
				impar:=impar+1;
			codigo:=codigo div 10;
		end;
		MasPares:=par>impar;
	end;
	
	Procedure Imprimir (vC:vContador);
	var
		i:integer;
	begin
		for i:=1 to dimF do
			writeln('Los objetos observados de la Categoria [',i,'] son: ',vC[i]);
	end;
	
	Procedure Procesar(var l:lstObjetos; var vC:vContador; var codMax1,codMax2,CantGalileo:integer);
	var
		disMax1,disMax2:real;
	begin
		InicializarContador(vC);
		disMax1:=-1;
		CantGalileo:=0;
		while (l<>nil) do begin
			MasLejanos(l^.objeto.codigo,l^.objeto.distancia,codmax1,codMax2,disMax1,disMax2);
			if Galileo(l^.objeto.descubridor,l^.objeto.anio) then
				cantGalileo:=cantGalileo+1;
			vC[l^.objeto.categoria]:=vC[l^.objeto.categoria]+1;
			if MasPares(l^.objeto.codigo) then
				writeln('El codigo de la estrella ',l^.objeto.nombre,' tiene mas digitos pares que impares');
			l:=l^.sig;
		end;
	end;

var
	l:lstObjetos;
	vC:vContador;
	codMax1,codMax2,CantGalileo:integer;
begin
	l:=nil;
	CargarLista(l);
	Procesar(l,vC,codMax1,codMax2,CantGalileo);
	Imprimir(vC);
	writeln('Codigos de los dos objetos mas lejanos de la tierra [',codMax1,'] [', codMax2,']');
	writeln('Cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600 [',CantGalileo,']');
end.
