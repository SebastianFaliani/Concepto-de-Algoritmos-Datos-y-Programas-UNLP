program Pra3Eje3_2017;
type
	str30=string[30];
	rEdad=1..100;
	tParticipante=record
		nombre:str30;
		sexo:char;
		dni:longint;
		especialidad:str30;
		edad:rEdad;
	end;
	
	procedure LeerParticipante(var p:tParticipante);
	begin
		with p do begin
			write('Nombre: ');readln(nombre);
			write('Sexo: ');readln(sexo);
			write('DNI: ');readln(dni);
			write('Especialidad: ');readln(especialidad);
			write('Edad: ');readln(edad);
		end;
	end;
	
	procedure masJoven(p:tParticipante; var pMasJoven:tParticipante);
	begin
		if (p.edad<pMasJoven.edad) then
			pMasJoven:=p;
	end;
	
	function seisTres(num:longint):boolean;
	var	
		dig:integer;
		cumple:boolean;
	begin
		cumple:=false;
		while (num<>0) and (not cumple) do begin
			dig:=num mod 10;
			if (dig=3) then begin
				num:=num div 10;
				dig:=num mod 10;
				if (dig=6) then 
					cumple:=true;
			end;
			num:=num div 10;
		end;
		seisTres:=cumple;
	end;
	
	function muCanto(sexo:char;especialidad:str30):boolean;
	begin
		muCanto:=(sexo='f') and (especialidad='canto');
	end;
	
	procedure ImprimirParticipante(p:tParticipante);
	begin
		with p do begin
			writeln('Nombre: ',nombre);
			writeln('Sexo: ',sexo);
			writeln('DNI: ',dni);
			writeln('Especialidad: ',especialidad);
			writeln('Edad: ',edad);
		end;
	end;
	
	procedure procesar(var pMasJoven:tParticipante; var cant63:integer; var porcMuCanto:real);
	var
		p:tParticipante;
		cantMuCanto,cantTotal:integer;
	begin
		cant63:=0;
		cantTotal:=0;
		cantMuCanto:=0;
		pMasJoven.edad:=100;
		repeat 
			LeerParticipante(p);
			cantTotal:=cantTotal+1;
			masJoven(p,pMasJoven);
			if seisTres(p.dni) then
				cant63:=cant63+1;
			if muCanto(p.sexo,p.especialidad) then
				cantMuCanto:=cantMuCanto+1;
		until (p.nombre='Juan Perez');	
		porcMuCanto:=(cantMuCanto*100)/cantTotal;
	end;

var
	pMasJoven:tParticipante; 
	cant63:integer; 
	porcMuCanto:real;
begin
	procesar(pMasJoven,cant63,porcMuCanto);
	writeln('**** Datos completos del participante mas joven ****');
	ImprimirParticipante(pMasJoven);
	writeln('Personas cuyo DNI contiene el dígito 6 seguido del digito 3: ',cant63);
	writeln(' El porcentaje de mujeres cuya especialidad es canto: ',porcMuCanto:6:2);
end.
	
	
