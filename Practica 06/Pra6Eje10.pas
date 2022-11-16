program Pra6Eje10;
type
	rCliente=record
		dni:Longint;
		turno:integer;
	end;
	lstClientes=^nodo;
	nodo=record
		cliente:rCliente;
		sig:lstClientes
	end;
	
	procedure agregar(var l:lstClientes; rC:rCliente);
	var
		aux:lstClientes;
	begin
		new(aux);
		aux^.cliente:=rC;
		aux^.sig:=l;
		l:=aux;
	end;
	
	procedure RecibirCliente(dni:Longint; var l:lstClientes);
	var
		rC:rCliente;
	begin
		rC.dni:=dni;
		if l=nil then
			rC.turno:=1
		else
			rC.turno:=l^.cliente.turno+1;
		agregar(l,rC);
	end;
	
	procedure AtenderCliente (var l:lstClientes; var rC:rCliente);
	var
		aux,ant:lstClientes;
	begin
		aux:=l;
		ant:=l;
		while aux^.sig<>nil do begin
			ant:=aux;
			aux:=aux^.sig;
		end;
		rC:=aux^.cliente;
		if aux=ant then
			l:=nil
		else
			ant^.sig:=nil;
		dispose(aux);
	end;

var
	l:lstClientes;
	rC:rCliente;
	dni:Longint;
begin
	l:=nil;
	write('DNI: ');readln(dni);
	while dni<>0 do begin
		RecibirCliente(dni,l);
		write('DNI: ');readln(dni);
	end;
	
	while l<>nil do begin
		AtenderCliente (l,rC);
		writeln('DNI: ',rC.dni,' Turno: [', rC.turno,']');
		readln();
	end;
end.
