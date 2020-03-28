function [outputArg1] = MSE(X, T, W)
    sum = 0;
    for k = 1:size(X, 2)
        g_k = 1./(1 + exp(-W*X(:,k)));       
        t_k = T(:, k);                        
        sum = sum + (g_k-t_k)'*(g_k - t_k);
    end
    outputArg1 = 1/2 * sum;
end

    