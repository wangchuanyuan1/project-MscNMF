clc
clear
addpath 'E:\2020º®¼Ù\data'
addpath 'E:\2020º®¼Ù\SinNLRR-master'
datasets = {'_Buettner','_Deng','_Ginhoux','_Ting','_Treutlin',...
            '_13_Darmanis','_19_Engel','_12_Goolam','_4_Usoskin','_3_Pollen',...
            '_30_TP','_33_TP','_Bre','_5_Zeisel','_2_Kolod',...
            '_1_mECS','_6_TP','_Q','_Tasic','_Macosko'};
Simm = {5,6,7,9,10,13,18,19};
for num =8:8
data = ['Data' datasets{Simm{num}} '.mat'];       
load(data)
in_X = double(in_X);
label = true_labs;
n_space = length(unique(label));
[X,flag_index] = FilterGenesZero(in_X);
[n,m]=size(X);
% X=X';
%  X=mapminmax(X',0,1);
X = normalize(X');
%  X = normalize_W(X',1);
rank = 100; 
e=zeros(rank-1,m);
VS = cell(rank-1,1);
    for k = 2:rank
           [in_U,~] = NNDSVD(X,k,0);
           in_V = in_U'*X;  
%            in_U = rand(m,2);in_V = rand(2,n);
           [U,V,obj(num,:)] = NMF(X,in_U,in_V,1200);
           e(k-1,:) = var1(U,V);  
           VS{k-1} = V;
    end
    [optnumber,T0,optnumber1]=var2(e,m,600);
    rank_final(1,num)=n_space;
    rank_final(2,num)=optnumber;
    rank_final(3,num)=optnumber1; 
    Z_simi = cell(1,rank-1);Z = zeros(n,n);
%     save(['VS' datasets{Simm{num}}],'VS','optnumber1','e','m','n')
    for i=1:rank-1
        Z_simi{i} = corr(VS{i},VS{i},'type','Pearson');  
%         [Z_simi{i}, ~] = localize(abs(Z1));
        Z = Z + Z_simi{i};
    end
    Z = Z./(rank-1);
    [Z, ~] = localize(abs(Z));
    similarity = Z+Z';    
    grps = SpectralClustering(similarity, n_space);
    NMI(1,num)=Cal_NMI(label, grps);
    ARI(1,num)=Cal_ARI(label, grps);
    grps = SpectralClustering(similarity, optnumber1);
    NMI(2,num)=Cal_NMI(label, grps);
    ARI(2,num)=Cal_ARI(label, grps)
end





