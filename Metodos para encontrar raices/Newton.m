%Metodo de newton
disp("Programa de metodo newton rapshon");
disp("Ingrese funcion en formato f=@(x) x.^2");
f=input("Ingrese funcion: ");
disp("Ingrese  derivada de la funcion en formato df=@(x) 2*x");
df=input("Ingrese derivada: ");
disp("ingrese aproximacion inicial");
p0=input("aproximacion inicial: ");
disp("ingrese tolerancia de calculos (Positivo) ");
do
tol=input("Tolerencia: ");
until(tol>0)

disp("Ingrese numero de iteraciones que se buscan hacer (positivo) ");
do
num=input("Ingrese numero: ");
until(num>0)
i=1;

while(i<num)
p=p0-f(p0)/df(p0);
disp(p);
if(abs(p-p0)<tol)
disp("el proceso termino con exito en iteracion:  "), disp(i);
break;
endif
p0=p;
i=i+1;
endwhile


