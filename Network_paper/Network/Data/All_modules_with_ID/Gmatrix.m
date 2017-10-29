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