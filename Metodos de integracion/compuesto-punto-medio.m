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