program Pra2Par2Eje11;
type
	str30=string[30];
	
	procedure Leer(var inscripcion:integer; var apellido, nombre:str30);
	begin
		write('numero Inscripcion: ');readln(inscripcion);
		write('Apellido: ');readln(apellido);
		write('Nombre: ');readln(nombre);
	end;

	procedure mas_chico(apellido:str30;inscripcion:integer; var ape_chico1,ape_chico2: str30;
																													var ins_chico1,ins_chico2:integer);
	begin
		if (inscripcion<ins_chico1) then begin
			ins_chico2:=ins_chico1;
			ins_chico1:=inscripcion;
			ape_chico2:=ape_chico1;
			ape_chico1:=apellido;
		end
		else
		if (inscripcion<ins_chico2) then begin
			ins_chico2:=inscripcion;
			ape_chico2:=apellido;
		end;
	end;
	
	procedure mas_grande(nombre:str30;inscripcion:integer; var nom_grande1,nom_grande2: str30;
																													var ins_grande1,ins_grande2:integer);
	begin
		if (inscripcion>ins_grande1) then begin
			ins_grande2:=ins_grande1;
			ins_grande1:=inscripcion;
			nom_grande2:=nom_grande1;
			nom_grande1:=nombre;
		end
		else
		if (inscripcion>ins_grande2) then begin
			ins_grande2:=inscripcion;
			nom_grande2:=nombre;
		end;
	end;
	
	procedure procesar(var ape_chico1,ape_chico2,nom_grande1,nom_grande2: str30; var Porc_ins_par:real);
		function es_par(num:integer):boolean;
		begin
			es_par:=(num mod 2)=0;
		end;

	var 
		inscripcion:integer; 
		apellido, nombre:str30;
		ins_chico1,ins_chico2:integer;
		ins_grande1,ins_grande2:integer;
		cant_alumnos,cant_par:integer;

	begin
		ins_chico1:=32766;
		ape_chico1:='';
		ins_grande1:=-1;
		nom_grande1:='';
		cant_alumnos:=0;
		cant_par:=0;
		
		repeat
			Leer(inscripcion,apellido,nombre);
			mas_chico(apellido,inscripcion,ape_chico1,ape_chico2,ins_chico1,ins_chico2);
			mas_grande(nombre,inscripcion,nom_grande1,nom_grande2,ins_grande1,ins_grande2);
			cant_alumnos:=cant_alumnos+1;
			if es_par(inscripcion) then
				cant_par:=cant_par+1;
		until(inscripcion=1200);
		Porc_ins_par:=(cant_par*100)/cant_alumnos;
	end;

var
	ape_chico1,ape_chico2: str30;
	nom_grande1,nom_grande2: str30;
	Porc_ins_par:real;
begin
	procesar(ape_chico1,ape_chico2,nom_grande1,nom_grande2,Porc_ins_par);
	writeln(ape_chico1,' - ',ape_chico2);
	writeln(nom_grande1,' - ',nom_grande2);
	writeln(Porc_ins_par:2:2,' %');
end.
