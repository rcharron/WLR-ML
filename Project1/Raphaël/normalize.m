function [Data,c,b]=normalize(Data)
    n=size(Data,1);
    c=zeros(1,n);
    b=zeros(1,n);
    for i=1:n
        b(i)=mean(Data(i,:));
        alpha=1/max(Data(i,:)-b(i));
        Data(i,:)=alpha.*(Data(i,:)-b(i));
        c(i)=alpha;
    end
end