
disp("Algoritmo de aitken");
pn=input("ingrese funcion en terminos de x: ");
num=input("Ingrese el numero de valores a generar: ");
i=1;
while(i<=num)
p1=pn(i);
p2=pn(i+1);
p3=pn(i+2);
r=p1-((p2-p1)^2/(p3-2*p2+p1));
disp("#########################");
disp("iteraccion numero: ")
disp(i);
disp("#########################");
disp("P1: ");
disp(p1);
disp("P2: ");
disp(p2);
disp("P3: ");
disp(p3);
disp("R: ");
disp(r);

i++;
endwhile
