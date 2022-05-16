%% Machine Learning: Lab Assignment 2
% Durga Varun Gangesetti

% One-dimensional linear regression with intercept
function [slope, intercept] = linearRegressionIntercept(dataset)

    [n, d] = size(dataset);
    
    % Checking number of coloumns
    if (d ~= 2) % For a one-dimensional problem the number of column of the dataset must be 2
        disp('Error: incorrect size of the sets.\n');
        return 
    end
    
    x_mean = 0;
    t_mean = 0;
    for j=1:n
        x_mean = x_mean + dataset(j,1);
        t_mean = t_mean + dataset(j,2);
    end
    x_mean = x_mean/n;
    t_mean = t_mean/n;
    
    numerator = 0;
    denominator = 0;
    
    for i=1:n
        numerator = numerator + (dataset(i,1)-x_mean) * (dataset(i,2)-t_mean);
        denominator = denominator + (dataset(i,1)-x_mean)^2;
    end
    slope = numerator/denominator;
    intercept = t_mean - slope * x_mean;
    
end