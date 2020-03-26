function [outputArg1] = W(X, T, W_prev, alpha)
    outputArg1 = W_prev - alpha*deltaW_MSE(X, T, W_prev);
end

