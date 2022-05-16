%% Machine Learning: Lab Assignment 2
% Durga Varun Gangesetti

clear

%% GET DATA
% Uploading data sets
turkish_dataset = readtable('turkish-se-SP500vsMSCI.csv');
[m, c] = size(turkish_dataset);
turkish_dataset = turkish_dataset{:,:};

car_dataset = readtable('mtcarsdata-4features.csv');
[n, d] = size(car_dataset);
models = car_dataset{:,1};
car_dataset = car_dataset{:,2:end};


%% FIT A LINEAR REGRESSION MODEL
% 1) One-dimensional problem without intercept on the Turkish stock exchange data
slope = linearRegression(turkish_dataset);

figure
plot(turkish_dataset(:,1), turkish_dataset(:,2), 'rx');
hold on
plot(turkish_dataset(:,1), slope * turkish_dataset(:,1), 'b-','LineWidth',2);
title('1-D Linear regression')
xlabel('SP500')
ylabel('MSCI')

% 2) Comparing graphically the results obtained with different random subsets of the whole data set
index = randperm(m);
figure
for h=1:10
    random = 53; % 10% of the whole data set
    subset = turkish_dataset(index(1+random*(h-1):random*h), :);
    [slope_sub] = linearRegression(subset);
    plot(subset(:,1), slope_sub * subset(:,1), '-','LineWidth',1);
    hold on  
end
title('1-D Linear regression on subsets')
xlabel('SP500')
ylabel('MSCI')

% 3) One-dimensional problem with intercept on the Motor Trends car data, using columns mpg and weight
subset_car = [car_dataset(:,4), car_dataset(:,1)];
[slope2, intercept2] = linearRegressionIntercept(subset_car);

figure
plot(subset_car(:,1), subset_car(:,2), 'rx');
hold on
plot(subset_car(:,1), slope2 * subset_car(:,1) + intercept2, 'b-','LineWidth',2);
title('1-D Linear regression with intercept')
xlabel('Mpg')
ylabel('Weight')

% 4) Multi-dimensional problem on the complete MTcars data, using all four columns
x = car_dataset(:,2:end);
target = car_dataset(:,1); %Mpg
[slope3] = linearRegressionMultiD(x, target);
estimated_mpg = slope3(1)*car_dataset(:,2) + slope3(2)*car_dataset(:,3) + slope3(3)*car_dataset(:,4);

T = table(car_dataset(:,1), estimated_mpg);
T.Properties.VariableNames = {'Mpg real (t)' 'Mpg estimated (y)'};

figure
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
    'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);



%% TEST REGRESSION MODEL
dim_subset1 = 53; % 5% of the firs data set
dim_subset2 = 4; % 5% of the second data set

for k=1:100
    index = randperm(m);
    index2 = randperm(n);
    randomSubset1_training = turkish_dataset(index(1:dim_subset1), :); % Subset made of 10% of the data - Training Data
    randomSubset2_training = car_dataset(index2(1:dim_subset2), :);
    randomSubset1_test = turkish_dataset(index(dim_subset1+1:end), :); %Subset made of the remaining 90% of the data - Test Data
    randomSubset2_test = car_dataset(index2(dim_subset2+1:end), :);
    
    % Computing linear regression on the Training Data 
    slope1 = linearRegression(randomSubset1_training);
    [slope2, intercept2] = linearRegressionIntercept([randomSubset2_training(:,4), randomSubset2_training(:,1)]);
    slope3 = linearRegressionMultiD(randomSubset2_training(:,2:end), randomSubset2_training(:,1));
    
    % Computing the objective on the Training Data
    objective1_training(k) = MSE(slope1, 0 ,randomSubset1_training, 1);
    objective2_training(k) = MSE(slope2, intercept2, [randomSubset2_training(:,4), randomSubset2_training(:,1)], 2);
    objective3_training(k) = MSE(slope3, 0, [randomSubset2_training(:,2:end), randomSubset2_training(:,1)], 3);
    
    % Computing the objective on the Test Data
    objective1_test(k) = MSE(slope1, 0 ,randomSubset1_test, 1);
    objective2_test(k) = MSE(slope2, intercept2, [randomSubset2_test(:,4), randomSubset2_test(:,1)], 2);
    objective3_test(k) = MSE(slope3, 0, [randomSubset2_test(:,2:end), randomSubset2_test(:,1)], 3);
end

average_objective_training(1) = sum(objective1_training)/100;
average_objective_training(2) = sum(objective2_training)/100;
average_objective_training(3) = sum(objective3_training)/100;
average_objective_test(1) = sum(objective1_test)/100;
average_objective_test(2) = sum(objective2_test)/100;
average_objective_test(3) = sum(objective3_test)/100;

TT = table(average_objective_training', average_objective_test');
TT.Properties.VariableNames = {'Training' 'Test'};
TT.Properties.RowNames = {'Model 1' 'Model 2' 'Model 3'};

figure
uitable('Data',TT{:,:},'ColumnName',TT.Properties.VariableNames,...
    'RowName',TT.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
