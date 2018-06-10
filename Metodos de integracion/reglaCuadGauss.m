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
