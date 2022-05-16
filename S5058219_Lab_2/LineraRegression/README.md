# Lab assignment 2: linear regression
Task 1: Get data
Task 2: Fit a linear regression model
Task 3: Test regression model
Describe everything in a report  (following the report guidelines).

Then submit everything (following the lab submission guidelines)

## Task 1: Get data
Download the turkish-se-SP500vsMSCI and the mtcarsdata-4features data sets in the lab resources section of the Aulaweb page.

Do what is necessary to make them readable in Matlab, for instance with the load function.

## Task 2: Fit a linear regression model
Using the slides, reproduce the examples that you have seen during the lectures:

1) One-dimensional problem without intercept on the Turkish stock exchange data
2) Compare graphically the solution obtained on different random subsets (10% or less) of the whole data set. To see  clear difference, select data from different ends of the data set (beginning and end) since they are in temporal order
3) One-dimensional problem with intercept on the Motor Trends car data, using columns mpg and weight
4) Multi-dimensional problem on the complete MTcars data, using all four columns (predict mpg with the other three columns)

## Task 3: Test regression model
- Re-run 1,3 and 4 from task 2 using only 5% (or less) of the data.

- Compute the objective (mean square error) on the training data

- Compute the objective of the same models on the remaining 95% (or more) of the data.

- Repeat for different training-test random splits, for instance 10 times. Suggestion: write code for this job, don't waste time repeating manually. Matlab scripts are done for that.

- Show the results (using a graph or a table of values) and comment.