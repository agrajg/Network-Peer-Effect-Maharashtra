% INPUT CSV FILES A_m, X_m, Y_m, BLK_m, CST_m


% Creation of the G Matrix from module A using group size 
clear all
% Feed any matrix from stata into A matrix on Matlab
[Anum,Atxt,Araw] = xlsread('A_m.csv');  %matrix invoked 
[Am,An] = size(Anum);
for index1 = 1:An
   if strcmp(Atxt(1,index1), 'group_geo_size_inverse')
       p = index1;
       break;
   end
end

F = Anum(:,p);
G = diag(F,0);
[Gm,Gn] = size(G);

count=0;
for index2 = 2:Gm
    for index3 = 2:Gn
        if index2 == index3
            if G(index2-1,index3-1) == G(index2, index3)
            count=count + 1; 
                for index4 = 1:count
                    G(index2-index4,index2) = G(index2, index2);
                    G(index2,index2-index4) = G(index2, index2);
                end
            elseif G(index2-1,index3-1) ~= G(index2, index3)
                count = 0;
            end
        end
    end
end
for index6 = 1:Gm
   for index5 = 1:Gn
  
 if index5 == index6
            G(index6, index5) = 0;
        end
   end
end

%G_mat = G*(ones(Gm)- eye(Gm))
%-------------------------------G Matrix-------------------------
index2 = 0
index3 = 0
index4 = 0
index5 = 0
index6 = 0
index7 = 0
%---------------J MATRIX-----------------------------------------

IJ = diag(F,0);
[IJm,IJn] = size(IJ);

count=0;
for index2 = 2:IJm
    for index3 = 2:IJn
        if index2 == index3
            if IJ(index2-1,index3-1) == IJ(index2, index3)
            count=count + 1; 
                for index4 = 1:count
                    IJ(index2-index4,index2) = IJ(index2, index2);
                    IJ(index2,index2-index4) = IJ(index2, index2);
                end
            elseif IJ(index2-1,index3-1) ~= IJ(index2, index3)
                count = 0;
            end
        end
    end
end

J = eye(IJm) - IJ


%---------------J MATRIX-----------------------------------------
index2 = 0
index3 = 0
index4 = 0
index5 = 0
index6 = 0
index7 = 0
%---------------Multiplications-----------------------------------
[Ynum,Ytxt,Yraw] = xlsread('Y_m.csv');  %matrix invoked 
[Xnum,Xtxt,Xraw] = xlsread('X_m.csv');  %matrix invoked 
[BLKnum,BLKtxt,BLKraw] = xlsread('BLK_m.csv');  %matrix invoked 
[CSTnum,CSTtxt,CSTraw] = xlsread('CST_m.csv');  %matrix invoked 


GY = G*Ynum
GYlab = {'GxY'}



JGY = J*G*Ynum
JGYlab = {'JxGxY'} 



[waste,Xtxtsize] = size(Xtxt);


JX = J*X
for index2 = 1:Xtxtsize
	Jlab(1,index2) = 'Gx';
end
JXlab = strcat(Jlab,Xtxt);



JGX = J*G*X
for index3 = 1:Xtxtsize
	JGlab(1,index3) = 'JxGx';
end
JGXlab = strcat(JGlab,Xtxt);

JG2 = J*G*G
for index4 = 1:size(G)
	JG2alab(1,index4) = index4;
end
JG2lab = strcat('JG2_',JGalab);





s2 = xlswrite('C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.xlsx',[GYlab JGYlab JXlab JGXlab JG2lab ],'Sheet1','A1');
p2 = xlswrite('C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.xlsx', [GY JGY JX JGX JG2 ], 'Sheet1', 'A2');
