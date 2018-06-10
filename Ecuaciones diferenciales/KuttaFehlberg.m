 TRUE = 1;
 FALSE = 0;
 printf('This is the Runge-Kutta-Fehlberg Method.\n');
 printf('Input the function F(t,y) in terms of t and y\n');
 printf('For example: @(y)@(t) y-t^2+1 \n');
 F = input('ingrese aqui: ');

 OK = FALSE;
 while OK == FALSE 
     printf('Input left and right endpoints on separate lines.\n');
     A = input(' ');
     B = input(' ');
     if A >= B  
         printf('Left endpoint must be less than right endpoint\n');
     else
         OK = TRUE;
     end
 end
 printf('Input the initial condition\n');
 ALPHA = input(' ');
 OK = FALSE;
 while OK == FALSE 
     printf('Input tolerance\n');
     TOL = input(' ');
     if TOL <= 0 
         printf('Tolerance must be a positive.\n');
     else
         OK = TRUE;
     end
 end
 OK = FALSE;
 while OK == FALSE 
     printf('Input minimum and maximum mesh spacing on separate lines.\n');
     HMIN = input(' ');
     HMAX = input(' ');
     if HMIN < HMAX & HMIN > 0 
         OK = TRUE;
     else
         printf('Minimum mesh spacing must be a positive real\n');
         printf('number and less than the maximum mesh spacing\n');
     end
 end
 if OK == TRUE 
     printf('Choice of output method:\n');
     printf('1. Output to screen\n');
     printf('2. Output to text file\n');
     printf('Please enter 1 or 2\n');
     FLAG = input(' ');
     if FLAG == 2 
         printf('Input the file name in the form - drive:\\name.ext\n');
         printf('For example   A:\\OUTPUT.DTA\n');
         NAME = input(' ','s');

         OUP=file('open',NAME,'unknow');
     else
         OUP = 1;
     end
     
     if OUP==1 
         printf('RUNGE-KUTTA-FEHLBERG METHOD\n\n');
         printf('    T(I)           W(I)          H           R\n\n');
        
         H = HMAX;
         T = A;
         W = ALPHA;
         printf('%12.7f %11.7f    0           0\n', T, W);
         OK = TRUE;
        
         while (T < B && OK == TRUE) 
            

             K1 = H*F(T)(W);
             K2 = H*F(T+H/4)(W+K1/4);K3 = H*F(T+3*H/8)(W+(3*K1+9*K2)/32);
             K4 = H*F(T+12*H/13)(W+(1932*K1-7200*K2+7296*K3)/2197);
             K5 = H*F(T+H)(W+439*K1/216-8*K2+3680*K3/513-845*K4/4104);
             K6 = H*F(T+H/2)(W-8*K1/27+2*K2-3544*K3/2565+1859*K4/4104-11*K5/40);
            
             R = abs(K1/360-128*K3/4275-2197*K4/75240.0+K5/50+2*K6/55)/H;
            
             if R <= TOL 

                 T = T+H;
                 W = W+25*K1/216+1408*K3/2565+2197*K4/4104-K5/5;
                
                 printf('%12.7f %11.7f %11.7f %11.7f\n', T, W, H, R);
             end

             if R > 1.0E-20 
                 DELTA = 0.84 * exp(0.25 * log(TOL / R));
             else
                 DELTA = 10.0;
             end

             if DELTA <= 0.1 
                 H = 0.1*H;
             else
                 if DELTA >= 4 
                     H = 4.0 * H;
                 else
                     H = DELTA * H;
                 end
             end

             if H > HMAX 
                 H = HMAX;
             end

             if H < HMIN 
                 OK = FALSE;
             else
                 if T+H > B 
                     if abs(B-T) < TOL 
                         T = B;
                     else
                         H = B-T;
                     end
                 end
             end
         end
         if OK == FALSE 
             printf('Minimal H exceeded\n');
         end
     else

         text1='RUNGE-KUTTA-FEHLBERG METHOD';
         write(OUP,text1);         
        
         H = HMAX;
         T = A;
         W = ALPHA;

         text2='T';
         write(OUP,text2);
         write(OUP,T); 
         text3='W';
         write(OUP,text3);
         write(OUP,T); 
         OK = TRUE;
        
         while T < B & OK == TRUE 
            
             K1 = H*F(T,W);
             K2 = H*F(T+H/4,W+K1/4);K3 = H*F(T+3*H/8,W+(3*K1+9*K2)/32);
             K4 = H*F(T+12*H/13,W+(1932*K1-7200*K2+7296*K3)/2197);
             K5 = H*F(T+H,W+439*K1/216-8*K2+3680*K3/513-845*K4/4104);
             K6 = H*F(T+H/2,W-8*K1/27+2*K2-3544*K3/2565+1859*K4/4104-11*K5/40);
            
             R = abs(K1/360-128*K3/4275-2197*K4/75240.0+K5/50+2*K6/55)/H;
            
             if R <= TOL 
  
                 T = T+H;
                 W = W+25*K1/216+1408*K3/2565+2197*K4/4104-K5/5;
                
                 text04='Iteracion:';
                 write(OUP,text04);
                 write(OUP,I);
                 text4='T';
                 write(OUP,text4);
                 write(OUP,T); 
                 text5='W';
                 write(OUP,text5);
                 write(OUP,T);
                  text6='H';
                 write(OUP,text6);
                 write(OUP,H); 
                 text7='R';
                 write(OUP,text7);
                 write(OUP,R);
             end

             if R > 1.0E-20 
                 DELTA = 0.84 * exp(0.25 * log(TOL / R));
             else
                 DELTA = 10.0;
             end

             if DELTA <= 0.1 
                 H = 0.1*H;
             else
                 if DELTA >= 4 
                     H = 4.0 * H;
                 else
                     H = DELTA * H;
                 end
             end

             if H > HMAX 
                 H = HMAX;
             end
 
             if H < HMIN 
                 OK = FALSE;
             else
                 if T+H > B 
                     if abs(B-T) < TOL 
                         T = B;
                     else
                         H = B-T;
                     end
                 end
             end
         end
         if OK == FALSE 

             text8='Minimal H exceeded';
             write(OUP,text8);
         end
 
         file('close',OUP);
         printf('Output file %s created successfully \n',NAME);      
     end     
 end
