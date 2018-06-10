 pkg load symbolic
syms('F','OK','A','B','ALPHA','N','FLAG','NAME','OUP','H');
syms('T','W','I','x','s');
 clc();
 tic();
 TRUE = 1;
 FALSE = 0;
 printf('This is Eulers Method.\n');
 printf('Input the function F(t,y) in terms of t and y\n');
 printf('For example: @(t)@(y) y-t^2+1\n');
 F=input("Ingrese la funcion F(t,y) en terminos de t e y: ");

 OK = FALSE;
 while OK == FALSE 
 printf('Ingrese los puntos del extremo t en lineas separadas.\n');
 A = input(' ');
 B = input(' ');
 if A >= B  
 printf('Punto del extremo izquierdo debe ser menor que punto del extremo del derecho\n');
 else
 OK = TRUE;
 end;
 end;
 printf('Ingrese la condicion inicial\n');
 ALPHA = input(' ');
 OK = FALSE;
 while OK == FALSE 
 printf('Ingrese un entero positivo de numero de subintervalos N para poder calcular h\n');
 N = input(' ');
 if N <= 0 
 printf('El nuemro debe ser un entero positivo\n');
 else
 OK = TRUE;
 end;
 end;
 if OK == TRUE 
 printf('Choice of output method:\n');
 printf('1. Salida por pantalla\n');
    printf('2. Salida por un archivo de texto\n');
 printf('Por favor digite 1 o 2\n');
 FLAG = input(' ');

    ti=toc();
    printf('\nEl tiempo gastado por el usuario\n');
    printf('en la entrada de datos fue %18.12f segundos\n\n',ti);

 if FLAG == 2 
 printf('Input the file name in the form - drive:\\name.ext\n');
 printf('For example   A:\\OUTPUT.DTA\n');
 NAME = input(' ','s');
 OUP = fopen(NAME,'wt');
 else
 OUP = 1;
 end;
 printf('METODO DE EULER \n\n');
 printf('    t           w\n\n');

 H = (B-A)/N;
 T = A;
 W = ALPHA;
 printf('%5.3f %11.7f\n', T, W);

 for I = 1:N 

 W = W+H*F(T)(W);
 T = A+I*H;

w(I)=W;
t(I)=T;
 printf('%5.3f %11.7f\n', T, W);
end;

% STEP 5
 if OUP ~= 1 
 fclose(OUP);
 printf('Output file %s created successfully \n',NAME);
end;
end;
plot(t,w)

tf=toc();
t=tf-ti;
printf('\nEl tiempo real de máquina fue %18.12f segundos',t);
printf('\ntiempo total de ejecucion del programa: %f segundos',toc());