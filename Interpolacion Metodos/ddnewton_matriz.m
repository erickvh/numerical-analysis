
 clc;
 TRUE = 1;
 FALSE = 0;
 printf('Forma del polinomio de interpolación de NEWTON\n');
 OK = FALSE;
 while OK == FALSE 
     printf('Elija el método de entrada:\n');
     printf('1. Ingresar entrada por medio del teclado\n');
     printf('2. Ingresar datos desde un archivo de texto\n');
     printf('3. Generar datos unsando una función F\n');
     printf('Escoja 1, 2, o 3 por favor\n');
     FLAG = input(' ');
     if FLAG == 1 || FLAG == 2 || FLAG == 3 
         OK = TRUE;
     end
 end
 if FLAG == 1 
     OK = FALSE;
     while OK == FALSE 
         printf('Ingrese n\n');
         N = input(' ');
         if N > 0 
             OK = TRUE;
             X = zeros(N+1);
             Q = zeros(N+1,N+1);
             d=[1.101 0.3349375 -0.02475];f=[0 0.25 0.5];
             for I = 0:N
                 printf('Ingrese X(%d) y F(X(%d)) ', I, I);
                 printf('en líneas separadas\n');
                 X(I+1) = input(' ');
                 Q(I+1,1) =input(' ');
             end
         else 
             printf('El número debe ser un entero positivo\n');
         end
     end
 end
 if FLAG == 2 
     printf('¿Ha creado con los datos una columna en un archivo de texto?\n');
     printf('Digite Y o N\n');
     A = input(' ','s');
     if A == 'Y' | A == 'y' 
         printf('Ingrese el nombre del archivo en la forma - ');
         printf('drive:\\name.txt\n');
         printf('por ejemplo:   E:\\DATA.txt\n');
         NAME = input(' ','s');
         INP = mopen(NAME,'rb');
         OK = FALSE;
         while OK == FALSE 
             printf('Ingrese n\n'); 
             N = input(' ');
             if N > 0                   
                 X = zeros(N+1);
                 Q = zeros(N+1,N+1);
                 for I = 0:N
                      X(I+1) = fscanf(INP,'%f');
                    Q(I+1,1) = fscanf(INP,'%f');
                 end
                 mclose(INP);
                 OK = TRUE;
             else
                 printf('El número debe ser un entero positivo\n')
             end
         end
     else
         printf('Por favor crear la entrada del archivo en UNA columna ');
         printf('Formada con los valores de X y F(X)\n');
         printf('los valores de F(X) deben ir despues de cada X correspondiente.\n');
         printf('El programa terminará para que el archivo ');
         printf('se puede crear.\n');
         OK = FALSE;
     end
 end
 if FLAG == 3 
     printf('Ingrese la funcion F(x) en terminos de x\n');
     printf('Por ejemplo: y=3*x^3-2*x^2+1\n');
     s = @(x) x.^3-2*x.^2-2;%input('Digite la formula formato: @(x) x.^2+2*x+1');
     
     OK = FALSE;
     while OK == FALSE 
         printf('Ingrese n\n');
         N = input(' ');
         v =[-2 -1 0 2 3 6];
         if N > 0 
             X = zeros(N+1);
             Q = zeros(N+1,N+1);
             for I = 0:N
                 printf('Ingrese X(%d)\n', I+1);
                 X(I+1) = v(I+1);%input(' ');
                 Q(I+1,1) = s(X(I+1));
             end
             OK = TRUE;
         else
             printf('El número debe ser un entero positivo\n');
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
         text1='NEWTONS INTERPOLATION POLYNOMIAL\n\n'
         write(OUP,text1);
     else
         OUP = 1;
     end
     if OUP==1 
         printf('INTERPOLACION POLINOMIAL DE NEWTON\n\n');
     else
         text2='INTERPOLACION POLINOMIAL DE NEWTON\n\n';
         write(OUP,text2); 
     end
  fprintf(OUP, 'INTERPOLACION POLINOMIAL DE NEWTON\n\n');
     % STEP 1
     V=[];
     for I = 1:N
       X(I)
       if(I==1) V=[V X(I)]; end       
         for J = 1:I  
              Q(I+1,J+1) = (Q(I+1,J) - Q(I,J)) / (X(I+1) - X(I-J+1));
             if(J==I) 
             V=[V  Q(I+1,J+1)];
             end             
         end
     end

     % STEP 2
     if OUP==1 
         printf('Input data follows:\n');
     else
         text3='Input data follows:\n';
         write(OUP,text3); 
     end
      fprintf(OUP, 'Los datos de entrada son:\n');      
      %esta parte es la que he agregado--------------------------------
     for I = 0:N
        %fprintf(OUP, '%12.8f\n', Q(I+1,I+1));
       if OUP==1 
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
     end
    %imprimiendo todas las diferencias divididas calculadas
     if OUP==1 
         printf('********* MATRIZ ********\n');
     else
         text5='********* MATRIZ ********\n';
         write(OUP,text5); 
     end
     for I = 1:N+1
         for J = 1:I
                 if OUP==1 
                     printf('%12.8f ', Q(I,J));
                 else
                     text6='%12.8f ';
                     write(OUP,text6);
                     write(OUP,Q(I,J)); 
                 end
            
            %fprintf(OUP, '%12.8f ', Q(I,J));
         end
           if OUP==1 
                       printf('\n');
           else
                       text7='-.-.-.-.-.-.-.-.-.-.-';
                       write(OUP,text7);
           end
        fprintf(OUP, '\n');
     end
     % fin de la impresión
     if OUP ~= 1 
        file('close',OUP);
        printf('Output file %s created successfully\n',NAME);
     end
     xf = input('Desea evaluar en?: ');
     j=1;
      acumulador= 0;
     while j<N+1
        i=1; p=1;          
       if(j==1)
          acumulador= acumulador+ Q(1,1)
       else
       
          while i<j
              q=p;fprintf('factor total')
              p=[xf - X(i)]%factor
              fprintf('multiplicando los factores da: ')            
              p=conv(q,p)
              
              if i==j-1
                fprintf('final sumando: ')
                p=conv(V(j),p);
                fprintf('acumulador VJ ')   
                acumulador= acumulador + p
              end
              i=i+1;
          endwhile
        end
         j=j+1;
      endwhile
         
     
 end

