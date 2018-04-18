
disp("Metodo de steffensen");

f=input("Ingrese funcion en terminos de x @(x): ");
p0=input("Ingrese aproximacion inicial: ");


do
tol=input("ingrese tolerancia: ");
until(tol>0)


do
num=input("ingrese numero maximo de iteraciones: ");
until(num>0)
%paso 1
i=1;
%paso 2
while i<num
  %paso 3
  p1=f(p0);
  p2=f(p1);
p=p0-((p1-p0)^2)/(p2-2*p1+p0);
disp(p);
if(abs(p1-p0)<tol)
disp("el metodo tuvo exito en la iteracion: ");
disp(i);
break;
endif
   
i++;

p0=p;
if(i==num)
disp("el metodo no tuvo exito");
endif

endwhile

