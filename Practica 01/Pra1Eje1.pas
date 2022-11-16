{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”}

Program Pra1Eje1;
var
	num1,num2:integer;
begin
	write('Ingrese un Numero: ');readln(num1);
	write('Ingrese otro Numero: ');readln(num2);
	if num1>num2 then
		writeln('El numero ', num1,' es mayor que ', num2)
	else
		if num2>num1 then
			writeln('El numero ', num2,' es mayor que ', num1)
		else
			writeln('Los numeros leidos son iguales'); 
end.
