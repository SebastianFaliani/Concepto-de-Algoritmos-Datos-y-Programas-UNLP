{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre,
apellido y peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La
maternidad necesita un programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo
}
Program Pra7Eje4;
const
	dimF=42;
type
	str30=string[30];
	vPeso=array[1..dimF] of integer;
	rPaciente=record
		nombre:str30;
		apellido:str30;
		peso:vPeso;
		dimL:integer;
	end;
	lstPacientes=^nodo;
	nodo=record
		paciente:rPaciente;
		sig:lstPacientes;
	end;
	
	Procedure InicializarLista(var l:lstPacientes);
	begin
		l:=nil;
	end;
	
	Procedure SemanaMayorAumentoyTotal(vP:vPeso;dimL:integer; var semana,total:integer);
	var
		i,maxPeso:integer;
	begin
		maxPeso:=-1;
		total:=0;
		for i:=1 to dimL do begin
			total:=total+vP[i];
			if vP[i]>maxPeso then begin
				maxPeso:=vP[i];
				semana:=i;
			end;
		end;
	end;
	
	Procedure Procesar(l:lstPacientes; var semana,total:integer);
	begin
		while(l<>nil) do begin
			SemanaMayorAumentoyTotal(l^.paciente.peso,l^.paciente.dimL,semana,total);
			writeln('La semana con mayor aumento de peso es: ',semana);
			writeln('El aumento de peso total durante el embarazo es: ',total);
		end;
	end;
	
var
	l:lstPacientes;
	semana,total:integer;
begin
	InicializarLista(l);
	CargarLista(l); // se Dispone
	Procesar(l,semana,total);
end.
