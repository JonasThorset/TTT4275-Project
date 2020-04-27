x1 = load('class_1', '-ascii');     %setosa
x2 = load('class_2', '-ascii');     %Versicolour
x3 = load('class_3', '-ascii');     %Virginica

%% Testing and training samples
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

%----------Removing features (Remove comments to test Task 2)--------------
%x_train(:, 2) = [];               %Remove Sepal width
%x_test(:, 2) = [];
% 
%x_train(:, 1) = [];               %Remove Sepal length
%x_test(:, 1) = [];
% 
%x_train(:, end) = [];             %Remove Petal width
%x_test(:, end) = []; 
%--------------------------------------------------------------------------

%Using 30 last samples for training and 20 first for testing (task 1d).
%Remove comments to test task 1d.
%x_train = [x1(21:end, :); x2(21:end, :); x3(21:end, :)];
%x_test = [x1(1:20, :); x2(1:20, :); x3(1:20, :)];

%% Find input data matrix and corresponding targets matrix
X_N = [x_train'; ones(1, size(x_train, 1))];
T_N = zeros(3, size(X_N, 2));
T_N(1, 1:30) = 1;
T_N(2, 31:60) = 1;
T_N(3, 61:90) = 1;

%% Training, finding W
W_0 = zeros(3, size(X_N, 1));       %Using a zero matrix as offset
W_prev = W_0;
W_mat = ones(3, size(X_N, 1));
alpha = 0.008;

for i = 1: 12000
    W_mat = W(X_N, T_N, W_prev, alpha);
    W_prev-W_mat;                   %Checking convergence
    W_prev = W_mat;
end

%% Testing
%Train set
T_D = [ones(1,size(x1_train, 1))*1, ones(1,size(x2_train, 1))*2, ones(1,size(x3_train, 1))*3];
X_D = [x_train'; ones(1, size(x_train, 1))];

%Test set
T_T = [ones(1,size(x1_test, 1))*1, ones(1,size(x2_test, 1))*2, ones(1,size(x3_test, 1))*3];
X_T = [x_test'; ones(1, size(x_test, 1))];

g_D = W_mat * X_D;                  %Discriminant function
[A_D,I_D] = max(g_D);               %Decision rule. Finds largest element in each column in g. Appends class nr. to I

g_T = W_mat * X_T;             
[A_T,I_T] = max(g_T);          

%% Finding confusion matrix and error rate
C_D = confusionmat(T_D, I_D)        %MATLAB does the job
EER_D = EER(C_D)                    %Error rate test set

C_T = confusionmat(T_T, I_T)
%confusionchart(C_T);
EER_T = EER(C_T)                    



%% Plots
% subplot(2,2,1)
%  scatter(x1(1:30,1),x1(1:30,2), 100, 'filled');
%  hold on
%  scatter(x2(1:30,1),x2(1:30,2), 100, 'filled');
%  hold on
%  scatter(x3(1:30,1),x3(1:30,2), 100, 'filled');
%  xlabel('Sepal length'); ylabel('Sepal width');
%  title('30 first samples');
%  legend('Setosa', 'Versicolor', 'Virginica');
%  
%  subplot(2,2,2)
%  scatter(x1(1:30,3),x1(1:30,4), 100, 'filled');
%  hold on
%  scatter(x2(1:30,3),x2(1:30,4), 100, 'filled');
%  hold on
%  scatter(x3(1:30,3),x3(1:30,4), 100, 'filled');
%  xlabel('Petal length'); ylabel('Petal width');
%  title('30 first samples');
%  legend('Setosa', 'Versicolor', 'Virginica');
%  
%  subplot(2,2,3)
%  scatter(x1(21:end,1),x1(21:end,2), 100, 'filled');
%  hold on
%  scatter(x2(21:end,1),x2(21:end,2), 100, 'filled');
%  hold on
%  scatter(x3(21:end,1),x3(21:end,2), 100, 'filled');
%  xlabel('Sepal length'); ylabel('Sepal width');
%  title('30 last samples');
%  legend('Setosa', 'Versicolor', 'Virginica');
%  
%  subplot(2,2,4)
%  scatter(x1(21:end,3),x1(21:end,4), 100, 'filled');
%  hold on
%  scatter(x2(21:end,3),x2(21:end,4), 100, 'filled');
%  hold on
%  scatter(x3(21:end,3),x3(21:end,4), 100, 'filled');
%  xlabel('Petal length'); ylabel('Petal width');
%  title('30 last samples');
%  legend('Setosa', 'Versicolor', 'Virginica');