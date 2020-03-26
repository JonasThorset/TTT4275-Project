function [outputArg1] = MSE(X, T, W)
    sum = 0;
    for k = 1:size(X, 2)
        g_k = 1./(1 + exp(-W*X(:,k)));       %Discriminant function
        t_k = T(:, k);                       %Class labels aka Targets 
        sum = sum + (g_k-t_k)'*(g_k - t_k);
    end
    outputArg1 = 1/2 * sum;
end

    