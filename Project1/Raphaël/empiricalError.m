function [err]=empiricalError(X,Y,f)
    Xn=Y;
    n=size(Y,2);
    for i=1:n
        Xn(n)=f(X(:,i));
    end
    err=mean(loss(Xn,Y));
end