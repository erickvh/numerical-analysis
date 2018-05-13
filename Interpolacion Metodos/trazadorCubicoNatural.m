%trazador cubico natural
disp("Este el metodo de trazador cubico natural");
do
N=input("Ingresar N: ");
until(N>0)

  X = zeros(1,N+1);
  A = zeros(1,N+1);

for I=0:N
  printf("==========================================\n");
  X(I+1)=input(strcat("ingrese el valor de x(",num2str(I),"): ")); 
  A(I+1)=input(strcat("ingrese el valor de f(",num2str(I),"): ")); 
  
  printf("=========================================\n");
  
endfor

    M = N - 1;
% STEP 1
     H = zeros(1,M+1);
     for I = 0:M
         H(I+1) = X(I+2) - X(I+1);
     endfor
% STEP 2
% Use XA in place of ALPHA
     XA = zeros(1,M+1);
     for I = 1:M
         XA(I+1) = 3.0*(A(I+2)*H(I)-A(I+1)*(X(I+2)-X(I))+A(I)*H(I+1))/(H(I+1)*H(I));
     endfor 
% STEP 3
% STEPs 3, 4, 5 and part of 6 solve the tridiagonal system using /% Crout reduction./% use XL, XU, XZ in place of L, MU, Z resp.
     XL = zeros(1,N+1);
     XU = zeros(1,N+1);
     XZ = zeros(1,N+1);
     XL(1) = 1;
     XU(1) = 0;
     XZ(1) = 0;
     
  % STEP 4
     for I = 1:M
         XL(I+1) = 2*(X(I+2)-X(I))-H(I)*XU(I);
         XU(I+1) = H(I+1)/XL(I+1);
         XZ(I+1) = (XA(I+1)-H(I)*XZ(I))/XL(I+1);
     endfor
  % STEP 5
     XL(N+1) = 1;
     XZ(N+1) = 0;
     B = zeros(1,N+1);
     C = zeros(1,N+1);
     D = zeros(1,N+1);
     C(N+1) = XZ(N+1);
  % STEP 6
     for I = 0:M
         J = M-I;
         C(J+1) = XZ(J+1)-XU(J+1)*C(J+2);
         B(J+1) = (A(J+2)-A(J+1))/H(J+1) - H(J+1) * (C(J+2) + 2.0 * C(J+1)) / 3.0;
         D(J+1) = (C(J+2) - C(J+1)) / (3.0 * H(J+1));
     endfor
     
    
         printf('NATURAL CUBIC SPLINE INTERPOLATION\n\n');
         printf('The numbers X(0),...,X(N) are:\n');
         for I = 0:N
             printf(' %11.8f', X(I+1));
         endfor
     
       printf('\n\nThe coefficients of the spline on the subintervals '); 
         printf('are:\n');
         printf('for I = 0, ..., N-1\n');
         printf('          A(I)                   B(I)                    C(I)                  D(I)\n');
         
         for I = 0:M
              printf('%13.8f %13.8f %13.8f %13.8f\n',A(I+1),B(I+1),C(I+1),D(I+1));
         endfor
    %ingresar el nodo a interpolar

     printf('Ingrese el nodo a interpolar\n');
     x = input(' ');
     a=X(1); 
     b=X(N+1);
     while x<a | x>b 
         %valido si el numero ingresado esta en el intervalo Xo-Xn
          printf('\nEl nodo a interpolar debe estar en el rango Xo-Xn\n');   
          printf('Ingrese el nodo a interpolar\n');
          x = input(' ');
     end
 
     for i=1:N
         if (x>X(i) & x<X(i+1))
             s=i;
             i=N;
         end
     end
 
     POL=num2str(A(s));
     POL=strcat(POL,'+(');
     POL=strcat(POL,num2str(B(s)));
     POL=strcat(POL,'*(x-');
     POL=strcat(POL,num2str(X(s)));
     POL=strcat(POL,'))+(');
     POL=strcat(POL,num2str(C(s)));
     POL=strcat(POL,'*(x-');
     POL=strcat(POL,num2str(X(s)));
     POL=strcat(POL,')^2)+(');
     POL=strcat(POL,num2str(D(s)));
     POL=strcat(POL,'*(x-');
     POL=strcat(POL,num2str(X(s)));
     POL=strcat(POL,')^3)');

  
     r=A(s)+B(s)*(x-X(s))+C(s)*(x-X(s))^2+D(s)*(x-X(s))^3;
     printf('FORMA DEL POLINOMIO DE INTERPOLACION\n');   
     printf('S(%d)(x) = %s \n',s-1,POL);
     printf('\nVALOR INTERPOLADO\n');   
     printf('S(%d)(%.6f) = %13.8f \n',s-1,x,r);    
 
    