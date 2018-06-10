
 clc;
 TRUE = 1;
 FALSE = 0;
 
 printf('Este es el METODO DEL PUNTO MEDIO.\n');
 printf('Ingrese la función F(t,y) en terminos de t y y\n');
 printf('Por ejemplo: @(t)@(y) y-t^2+1 : \n');
 F=input("ingrese aqui: ");
 OK = FALSE;
 while OK == FALSE 
    printf('Ingrese los puntos del extremo t en lineas separadas.\n');
    A = input(' ');
 
    B = input(' ');
    if A >= B  
        printf('Punto del extremo izquierdo debe ser menos que punto del extremo del derecho\n');
    else
        OK = TRUE;
    end;
 end;
 printf('Ingrese la condicion inicial Wo\n');
 ALPHA = input(' ');
 OK = FALSE;
 while OK == FALSE 
    printf('Ingrese un entero positivo de numero de subintervalos N ');
    printf('para poder calcular h\n');
    N = input(' ');
    if N <= 0 
        printf('El numero debe de ser un entero positivo\n');
    else
        OK = TRUE;
    end
 end

 t=zeros(1,N);   
 y=zeros(1,N); 
 t(1,1)=A;
 y(1,1)=ALPHA;
 H = (B-A)/N;

 for I=1:(N)
     t(1,I+1)=A+H*I;
 end
 
 if OK == TRUE 
    printf('\nESTE PROGRAMA LE GENERARA UN GRAFICA QUE ES LA\n');
    printf('SOLUCION APROXIMADA QUE HEMOS CALCULADO');
    printf('\n\nElija el tipo de salida:\n');
    printf('1. Salida por pantalla\n');
    printf('2. Salida por un archivo de texto\n');
    printf('Por favor digite 1 o 2\n');
    FLAG = input(' ');
    if FLAG == 2 
        printf('Ingrese el nombre del archivo de la forma - drive:\\name.ext\n');
        printf('Por ejemplo   A:\\OUTPUT.DTA\n');
        NAME = input(' ','s');
        OUP = file('open',NAME,'unknown');
        write(OUP, 'METODO DEL PUNTO MEDIO (RUNGE KUTTA)');
        write(OUP, '    t           w');
    else
        OUP=1;
        printf('METODO DEL PUNTO MEDIO (RUNGE KUTTA)\n');
        printf('    t           w\n');
    end;

    for I=1:(N)
        K=F(t(1,I))(y(1,I));
        C=H/2;
        y(1,I+1)=y(1,I)+H*F(t(1,I)+C)(y(1,I)+C*K);
    end

    if FLAG==2 then
        for I=1:(N+1)
            text=string(t(1,I))+" "+string(y(1,I));
            write(OUP, text);
        end
    else
        for I=1:(N+1)
            printf('   %5.3f %11.7f\n', t(1,I), y(1,I));
        end
    end
    if OUP ~= 1 
        file('close', OUP);
        printf('El archivo de salida %s se creo con exito \n',NAME);
    end
 end
 printf("\nGraficando...");
 plot(t,y,'*')
 printf("Grafico Elaborado");
