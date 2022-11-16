Program Pra4Eje14;
const
	dimFC=5;
	dimFP=1000;
type
	ranRol=1..dimFC;
	str30=string[30];
	
	rRol=record
		codRol:ranRol;
		rol:str30;
		valor:real;
	end;
		
	rDesarrollador=record
		pais:str30;
		proyecto:integer;
		nombreP:str30;
		codRol:ranRol;
		hs:integer;
	end;
	
	rProyecto=record
		montoInv:real;
		contArq:integer;
	end;
	
	vRoles=array[ranRol] of real;
	vProyectos=array[1..dimFP] of rProyecto;


	procedure LeerDesarrollador(var d:rDesarrollador);
	begin
		with d do begin
			write('Proyecto: ');readln(proyecto);
			if (proyecto<>-1) then begin
				write('Pais: ');readln(pais);
				write('Nombre: ');readln(nombreP);
				write('Codigo Rol: ');readln(codRol);
				write('Hs. Trabajadas: ');readln(hs);
			end
		end;
	end;
	
	procedure cargarRoles(var vR:vRoles); {se dispone}
	begin
	end;
	
	procedure iniciarVectores (var vP:vProyectos);
	var 
		i:integer;
	begin
		for i:=1 to dimFP do begin
			vP[i].montoInv:=0;
			vp[i].contArq:=0;
		end;
	end;

	function Invertido(vR:vRoles;codRol:ranRol; hs:integer):real;
	begin
		Invertido:=vR[codRol]*hs;
	end;

	Procedure montoTotal(vR:vRoles; pais,paisCompara:str30; codRol:ranRol; hs:integer; var suma:real);
	begin
		if (pais=paisCompara) then
			suma:=suma+(Invertido(vR,codRol,hs));
	end;
	
	Procedure hsTrabajada(codRol:ranRol; hs:integer; var sumaHs:real);
	begin
		if (codRol=3) then
			sumaHs:=sumaHs+hs;
	end;
	
	procedure MenorInvercion(vP:vProyectos; var minCod:integer);
	var
		i:integer;
		minInv:real;
	begin
		minInv:=99999999;
		for i:=1 to dimFP do begin
			if vP[i].montoInv<minInv then
				minInv:=vP[i].montoInv;
				minCod:=i;
		end;
	end;
	
	procedure procesar(vR:vRoles; vP:vProyectos; var suma,sumaHs:real; var minCod:integer);
	var 
		id:integer;
		d:rDesarrollador;
	begin
		id:=1;
		suma:=0;
		LeerDesarrollador(d);
		while  (d.proyecto<>-1)  do begin
			montoTotal(vR,d.pais,'Argentina',d.codRol,d.hs,suma);
			hsTrabajada(d.codRol,d.hs,sumaHs);
			
			vP[d.proyecto].montoInv:=(vP[d.proyecto].montoInv) + (Invertido(vR,d.codRol,d.hs));
			
			if (d.codRol=4) then
				vP[d.proyecto].contArq:=(vP[d.proyecto].contArq)+1;
			
			id:=id+1;
			LeerDesarrollador(d);
		end;
		MenorInvercion(vP,minCod);
	end;

var
	suma,sumaHs:real;
	vR:vRoles;
	vP:vProyectos;
	minCod:integer;
begin
	cargarRoles(vR); {se dispone}
	iniciarVectores(vP);
	procesar(vR,vP,suma,sumaHs,minCod);
end.
