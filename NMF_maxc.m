function c = NMF_maxc(V,q)
if ~exist('q','var')
 q=1;
end
if q==1
    c = zeros(size(V,2),1);
    for i = 1:size(V,2)
     c(i) = find(V(:,i)==max(V(:,i)),1);
    end
else   
    Z = corr(V,V,'type','Pearson');  
    [localX, ~] = localize(abs(Z));
    similarity = localX+localX';    
    c = SpectralClustering(similarity, size(V,1));
end
end