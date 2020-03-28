function [outputArg1] = EER(Confusion_mat)
    hits = 0;                               %Number of correct classifications
    misses = 0;                             %Number of incorrect classifications
    for i = 1 : size(Confusion_mat,1)
        for j = 1: size(Confusion_mat,2)
            if i == j
                hits = hits + Confusion_mat(i,j);
            elseif j ~= i 
                misses = misses +Confusion_mat(i,j);
            end
        end
    end

outputArg1 = misses/(hits + misses);
end

