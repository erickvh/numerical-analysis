%FUNCIONES DE USO GENERAL
function graficador(a,b,f)
      x=(a-0.1):0.001:(b+0.1);
      plot(x,f(x),'b'); grid on
      area(x,f(x)); grid on
      ylabel('f(x)');
      xlabel('x');
      legend('Area Bajo La Curva');
      title('Grafica');  
endfunction
%FUNCIONES DE METODOS DE INTEGRACION NUMERICA

%REGLAS NEWTON COTES CERRADAS

%REGLA SIMPSON TRAPECIOS
function [time,error]= rSimpleTrapecios(enableInputs,a,b,f)
      if enableInputs==true
      clc();
      fprintf('\n-- // Formula Cerrada de Newton-Cotes, Regla Simple de Trapecios // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      endif

      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('\n- Valor Exacto de La Integral: %0.5f\n',datoReal);
      h = (b-a)./2;
      %Calculando el área
      sum = h*(f(a)+f(b));
      %Impresión de resultados finales  
      fprintf('- Resultado Usando La Regla Simple de Trapecios: %0.5f\n',sum);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      %Grafica del area de integración
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      endif
      time=toc;
      else
      
      tic;
      h = (b-a)./2;
      sum = h*(f(a)+f(b));
      time=toc;
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando La Regla Simple de Trapecios: %0.5f\n',sum)
      endif
endfunction

%REGLA SIMPSON 1/3
function [time,error]= rSimpsonUnTercio(enableInputs,a,b,f)
if(enableInputs==true)
  clc();
  fprintf('\n-- // Formula Cerrada de Newton-Cotes, Regla de Simpson 1/3 Para n = 2 // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('- Valor Exacto de La Integral: %0.5f\n',datoReal);
      %Regla de Simpson 1/3 Para n = 2
      h = (b-a)./2;
      x0 = a + 0*h;
      x1 = a + 1*h;
      x2 = b;
      sum = (h/3)*(f(x0)+4*f(x1)+f(x2));
      error = abs(datoReal-sum);
      %Impresión de resultados finales
      fprintf('- Resultado Usando La Regla de Simpson 1/3 Para n = 2: %0.5f\n',sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
      else
      tic;
      h = (b-a)./2;
      x0 = a + 0*h;
      x1 = a + 1*h;
      x2 = b;
      sum = (h/3)*(f(x0)+4*f(x1)+f(x2));
      time=toc;
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando La Regla de Simpson 1/3 Para n = 2: %0.5f\n',sum);
      endif
endfunction

%REGLA SIMPSON 3/8
function [time,error]= rSimpsonTresOctavo(enableInputs,a,b,f)
if(enableInputs==true)
  clc();
  fprintf('\n-- // Formula Cerrada de Newton-Cotes, Regla de Simpson 3/8 Para n = 3 // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('- Valor Exacto de La Integral: %0.5f\n',datoReal);
      %Regla de Simpson 3/8 Cuando n = 3
      h = (b-a)./3;
      x0 = a + 0*h;
      x1 = a + 1*h;
      x2 = a + 2*h;
      x3 = b;
      sum = (3*h/8)*(f(x0)+3*f(x1)+3*f(x2)+f(x3));
      %Impresión de resultados finales
      fprintf('- Resultado Usando La Regla de Simpson 3/8 Para n = 3: %0.5f\n',sum);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
else
    tic;
      h = (b-a)./3;
      x0 = a + 0*h;
      x1 = a + 1*h;
      x2 = a + 2*h;
      x3 = b;
      sum = (3*h/8)*(f(x0)+3*f(x1)+3*f(x2)+f(x3));
      time=toc;
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando La Regla de Simpson 3/8 Para n = 3: %0.5f\n',sum);
endif     

endfunction

%newton cotes abiertas
%REGLA PUNTO MEDIO
function [time,error]=rPuntoMedio(enableInputs,a,b,f)
   if(enableInputs==true)
      clc();
      fprintf('\n-- // Formula Abierta de Newton-Cotes, Punto medio Para n = 0 // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('- Valor Exacto de La Integral: %0.5f\n',datoReal);
      %Regla del punto medio
      h=(b-a)/2; %h=(b-a)/n+2 ==> n=0 ==> (b-a)/2
      sum =2*h*f(a+h);
      %Impresión de resultados finales
      fprintf('- Resultado Usando La Regla de Simpson 3/8 Para n = 3: %0.5f\n',sum);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      endif
      time=toc;
      else
      tic;
      h = (b-a)./2;
      sum =2*h*f(a+h);
      time=toc;
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando La Regla de Simpson 3/8 Para n = 3: %0.5f\n',sum);
      endif
endfunction

%REGLAS COMPUESTAS

%REGLA COMPUESTA DE TRAPECIO
function [time,error]= rCompuestaTrapecios(enableInputs,a,b,f,n)
      if(enableInputs==true)
      clc();
      fprintf('\n-- Regla Compuesta de Trapecios // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      n = input('- Ingrese el numero de iteraciones(puede ser par o impar: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('\n- Valor Exacto de La Integral: %0.5f\n',datoReal);
      h = (b-a)./n;
      x0 = a;
      i = 1;
      %Calculando el área de los extremos
      sum = (h/2)*(f(x0)+f(b));
      %Calculando el área usando (h/2)*2*[f(x0+h)+f(x0+2h)+...f(x0+n*h)]
      while (i < n)
        a = x0 + i*h;
        sum = sum + (h/2)*2*f(a);
        i = i+1;
        end
      %Impresión de resultados finales  
      fprintf('- Resultado Usando La Regla de Trapecios Para %d Iteraciones: %0.5f\n',n,sum);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      %Grafica del area de integración
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
      else
      tic;
      h = (b-a)./n;
      x0 = a;
      i = 1;
      %Calculando el área de los extremos
      sum = (h/2)*(f(x0)+f(b));
      %Calculando el área usando (h/2)*2*[f(x0+h)+f(x0+2h)+...f(x0+n*h)]
      while (i < n)
        a = x0 + i*h;
        sum = sum + (h/2)*2*f(a);
        i = i+1;
        end
      time=toc;
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando regla compuesta trapecio: %0.5f\n',sum);      
      endif
endfunction

%REGLA COMPUESTA SIMPSON
function [time,error]= rCompuestaSimpson(enableInputs,a,b,f,n)
      if(enableInputs==true)
      clc();
      fprintf('\n-- //Regla Compuesta de Simpson // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      n = input('- Ingrese el numero de iteraciones(recuerde que tiene que ser par): ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('- Valor Exacto de La Integral: %0.5f\n',datoReal);
      %Regla de Simpson 1/3 Mediante Iteraciones:
      h = (b-a)./n;
      x = zeros(1,n+1);
      x(1) = a;
      x(n+1) = b;
      %Agregando datos al vector "x"
      i = 2;
      while (i < n+1)
        x(i) = x(1) + (i-1)*h;
        i = i+1;
        end
      %Calculando el área de los extremos
      sum = 0;
      sum = (h/3)*(f(a)+f(b));
      %Calculando el área usando (h/3)*4*[f(x(1))+f(x(3))+...f(x(2*k+1))]
      k = 0;
      while (k <= (n-2)/2)
        sum = sum + (h/3)*4*f(x((2*k+1)+1));
        k = k+1;
        end
      k = 1;
      %Calculando el área usando (h/3)*4*[f(x(1))+f(x(4))+...f(x(2*k))]
      while (k <= (n-2)/2)
        sum = sum + (h/3)*2*f(x((2*k)+1));
        k = k+1;
        end
      %Impresión de resultados finales
      fprintf('- Resultado Usando La Regla de Simpson 1/3 Para n = %d Iteraciones: %0.5f\n',n,sum);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
      
      else
      tic;
      h = (b-a)./n;
      x = zeros(1,n+1);
      x(1) = a;
      x(n+1) = b;
      %Agregando datos al vector "x"
      i = 2;
      while (i < n+1)
        x(i) = x(1) + (i-1)*h;
        i = i+1;
        end
      %Calculando el área de los extremos
      sum = 0;
      sum = (h/3)*(f(a)+f(b));
      %Calculando el área usando (h/3)*4*[f(x(1))+f(x(3))+...f(x(2*k+1))]
      k = 0;
      while (k <= (n-2)/2)
        sum = sum + (h/3)*4*f(x((2*k+1)+1));
        k = k+1;
        end
      k = 1;
      %Calculando el área usando (h/3)*4*[f(x(1))+f(x(4))+...f(x(2*k))]
      while (k <= (n-2)/2)
        sum = sum + (h/3)*2*f(x((2*k)+1));
        k = k+1;
        end
      time=toc;
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando regla compuesta simpson: %0.5f\n',sum); 
      endif    
endfunction

%REGLA COMPUESTA PUNTO MEDIO
function [time,error]= rCompuestaPuntoMedio(enableInputs,a,b,f,n)
  if(enableInputs==true)
  clc();
  fprintf('\n-- // Formula Abierta, Regla Compuesta del Punto Medio // --\n');
      %Ingreso de datos por parte del usuario
      f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      n = input('- Ingrese el numero de iteraciones(recuerde que tiene que ser par): ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('\n- Valor Exacto de La Integral: %0.5f\n',datoReal);
      %Regla del Punto Medio Mediante Iteraciones:
      h = (b-a)./n;
      x = zeros(1,n+1);
      xb = zeros(1,n);
      x(1) = a;
      x(n+1) = b;
      %Agregando datos al vector "x"
      i = 2;
      while (i < n+1)
        x(i) = x(i-1) + h;
        i = i+1;
        end
      %Agregando datos al vector de los puntos medios [a,b] -> (a+b)/2
      i = 1;
      while (i <= n)
        xb(i) = (x(i+1)+(x(i)))./2;
        i = i+1;
        end
      %Calculando el área usando [f(xb(1))+f(xb(2))+...f(xb(n))]
      sum = 0;
      i = 1;
      while (i <= n)
        sum = sum + f(xb(i));
        i = i+1;
        end
      sum = h*sum;
      %Impresión de resultados finales
      fprintf('- Resultado Usando La Regla del Punto Medio Para %d Iteraciones: %0.5f\n',n,sum);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
      else
      
      tic;
      %Regla del Punto Medio Mediante Iteraciones:
      h = (b-a)./n;
      x = zeros(1,n+1);
      xb = zeros(1,n);
      x(1) = a;
      x(n+1) = b;
      %Agregando datos al vector "x"
      i = 2;
      while (i < n+1)
        x(i) = x(i-1) + h;
        i = i+1;
        end
      %Agregando datos al vector de los puntos medios [a,b] -> (a+b)/2
      i = 1;
      while (i <= n)
        xb(i) = (x(i+1)+(x(i)))./2;
        i = i+1;
        end
      %Calculando el área usando [f(xb(1))+f(xb(2))+...f(xb(n))]
      sum = 0;
      i = 1;
      while (i <= n)
        sum = sum + f(xb(i));
        i = i+1;
        end
      sum = h*sum;
      time=toc;
      
      datoReal = quad(f,a,b);
      error = abs(datoReal-sum);
      fprintf('- Resultado Usando regla compuesta punto medio: %0.5f\n',sum); 
      endif
endfunction

%REGLAS COMPLEMENTARIAS
function time = rRomberg
  fprintf('\n-- // Integracion de Romberg // --\n');
      funcion=input('- Ingrese la funcion en formato f(x): ','s');
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: '); 
      n = input('- Ingrese el numero de intervalos: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      f = inline(funcion);
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('\n- Valor Exacto de La Integral: %0.5f\n\n',datoReal);
      h=(b-a); 
      M=1; 
      J=0; 
      R=zeros(n,n); 
      x=a;         
      f1=eval(funcion); 
      x=b; 
      f2=eval(funcion); 
      R(1,1)=h*(f1+f2)/2; 
      while (J<(n-1)) 
          J=J+1; 
          h=h/2; 
          s=0; 
          for p=1:M 
              x=a+h*(2*p-1); 
              f3=eval(funcion); 
              s=s+f3; 
          end 
          R(J+1,1)=(1/2)*(R(J,1))+h*s;                     
          M=2*M; 
          for k =1:J 
              R(J+1,k+1)=R(J+1,k)+(R(J+1,k)-R(J,k))/(4^k-1); 
          end 
      end 
      R             
      fprintf('- La aproximacion buscada es: %10.15f\n\n', R(J+1,J+1))
      sum = R(J+1,J+1);
      error = abs(datoReal-sum);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
endfunction
function time=rRombergMod
  fprintf('\n-- // Integracion de Romberg Modificado // --\n');
      funcion=input('- Ingrese la funcion en formato f(x): ','s');
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: '); 
      n = input('- Ingrese el numero de particiones: ');
      tol=input('- Ingrese la tolerancia: '); 
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      f = inline(funcion);
      tic;
      if(!(a == b))
      datoReal = quad(f,a,b);
      fprintf('\n- Valor Exacto de La Integral: %0.5f\n\n',datoReal);
      M=1; 
      h=b-a; 
      err=1; 
      J=0; 
      R=zeros(4,4); 
      x=a; 
      f_a=eval(funcion); 
      x=b; 
      f_b=eval(funcion); 
      R(1,1)=h*(f_a+f_b)/2; 
      disp('quad                   err                      h') 
      while((err>tol)&&(J<n))||(J<4) 
          J=J+1; 
          h=h/2; 
          s=0; 
          for p=1:M 
              x1=a+h*(2*p-1); 
              x=x1; 
              f_x1=eval(funcion); 
              s=s+f_x1; 
          end 
          R(J+1,1)=R(J,1)/2+h*s; 
          M=2*M; 
          for K=1:J                 
            R(J+1,K+1)=R(J+1,K)+(R(J+1,K)-R(J,K))/(4^K-1); 
          end    
          err=abs(R(J,J)-R(J+1,K+1)); 
          fprintf('%10.9f     %10.9f      %10.9f\n',R(J+1,J+1),err,h) 
      end 
      fprintf('\nLa matriz triangular inferior es:\n') 
      disp(R) 
      fprintf('\n- El error es para el numero de particiones: %d\n',err) 
      %disp(err)
      fprintf('- El tamanio de la ultima particion es: %d\n',h) 
      sum = R(J+1,J+1);
      fprintf('- La respuesta es: %0.8f\n',sum) 
      %disp(R(J+1,J+1))
      error = abs(datoReal-sum);
      fprintf('\nError Real: %0.5f\n',error);
      error = abs((datoReal-sum)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      graficador(a,b,f);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
endfunction
%metodos de cuadraturas
function time= cuadAdaptativa
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

endfunction

function time= cuadGauss
  fprintf('\n-- // Metodo de Cuadratura Gaussiana // --\n');
      %Ingreso de datos por parte del usuario
      F = input('- Ingrese la funcion en formato f(x): ','s');
      F = inline(F);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      n = input('- Ingrese un numero entre 2 y 5: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
      end
      tic;
      if(!(a == b))
      datoReal = quad(F,a,b);
      fprintf('- Valor Exacto de La Integral: %0.5f\n',datoReal);
      
       K=(b-a)/2;
       switch n
         case 2
          C1=1;
          C2=1;
          t1=0.5773502692;
          t2=-0.5773502692;
          X1=((b-a)*t1+(b+a))/2;
          X2=((b-a)*t2+(b+a))/2;
          I=K*(C1*F(X1)+C2*F(X2));
         case 3
         C1=0.5555555556;
         C2=0.8888888889;
         C3=0.5555555556;
         t1=0.7745966692;
         t2=0.0000000000;
         t3=-0.7745966692;
         X1=((b-a)*t1+(b+a))/2;
         X2=((b-a)*t2+(b+a))/2;
         X3=((b-a)*t3+(b+a))/2;
         I=K*(C1*F(X1)+C2*F(X2)+C3*F(X3));
         
         case 4
          C1=0.3478548451;
          C2=0.6521451549;
          C3=0.6521451549;
          C4=0.3478548451;
          t1=0.8611363116;
          t2=0.3399810436;
          t3=-0.3399810436;
          t4=-0.8611363116;
          X1=((b-a)*t1+(b+a))/2;
          X2=((b-a)*t2+(b+a))/2;
          X3=((b-a)*t3+(b+a))/2;
          X4=((b-a)*t4+(b+a))/2;
          I=K*(C1*F(X1)+C2*F(X2)+C3*F(X3)+C4*F(X4));
         case 5
           C1=0.2369268851;
           C2=0.4786286705;
           C3=0.5688888889;
           C4=0.4786286705;
           C5=0.2369268851;
           t1=0.9061798459;
           t2=0.5384693101;
           t3=0.0000000000;
           t4=-0.5384693101;
           t5=-0.9061798459;
           X1=((b-a)*t1+(b+a))/2;
           X2=((b-a)*t2+(b+a))/2;
           X3=((b-a)*t3+(b+a))/2;
           X4=((b-a)*t4+(b+a))/2;
           X5=((b-a)*t5+(b+a))/2;
           I=K*(C1*F(X1)+C2*F(X2)+C3*F(X3)+C4*F(X4)+C5*F(X5));
        otherwise 
        break;
        end
       fprintf('- Resultado Usando Cuadratura Gaussiana Para N= %d : %0.5f\n',n,I);
      error = abs(datoReal-I);
      fprintf('Error Real: %0.5f\n',error);
      error = abs((datoReal-I)/datoReal)*100;
      fprintf('Error Porcentual: %0.2f\n',error);
      %Grafica del area de integración
      graficador(a,b,F);
      else
      fprintf('\nNOTA: El resultado de la integral es cero ya que ambos limites son iguales\n');
      end
      time=toc;
        
endfunction

%Metodo comparacion de newton cotes evalua eficiencia de error
%para encontrar un mejor metodo

function comparacionNewtonCotes()
  clc();
   printf('\n--comparacion metodos Newton Cotes -- \n');
   f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
    endif 
    printf("\n RESULTADOS \n");
    printf('\n--Resultado real--\n');
    printf('Valor real: %0.5f\n',   quad(f,a,b));
    printf('\n--Formulas abiertas--\n');
   [tTrapecio,eTrapecio]= rSimpleTrapecios(false,a,b,f);
   [tSimpsonUnTercio,eSimpsonUnTercio]=rSimpsonUnTercio(false,a,b,f);
   [tSimpsonTresOctavo,eSimpsonTresOctavo]=rSimpsonTresOctavo(false,a,b,f);
   printf('\n--Formulas cerradas--\n');
   [tPuntoMedio,ePuntoMedio]=rPuntoMedio(false,a,b,f);
   printf('\nEFICIENCIA EN TIEMPO\n');
   printf("\n- tiempo ejecucion metodo trapecio simple: %d s\n",tTrapecio);  
   printf("\n- tiempo ejecucion metodo Simpson Un Tercio: %d s\n",tSimpsonUnTercio);
   printf("\n- tiempo ejecucion metodo Simpson Tres Octavos: %d s\n",tSimpsonTresOctavo);
   printf("\n- tiempo ejecucion metodo punto medio: %d s\n",tPuntoMedio);
   
   printf('\n#Nota: recordar que se ocupan formulas directas en el software\nno genera iteraciones y no se consideran graficos\nel tiempo es eficiente en todo\n');
     
   printf('\nMETODO MAS APROXIMADO \n');
   fprintf('Error Real de metodo trapecio: %0.5f\n',eTrapecio); 
   fprintf('Error Real de metodo simpson un tercio: %0.5f\n',eSimpsonUnTercio); 
   fprintf('Error Real de metodo simpson tres octavo: %0.5f\n',eSimpsonTresOctavo); 
   fprintf('Error Real de metodo punto medio: %0.5f\n',ePuntoMedio); 
   
   if(eTrapecio<eSimpsonUnTercio&&eTrapecio<eSimpsonTresOctavo&&eTrapecio<ePuntoMedio)
       printf("\n-El metodo mas exacto puede ser el del trapecio con: %d de valor de error real \n",eTrapecio);
    
   elseif(eSimpsonUnTercio<eTrapecio&&eSimpsonUnTercio<eSimpsonTresOctavo&&eSimpsonUnTercio<ePuntoMedio)
       printf("\n-El metodo mas exacto puede ser el de simpson 1/3 con: %d de valor de error real \n",eSimpsonUnTercio);
   elseif(eSimpsonTresOctavo<eTrapecio&&eSimpsonTresOctavo<eSimpsonUnTercio&&eSimpsonTresOctavo<ePuntoMedio)
       printf("\n-El metodo mas exacto puede ser el de simpson 3/8 con: %d de valor de error real \n",eSimpsonTresOctavo);
   elseif(ePuntoMedio<eTrapecio&&ePuntoMedio<eSimpsonUnTercio&&ePuntoMedio<eSimpsonTresOctavo) 
        printf("\n-El metodo mas exacto puede ser el de punto medio con: %d de valor de error real \n",ePuntoMedio);
   endif
endfunction

%Se deben ingresar numeros pares porque solo asi permite metodos 
%SIMPSON Y PUNTO MEDIO COMPUESTO

function comparacionMethCompuestas()
clc();
   printf('\n--comparacion metodos compuestos -- \n');
   f = input('- Ingrese la funcion en formato f(x): ','s');
      f = inline(f);
      a = input('- Ingrese el limite inferior: ');
      L = a;
      b = input('- Ingrese el limite superior: ');
      %Se verifica que el limite superior no sea menor que el limite inferior
      if(a > b)
      a = b;
      b = L;
    endif 
     n = input('- Ingrese el numero de iteraciones(recuerde que tiene que ser par): ');
     printf('\nNota: el numero debe ser par debido a que los\nmetodo simpson compuesto y punto medio solo admiten valores de ese modo\n');
    
    printf("\n RESULTADOS \n");
    printf('\n--Resultado real--\n');
    printf('Valor real: %0.5f\n',   quad(f,a,b));
    
   [tcTrapecio,ecTrapecio]= rCompuestaTrapecios(false,a,b,f,n);
   [tcSimpson,ecSimpson]=rCompuestaSimpson(false,a,b,f,n);
   [tcPuntoMedio,ecPuntoMedio]=rCompuestaPuntoMedio(false,a,b,f,n);
   
   printf('\nEFICIENCIA EN TIEMPO\n');
   printf("\n- tiempo ejecucion metodo  compuesto trapecio: %d s\n",tcTrapecio);  
   printf("\n- tiempo ejecucion metodo compuesto simpson: %d s\n",tcSimpson);
   printf("\n- tiempo ejecucion metodo compuesto punto medio: %d s\n",tcPuntoMedio);

   if(tcTrapecio<tcSimpson && tcTrapecio<tcPuntoMedio)
          printf("\n- tiempo ejecucion mas rapido es el del metodo compuesto trapecio: %d s\n",tcTrapecio);
   elseif(tcSimpson<tcTrapecio&&tcSimpson<tcPuntoMedio)
          printf("\n- tiempo ejecucion mas rapido es el del metodo compuesto simpson: %d s\n",tcSimpson);       
   elseif(tcPuntoMedio<tcTrapecio&&tcPuntoMedio<tcSimpson)
          printf("\n- tiempo ejecucion mas rapido es el del metodo compuesto punto medio: %d s\n",tcPuntoMedio);       
   endif
   
   printf('\nMETODO MAS APROXIMADO \n');
   fprintf('Error Real de metodo compuesto trapecio: %0.5f\n',ecTrapecio); 
   fprintf('Error Real de metodo compuesto simpson: %0.5f\n',ecSimpson); 
   fprintf('Error Real de metodo compuesto punto medio: %0.5f\n',ecPuntoMedio);
   
   if(ecTrapecio<ecSimpson && ecTrapecio<ecPuntoMedio)
       printf("\n-El metodo mas exacto puede ser el del trapecio compuesto con: %d de valor de error real \n",ecTrapecio);
   elseif(ecSimpson<ecTrapecio&&ecSimpson<ecPuntoMedio)
       printf("\n-El metodo mas exacto puede ser el de simpson compuesto con: %d de valor de error real \n",ecSimpson);
   elseif(ecPuntoMedio<ecTrapecio&&ecPuntoMedio<ecSimpson)
       printf("\n-El metodo mas exacto puede ser el de punto medio compuesto con: %d de valor de error real \n",ecPuntoMedio);
   endif
endfunction

%MENU PRINCIPAL%

clear; format long 
fprintf('\t:::::::::::::UNIVERSIDAD DE EL SALVADOR:::::::::::::\n'); 
fprintf('\t::::::::::::::::::METODOS NUMERICOS:::::::::::::::::\n'); 
fprintf('\n::::::::::::::::::::::::::ING. EN SISTEMAS::::::::::::::::::::::::::\n');  
fprintf('\n\t::::::::::Equipo Electro-Math::::::::::\n'); 
fprintf('\n\t::::::::::Grace Hernandez::::::::::\n');
fprintf('\n\t::::::::::Celina Alfaro::::::::::\n');
fprintf('\n\t::::::::::Javier Perdomo::::::::::\n');
fprintf('\n\t::::::::::Erick Ventura::::::::::\n\n');
bandera = 1;
while(bandera == 1)
clc();
disp('****Formulas cerradas de Newton-Cotes****');
disp('[1] Regla Simple de Trapecios') 
disp('[2] Regla de Simpson 1/3 Para n = 2') 
disp('[3] Regla de Simpson 3/8 Para n = 3')
disp('****Formulas abiertas de Newton-Cotes****');
disp('[4] Regla punto medio Para n = 0')
disp('****Metodos Integracion Compuesta****');
disp('[5] Regla Compuesta de Simpson') 
disp('[6] Regla Compuesta de Trapecios') 
disp('[7] Regla Compuesta del Punto Medio')
disp('****Metodos Integracion de cuadratura****');
disp('[8] Integracion metodo cuadratura adaptiva');
disp('[9] Integracion metodo cuadratura gaussiana'); 
disp('****Metodos complementarios****');
disp('[10] Integracion de Romberg')
disp('[11] Integracion de Romberg Modificado') 
disp('****Comparacion de metodos****');
disp('[12] Comparacion metodos de Newton-Cotes');
disp('[13] Comparacion metodos compuestos');
disp('[14] Salir')
elec = 15; %Este dato obliga a la variable a entrar al ciclo
while(!(elec == 1 || elec == 2 || elec == 3 || elec == 4 || elec == 5 || elec == 6 || elec == 7 || elec == 8 || elec == 9|| elec == 10|| elec == 11|| elec == 12|| elec == 13|| elec == 14))
elec = input('- Eliga Una Opcion Valida: ');
end
if(elec == 14) %Si la elección es igual a 12 entonces se saldra automaticamente del ciclo while
bandera = 0;
break;
end

switch elec
    case 1
      tiempo=rSimpleTrapecios(true);
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);
    case 2
      tiempo=rSimpsonUnTercio(true);
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);
    case 3
      tiempo=rSimpsonTresOctavo(true);
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);
    case 4
      tiempo=rPuntoMedio(true);    
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);    
    case 5
      tiempo=rCompuestaSimpson(true);
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);
    case 6
      tiempo=rCompuestaTrapecios(true);
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);      
    case 7
      tiempo=rCompuestaPuntoMedio(true);
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo); 
    case 8
      tiempo=cuadAdaptativa();
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);
    case 9
      tiempo=cuadGauss();
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);      
    case 10 
      tiempo=rRomberg();
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo); 
    case 11
      tiempo=rRombergMod();
      printf("\n- TIEMPO DE EJECUCION DEL METODO %d s\n",tiempo);
    case 12
      %metodos poseen menu interno
      comparacionNewtonCotes();
    case 13
      %metodo posee menu interno
        comparacionMethCompuestas();
    case 14
      break;
    otherwise 
      bandera = 0;
    end %Finaliza el Case
    fprintf('\n');
    bandera = 5; %Este dato obliga a la bandera a entrar al ciclo
    while(!(bandera == 1 || bandera == 0))
    bandera = input('Desea aplicar otro metodo de integracion? (Si = 1, No = 0): ');
    end
    bandera = bandera;
end %Finaliza el ciclo while
fprintf('\t::::::::::INTEGRACION EN ELECTROSTATICA::::::::::\n');
fprintf('\t:::::::::::::::METODOS NUMERICOS:::::::::::::::::\n'); 
fprintf('\n::::::::::::::::ING. EN SISTEMAS::::::::::::::::::::\n');


