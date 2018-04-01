%metodo secante
disp("Programa de metodo de la secante");
disp("Ingrese funcion en formato f=@(x) x.^2");
f=input("Ingrese funcion: ");
disp("Ingrese aproximaciones p0 y p1 (no deben ser iguales)");
do
p0=input("p0: ");
p1=input("p1: ");
until(p0 != p1)

do
tol=input("ingrese tolerancia: ");
until(tol>0)

do
num=input("ingrese numero maximo de iteraciones: ");
until(num>0)


i=2;
f0=f(p0);
f1=f(p1);

while(i<num)
p=p1-f1*(p1-p0)/(f1-f0);
fp=f(p);
disp(p);

if(abs(p-p1)<tol)
disp("El proceso termino con exito en la iteracion num: ");
disp(i);
break;
endif
p0=p1;
f0=f1;
p1=p;
f1=fp;

i=i+1;
endwhile