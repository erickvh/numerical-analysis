
%v=[ 1 -2 3 1 5 2  7 -3];
v=[];

OK = false;
while OK == false 
    printf('Choice of input method:\n');
    printf('1. Input entry by entry from keyboard\n');
    printf('2. Input data from a text file\n');
    printf('3. Generate data using a function F\n');
    printf('Choose 1, 2, or 3 please\n');
    FLAG = input(' ');
    if FLAG == 1 | FLAG == 2 | FLAG == 3 
       OK = true;
    end
end

if FLAG == 1 
   OK = false;
   while OK == false 
      printf('Digite la cantidad de pares ordenadosn');
      N = input(' ');
      if N > 0 
         OK = true;
         X = zeros(N+1);
         Q = zeros(N+1,N+1);
         for I = 0:N
             printf('Input X(%d) and F(X(%d)) ', I, I);
             printf('on separate lines\n');
             v= [v input('')];
             v= [v input('')];
         end
      else 
         printf('Number must be a positive integer\n');
      end
    end
    
end
if FLAG == 2 
   printf('Debe tener los valores de X1, X2 ... XN EN UNA COLUMNA. ARCHIVO LLADADO entrada.txt \n');
      INP = fopen('entrada.txt','r');
      OK = false;
      while OK == false 
         printf('Input n\n'); 
         N = input(' ');
         if N > 0                   
             X = zeros(N+1);
             Q = zeros(N+1,N+1);
             for I = 0:N
                v = [v fscanf(INP, '%d')];
                v= [v fscanf(INP, '%d')];
             end
             fclose(INP);
             OK = true;
         else
             printf('Number must be a positive integer\n')
         end
      
   end
end
if FLAG == 3 
   printf('Input the function F(x) in terms of x\n');
   printf('FORMATO: @(x)3*x^3-2*x^2+1\n');
   s = input('');
   OK = false;
   while OK == false 
       printf('Input n\n');
       N = input('');
       if N > 0          
           for I = 0:N
               printf('Input xn(%d)\n', I+1);
                 v= [v input('')];
                 v= [v s(v(I+1))];              
           end
           OK = true;
       else
           printf('Number must be a positive integer\n');
       end
   end
end




n=length(v);
i=1;
vx=[ ];vy=[];vy=[];deno=[];acum=[];deno=[];
while i<n+1 %recorriendo vector
   if (rem(i,2)==0)
    vx(i-i/2)=v(i);
    acum=[acum 0];
   elseif
    vy(i-(i-1)/2)=v(i);
   end
  i=i+1;
endwhile


fprintf('_______________________________\n')
%hacer for para sacar cada lagangre INICIO DE PROCESO
t0 = clock();
it=1;
while it<n/2+1
  i=1;L=[]; den=1;p=[1]; RESp=[1];%%%%%
      while i<n/2+1 %recorriendo vector
         if i!=it
            
           L= [vy(i) L ]; % ACUMULADOR LISTADO DE FACTORES
           den=(vy(it)-vy(i))*den; %denominador en lagrange fprintf('/ %5.5f \n', den)
         endif
        i=i+1;
      endwhile
        deno= [deno den ];
        i=1;subn=length(L); 
    while i<subn+1 
        pT=p;
        p=[1 -L(i)];%factor de lagrange
        
         p=conv(pT,p); %NUMERADOR DE LAGRANGE 
        %RES= conv([vy(i),L(i)/p]);
        i=i+1;
    endwhile
      fprintf("Lagrange de L %d :\n", it);
      polyout(p/deno(it),'x');
      acum = acum + (p*vx(it)/deno(it));%% vx es vy enrealidad 
      if(it==n/2)
      tiempo_transcurrido = etime(clock(), t0);
      
       printf('Select output destination \n');
       printf('1. Screen \n');
       printf('2. Text file \n');
       printf('Enter 1 or 2 \n');
       FLAG = input(' ');
       if FLAG == 2
           tiempo_transcurrido;
           printf('Input the file name in the form - drive:\\name.ext\n');
           printf('LOS DATOS SEGUARDAN EN Rlagrange.txt');
           OUP = fopen('Rlagrange.txt','w+');
           text1='NEWTONS INTERPOLATION POLYNOMIAL \n'
           fprintf(OUP, '%s', text1);
           fprintf(OUP,"La funcion final es la siguiente:\n ");
            FX = polyout(acum,'x');
            fprintf(OUP,FX);
            fprintf(OUP,'_______________________________\n')
            xr = input('DESEA EVALUAR EL PLINOMIO RESULTANTE EN X = ');
            FX=polyval(acum, xr);
            fprintf(OUP,'\n El valor es:  %d \n', FX)
            xg = linspace ( vy(1), vy(n/2), 100 );
            yg = polyval(acum,xg);
            fclose(OUP);
        else
            tiempo_transcurrido
            fprintf("La funcion final es la siguiente:\n ");
            FX = polyout(acum,'x')
            fprintf('_______________________________\n')
            xr = input('DESEA EVALUAR EL PLINOMIO RESULTANTE EN X = ');
            FX=polyval(acum, xr)
            xg = linspace ( vy(1), vy(n/2), 100 );
            yg = polyval(acum,xg);
            plot(xg,yg);
        end
        
        
      endif
      it=it+1;
endwhile



 fprintf('\n');
