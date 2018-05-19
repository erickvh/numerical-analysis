 % NEWTONS INTERPOLATORY DIVIDED-DIFFERENCE FORMULA ALGORITHM 3.2        

% clc;
 TRUE = 1;
 FALSE = 0;
 printf('Polinomio de interpolacion de NEWTON\n');
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
                 printf('en li­neas separadas\n');
                 X(I+1) = input(' ');
                 Q(I+1,1) = input(' ');
             end
         else 
             printf('El numero debe ser un entero positivo\n');
         end
     end
 end
 if OK == TRUE 
     printf('Seleccione el tipo de salida\n');
     printf('1. Pantalla\n');
     printf('2. Archivo de texto\n');
     printf('Ingrese 1 o 2\n');
     FLAG = input(' ');
     if FLAG == 2 
         printf('Ingrese el nombre del archivo de la forma - drive:\\name.ext\n');
         printf('Por ejemplo:   E:\\SALIDA.TXT\n');
         NAME = input(' ','s');
         OUP = file('open',NAME,'unknown');
         text1='Interpolacion Polinomial de Newton\n\n'
         write(OUP,text1);
     else
         OUP = 1;
     end
     if OUP==1;
         printf('INTERPOLACION POLINOMIAL DE NEWTON\n\n');
     else
         text2='INTERPOLACION POLINOMIAL DE NEWTON\n\n';
         write(OUP,text2); 
     end
     fprintf(OUP, 'INTERPOLACION POLINOMIAL DE NEWTON\n\n');
     
     for I = 1:N
         for J = 1:I
             Q(I+1,J+1) = (Q(I+1,J) - Q(I,J)) / (X(I+1) - X(I-J+1));
         end
     end
     
     if OUP==1;
         printf('Ingrese datos siguientes:\n');
     else
         text3='Ingrese datos siguientes:\n';
         write(OUP,text3); 
     end
     fprintf(OUP, 'Los datos de entrada son:\n');      
     for I = 0:N
     if OUP==1;
         printf('X(%d) = %12.8f F(X(%d)) = %12.8f\n',I,X(I+1),I,Q(I+1,1));
     else
         text4='------------------------------------';
         text4='X(%d) = %12.8f F(X(%d)) = %12.8f\n';
         write(OUP,text4);
         write(OUP,I);
         write(OUP,X(I+1));
         write(OUP,I);
         write(OUP,Q(I+1,1));     
     end
        fprintf(OUP,'X(%d) = %12.8f F(X(%d)) = %12.8f\n',I,X(I+1),I,Q(I+1,1));
     end
     if OUP==1;
         printf('*-*-*-*-* MATRIZ *-*-*-*-*\n');
     else
         text5='*-*-*-*-* MATRIZ *-*-*-*-*\n';
         write(OUP,text5); 
     end

     fprintf(OUP, '*-*-*-*-* MATRIZ *-*-*-*-*\n');
     for I = 1:N+1
         for J = 1:I
            
                 if OUP==1;
                     printf('%12.8f ', Q(I,J));
                 else
                     text6='%12.8f ';
                     write(OUP,text6);
                     write(OUP,Q(I,J)); 
                 end
            
            fprintf(OUP, '%12.8f ', Q(I,J));
         end
         if OUP==1;
                     printf('\n');
         else
                     text7='-.-.-.-.-.-.-.-.-.-.-';
                     write(OUP,text7);
         end
         fprintf(OUP, '\n');
     end
     
     if OUP ~= 1 
        file('close',OUP);
        printf('Archivo de salida %s creado exitosamente\n',NAME);
     end
 end
