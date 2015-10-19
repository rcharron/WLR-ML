function []=PredictData(Data,fraw,name)
Data=Data';
n=size(Data,2);
delays = ones(n,1);
ids = ones(n,1);
for i=1:n
    ids(i)=Data(1,i);
    delays(i)=fraw(makefeatures(Data(2:15,i)));
end


% Gene r a t e a s i n g l e a r r a y wi th the I d s and d e l a y s .
res = horzcat(ids,delays);
% Conv e r t the a r r a y to a t a b l e and add column h e a d e r s .
table=array2table(res,'VariableNames',{'Id','Delay'});
% Wr i te the o b t a i n e d t a b l e to a CSV f i l e .
writetable ( table , name ) ;
end

