function [myf,Beta]= linearlasso(X,Y,keepfactor)
    %one dimension for the translation and transpose to get notation of the
    %course
    Xb=[X;ones(1,size(X,2))]';
    Yb=Y';
    
    n=nearest((keepfactor)*size(X,1));
    [B,FitInfo]=lasso(Xb,Yb);
    [~,I]=min(abs(FitInfo.DF-n));
    
    Beta=B(:,I);


    %compute Beta
    %Beta=(Xb'*Xb)^(-1)*Xb'*Yb;

    %check bounds
    %if sum(Beta)>threshold
        %nearest point
    %end

    %make a function of it
    myf=@(X)[X;1]'*Beta;

end