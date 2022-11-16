program Pra3Eje4;
const
	cMin=3.40;
	cMB=1.35;
	cClientes=9300;

type
	tCliente=record
		codigo:integer;
		lineas:integer;
	end;
	
	tLinea=record
		num:integer;
		min:integer;
		mb:integer;
	end;
	
	procedure LeerLinea(var l:tLinea);
	begin
		with l do begin
			write('Numero: ');readln(num);
			write('Minutos: ');readln(min);
			write('MB:' );readln(mb);
		end;
	end;

	procedure LeerCliente(var c:tCliente);
	begin
		with c do begin
			write('Codigo: ');readln(codigo);
			write('Cant. Lineas: ');readln(lineas);
		end;
	end;

	procedure procesar(lineas:integer; var cantMin,cantMB:integer);
	var 
		l:tLinea;
		i:integer;
	begin
		cantMin:=0;
		cantMB:=0;
		for i:=1 to lineas do begin
			LeerLinea(l);
			cantMin:=cantMin + l.min;
			cantMB:=cantMB + l.MB;
		end;
	end;
	
var
	c:tCliente;
	i,cantMin,cantMB:integer;
	facturacion:real;
begin
	for i:=1 to cClientes do begin
		LeerCliente(c);
		procesar(c.lineas,cantMin,cantMB);
		facturacion:=(cantMin*cMin)+(cantMB*cMB);
		writeln('Facturacion Mensual del cliente [',c.codigo,'] es de: $ ',facturacion:6:2);
	end;
end.
