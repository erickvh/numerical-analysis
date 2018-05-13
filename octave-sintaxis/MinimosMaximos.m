%funcion f(x)=x - 2sen(x^2) de -2 a 2
% minimos y maximos
%df=1-4xcos(x^2)
x=-2:0.1:2;
f=@(x) x-2*sin(x.^2);
plot(x,f(x));
grid();
ylabel("Y");
xlabel("X");
title("f=x-2*sen(x^2)");

df=@(x) 1-4*x.*cos(x.^2);

valorx=fsolve(df,0);
valorx
valory= f(valor);
%plot(x,df(x),valor,resultado);
valory