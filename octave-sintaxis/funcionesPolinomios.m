%algunos metodos dados en clases

p=@(x) x.^4-10*x.^3+35*x.^2-50*x+24;
%en caso que no exista un valor de coeficiente se asume
%que es cero ejemplo p(x)=x^2+2 entonces pa= [1 0 2]

pa=[1,-10,35,-50,24];
disp("este es el polinomio representado: ");
disp(p);
printf("\n");
%resPolyval tiene que valer 360 con x=7
disp("********************************");
resPolyval=polyval(pa,7);
printf("resultado funcion polyval: %d \n",resPolyval);
disp("********************************");

%respolyvalm manipulacion con matrices 
resPolyvalm=polyvalm(pa,[0 1 2; 3 4 5 ;6 7 8]);
disp("polyvalm resultado: ");
disp(resPolyvalm);
disp("********************************");

%roots obtencion de raices
raices=roots(pa);
disp("estas son las raices del polinomio: ")
disp(raices);
disp("********************************");
%contruccion de polinomio por medio de las raices
disp("apartir de las raices del polinomio anterior se puede");
disp(" volver a contruir el polinomio con la funcion poly");
disp("Poly resultado:");
printf("\n");

resPoly=poly(raices);
disp(resPoly);
disp("********************************");

%contruccion de polinomio por medio de las raices
x=[0,1,2,3,4,5,6];
y=p(x);
newPolinomio=polyfit(x,y,4);
disp("la finalidad de polyfit es crear un polinomio");
disp("atravez de puntos 'y' y 'x'");
disp("resultado de polyfit");
disp(newPolinomio);
disp("********************************");

%polyder derivada polinomios, polyint integrar polinomios
resPolyder=polyder(pa);
resPolyint=polyint(pa);
disp("resultado de derivada por polyder: ");
disp(resPolyder);
disp("resultado de integral por polyint: ");
disp(resPolyint);
disp("********************************");

%
