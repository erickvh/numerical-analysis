%metodo biseccion

disp("Programa de metodo de la bissecion");
disp("Ingrese funcion en formato f=@(x) x.^2");
f=input("Ingrese funcion: ");
disp("Ingrese extremos a y b (no deben ser iguales)");
do
a=input("limite inferior (a): ");
b=input("limite superior (b): ");
until(a != b)

if(a>b)
x=a;
a=b;
b=x;
endif
if(f(a)*f(b)>=0)
disp("El metodo no es aplicable");
break;
endif

do
tol=input("ingrese tolerancia: ");
until(tol>0)

do
num=input("ingrese numero maximo de iteraciones: ");
until(num>0)
 i=1;
 fa=f(a);
 
 while(i<num)
   p=a+(b-a)/2;
  fp=f(p);
  disp(p);
 if (fp==0 || (b-a)/2<tol)
   disp("Exito en el proceso con valor: "); disp(p);
   disp("En iteraccion numero: "); disp(i);   
   break;
 endif
    i=i+1;
 if(fa*fp>0)
  a=p;
  fa=fp;
 else
 b=p;
 endif
 endwhile

 
 
 
