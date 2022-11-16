program Pra3Eje5;
type
	str30=string[30];
	rAnio=2010..2022;
	
	tAuto=record
		marca:str30;
		modelo:rAnio;
		precio:real;
	end;
	
	procedure LeerAuto(var a:tAuto);
	begin
		with a do begin
			write('Marca: ');readln(marca);
			if (marca<>'zzz') then begin
				write('Modelo: ');readln(modelo);
				write('Precio: ');readln(Precio);
			end;
		end;
	end;
	
	procedure masCaro(a:tAuto; var maxMarca:str30; var maxModelo:rAnio; var maxPrecio:real);
	begin
		with a do begin
			if (precio>maxPrecio) then begin
				maxPrecio:=precio;
				maxMarca:=marca;
				maxModelo:=modelo;
			end
		end;
	end;
	
var
	a:tAuto;
	marcaAct,maxMarca:str30;
	maxModelo:rAnio; 
	maxPrecio,promedio,suma:real;
	cant:integer;
	
begin
	maxPrecio:=-1;
	LeerAuto(a);
	while (a.marca<>'zzz') do begin
		cant:=0;
		suma:=0;
		marcaAct:=a.marca;
		while (marcaAct=a.marca) do begin
			cant:=cant+1;
			suma:=suma+ a.precio;
			masCaro(a,maxMarca,maxModelo,maxPrecio);
			LeerAuto(a);
		end;
		promedio:=suma/cant;
		writeln('El Precio Promedio de la marca ', marcaAct,' es: $ ',promedio:8:2);
	end;
	writeln('El mas caro es: ', maxMarca,' modelo ',maxModelo );
end.



















