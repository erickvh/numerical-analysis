 % Combina procedimiento punto fijo,Aitken y Stephensen               
 %
 % To find a solution to f(x) = 0 given an
 % initial approximation p0:
 %
 % INPUT:   functions: f and g
 %          initial approximation p0; tolerance TOL;
 %          maximum number of iterations NO.
 %
 % OUTPUT:  approximate solution p from fixed oint, aitken and stephensen or a message of failure
 format long
 syms('OK', 'P0', 'TOL', 'NO', 'FLAG', 'NAME', 'OUP', 'F0');
 syms('I', 'FP0', 'D','x','s');
 TRUE = 1;
 FALSE = 0;
 fprintf(1,'This is the combined method\n');
 fprintf(1,'Input the function F(x) in terms of x\n');
 fprintf(1,'For example: x.^3+2*x-10\n');
 s = input(' ');
 F = inline(s,'x');
 %fprintf(1,'This is the combined method\n');
 fprintf(1,'Input the function G(x) in terms of x\n');
 fprintf(1,'For example: x-x.^3+2*x-10\n');
 s = input(' ');
 G = inline(s,'x');
 OK = FALSE;
 fprintf(1,'Input initial approximation\n');
 P0 = input(' '); 
 while OK == FALSE 
 fprintf(1,'Input tolerance\n');
 TOL = input(' ');
 if TOL <= 0 
 fprintf(1,'Tolerance must be positive\n');
 else 
 OK = TRUE;
 end
 end
 OK = FALSE;
 while OK == FALSE 
 fprintf(1,'Input number of aitken''s values to generate - no decimal point\n');
 NO = input(' ');
 if NO <= 0 
 fprintf(1,'Must be positive integer\n');
 else 
 OK = TRUE;
 end
 end
 if OK == TRUE 
 fprintf(1,'Select output destination\n');
 fprintf(1,'1. Screen\n');
 fprintf(1,'2. Text file\n');
 fprintf(1,'Enter 1 or 2\n');
 FLAG = input(' ');
 if FLAG == 2 
 fprintf(1,'Input the file name in the form - drive:\\name.ext\n');
 fprintf(1,'For example:   A:\\OUTPUT.DTA\n');
 NAME = input(' ','s');
 OUP = fopen(NAME,'wt');
 else
 OUP = 1;
 end
 fprintf(1,'Select amount of output\n');
 fprintf(1,'1. Answer only\n');
 fprintf(1,'2. All intermediate approximations\n');
 fprintf(1,'Enter 1 or 2\n');
 FLAG = input(' ');
 fprintf(OUP, 'Newtons Method\n');
 if FLAG == 2 
 fprintf(OUP, '  I   P    P(FP)    P(Ait)     P(Steph)     F(P)\n');
 end
 F0 = F(P0);
% STEP 1
 I = 1;
 OK = TRUE;        
% STEP 2
s = NO+2;
H = zeros(1,s);
A = zeros(1,s-2);
STP = zeros(1,s);
ST=zeros(1,s-2);
H(1,1)=P0;
for c = 2:s
    
        H(1,c) = G(H(1,c-1));
        if c>=3 && c<=s-2
            A(1,c)=H(1,c)-((H(1,c-1)-H(1,c)).^2./(H(1,c-2)-2*H(1,c-1)+H(1,c)));
            if c==3
               ST(1,c-2)=A(1,c);
            end
            
        end
end
STP(1,1)=ST(1,1);
STP(1,2)=G(STP(1,1));
STP(1,3)=G(STP(1,2));
ST(1,2)=STP(1,1)-((STP(1,2)-STP(1,1)).^2./(STP(1,3)-2*STP(1,2)+STP(1,1)));
for c = 3:s-2
        STP(1,c-1)=G(ST(1,c-1));
        STP(1,c-2)=G(STP(1,c-1));
        STP(1,c)=ST(1,c-1);
%         ST(1,c-1) = G(H(1,c-1));
        if c>=3 && c<=s-2
            ST(1,c)=STP(1,c)-((STP(1,c-1)-STP(1,c)).^2./(STP(1,c-2)-2*STP(1,c-1)+STP(1,c)));
        end
end

H

A

ST
% 
% %for i=0
%  while I <= NO+2 && OK == TRUE   
% % STEP 3
% % compute P(I)
%  FP0 = FP(P0);
%  D = F0/FP0;
% % STEP 6
%  P0 = P0 - D;  
%  F0 = F(P0);
%  if FLAG == 2 
%  fprintf(OUP,'%3d   %14.8e   %14.7e\n',I,P0,F0);
%  end
% % STEP 4
%  if abs(D) < TOL 
% % procedure completed successfully
%  fprintf(OUP,'\nApproximate solution = %.10e\n',P0);
%  fprintf(OUP,'with F(P) = %.10e\n',F0);
%  fprintf(OUP,'Number of iterations = %d\n',I);
%  fprintf(OUP,'Tolerance = %.10e\n',TOL);
%  OK = FALSE;
% % STEP 5
%  else
%  I = I+1;
%  end
%  end
%  if OK == TRUE 
% % STEP 7
% % procedure completed unsuccessfully
%  fprintf(OUP,'\nIteration number %d',NO);
%  fprintf(OUP,' gave approximation %.10e\n',P0);
%  fprintf(OUP,'with F(P) = %.10e not within tolerance  %.10e\n',F0,TOL);
%  end
 if OUP ~= 1
 fclose(OUP);
 fprintf(1,'Output file %s created successfully \n',NAME);
 end
 end
