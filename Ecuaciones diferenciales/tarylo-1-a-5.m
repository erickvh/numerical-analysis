
clc;

TRUE = 1;
FALSE= 0;
printf('Este es el metodo de Taylor de Orden Superior');
f=input('Ingrese la funcion f(t,y) en terminos (t,y) ejemplo @(t) @(y) y+t: ');
OK= FALSE;
while OK== FALSE
    printf('Ingrese los puntos del extremo t en lineas separadas \n');
    A= input('Ingrese A:->');
    B= input('Ingrese B:->');
    if A>= B 
        printf('Punto izquierdo debe ser menor que el extremo derecho\n')
    else
        OK=TRUE
    end
end

printf('Ingrese la condicion inicial Wo\n');
ALPHA = input('');

OK= FALSE;
while OK==FALSE
    printf('Ingrese un entero positivo N (numero de subintervalos)\n');
    printf('para poder calcular el paso h.\n');
 
    N= input('');
    if N<=0 
        printf('\nEl numero debe ser un entero positivo\n');
    else
        OK= TRUE;
    end
end

OK=FALSE;
while OK== FALSE
    printf('\n\nIngrese un entero positivo n (# de orden de taylor)\n');
    printf('Este programa solo calcula para orden 2, 3 y 4 \n')
    ORDEN = input('');
    if ORDEN<2 | ORDEN>4 
        printf('El numero debe ser un entero positivo entre 2 y 3');
    else
        OK=TRUE;
    end
end

H= (B-A)/N;
t= zeros(1,N);
w=zeros(1,N);
t(1,1)= A;
w(1,1)=ALPHA;


for I=1:N
    t(1,I+1)=A+H*I;
end

if ORDEN ==2
    printf('\n\nIngrese la primera derivada F(t,w)\n');
    printf('ANTES DE CONTINUAR CALCULE BIEN LA PRIMERA DERIVADA DE F\n');
    printf('RECUERDE que la funcion tiene que estar en terminos de t y w\n')
    FP1=input('por ejemplo: @(t)@(y) -t^2+1: ');
    TLR=zeros(1,N);
    for I=1:N

        TLR(1,I)=f( t(1,I) )(w(1,I)) + (H/2)*FP1(t(1,I))(w(1,I));

        w(1,I+1)=w(1,I)+H*TLR(1,I);
    end
else
    if ORDEN == 3 
       printf('\n\nIngrese la primera derivada F(t,w)\n');
       printf('ANTES DE CONTINUAR CALCULE BIEN LA PRIMERA DERIVADA DE F\n');
       printf('RECUERDE que la funcion tiene que estar en terminos de t y w\n')
        FP1=input('por ejemplo: @(t)@(y)-t^2+1: ');
     
       printf('\n\nIngrese la segunda derivada F(t,w)\n');
       printf('ANTES DE CONTINUAR CALCULE BIEN LA SEGUNDA DERIVADA DE F\n');
       printf('RECUERDE que la funcion tiene que estar en terminos de t y w\n')
       FP2=input('por ejemplo: @(t)@(y)-t^2+1: ');
       
       TLR=zeros(1,N);
       for I=1:N

           TLR(1,I)= f( t(1,I))(w(1,I))  +  (H/2)*FP1(t(1,I))(w(1,I))  +  (H^2/6)*FP2(t(1,I))(w(1,I));
           w(1,I+1)= w(1,I)+H*TLR(1,I)
       end
   else
       printf('\n\nIngrese la primera derivada F(t,w)\n');
       printf('ANTES DE CONTINUAR CALCULE BIEN LA PRIMERA DERIVADA DE F\n');
       printf('RECUERDE que la funcion tiene que estar en terminos de t y w\n')
FP1=input('por ejemplo: @(t)@(y) -t^2+1: ');
       printf('\n\nIngrese la segunda derivada F(t,w)\n');
       printf('ANTES DE CONTINUAR CALCULE BIEN LA SEGUNDA DERIVADA DE F\n');
       printf('RECUERDE que la funcion tiene que estar en terminos de t y w\n')
FP2=input('por ejemplo: @(t)@(y) -t^2+1: ');
       printf('\n\nIngrese la tercera derivada F(t,w)\n');
       printf('ANTES DE CONTINUAR CALCULE BIEN LA TERCERA DERIVADA DE F\n');
       printf('RECUERDE que la funcion tiene que estar en terminos de t y w\n')
       FP3=input('por ejemplo: @(t)@(y) -t^2+1: ');
       
       TLR=zeros(1,N);
       for I=1:N

           TLR(1,I)= f( t(1,I))(w(1,I))  +  (H/2)*FP1(t(1,I))(w(1,I))  +  (H^2/6)*FP2(t(1,I))(w(1,I))  +  (H^3/24)*FP3(t(1,I))(w(1,I));
           w(1,I+1)= w(1,I)+H*TLR(1,I)
       end
    end
end

printf('\n\n Metodo de TAYTLOR DE ORDEN SUPERIOR DE ORDEN %d\n',ORDEN);
printf('    t           w\n');
for I=1:(N+1)
    printf('    %5.3f    %11.7f\n',t(1,I),w(1,I))   
 end

 plot(t,w);   

