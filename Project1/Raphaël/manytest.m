function [f,Beta,err]= manytest(Data,regfunc,iters)
    err=Inf;
    for i=1:iters
        [X,Y,Xv,Yv,ftake]=treatData(Data);
        [myf,beta]=regfunc(X,Y);
        [nerr]=empiricalError(Xv,Yv,myf);
        if nerr<err
            err=nerr;
            Beta=beta;
            f=@(X)ftake(myf,X);
        end
    end
end