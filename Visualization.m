function Visualization(cell_gene,n,gene_name,cell_name)
num = length(gene_name);
C=zeros(3,num*n);
C(1,:)=(1-cell_gene)*0.85;
C(2,:)=1-cell_gene;
C(3,:)=1;
for i=1:n
    for j=1:num
        X((i-1)*num+j,1)=j;
        Y((i-1)*num+j,1)=i;
    end  
end
ZZZ=ones(n,num);
ZZZ=ZZZ+60;
image(ZZZ);
colormap(gray);
for i=1:num
line_shu(i,1)=i;
line_shu(i,2)=line_shu(i,1);
line_shu(i,3)=0.5;
line_shu(i,4)=n+0.5;
hold on;
plot(line_shu(i,1:2),line_shu(i,3:4),'-w','LineWidth',1.5);
end
for i=1:n
line_he(i,1)=0.5;
line_he(i,2) = num+0.5;
line_he(i,3)=i;
line_he(i,4)=i;
hold on;
plot(line_he(i,1:2),line_he(i,3:4),'-w','LineWidth',2);
end
scatter(X, Y,25, C','filled', 'SizeData', 175);
set(gca, 'xticklabel', gene_name,'FontWeight','bold');
set(gca, 'yticklabel', cell_name,'FontWeight','bold');
xlim(gca,[0.5 num+0.5]);


xtl=get(gca,'XTickLabel'); 
xt=get(gca,'XTick');     
xtextp=1:num;                     
ytextp(1:num)=n+0.7; 
text(xtextp,ytextp,xtl,'HorizontalAlignment','right','rotation',40); 
set(gca,'xticklabel','');
end