{ Implementar un programa que lea y almacene información de clientes de una empresa
aseguradora automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código
de póliza contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando
llega el cliente con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que
el cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que
tiene contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga
mensualmente por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de
la estructura.
}
Program Pra7Eje2;
const
	dimF=6;
type
	str30=string[30];
	ranPoliza=1..dimF;
	rCliente=record
		codigo:integer;
		dni:longint;
		apellido:str30;
		nombre:str30;
		poliza:ranPoliza;
		montoB:real;
	end;
	lstClientes=^nodo;
	nodo=record
		cliente:rCliente;
		sig:lstClientes;
	end;
	vPoliza=array[ranPoliza] of real;

	Procedure IniciarLista(var l:lstClientes);
	begin
		l:=nil;
	end;
	
	Procedure LeerCliente(var rC:rCliente);
	begin
		with rC do begin
			write('Codigo: ');readln(codigo);
			write('Dni: ');readln(dni);
			write('Apellido: ');readln(apellido);
			write('Nombre: ');readln(nombre);
			write('Poliza[1..6]: ');readln(poliza);
			write('Monto Basico: ');readln(montoB);
		end;
	end;
	
	Procedure AgregarCliente(var l:lstClientes; rC:rCliente);
	var
		aux:lstClientes;
	begin
		new(aux);
		aux^.cliente:=rC;
		aux^.sig:=l;
		l:=aux;
	end;
	
	Procedure CargarLista(var l:lstClientes);
	var
		rC:rCliente;
	begin
		repeat
			LeerCliente(rC);
			AgregarCliente(l,rC);
		until (rC.codigo=1122);
	end;
	
	Function DosNueves(dni:longint):boolean;
	var
		dig,cant:integer;
	begin
		cant:=0;
		while (dni<>0) and (cant<2) do begin
			dig:=dni mod 10;
			if dig=9 then
				cant:=cant+1;
			dni:=dni div 10;
		end;
		DosNueves:=cant=2;
	end;
	
	Procedure Eliminar (var l:lstClientes; codigo:integer);
	var
		ant, act:lstClientes;
	begin
		ant:=l;
		act:=l;
		while (act<>nil) and (codigo<> act^.cliente.codigo) do begin
			ant:=act;
			act:=act^.sig;
		end;
		if ant=act then
			l:=act^.sig
		else
			ant^.sig:=act^.sig;
		dispose(act);
	end;
	
	Procedure Procesar(l:lstClientes; vP:vPoliza);
	var
		monto:real;
	begin
		while (l<>nil) do begin
			monto:=l^.Cliente.montoB+vP[L^.cliente.poliza];
			writeln('DNI: ',l^.cliente.dni,' Apellido: ',l^.cliente.apellido,' Nombre: ',l^.cliente.nombre,' Monto: ',monto);
			if DosNueves(l^.cliente.dni) then
				writeln('Apellido: ',l^.cliente.apellido,' Nombre: ',l^.cliente.nombre);
			l:=l^.sig;
		end;
	end;
	
var
	l:lstClientes; 
	vP:vPoliza;
	codigo:integer;
begin
	IniciarLista(l);
	CargarPoliza(vP);//se dispone
	CargarLista(l);
	writeln('Ingrese el codigo del Cliente a eliminar: ');readln(codigo);
	Eliminar(l,codigo);
end.
