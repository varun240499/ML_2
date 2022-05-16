%% Machine Learning: Lab Assignment 2
% Durga Varun Gangesetti

% One-dimensional linear regression without intercept
function slope = linearRegression(dataset)

    [n, d] = size(dataset);
    
    % Checking number of coloumns
    if (d ~= 2) % For a one-dimensional problem the number of column of the dataset must be 2
        disp('Error: incorrect size of the sets.\n');
        return 
    end
    
    numerator = 0;
    denominator = 0;
    
    for i=1:n
        numerator = numerator + dataset(i,1) * dataset(i,2);
        denominator = denominator + dataset(i,1)^2;
    end
    slope = numerator/denominator;

end