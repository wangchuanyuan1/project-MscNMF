function e = var1(U,V)  
     X = U*V;
     X=X';
    [m,n] = size(X);
    Sa = zeros(n,1);
    Se = zeros(n,1);
    [~,ind]=sort(sum(U,2),'descend');
    c = NMF_maxc(V,2);
        for j=1:size(X,2)
            [~,anovatab,~]=anova1(X(:,j)',c,'off');
            Sa(j)=anovatab{2,4};
            Se(j)=anovatab{3,4};
        end 
    F=Sa./(Sa+Se);
    for l=1:n
         e(l)=sum(F(ind(1:l)));
    end
end