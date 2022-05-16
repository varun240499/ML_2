%% Machine Learning: Lab Assignment 2
% Durga Varun Gangesetti

% Mean Square Error
function objective = MSE(slope, intercept, dataset, model)

    [n, c] = size(dataset);
    
    % Computing the objective
    if model == 1 % One-dimensional linear regression without intercept
        y = slope * dataset(:,1);
        objective = 0;
        for k=1:n
            objective = objective + (dataset(k,2) - y(k))^2;
        end
        objective = objective/n;
    end    
    
    if model == 2 % One-dimensional linear regression with intercept
        y = intercept + slope * dataset(:,1);
        objective = 0;
        for k=1:n
            objective = objective + (dataset(k,2) - y(k))^2;
        end
        objective = objective/n;
    end
    
    if model == 3 % Muldi-dimensional linear regression
        data = dataset(:,1:(c-1));
        target = dataset(:, c);
        y = data * slope;
        objective = immse(target, y);
    end
end