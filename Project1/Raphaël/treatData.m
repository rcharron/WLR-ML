function [Xs,Ys,Xv,Yv,fraw]=treatData(Data)


Data=Data';
n=size(Data,2);
perm = randperm(n) ;
v=nearest(0.2*n);
selv = perm(1:v);
sels = perm(v+1:n);

X=Data(2:15,:);
Y=Data(16,:);
X=makefeatures(X);
Xs=X(:,sels);
Xv=X(:,selv);
Ys=Y(:,sels);
Yv=Y(:,selv);
[Xs,ax,bx]=normalize(Xs);
[Ys,ay,by]=normalize(Ys);
for i=1:v
    Xv(:,i)=ax'.*(Xv(:,i)-bx');
    Yv(:,i)=ay'.*(Yv(:,i)-by');
end

aax=ax';
aay=1./ay';
bbx=bx';
bby=by';

fraw=@(f,X)aay.*(f(aax.*(X-bbx)))+bby;
end