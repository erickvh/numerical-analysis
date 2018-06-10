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