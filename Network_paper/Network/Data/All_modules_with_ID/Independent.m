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






% Call matrix
[Ynum,Ytxt,Yraw] = xlsread('Y_m.csv');  %matrix invoked 
[Xnum,Xtxt,Xraw] = xlsread('X_m.csv');  %matrix invoked 
[BLKnum,BLKtxt,BLKraw] = xlsread('BLK_m.csv');  %matrix invoked 
[CSTnum,CSTtxt,CSTraw] = xlsread('CST_m.csv');  %matrix invoked 
% concatenate matrix
XCSTnum = [Xnum CSTnum];% CSTnum
GxXCST = G*XCSTnum;
G2xCST = G*G*XCSTnum;
G3xCST = G*G*G*XCSTnum;

ONE_m = ones(305,1);
GxY = G*Ynum;
big_X1 = [ GxY ];%GxXCST XCSTnum  BLKnum
big_X3 = [Ynum GxY GxXCST G2xCST G3xCST];

%D1= cat(1,'GxY' , big_X1)
D1 = {'Y','GxY', 'GxXCST1', 'GxXCST2', 'GxXCST3', 'GxXCST4', 'GxXCST5', 'GxXCST6', 'GxXCST7' ,'GxXCST8','GxXCST9','GxXCST10', 'G2xCST1', 'G2xCST2', 'G2xCST3','G2xCST4','G2xCST5','G2xCST6','G2xCST7','G2xCST8','G2xCST9','G2xCST10','G3xCST1','G3xCST2','G3xCST3','G3xCST4','G3xCST5','G3xCST6','G3xCST7','G3xCST8','G3xCST9','G3xCST10'} ;
s1 = xlswrite('C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.xlsx',D1,'Sheet1');
p1 = xlswrite('C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.xlsx', big_X3, 'Sheet1', 'A2');
s2 = xlswrite('C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.xlsx',[Xtxt CSTtxt BLKtxt],'Sheet1','AG1');
p2 = xlswrite('C:\Users\Personal\Documents\Network_paper\Network\Data\All_modules_with_ID\Gmat_geo_reg.xlsx', [Xnum CSTnum BLKnum], 'Sheet1', 'AG2');

%big_X2 = [ GxY GxXCST];%GxXCST XCSTnum  BLKnum
%big_X3 = [Ynum GxY GxXCST G2xCST G3xCST XCSTnum  BLKnum];
%D1 = {'Y','GxY', 'GxXCST1', 'GxXCST2', 'GxXCST3', 'GxXCST4', 'GxXCST5', 'GxXCST6', 'GxXCST7' ,'GxXCST8', 'G2xCST1', 'G2xCST2', 'G2xCST3','G2xCST4','G2xCST5','G2xCST6','G2xCST7','G2xCST8','G3xCST1','G3xCST2','G3xCST3','G3xCST4','G3xCST5','G3xCST6','G3xCST7','G3xCST8','XCSTnum1','XCSTnum2','XCSTnum3','XCSTnum4','XCSTnum5','XCSTnum6','XCSTnum7','XCSTnum8','BLKnum1','BLKnum2','BLKnum3','BLKnum4','BLKnum5','BLKnum6','BLKnum7','BLKnum8','BLKnum9'} ;




%xlswrite(filename,A, sheet1)


%[b1,bint1,r1,rint1,stats1] = regress(Ynum,big_X1);
%[b2,bint2,r2,rint2,stats2] = regress(Ynum,big_X2);
%[b3,bint3,r3,rint3,stats3] = regress(Ynum,big_X3);
%regstats(Ynum,big_X1,linear);
%beta1 = regstats(beta);
%tstat1 = regstats(tstat);
%R2 = regstats(rsquare);

%regstats(Ynum,big_X2,linear);
%stats2 = regstats(beta,tstat,rsquare);
%regstats(Ynum,big_X3,linear);
%stats3 = regstats(beta,tstat,rsquare);

% multiply G and X