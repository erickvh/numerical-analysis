
disp("Programa de metodo de la posicion falsa");
disp("Ingrese funcion en formato f=@(x) x.^2");
f=input("Ingrese funcion: ");
disp("Ingrese extremos a y b (no deben ser iguales)");
do
p0=input("p0: ");
p1=input("p1: ");
until(p0 != p1)

if(p0>p1)
x=p0;
p0=p1;
p1=p0;
endif
if(f(p0)*f(p1)>=0)
disp("El metodo no es aplicable");
break;
endif

do
tol=input("ingrese tolerancia: ");
until(tol>0)

do
num=input("ingrese numero maximo de iteraciones: ");
until(num>0)

i=2;
q0=f(p0);
q1=f(p1);

while(i<=num)
p=p1-q1*(p1-p0)/(q1-q0);
q=f(p);
disp(p);
if(abs(p-p1)<tol)
disp("Solucion aproximada en iteracion numero: ");
disp(i);
break;

endif
i=i+1;

if(q*q1<0)
p0=p1;
q0=q1;
endif
p1=p;
q1=q;
endwhile

 