disp("Programa para validar punto fijo");
disp("Ingrese funcion en formato f=@(x) x.^2");
f=input("Ingrese funcion: ");
disp("Ingrese  derivada de la funcion en formato df=@(x) 2*x");
df=input("Ingrese derivada: ");
disp("ingrese intervalos");
a=input("extremo a: ");
b=input("extremo b: ");
if(a>b)
aux=a;
a=b;
b=aux;
endif
intervalo=linspace(a,b);
do
disp("seleccione opcion");
disp("1. f(x) segun el intervalo grafico");
disp("2. df(x) segun el valor que comprende");
disp("3. comprobacion final");
disp("4. Salir");
seleccion=input("Ingrese valor: ");
if(seleccion==1)
plot(intervalo,f(intervalo),intervalo,intervalo);
title("f(x) vs intervalo");
grid();
elseif(seleccion==2)
plot(intervalo,df(intervalo),linspace(-1,1),linspace(-1,1));
title("df(x)");
grid();
elseif(seleccion==3)
bandera=true;
estados=(df(intervalo)>=-1)&&(df(intervalo)<=1);
for valor=estados
  if(valor==0)
  bandera=false;
  endif
endfor
disp("");
if(bandera==true)
disp("EL METODO ES VALIDO EN EL INTERVALO");
else
disp("EL METODO NO FUNCIONARA");
endif
endif
until(seleccion==4)
