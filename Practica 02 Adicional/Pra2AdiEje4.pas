program Pra2AdiEje4;
const
	diaTierra=12700;
	diaMarte=6780;
	PerJupiter=439264;
	pi=3.14;
type
	str30=string[30];
	
	function Diametro(radio:integer):real;
	begin
		Diametro:=radio*2;
	end;

	procedure Leer(var Nombre:str30; var radio,distancia:integer);
	begin
		readln(radio);
		if(radio<>0) then begin
			readln(nombre);
			readln(distancia);
		end;
	end;
	
	procedure procesar(var cant:integer);
	var
		nombre:str30;
		radio,distancia:integer;
		diam:real;
	begin
		cant:=0;
		Leer(nombre,radio,distancia);
		while (radio<>0) do begin
			diam:=Diametro(radio);
			if (diam <= diaTierra) and (diam>=diaMarte) then begin
				writeln(nombre);
				writeln(distancia);
			end;
			writeln(diam:2:2);
			if (diam*pi)>perJupiter then
				cant:=cant+1;
			Leer(nombre,radio,distancia);
		end;
	end;	
var
	cant:integer;
begin
	procesar(cant);
	writeln(cant);
end.
