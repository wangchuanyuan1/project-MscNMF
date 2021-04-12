function [optnumber,T1,optnumber1]=var2(e,m,i)
    e0=e;
    for l=1:m
        if isempty(find(e(:,l)-[e(2:end,l);e(end,l)]>=0))
            k0(l)=100;
        else
            k0(l)=find(e(:,l)-[e(2:end,l);e(end,l)]>0,1,'first')+1;
        end
        [~,iA] = max(e(:,l));
        k1(l)=iA+1;

    end
     T0=tabulate(k0(1:i));
%      T0 = tabulate(k0);
    optnumber=T0(find(max(T0(:,2))==T0(:,2)),1);
     T1=tabulate(k1(1:i));
    optnumber1=T1(find(max(T1(:,2))==T1(:,2)),1);
end