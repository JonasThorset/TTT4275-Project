x1 = load('class_1', '-ascii');     %setosa
x2 = load('class_2', '-ascii');     %Versicolour
x3 = load('class_2', 'ascii');      %Virginica

%Samples for training
x1_train = x1(1:30, 1:end);
x2_train = x2(1:30, 1:end);
x3_train = x3(1:30, 1:end);
x_train = [x1_train; x2_train; x3_train];

%Samples for testing
x1_test = x1(31:end, 1:end);
x2_test = x2(31:end, 1:end);
x3_test = x3(31:end, 1:end);
x_test = [x1_test; x2_test; x3_test];

%Finding X_N and the corresponding T_N
X_N = [x_train'; ones(1, size(x_train, 1))];
T_N = zeros(3, size(X_N, 2));
T_N(1, 1:30) = 1;
T_N(2, 31:60) = 1;
T_N(3, 61:90) = 1;


%Finding W (Learning)
W_0 = zeros(3, size(X_N, 1));     %Hva skal W_0 være????
W_prev = W_0;
W_mat = eye(3, size(X_N, 1));
alpha = 0.005;

for i = 1: 10000
    W_mat = W(X_N, T_N, W_prev, alpha);
    W_prev-W_mat;       %Sjekker konvergens
    W_prev = W_mat;
end


%Testing
T = [ones(1,20)*1, ones(1,20)*2, ones(1,20)*3];
X = [x_test'; ones(1, size(x_test, 1))];
g = W_mat * X;           %Discriminant function
[A,I] = max(g);          %Decision rule. Find largest element in each column. Append class nr. to I

%Confusion matrix and error rate
C = confusionmat(T, I)     %MATLAB does the job

hits = 0;                   %Number of correct classifications
misses = 0;                 %Number of incorrect classifications
for i = 1 : size(C,1)
    for j = 1: size(C,2)
        if i == j
            hits = hits + C(i,j);
        elseif j ~= i 
            misses = misses +C(i,j);
        end
    end
end

error_rate = misses/(hits+misses)             %Ganske rævva error_rate foreløpig




%scatter(x1(:,1),x1(:,2), 100, 'filled');
%hold on
%scatter(x2(:,1),x2(:,2), 100, 'filled');
%hold on
%scatter(x3(:,1),x1(:,2), 100, 'filled');
