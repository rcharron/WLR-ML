function [err]=loss(X,Y)
    err=(X-Y)*(X-Y)';
end