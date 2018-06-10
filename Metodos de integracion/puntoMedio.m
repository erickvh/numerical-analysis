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