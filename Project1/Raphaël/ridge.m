function [myf,Beta]= ridge(X,Y,lambda)
    %one dimension for the translation and transpose to get notation of the
    %course
    Xb=[X;ones(1,size(X,2))]';
    Yb=Y';

    %compute Beta
    Il=lambda.*eye(size(X,1)+1);
    Beta=(Xb'*Xb+Il)^(-1)*Xb'*Yb;

    %make a function of it
    myf=@(X)[X;1]'*Beta;

end