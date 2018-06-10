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
 