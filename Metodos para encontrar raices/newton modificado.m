%newton modificado 

disp("Programa de metodo newton modificado");
f=input("Ingrese funcion f(x)=@(x) x ...: ");
df=input("Ingrese derivada df(x)=@(x) x ...: ");
d2f=input("Ingrese segunda derivada d2f(x)=@(x) x ... : ");
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
p=p0-f(p0)*df(p0)/((df(p0))^2 - f(p0)*d2f(p0));
disp(p);
if(abs(p-p0)<tol)
disp("el proceso termino con exito en iteracion:  "), disp(i);
break;
endif
p0=p;
i=i+1;
endwhile

 