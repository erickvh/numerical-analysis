
 TRUE = 1;
 FALSE = 0;
 printf('Metodo de Runge-Kutta Orden 4.\n');
 printf('Ingrese funcion F(t,y) en terminos de  t e y\n');
 printf('For example: @(y)@(t) y-t^2+1 \n');

  F = input('Ingrese aqui: ');

 OK = FALSE;
 while OK == FALSE 
     printf('Ingrese intervalos de la funcion en lineas separadas.\n');
     A = input(' ');
     B = input(' ');
     if A >= B  
         printf('EL limete superior debe ser mayor que el inferior\n');
     else
         OK = TRUE;
     end;
 end;
 printf('ingrese condicion inicial\n');
 ALPHA = input(' ');
 OK = FALSE;
 while OK == FALSE 
     printf('Ingrese el numero de subintervalos N: \n');
     N = input(' ');
     if N <= 0 
         printf('El numero debe ser positivo: \n');
     else
         OK = TRUE;
     end;
 end;
 if OK == TRUE 
     printf('Escoja metodo de salida:\n');
     printf('1. Salida pantalla\n');
     printf('2. Text File\n');
     printf('ingrese 1 o 2\n');
     FLAG = input(' ');
     if FLAG == 2 
         printf('Input the file name in the form - drive:\\name.ext\n');
         printf('For example   A:\\OUTPUT.DTA\n');
         NAME = input(' ','s');

         OUP=file('open',NAME,'unknow');
     else
         OUP = 1;
     end;
     if OUP==1 
         printf('RUNGE-KUTTA ORDEN 4\n\n');
         printf('    t           w\n\n');
        % STEP 1
         H = (B-A)/N;
         T = A;
         W = ALPHA;
         printf('%5.3f %11.7f\n', T, W);
        % STEP 2
         for I = 1:N 
            % STEP 3
             K1 = H*F(T)(W);
             K2 = H*F(T+H/2.0)(W+K1/2.0);
             K3 = H*F(T+H/2.0)(W+K2/2.0);
             K4 = H*F(T+H)(W+K3);
            % STEP 4
            % compute W(I)
             W = W+(K1+2.0*(K2+K3)+K4)/6.0;
    
    
             T = A+I*H;

             printf('%5.3f %11.7f\n', T, W);
         end;       
     else

         text1='RUNGE-KUTTA FOURTH ORDER METHOD';
         write(OUP,text1);
        % STEP 1
         H = (B-A)/N;
         T = A;
         W = ALPHA;

         text2='t';
         write(OUP,text2);         
         write(OUP,T);
         text3='w';
         write(OUP,text3);
         write(OUP,W);
        % STEP 2
        
        for I = 1:N 
       
            % STEP 3
            % use K1, K2, K3, K4 for K(1), K(2), K(3), K(4) RESP.
             K1 = H*F(T,W);
             K2 = H*F(T+H/2.0, W+K1/2.0);
             K3 = H*F(T+H/2.0, W+K2/2.0);
             K4 = H*F(T+H,W+K3);
 
             W = W+(K1+2.0*(K2+K3)+K4)/6.0;
   
             T = A+I*H;

             text4='Iteraicon:'
             write(OUP,text4);
             write(OUP,I);
             write(OUP,text5);         
             write(OUP,T);
             text6='w';
             write(OUP,text6);
             write(OUP,W);
         end

        file('close',OUP); 
        printf('Output file %s created successfully. \n',NAME);
     end     
 end