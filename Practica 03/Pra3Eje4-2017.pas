program Pra3Eje4_2017;
const
	cPais=3;
	cRepre=2;
type
	str30=string[30];
	rEdad=1..100;
	tPlato=record
		nombre:str30;
		sirve:str30;
		ingrediente:str30;
	end;
	tRepresentante=record
		nombre:str30;
		apellido:str30;
		plato:tPlato;
		genero:char;
		edad:rEdad;
	end;

	procedure LeerPlato(var p:tPlato);
	begin
		with p do begin
			write('Nombre del Plato: ');readln(nombre);
			write('Se sirve [frio/caliente]: ');readln(sirve);
			write('Ingrediente Principal: ');readln(ingrediente);
		end;
	end;
	
	procedure LeerRepresentante(var r:tRepresentante);
	var
		p:tPlato;
	begin
		with r do begin
			write('Nombre: ');readln(nombre);
			write('Apellido: ');readln(apellido);
			LeerPlato(p);
			plato:=p;
			write('Genero [f/m]: ');readln(genero);
			write('Edad: ');readln(edad);
		end;
	end;
	
	procedure mayorFemFrio(pais,cant:integer; var maxCant,maxPais:integer);
	begin
		if (cant>maxCant) then begin
			maxCant:=cant;
			maxPais:=pais;
		end;
	end;
	
	function femFrio(genero:char;sirve:str30):boolean;
	begin
		femFrio:= (genero='f') and (sirve='frio');
	end;
	
	function esCaliente(sirve:str30):boolean;
	begin
		esCaliente:=(sirve='caliente');
	end;
	
	procedure procesar(var maxPais:integer; var promEdad:real);
	var
		r:tRepresentante;
		i,j,cantfemFrio,maxCant,SumaEdad,cantPlaCal:integer;
		
		
	begin
		maxCant:=-1;
		SumaEdad:=0;
		for i:=1 to cPais do begin
			cantfemFrio:=0;
			cantPlaCal:=0;
			for j:=1 to cRepre do begin
				LeerRepresentante(r);
				if femFrio(r.genero,r.plato.sirve) then
					cantfemFrio:=cantfemFrio+1;
				SumaEdad:=SumaEdad + r.edad;
				if esCaliente(r.plato.sirve) then
					cantPlaCal:=cantPlaCal+1;
			end;
			mayorFemFrio(i,cantfemFrio,maxCant,maxPais);
			if (cantPlaCal>0) then
				writeln('Porcentaje de platos caliente para el pais (',i,') es: ', ((cantPlaCal*100)/cRepre):4:2)
			else
				writeln('NO hay platos calientes para el pais (',i,')');
		end;
		promEdad:=SumaEdad/(cPais*cRepre);
	end;

var
	maxPais:integer;
	promEdad:real;

begin
	procesar(maxPais,promEdad);
	writeln(' El Pais con mayor cantidad de participantes femeninos que presentan platos frios es: ', maxPais );
	writeln('La edad promedio de los participantes es: ', promEdad:4:2);
end.
