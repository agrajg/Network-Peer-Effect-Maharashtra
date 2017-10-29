%% Housekeeping information
clear all
[Anum,Atxt,Araw] = xlsread('A_m.csv');  %matrix invoked
gs = transpose(Anum); % group sizes

%% G MATRIX
storeg=cell(length(gs));
for i=1:length(gs)
    x=ones(gs(i),1);
    storeg{i}=(1/(gs(i)-1)).*(x*x'-eye(gs(i)));
    clear x;
end
for i=1:length(gs)
    G = blkdiag(storeg{:});
end
clear storeg;

%% J MATRIX
storej=cell(length(gs));
for i=1:length(gs)
    x=ones(gs(i),1);
    storej{i}=eye(gs(i))-(1/gs(i)).*(x*x');
    clear x;
end
for i=1:length(gs)
    J = blkdiag(storej{:});
end
clear storej;



[Ynum,Ytxt,Yraw] = xlsread('Y_m.csv');  %matrix invoked 
[Xnum,Xtxt,Xraw] = xlsread('X_m.csv');  %matrix invoked 
[BLKnum,BLKtxt,BLKraw] = xlsread('BLK_m.csv');  %matrix invoked 
[CSTnum,CSTtxt,CSTraw] = xlsread('CST_m.csv');  %matrix invoked 


%---------------------------------------------------------------
JY = J*Ynum;
JYlab = {'JxY'};



JGY = J*G*Ynum;
JGYlab = {'JxGxY'} ;



[waste,Xtxtsize] = size(Xtxt);

JX = J*Xnum;
JXlab = strcat('Jx',Xtxt);



JGX = J*G*Xnum;
JGXlab = strcat('JxGx',Xtxt);

JG2X = J*G*G*Xnum;
JG2Xlab = strcat('JG2X_',Xtxt);





s2 = xlswrite('Gmat_geo_reg.xlsx',[JYlab JGYlab JXlab JGXlab JG2Xlab],'Sheet1','A1');
p2 = xlswrite('Gmat_geo_reg.xlsx', [JY JGY JX JGX JG2X], 'Sheet1', 'A2');



%% END