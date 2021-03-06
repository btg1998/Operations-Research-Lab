clc;
clear all;
% --- OILCO Suppler Problem --------%%%
%---  Decision Variables -------------- %%%
% xi = amount of oil bought in month i , i = 1,2,3,4 : xi>=0
% Cost = 75x1 + 72x2 + 92x3 + 90x4 + Holding cost
% Holding cost = 10(x1 - 3000) + 10(x1 + x2 - 11000) + 10(x1 + x2 + x3 -
% 20000) + 10(x1 + x2 + x3 + x4 - 26000)
% Total cost = 115x1 + 102x2 + 112x3 + 100x4 
% Objective function, z = Min 115x1 + 102x2 + 112x3 + 100x4 - 600000
%% --- Constraints -----%%%%%%%

%--- Demand Constraints ------%%%%
% --  x1+2000 >= 5000     =>    x1 >=3000 (First month)
%--- x2+ x1+2000-5000 >=  8000  => x1+x2 >= 11000 (Second Month)
% --- x1+x2+x3+2000-5000-8000 >= 9000   =>  x+x2+x3 >= 20000 (Third Month)
% --- x1+x2+x3+x4 +2000 -5000 -8000 -9000 >= 6000  => x1+x2+x3+x4 >= 26000
% -------------------------------------------------------------------------------------------
%  -- Storage Constraints  -------%%%%
% x1+ 2000 -5000 <= 4000  => x1 <= 7000 (First month)
% x1+x2 +2000 -5000 -8000 <= 4000  => x1+x2 <= 15000 (Second Month )
% x1+x2+x3+2000 -5000-8000-9000 <= 4000  => x1+x2+x3 <= 24000 (Third Month )
% x1+x2+x3+x4 +2000 -5000 -8000 - 9000 - 6000 <= 4000  => x1+x2+x3+x4 <=  30000
%--------------------------------------------------------------------------------------------

c = [115 ; 102 ; 112 ; 100];
 A = [ -1, 0, 0, 0 ;
          -1, -1, 0, 0 ;
          -1, -1 , -1 , 0;
          -1, -1, -1, -1;
          1, 0, 0, 0 ;
          1, 1, 0, 0 ;
          1, 1 ,  1 , 0;
           1,  1,  1,  1];
   
    b  = [-3000; -11000; -20000; -26000; 7000; 15000; 24000;30000];

  lb=[0;0;0;0;];
  
[x,fval] = linprog(c,A,b,[],[],lb);

fprintf (' Total cost is : %d \n',  fval - 600000); % Linprog takes only the coefficients as input so the constant has to be subtracted manually.

for i=1:4
    fprintf(' Procurement in month % d is : %d \n', i, x(i));
end



