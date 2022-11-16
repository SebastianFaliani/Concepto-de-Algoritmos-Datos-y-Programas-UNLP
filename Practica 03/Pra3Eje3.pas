program Pra3Eje3;
const
	esc=2400;
	Unesco=23.435;
type
	str30=string[30];
	rCod=1..esc;
	tEscuela=record
		cod:rCod;
		nombre:str30;
		docentes:integer;
		alumnos:integer;
		localidad:str30;
	end;

	procedure Leer(var e:tEscuela);
	begin
		with e do begin
			write('codigo: ');readln(cod);
			write('nombre: ');readln(nombre);
			write('docentes: ');readln(docentes);
			write('alumnos: ');readln(alumnos);
			write('localidad: ');readln(localidad);
		end;
	end;
	
	function Relacion(docentes:integer; alumnos:integer):real;
	begin
		Relacion:=alumnos/docentes;
	end;
	
	procedure maxRelacion(rel:real; CUE:rCod; nom:str30; 
												var maxRela1,maxRela2:real; var maxCUE1,maxCUE2:rCod; var maxNom1,maxNom2:str30);
	begin
		if (rel>maxRela1)then begin
			maxRela2:=maxRela1;
			maxRela1:=rel;
			maxCUE2:=maxCUE1;
			maxCUE1:=CUE;
			maxNom2:=maxNom1;
			maxNom1:=nom;
		end
		else
		if (rel>maxRela2)then begin
			maxRela2:=rel;
			maxCUE2:=CUE;
			maxNom2:=nom;
		end;
	end;

	procedure procesar (var cant:integer; var maxCUE1,maxCUE2:rCod; var maxNom1,maxNom2:str30);
		function Laplata(rel:real;Localidad:str30):boolean;
		begin
			Laplata:=(rel>Unesco) and ( Localidad='La Plata');
		end;
	
	var
		e:tEscuela;
		i:integer;
		Rel,maxRela1,maxRela2:real;
	begin
		cant:=0;
		maxRela1:=-1;
		for i:=1 to esc do begin
			Leer(e);
			Rel:=Relacion(e.docentes,e.alumnos);
			if (Laplata(rel,e.localidad)) then
				cant:=cant +1;
			maxRelacion(rel,e.Cod,e.nombre,maxRela1,maxRela2,maxCUE1,maxCUE2,maxNom1,maxNom2);
		end;
		
	end;

var
	cant:integer; 
	var maxCUE1,maxCUE2:rCod; 
	var maxNom1,maxNom2:str30;

begin
	procesar(cant,maxCUE1,maxCUE2,maxNom1,maxNom2);
	writeln(cant);
	writeln('(',maxCUE1,')',maxNom1,' - (',maxCUE2,')',maxNom2);
end.
