% metodo de nevilles
% clc;
 TRUE=1;
 FALSE=0;
 printf('Metodo de Neville.\n');
 OK = FALSE;
 while OK == FALSE 
     OK = FALSE;
     while OK ~= TRUE 
         printf('Ingrese n\n');
         N = input(' ');
         if N > 0 
             OK = TRUE;
             XX = zeros(N+1);
             Q = zeros(N+1,N+1);
             for I = 0:N
                 printf('Ingrese X(%d) y F(X(%d)) ', I, I);
                 printf('en lineas separadas.\n');
                 XX(I+1) = input(' ');
                 Q(I+1,1) = input(' ');
             end
         else
             printf('El numero debe ser positivo\n');
         end
     end
 end
 
 if OK == TRUE 
     printf('Ingrese el punto en donde sera evaluado el polinomio:\n');
     X = input(' ');
 end
 if OK == TRUE
     D = zeros(N+1);
     D(1) = X-XX(1);
     for I = 1:N
         D(I+1) = X-XX(I+1);
         for J = 1:I
             Q(I+1,J+1) = (D(I+1)*Q(I,J)-D(I-J+1)*Q(I+1,J))/(D(I+1)-D(I-J+1));
         end
     end
     printf('Seleccione forma de salida\n');
     printf('1. Pantalla\n');
     printf('2. Archivo de texto\n');
     printf('Ingrese 1 o 2\n');
     FLAG = input(' ');
     if FLAG == 2 
         printf('Ingrese el nombre del archivo en la forma - drive:\\name.ext\n');
         printf('Por ejemplo:   E:\\OUTPUT.TXT\n');
         NAME = input(' ','s');
         OUP = file('open',NAME,'unknown');
     else
         OUP = 1;
     end
     if OUP==1
         printf('Metodo Nevilles\n');
     else
         text1='Metodo Nevilles'
         write(OUP,text1);
     end
     if OUP==1
         printf('Tabla para P evaluada en X = %12.8f , siguientes: \n', X);
     else
         text2='Tabla para P evaluada en X , siguientes: ';
         write(OUP,text2)
     end
     if OUP==1
         printf('Las entradas son XX(I), Q(I,0), ..., Q(I,I) ');
     else
         text3='Las entradas son XX(I), Q(I,0), ..., Q(I,I) ';
         write(OUP,text3)
     end
     if OUP==1
         printf('por cada I = 0, ..., N donde N = %3d\n\n', N);
     else
         text4='por cada I = 0, ..., N donde N = ';
         write(OUP,text4);
         write(OUP,N)
     end

         if OUP==1
             printf('%11.8f ', XX(I+1));
         else
             text5='-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-';
             write(OUP,text5)
             write(OUP,XX(I+1))
         end

         for J = 0:I
             if OUP==1 
                 printf('%11.8f ', Q(I+1,J+1));
             else
                 text6='-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-';
                 write(OUP,text6)
                 write(OUP,Q(I+1,J+1)) 
             end

         end
         if OUP==1
             printf('\n');
         else
             text7='-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-';
             write(OUP,text7)
         end
     end

     if OUP ~= 1 
         if OUP==1
             printf('%11.8f ',time);
         else
             text8='-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-';
             write(OUP,text8)
         end
         if OUP==1
             printf('el tiempo de maquina es %11.8f \n\n', time);
         else
             text9='-.-.-.-. el tiempo fue -.-.-.-.-.-';
             write(OUP,text9);
             write(OUP,time);
         end
         file('close',OUP);
         printf('Archivo de salida %s creado exitosamente\n',NAME);
     end