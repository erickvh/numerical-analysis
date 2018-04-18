
disp("Metodo de punto fijo modificado");
g=input("ingresar funcion g(x)=@(x) x ...: ");
p0=input("ingresar valor inferior del intervalo: ");
p1=input("ingresar valor superior del intervalo: ");

do
tol=input("Tolerencia: ");
until(tol>0)

disp("Ingrese numero de iteraciones que se buscan hacer (positivo) ");
do
num=input("Ingrese numero: ");
until(num>0)
%paso 1
i=2;
gp0=g(p0);
gp1=g(p1);

       
%paso 2
while(i<num)
%paso 3
      m=(gp1-gp0)/(p1-p0);
      b=gp0-m*p0;
      xk=(b)/(1-m);
       p = g(xk);
       p0=p1;gp0=g(p1);
       p1=xk;gp1=p;
disp(xk);
if(abs(p-p1)<tol)
disp("el proceso termino con iteraciones: ");
disp(i);
break;
endif
i++;
if(i==num)
disp("el metodo no tuvo exito");
endif

endwhile
