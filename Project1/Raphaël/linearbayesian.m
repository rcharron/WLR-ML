function [myf,Beta]= linearbayesian(X,Y)
    %one dimension for the translation and transpose to get notation of the
    %course
    Xb=[X;ones(1,size(X,2))]';
    Yb=Y';
    
    %compute Beta
    Beta=(Xb'*Xb)^(-1)*Xb'*Yb;

    %make a function of it
    myf=@(X)[X;1]'*Beta;

end