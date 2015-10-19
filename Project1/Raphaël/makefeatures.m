function [X]= makefeatures(X)
    X=[X;(log(X))];
end