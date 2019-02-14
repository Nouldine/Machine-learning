
clear ; close all; clc

% Load Data
% The first two columns contains the exam scores an
% contains the label

data = load('hw2_data1.txt');

X = data(:, [1, 2]); y = data(:, 3);


%fprintf(['Pllotting data with + indicating ( y = 1 ) indicating ( y = 0) examples']);

fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
         'indicating (y = 0) examples.\n']);


plot(X, y);

% Put somes labels
hold on;

% Labels and legend

xlabel('Exam 1 score')
ylabel('Exam 2 score')

%Specified in plot order
legend('Admitted', 'Not admitted')

hold off;

fprintf('\nProgram paused. Press enter to continue.\')

pause;

% Setup the data matrix appropriately, and add ones

[m, n] = size(X)

%Initialize fitting parameters











