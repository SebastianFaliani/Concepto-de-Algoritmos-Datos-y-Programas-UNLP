Program Pra4Eje9;
const
	dimF=400;
type
	rango=1..dimF;
	str30=string[30];
	ranAnio=1900..2100;
	rAlumno=record
		inscripcion:integer;
		dni:longint;
		apellido:str30;
		nombre:str30;
		nacimiento:ranAnio;
	end;
	
	vAlumnos=array[rango] of rAlumno;

	procedure CargarVectorAlumnos(var v:vAlumnos; var dimL:integer);
		procedure CargarAlumno(var a:rAlumno);
		begin
			with a do begin
				write('DNI: ');readln(dni);
				if (dni<>-1) then begin
					write('Inscripcion: ');readln(inscripcion);
					write('Apellido: ');readln(apellido);
					write('Nombre: ');readln(nombre);
					write('Nacimiento: ');readln(nacimiento);
				end;
			end;
		end;
	
	var
		a:rAlumno;
	begin
		dimL:=0;
		CargarAlumno(a);
		while (a.dni<>-1) and (dimL<dimF) do begin
			dimL:=dimL+1;
			v[dimL]:=a;
			if (dimL<dimF) then
				CargarAlumno(a);
		end;
	end;
	
	function digPares(num:longint):boolean;
		function esPar(dig:integer):boolean;
		begin
			esPar:=(dig mod 2=0);
		end;
	var
		dig:integer;
		estado:boolean;
	begin
		estado:=true;
		while (num<>0) and (estado) do begin
			dig:=num mod 10;
			estado:=esPar(dig);
			num:=num div 10;
		end;
		digPares:=estado;
	end;
	
	procedure mayorEdad(edad:ranAnio;ape,nom:str30;
						var maxEdad1,maxEdad2:ranAnio; var maxApe1,maxApe2,maxNom1,maxNom2:str30);
	begin
		if (edad<maxEdad1) then begin
			maxEdad2:=maxEdad1;
			maxApe2:=maxApe1;
			maxNom2:=maxNom1;
			maxEdad1:=edad;
			maxApe1:=ape;
			maxNom1:=nom;
		end
		else
		if (edad<maxEdad2) then begin
			maxEdad2:=edad;
			maxApe2:=ape;
			maxNom2:=nom;
		end;
	end;
	
	procedure procesar(v:vAlumnos; dimL:integer; var porcDni:real; var maxApe1,maxApe2,maxNom1,maxNom2:str30);
	var
		i,contDni:integer;
		maxEdad1,maxEdad2:ranAnio;
	begin
		maxEdad1:=2100;
		contDni:=0;
		for i:=1 to dimL do begin
			if digPares(v[i].dni) then
				contDni:=contDni+1;
			mayorEdad(v[i].nacimiento,v[i].apellido,v[i].nombre,maxEdad1,maxEdad2,maxApe1,maxApe2,maxNom1,maxNom2);
		end;
		porcDni:=((contDni*100)/dimL);
	end;
	
var
	v:vAlumnos;
	porcDni:real;
	maxApe1,maxApe2,maxNom1,maxNom2:str30;
	dimL:integer;
begin
	CargarVectorAlumnos(v,dimL);
	procesar(v,dimL,porcDni,maxApe1,maxApe2,maxNom1,maxNom2);
	writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares: ',porcDni:3:2);
	writeln('Apellido y nombre de los dos alumnos de mayor edad: [',maxApe1,' ',maxNom1,'] - [',maxApe2,' ',maxNom2,']' );
end.
