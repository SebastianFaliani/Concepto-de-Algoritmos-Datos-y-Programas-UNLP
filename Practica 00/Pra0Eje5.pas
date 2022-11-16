{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo
tiene un valor de $1.60,}

Program Pra0Eje5;
var
	caramelos,clientes,cant,resto:integer;
begin
	write('Ingrese la cantidad de Caramelos: ');readln(caramelos);
	write('Ingrese la cantidad de Clientes: ');readln(clientes);
	cant:=caramelos div clientes;
	resto:=caramelos mod clientes;
	writeln('La cantidad de caramelos que le correspondera a cada cliente es: ',cant);
	writeln('La cantidad de caramelos que se quedara para si mismo es: ',resto);
	writeln('El dinero que debera cobrar el kiosquero si cada caramelo tiene un valor de $1.60 es de: ',(caramelos*1.60):8:2);
end.
