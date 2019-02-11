clc;
clear all;

%--- Name: Bhargav D ---%
%--- Roll No.: 16IM10034 ---%
%------ Ware House Problem Part A ---%
%--- Variables Used:  ---%
%--- Xij = Number of Units being transported from Plant i to Ware House j
%--- i = 1, 2, 3 and j= 1, 2, 3  and Yij = Number of Units being
%--- transported from Ware House i to Demanding Node j 
%--- where i = 1, 2, 3 and j =  1, 2 ,3, 4
%--- Objective Function: 
%--- Min Z = 5000*X11 + 3000*X12 + 6500*X13 + 6000*X21 + 3200*X22 +
%---         2500*X23 + 5500*X31 + 2300*X32 + 6200*X33 + 6000*Y11 +  
%---         4500*Y12 + 5000*Y13 + 4000*Y14 + 5500*Y21 + 3200*Y22 +
%---         2500*Y23 + 4700*Y24 + 5500*Y31 + 2300*Y32 + 6200*Y33 +
%---         8000*Y34
%--- Constraints: 
%--- X11 + X21 + X31 >= Y11 + Y12 + Y13 + Y14 
%--- X12 + X22 + X32 >= Y21 + Y22 + Y23 + Y24
%--- X13 + X23 + X33 >= Y31 + Y32 + Y33 + Y34
%--- Greater than or Equal to in the below Constraints doesn't matter
%--- because this is a Minimization Problem anyways
%--- Y11 + Y21 + Y31 >= 50
%--- Y12 + Y22 + Y23 >= 130
%--- Y13 + Y23 + Y33 >= 75
%--- Y14 + Y24 + Y34 >= 90


f = [ 5000 ; 3000 ; 6500 ; 6000 ; 3200 ; 2500 ; 5500 ; 2300 ; 6200 ; 6000 ;
    4500 ; 5000 ; 4000 ; 5500 ; 3200 ; 2500 ; 4700 ; 5500 ; 2300 ; 6200 ; 8000 ];

A = [ 1 , 0 , 0 , 1 , 0 , 0 , 1 , 0 , 0 , -1 , -1 , -1 , -1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 ;
      0 , 1 , 0 , 0 , 1 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , -1 , -1 , -1 , -1 , 0 , 0 , 0 , 0 ;
      0 , 0 , 1 , 0 , 0 , 1 , 0 , 0 , 1 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , -1 , -1 , -1 , -1 ;
      0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 ;
      0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 ;
      0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 ;
      0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 , 0 , 0 , 0 , 1 ; ];
C = -A ;
b = [ 0 ; 0 ; 0 ; -50 ; -130 ; -75 ; -90 ];
lb = [ 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0 ; 0; 0 ; 0 ; 0 ; 0 ];
[x, fval ] = intlinprog( f , [ 1:21 ] , C , b , [] , [] , lb , [] )

fprintf( ' The Minimum Transportation Cost Possible is %d \n ' , fval );
k = 1 ;
for i = 1 : 3
    for j = 1 : 3
       fprintf(' Amount of Units transported from P%d to W%d is : %d \n', i, j , x(k));
       k = k+1 ;
    end
end 
for i = 1 : 3
    for j = 1 : 4
        fprintf(' Amount of Units transported from W%d to D%d is : %d \n', i, j , x(k));
        k = k+1 ;
    end
end 