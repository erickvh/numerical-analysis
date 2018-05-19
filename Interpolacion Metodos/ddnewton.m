% Diferencias divididas Newtons       
% clc;
 TRUE = 1;
 FALSE = 0;
 printf('Interpolacion polinomial de Newtons\n');
 OK = FALSE;
 while OK == FALSE 
     OK = FALSE;
     while OK == FALSE 
         printf('Ingrese n\n');
         N = input(' ');
         if N > 0 
             OK = TRUE;
             X = zeros(N+1);
             Q = zeros(N+1,N+1);
             for I = 0:N
                 printf('Ingrese X(%d) y F(X(%d)) ', I, I);
                 printf('en lineas separadas\n');
                 X(I+1) = input(' ');
                 Q(I+1,1) = input(' ');
             end
         else 
             printf('El numero debe ser un entero positivo\n');
         end
     end
 end

 if OK == TRUE 
     printf('Ingrse el punto en el que el polinomio sera evaluado\n');
     x = input(' ');
     a=X(1); 
     b=X(N+1);
     while ~((x>a & x<b))
          printf('El numero debe estar entre el rango de Xo-Xn\n');   
          printf('Ingrese el punto en el que el polinomi sera evaluado\n');
          x = input(' ');
     end
 
 end

 if OK == TRUE 
     printf('Seleccione la forma de salida\n');
     printf('1. Pantalla\n');
     printf('2. Archivo de texto\n');
     printf('Ingrse 1 o 2\n');
     FLAG = input(' ');
     if FLAG == 2 
         printf('Ingresese el nombre del archivo de la siguiente forma - drive:\\name.ext\n');
         printf('Por ejemplo:   E:\\OUTPUT.TXT\n');
         NAME = input(' ','s');
         OUP = file('open',NAME,'unknown');
     else
         OUP = 1;
     end
     if OUP==1;
         printf('Interpolacion Polinomial de Newtons\n\n');
     else
         text1='Interpolacion Polinomial de Newtons';
         write(OUP,text1)
     end
 
     for I = 1:N
         for J = 1:I
             Q(I+1,J+1) = (Q(I+1,J) - Q(I,J)) / (X(I+1) - X(I-J+1));
         end
     end
 
     p=Q(1,1);
     K=(x-X(1));
     for I=2:N+1
         if I>2
           K=K*(x-X(I-1));
         end
         p=p+Q(I,I)*K;
     end

    if  OUP==1;
        printf('Ingrese datos siguientes');
    else
        text2='Ingrese datos siguientes';
        write(OUP,text2);
    end
 
     for I = 0:N
         if  OUP==1;
             printf('X(%d) = %12.8f F(X(%d)) = %12.8f\n',I,X(I+1),I,Q(I+1,1));
         else
             text3='-----------------------';
             write(OUP,text3);
             write(OUP,I);
             write(OUP,X(I+1));
             write(OUP,Q(I+1,1));
         end
     end
     
     if OUP==1;
         printf('\nLos coeficientes Q(0,0), ..., Q(N,N) son:\n');
     else
         text4='Los coeficientes Q(0,0), ..., Q(N,N) son:';
         write(OUP,text4);
     end
             
     for I = 0:N
         if OUP==1;
             printf('%12.8f\n', Q(I+1,I+1))
         else
             text5='-.-.-.-.-.-.-.-.-.-.-.-';
             write(OUP,text5);
             write(OUP,Q(I+1,I+1));
         end
         
     end
     if OUP==1;
         printf('\nP(%12.8f)=%12.14f\n',x,p);
     else
         text6='=================';
         write(OUP,text6);
         write(OUP,x);
         write(OUP,p);
     end
 
 if OUP ~= 1 
     file ('close',OUP);
     printf('Archivo %s creado exitosamente\n',NAME);
 end
 end
