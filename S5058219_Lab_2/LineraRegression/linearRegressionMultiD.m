%% Machine Learning: Lab Assignment 2
% Durga Varun Gangesetti

% Multi-dimensional linear regression
function slope = linearRegressionMultiD(dataset, target)

    slope = pinv(dataset) * target;
    
end