%algoritmo de interpolacion hermite%
format long;
disp("METODO DE INTERPOLACION HERMITE");
do
n=input("Ingrese el numero de datos -1 (ejemplo 5 datos ingresar 4): ");
until(n>0)

x=zeros(n+1);
q=zeros(2*n+2,2*n+2);

for i=0:n
  printf("==========================================\n");
  x(i+1)=input(strcat("ingrese el valor de x(",num2str(i),"): ")); 
  q(2*i+1,1)=input(strcat("ingrese el valor de fx(",num2str(i),"): "));
  q(2*i+2,2)=input(strcat("ingrese el valor de dfx(",num2str(i),"): ")); 
  printf("=========================================\n");
  
endfor

%paso 1 % 
z=zeros(2*n+2);
  for i=0:n
    
  %paso 2
    z(2*i+1) = x(i+1);
    z(2*i+2) = x(i+1);
    q(2*i+2,1) = q(2*i+1,1);
  %paso 3
           if i ~= 0 
               q(2*i+1,2) = (q(2*i+1,1)-q(2*i,1))/(z(2*i+1)-z(2*i));
           endif
  endfor
  %paso 4
 k=2*n+1;
 for i=2:k
    for j=2:i
      q(i+1,j+1) = (q(i+1,j)-q(i,j))/(z(i+1)-z(i-j+1));
    endfor
 endfor

%paso 5
  printf("Datos que fueron introducidos\n |       x            ||       fx        ||       df(x)        |\n");
for i=0:n
  printf(' | %12.10e || %12.10e || %12.10e ||\n',x(i+1),q(2*i+1,1),q(2*i+2,2));
 endfor

 %coeficientes de la interpolacion hermite
printf("====================================\n ");
 printf("Coeficientes de el polinomio de interpolacion de hermite\n ");
 printf("====================================\n ");
  
 for i=0:k
   printf( '  %12.10e\n', q(i+1,i+1));
 endfor
 
 %evaluar en el polinomio de hermite%

 do
  printf("====================================\n ");  
  ban=input(strcat("Desea evaluar el polinomio", "\n1=>si", "\n2=>no \n: "));
  
  if(ban==1)
         disp("");
         xx = input('ingrese valor de x que desea interpolar:  ');
         s = q(k+1,k+1)*(xx-z(k));
         for i = 2:k
             j = k-i+1;
             s = (s+q(j+1,j+1))*(xx-z(j));
         endfor
         s = s + q(1,1);
         printf( '\nresultado cuando x= %12.10e en f= %12.10e \n', xx, s);
  endif   
  
until(ban==2)


