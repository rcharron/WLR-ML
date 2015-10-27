%%load Data
Data=csvread('../train.csv');

%%
%%one Example
[X,Y,Xv,Yv,fraw]=treatData(Data);

[fb,betaB]=linearbayesian(X,Y);
[fridge,betaRidge]=ridge(X,Y,10);
[flasso,betaLasso]=linearlasso(X,Y,1/3);

[errb]=empiricalError(X,Y,fb);
[errridge]=empiricalError(X,Y,fridge);
[errlasso]=empiricalError(X,Y,flasso);
[errbv]=empiricalError(Xv,Yv,fb);
[errridgev]=empiricalError(Xv,Yv,fridge);
[errblassov]=empiricalError(Xv,Yv,flasso);

%%
%%Manytest for a method
[fb,Betab,errb]= manytest(Data,@linearbayesian,1000);
[flasso,Betalasso,errlasso]= manytest(Data,@(X,Y)linearlasso(X,Y,1/20),100);
[fridge,Betaridge,errridge]= manytest(Data,@(X,Y)ridge(X,Y,10),1000);

%%
%%Predict
Datap=csvread('../validate_and_test.csv');
PredictData(Datap,fridge,'ridge.csv');
PredictData(Datap,flasso,'lasso.csv');