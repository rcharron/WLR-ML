function [res]= makefeatures(X)
    n=size(X,2);
    res=zeros(size(makefeaturesrow(X(:,1)),1),n);
    for i=1:n
        res(:,i)=makefeaturesrow(X(:,i));
    end
%    X=[X;(log(X));1./X];
end

function [X]= makefeaturesrow(X)
Y=X*X';
Inv=1./X;
X=[X;(log(X));Inv;Y(:)];
end