program Tema2;
const
    dimF=20;
type
    ranCategoria=1..dimF;
    str30=string[30];
    rCategoria=record
        nombre:str30;
        precio:real;
    end;
    vCategoria=array[ranCategoria] of rCategoria;
    vContador=array[ranCategoria] of integer;
    rCompra=record
        dni:integer;
        categoria:ranCategoria;
        kg:integer;
    end;
    lstCompras=^nodo;
    nodo=record
        compra:rCompra;
        sig:lstCompras;
    end;
    
    procedure CargarCategorias(var vCat:vCategoria);
    begin
    end;
    
    procedure IniciarContador(var vC:vContador);
    var 
        i:integer;
    begin
        for i:=1 to dimF do
            vC[i]:=0;
    end;

    procedure LeerCompra(var rC:rCompra);
    begin
        with rC do begin
            readln(dni);
            if dni<>-1 then begin
                readln(categoria);
                readln(kg);
            end;
        end;
    end;
    
    procedure AgregarAdelante(var lst:lstCompras; rC:rCompra);
    var
        aux:lstCompras;
    begin
        new(aux);
        aux^.compra:=rC;
        aux^.sig:=lst;
        lst:=aux;
    end;
    
    procedure CargarLista(var lst:lstCompras);
    var
        rC:rCompra;
    begin
        LeerCompra(rC);
        while rC.dni<>-1 do begin
            AgregarAdelante(lst,rC);
            LeerCompra(rC);
        end;
    end;
    
    Procedure MemorGasto(monto:real; dni:integer; var minMonto:real; var minDni:integer);
    begin
        if monto<minMonto then begin
            minMonto:=monto;
            minDni:=dni;
        end;
    end;
    
    procedure ImprimirContador(vC:vContador);
    var
        i:integer;
    begin
        for i:= 1 to dimF do
            writeln('Para la categoria ',i,'hubo ',vC[i], 'compras');
    end;
    
    Function CincoImpares(dni:integer):boolean;
        Function esPar(dig:integer):boolean;
        begin
            esPar:=(dig mod 2)=0;
        end;
    var
        dig,impar:integer;
    begin
        impar:=0;
        while (dni<>0) and (impar<=5) do begin
            dig:=dni mod 10;
            if not esPar(dig) then
                impar:=impar+1;
            dni:=dni div 10;
        end;
        CincoImpares:= (impar<=5);
    end;
    
    Procedure Procesar(lst:lstCompras; vCat:vCategoria; var vC:vContador; var minDni:integer; var cantCompraDni:integer);
    var
        minMonto,monto:real;
        dniActual:integer;
    begin
        minMonto:=999999;
        cantCompraDni:=0;
        IniciarContador(vC);
        while(lst<>nil) do begin
            dniActual:=lst^.compra.dni;
            monto:=0;
            while(lst<>nil) and (dniActual=lst^.compra.dni) do begin
                monto:=monto + (lst^.compra.kg*vCat[lst^.compra.categoria].precio);
                vC[lst^.compra.categoria]:=vC[lst^.compra.categoria]+1;
                if CincoImpares(lst^.compra.dni) then
                    cantCompraDni:=cantCompraDni+1;
                lst:=lst^.sig;
            end;
            MemorGasto(monto,lst^.compra.dni,minMonto,minDni);
        end;
    end;
    
var
    lst:lstCompras; 
    vCat:vCategoria; 
    vC:vContador;
    minDni:integer;
    cantCompraDni:integer;
begin
    lst:=nil;
    CargarCategorias(vCat); //Se Dispone
    CargarLista(lst);
    Procesar(lst,vCat,vC,minDni,cantCompraDni);
    writeln('El dni del cliente que menos dinero ha gastado es: ', minDni);
    ImprimirContador(vC);
    writeln('Cantidad de compras hecha por cliente con dni compuesto por al menos 5 digitos impares: ', cantCompraDni);
end.
