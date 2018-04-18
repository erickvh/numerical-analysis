disp("Graficador");
f=input("Ingrese funcion a graficar formato f=@(x)cosx : ");
a=input("Limite inferior de la grafica: ");
b=input("Limite superior de la grafica: ");

x=linspace(a,b);
plot(x,f(x));
grid();
