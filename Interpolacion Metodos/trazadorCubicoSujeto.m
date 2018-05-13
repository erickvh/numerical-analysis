%trazador cubico sujeto
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

     printf('Ingresar derivada de F en (X(0)) and Derivative de F en (X(N)) \n');
     FP0 = input('ingresar df(0): ');
     FPN = input('ingresar df(n): ');

% STEP 1
     M = N - 1;
     H = zeros(1,M+1);
     for I = 0:M
         H(I+1) = X(I+2) - X(I+1);
     end
% STEP 2
% use XA instead of alpha
     XA = zeros(1,N+1);
     XA(1) = 3.0 * (A(2) - A(1)) / H(1) - 3.0 * FP0;
     XA(N+1) = 3.0 * FPN - 3.0 * (A(N+1) - A(N)) / H(N);
% STEP 3
     for I = 1:M
         XA(I+1) = 3.0*(A(I+2)*H(I)-A(I+1)*(X(I+2)-X(I))+A(I)*H(I+1))/(H(I+1)*H(I));
     end
% STEP 4
% STEPS 4, 5, 6 and part of 7 solve the tridiagonal system using Algorithm 6.7
% use XL, XU, XZ in place of L, MU, Z resp.
     XL = zeros(1,N+1);
     XU = zeros(1,N+1);
     XZ = zeros(1,N+1);
     XL(1) = 2.0 * H(1);
     XU(1) = 0.5;
     XZ(1) = XA(1) / XL(1);
% STEP 5
     for I = 1:M
         XL(I+1) = 2.0 * (X(I+2) - X(I)) - H(I) * XU(I);
         XU(I+1) = H(I+1) / XL(I+1);
         XZ(I+1) = (XA(I+1) - H(I) * XZ(I)) / XL(I+1);
     endfor
% STEP 6
     XL(N+1) = H(N) * (2.0 - XU(N));
     XZ(N+1) = (XA(N+1) - H(N) * XZ(N)) / XL(N+1);
     C = zeros(1,N+1);
     B = zeros(1,N+1);
     D = zeros(1,N+1);
     C(N+1) = XZ(N+1);
% STEP 7
     for I = 1:N
         J = N - I;
         C(J+1) = XZ(J+1) - XU(J+1) * C(J+2);
         B(J+1) = (A(J+2)-A(J+1))/H(J+1)-H(J+1)*(C(J+2)+2.0*C(J+1))/3.0;
         D(J+1) = (C(J+2) - C(J+1)) / (3.0 * H(J+1));
     endfor 
     

     printf('CLAMPED CUBIC SPLINE INTERPOLATION\n\n');
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
    
    