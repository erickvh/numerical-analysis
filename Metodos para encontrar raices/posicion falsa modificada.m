
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
%primer paso
i=2;
q0=f(p0);
q1=f(p1);
xt=zeros(1,num);
yt=zeros(1,num);
xt(1)=p0; 
yt(1)=q0;
%segundo paso
while(i<=num)
%tercer paso
p=p1-q1*(p1-p0)/(q1-q0);
xt(i)=p;
q=f(p);
yt(i)=q;
disp(p);
%cuarto paso
if(abs(p-p1)<tol)
disp("Solucion aproximada en iteracion numero: ");
disp(i);
break;

endif
%quinto paso
%iterador
%sexto paso 
if(q*q1<0)
p0=p1;
q0=q1;
endif
%septimo paso
p1=p;
q1=q;
if(i==num)
disp("el metodo no tuvo exito");
endif
i=i+1;
endwhile
%graficador 

 plot(xt,yt); grid on;

 