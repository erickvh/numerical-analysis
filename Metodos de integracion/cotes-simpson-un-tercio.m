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