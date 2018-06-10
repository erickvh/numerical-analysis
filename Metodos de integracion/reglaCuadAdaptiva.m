fprintf('\n-- // Regla de Cuadratura Adaptativa // --\n');
   %Ingreso de datos por parte del usuario
      F = input('- Ingrese la funcion en formato f(x): ','s');
      F = inline(F);
      AA = input('- Ingrese el limite inferior: ');
      L = AA;
      BB = input('- Ingrese el limite superior: ');
      N = input('- Ingrese el numero maximo de niveles: ');
      EPS = input('- Ingrese la tolerancia: ');
      
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(AA >BB)
      AA=BB;
      BB = L;
      end
      
      tic;
      if(!(AA == BB))
      datoReal = quad(F,AA,BB);
      fprintf('- Valor Exacto de La Integral: %0.5f\n',datoReal);
       
   %FIX
 CNT = 0;
 OK = true;
 APP = 0;
 I = 1;
 TOL = zeros(1,N);
 A = zeros(1,N);
 H = zeros(1,N);
 FA = zeros(1,N);
 FC = zeros(1,N);
 FB = zeros(1,N);
 S = zeros(1,N);
 L = zeros(1,N);
 FD = zeros(1,N);
 FE = zeros(1,N);
 V = zeros(1,7);
 TOL(I) = 10*EPS;
 A(I) = AA;
 H(I) = 0.5*(BB-AA);
 FA(I) = F(AA);
 CNT = CNT+1;
 FC(I) = F((AA+H(I)));
 CNT = CNT+1;
 FB(I) = F(BB);
 CNT = CNT+1;
% Approximation from Simpson's method for entire interval.
 S(I) = H(I)*(FA(I)+4*FC(I)+FB(I))/3;
 L(I) = 1;
% STEP 2
 while (I > 0 && OK == true) 
% STEP 3
 FD = F((A(I)+0.5*H(I)));
 CNT = CNT+1;
 FE = F((A(I)+1.5*H(I)));
 CNT = CNT+1;
% Approximations from Simpson's method for halves of intervals
 S1 = H(I)*(FA(I)+4*FD+FC(I))/6;
 S2 = H(I)*(FC(I)+4*FE+FB(I))/6;
%Save data at this level
 V(1) = A(I);
 V(2) = FA(I);
 V(3) = FC(I);
 V(4) = FB(I);
 V(5) = H(I);
 V(6) = TOL(I);
 V(7) = S(I);
 LEV = L(I);
% STEP 4
% Delete the level
 I = I-1;
% STEP 5
 if abs(S1+S2-V(7)) < V(6) 
 APP = APP+(S1+S2);
 else
 if LEV >= N 
 OK = FALSE;
%procedure fails
 else
% Add one level
% Data for right half subinterval
 I = I+1;
 A(I) = V(1)+V(5);
 FA(I) = V(3);
 FC(I) = FE;
 FB(I) = V(4);
 H(I) = 0.5*V(5);
 TOL(I) = 0.5*V(6);
 S(I) = S2;
 L(I) = LEV+1;
%Data for left half subinterval
 I = I+1;
 A(I) = V(1);
 FA(I) = V(2);
 FC(I) = FD;
 FB(I) = V(3);
 H(I) = H(I-1);
 TOL(I) = TOL(I-1);
 S(I) = S1;
 L(I) = L(I-1);
 end
 end
 end   
        fprintf('- Resultado usando Cuadratura Adaptiva con maximo niveles N= %d : %0.5f\n',N,APP);
        fprintf('- El numero de evaluaciones para el resultado es N= %d \n',CNT);
      error = abs(datoReal-APP);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-APP)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      %Grafica del area de integración
      graficador(AA,BB,F);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;  
