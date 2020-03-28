clear all

x1 = load('class_1', '-ascii');     %setosa
x2 = load('class_2', '-ascii');     %Versicolour
x3 = load('class_3', 'ascii');      %Virginica

%% Sepal length
subplot(2,2,1);
h1 = histogram(x1(:, 1));
h1.BinWidth = 0.25;
h1.EdgeColor = 'b';
xlabel('Length'); ylabel('Frequency');
hold on
h2 = histogram(x2(:, 1));
h2.BinWidth = 0.25;
h2.EdgeColor = 'r';
hold on
h3 = histogram(x3(:, 1));
h3.BinWidth = 0.25;
h3.EdgeColor = 'y';
legend('Setosa', 'Versicolour', 'Virginica');
title('Sepal');


%% Sepal width
subplot(2,2,2);
h4 = histogram(x1(:, 2));
h4.BinWidth = 0.25;
h4.EdgeColor = 'b';
xlabel('Width'); ylabel('Frequency');
hold on
h5 = histogram(x2(:, 2));
h5.BinWidth = 0.25;
h5.EdgeColor = 'r';
hold on
h6 = histogram(x3(:, 2));
h6.BinWidth = 0.25;
h6.EdgeColor = 'y';
legend('Setosa', 'Versicolour', 'Virginica');
title('Sepal');

%% Petal length
subplot(2,2,3);
h7 = histogram(x1(:, 3));
h7.BinWidth = 0.25;
h7.EdgeColor = 'b';
xlabel('Length'); ylabel('Frequency');
hold on
h8 = histogram(x2(:, 3));
h8.BinWidth = 0.25;
h8.EdgeColor = 'r';
hold on
h9 = histogram(x3(:, 3));
h9.BinWidth = 0.25;
h9.EdgeColor = 'y';
legend('Setosa', 'Versicolour', 'Virginica');
title('Petal');

%% Petal width
subplot(2,2,4);
h10 = histogram(x1(:, 4));
h10.BinWidth = 0.25;
h10.EdgeColor = 'b';
xlabel('Width'); ylabel('Frequency');
hold on
h11 = histogram(x2(:, 4));
h11.BinWidth = 0.25;
h11.EdgeColor = 'r';
hold on
h12 = histogram(x3(:, 4));
h12.BinWidth = 0.25;
h12.EdgeColor = 'y';
legend('Setosa', 'Versicolour', 'Virginica');
title('Petal');
