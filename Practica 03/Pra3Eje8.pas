program Pra3Eje8;
type
	str30=string[30];
	
	tDocente=record
		dni:longint;
		nombre:str30;
		apellido:str30;
		mail:str30;
	end;
	
	tProyecto=record
		codigo:integer;
		titulo:str30;
		docente:tDocente;
		alumnos:integer;
		escuela:str30;
		localidad:str30;
	end;
	
	procedure LeerProyecto(var p:tProyecto);
		procedure LeerDocente (var d:tDocente);
		begin
			with d do begin
				write('DNI: ');readln(dni);
				write('Nombre: ');readln(nombre);
				write('Apellido: ');readln(apellido);
				write('E-mail: ');readln(mail);
			end;
		end;
		
		var
			d:tDocente;
		begin
			with p do begin
				write('Codigo: ');readln(codigo);
				if (codigo<>-1) then begin
					write('Titulo: ');readln(titulo);
					LeerDocente(d);
					docente:=d;
					write('Alumno: ');readln(alumnos);
					write('Escuela: ');readln(escuela);
					write('Localidad: ');readln(localidad);
				end;
			end;
		end;
		
		procedure masAlumnos(escuela:str30; AlumEsc:integer; 
													var maxEsc1,maxEsc2:str30; var maxAlum1,maxAlum2:integer);
		begin
			if (AlumEsc>maxAlum1) then begin
				maxAlum2:=maxAlum1;
				maxAlum1:=AlumEsc;
				maxEsc2:=maxEsc1;
				maxEsc1:=escuela;
			end
			else
			if (AlumEsc>maxAlum2) then begin
				maxAlum2:=AlumEsc;
				maxEsc2:=escuela;
			end;
		end;
		
		function esPar(num:integer):boolean;
		begin
			esPar:= (num mod 2)=0;
		end;
		
		function IgualParImpar(num:integer):boolean;
		var
			dig,par,impar:integer;
		begin
			par:=0;
			impar:=0;
			while (num<>0) do begin
				dig:=num mod 10;
				if esPar(dig) then
					par:=par+1
				else
					impar:=impar+1;
				num:=num div 10;
			end;
			IgualParImpar:=(par=impar);
		end;
		
		
		procedure procesar (var TotalEsc:integer; var maxEsc1,maxEsc2:str30);
		var
			p:tProyecto;
			localidadAct,escuelaAct:str30;
			LocEsc,AlumEsc:integer;
			maxAlum1,maxAlum2:integer;
		begin
			LeerProyecto(p);
			TotalEsc:=0;
			maxAlum1:=-1;
			while (p.codigo<>-1) do begin
				localidadAct:=p.localidad;
				LocEsc:=0;
				while (p.codigo<>-1) and (localidadAct=p.localidad) do begin
					escuelaAct:=p.escuela;
					AlumEsc:=0;
					TotalEsc:=TotalEsc+1;
					LocEsc:=LocEsc+1;
					while (p.codigo<>-1) and (localidadAct=p.localidad) and (escuelaAct=p.escuela) do begin
						AlumEsc:=AlumEsc+ p.alumnos;
						If (p.localidad='Daireaux') and IgualParImpar(p.codigo) then
							writeln('Titulo de los proyectos de la localidad de Daireaux cuyo dígitos pares e impares del codigo son iguales: ',p.titulo);
						LeerProyecto(p);
					end;
					masAlumnos(escuelaAct,AlumEsc,maxEsc1,maxEsc2,maxAlum1,maxAlum2);
				end;
				writeln('Escuelas de la  localidad de ',localidadAct, ': ',LocEsc);
			end;
		end;
var 
	TotalEsc:integer; 
	maxEsc1,maxEsc2:str30;
begin
	procesar(TotalEsc,maxEsc1,maxEsc2);
	writeln('Cantidad total de escuelas que participan en la convocatoria: ',TotalEsc);
	writeln('Escuelas con mayor cantidad de alumnos participantes: ',maxEsc1, ' - ',maxEsc2);
end.
