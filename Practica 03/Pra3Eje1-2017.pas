program Pra3Eje1_2017;
type
	str30=string[30];
	str15=string[15];
	str2=string[2];
	tInmueble=record
		codigo:integer;
		tipo:str15;
		direccion:str30;
		habitaciones:integer;
		cochera: str2;
		estado:str15;
		precio:real;
	end;
	
	procedure LeerInmueble(var i:tInmueble);
	begin
		with i do begin
			write('Codigo: ');readln(codigo);
			write('Tipo: ');readln(tipo);
			write('Direccion: ');readln(direccion);
			write('Habitaciones: ');readln(habitaciones);
			write('Cochera[si/no]: ');readln(cochera);
			write('Venta/Alquiler: ');readln(estado);
			write('Precio: ');readln(precio);
		end;
	end;
	
	function CasaDosHab(tipo:str15; habitaciones:integer):boolean;
	begin
		CasaDosHab:=(tipo='casa') and (habitaciones>=2);
	end;
	
	function enVenta(estado:str15):boolean;
	begin
		enVenta:=estado='venta'
	end;
	
	
	procedure TresHabCochera(i:tInmueble;var sumaPrecios:real; var cantInm:integer);
	begin
		with i do begin
			if (habitaciones=3) and (cochera='si') and (not enVenta(estado)) and (tipo='departamento') then begin
				sumaPrecios:=sumaPrecios + precio;
				cantInm:=cantInm+1;
			end;
		end;
	end;
	
	
	procedure Procesar();
	var
		i:tInmueble;
		cantInm,cantVenta,TotalInm:integer;
		sumaPrecios:real;
	begin
		
		sumaPrecios:=0;
		cantInm:=0;
		cantVenta:=0;
		TotalInm:=0;
		repeat
			LeerInmueble(i);
			TotalInm:=TotalInm+1;
			if (CasaDosHab(i.tipo,i.habitaciones)) then
				writeln('Direccion de inmueble tipo casa con al menos dos habitaciones: ', i.direccion);
			TresHabCochera(i,sumaPrecios,cantInm);
			if enVenta(i.estado) then
				cantVenta:=cantVenta+1;
		until  (i.codigo=123);
		writeln('El precio promedio de alquiler de los departamentos que poseen 3 habitaciones y cochera: ', (sumaPrecios/cantInm):8:2);
		writeln('El porcentaje de inmuebles en venta: ', ((cantVenta*100)/TotalInm):8:2);
	end;

begin
	procesar();
end.
