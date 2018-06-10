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
   