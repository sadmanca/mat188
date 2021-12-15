%% Topic 4 Assignment
% In this assignment, you are going to try to apply both machine learning algorithms 
% (regression and classification) to a real estate problem. 
% 
% In machine learning, you need to train your model on a dataset (usually called 
% training set) which is completely different from the data set you use to test 
% the performance of the model (usually called testing set). (You never want to 
% give an exam to student which includes exactly the same questions covered in 
% lectures and tutorials!) As a result, after you get a dataset, you always need 
% to randomly seperate a part of data from the dataset for training purpose. The 
% amount of data in training set usually takes up 70% of the total data.

% you can run this line to make the matrix show value properly
format short g
% Part 1. Load and preprocess the data
% Load realestate.csv into a table named |dataset|.

dataset = readtable('realestate.csv');
%% 
% 
% 
% The dataset have 414 data points (rows). 
% 
% Take a random sample of 70% of the data (290 rows) as the training set and 
% the rest as the testing set.
%% 
% # Shuffle the table rows using randperm _(this is done for you below)_
% # Store the first 290 rows in your training set in |data_train|
% # Store the remainder of the rows in |data_test|

dataset = dataset(randperm(height(dataset)), :);
% split your dataset here
data_train = dataset(1:290,:);
data_test = dataset(291:end,:);
% Part 2. Linear Regression
% We need to find a linear regression model to predict the price per unit area 
% of the house (Y) based on three features (variable): House Age ($\left.X_1 \right)$, 
% Distance to the nearest MRT station ($\left.X_2 \right)$ and number of convenient 
% stores  ($\left.X_3 \right)$. The linear regression is in the form:
% 
% $$Y = \beta_0 + \beta_1*X_1+\beta_2*X_2+\beta_3*X_3$$
% 
% where you can solve for the coefficient $\beta_i$ with
% 
% $$\left\lbrack \begin{array}{cccc}N & \sum_{i=1}^N x_{\textrm{i1}}  & \sum_{i=1}^N 
% x_{\textrm{i2}}  & \sum_{i=1}^N x_{\textrm{i3}} \\\sum_{i=1}^N x_{\textrm{i1}}  
% & \sum_{i=1}^N {x_{\textrm{i1}} }^2  & \sum_{i=1}^N x_{\textrm{i1}} x_{\textrm{i2}}  
% & \sum_{i=1}^N x_{\textrm{i1}} x_{\textrm{i3}} \\\sum_{i=1}^N x_{\textrm{i2}}  
% & \sum_{i=1}^N x_{\textrm{i2}} x_{\textrm{i1}}  & \sum_{i=1}^N {x_{\textrm{i2}} 
% }^2  & \sum_{i=1}^N x_{\textrm{i2}} x_{\textrm{i3}} \\\sum_{i=1}^N x_{\textrm{i3}}  
% & \sum_{i=1}^N x_{\textrm{i3}} x_{\textrm{i1}}  & \sum_{i=1}^N x_{\textrm{i3}} 
% x_{\textrm{i2}}  & \sum_{i=1}^N {x_{\textrm{i3}} }^2 \end{array}\right\rbrack 
% \left\lbrack \begin{array}{c}\beta_0 \\\beta_1 \\\beta_2 \\\beta_3 \end{array}\right\rbrack 
% =\left\lbrack \begin{array}{c}\sum_{i=1}^N y_i \\\sum_{i=1}^N x_{\textrm{i1}} 
% y_{i\;} \\\sum_{i=1}^N x_{\textrm{i2}} y_{i\;} \\\sum_{i=1}^N x_{\textrm{i3}} 
% y_{i\;} \end{array}\right\rbrack$$

% build up your linear system of equations and find the coefficient with
% the training data
N_train = 290;
x1_train = data_train.House_Age;
x2_train = data_train.Distance_to_Nearest_MRT_station;
x3_train = data_train.Number_of_Convenience_Stores;
y_train = data_train.House_Price_of_Unit_Area;

A = [N sum(x1_train) sum(x2_train) sum(x3_train);
     sum(x1_train) sum(x1_train.^2) sum(x1_train.*x2_train) sum(x1_train.*x3_train);
     sum(x2_train) sum(x2_train.*x1_train) sum(x2_train.^2) sum(x2_train.*x3_train);
     sum(x3_train) sum(x3_train.*x1_train) sum(x3_train.*x2_train) sum(x3_train.^2);];

B = [sum(y_train); 
     sum(x1_train.*y_train);
     sum(x2_train.*y_train);
     sum(x3_train.*y_train)];

b = A\B
%% 
% Root mean square error (RMSE) is one of the metrics to evaluate the performance 
% of the liear regression model. It is based on the error you learnt from Exercise 
% 1.
% 
% $$\textrm{RMSE}=\sqrt{\frac{\sum_{i=1}^N {\left(y_i -y\right)}^2 }{N}}$$
% 
% What is the RMSE of the model on train set?

y_i_train = b(1) + b(2)*x1_train + b(3)*x2_train + b(4)*x3_train;
RMSE_train = sqrt(sum((y_train - y_i_train).^2) / N_train)
%% 
% What is the RMSE of the model on test set?

N_test = 124;
x1_test = data_test.House_Age;
x2_test = data_test.Distance_to_Nearest_MRT_station;
x3_test = data_test.Number_of_Convenience_Stores;
y_test = data_test.House_Price_of_Unit_Area;

y_i_test = b(1) + b(2)*x1_test + b(3)*x2_test + b(4)*x3_test;
RMSE_test = sqrt(sum((y_test - y_i_test).^2) / N_test)
% Part 3. Classification
% You have a friend who want to buy a new house. He want to know if the house 
% he found worth a price per unit area less than 40. We now need to build a classification 
% model to do this. Similarly, we will train our model on the train set of data 
% and test its performance on the test data.
% 
% You don't want to mess up your data while you are writing your code. As a 
% result, please make a copy of your data and modify the copy. If you find your 
% code is wrong, you can always create a new copy of the original data.

%create a copy of your data and try your code on the copied data
copy = dataset;
%% 
% First we need to change the price per unit area to 0 (if less than or equal 
% to 40) and 1 (if more than 40). Do this on the copy of the data you made.

for i = 1:length(copy.House_Price_of_Unit_Area)
    if copy.House_Price_of_Unit_Area(i) <= 40
        copy.House_Price_of_Unit_Area(i) = 0;
    else
        copy.House_Price_of_Unit_Area(i) = 1;
    end
end
%% 
% Split the data in to train set and test set again, with 70% of data going 
% to train set.

copy_train = copy(1:290,:);
copy_test = copy(291:end,:);
%% 
% Now you need to train the model on your modified train set. According to Exercise 
% 2, you need to find the coefficient $a_i$ for $X_i$, where $X_i$ are the features 
% you used in part 2, i.e. House Age ($\left.X_1 \right)$, Distance to the nearest 
% MRT station ($\left.X_2 \right)$ and number of convenient stores  ($\left.X_3 
% \right)$. 
% 
% In a more generalized form, we can have an intercept in the linear combination, 
% i.e.
% 
% $$\hat{\;y\;} =\sigma \;\left({a_0 +\;\mathit{\mathbf{a}}}_{1\;} \times X_{1\;} 
% +{\mathit{\mathbf{a}}}_{2\;} \times X_{2\;} +{\mathit{\mathbf{a}}}_{3\;} \times 
% X_{3\;} \right)=\sigma \;\left(\textrm{AX}\right)$$
% 
% Use your sigmoid function from the Topic 4, Lab Exercise 2.
% 
% In order to cut the time spent in calculation, the optimal value for $a_0$ 
% is 2.1. Please search for optimal values for $a_1$ from -0.07 to -0.05, $a_2$ 
% from -0.003 to -0.001 and $a_3$ from 0.1 to 0.3, each with 40 steps.

%set up your a1, a2, a3 array and error matrix here
a0 = 2.1;
a1 = linspace(-0.07, -0.05, 40);
a2 = linspace(-0.003, -0.001, 40);
a3 = linspace(0.1, 0.3, 40);
error = zeros(40, 40, 40);

x1_train = copy_train.House_Age;
x2_train = copy_train.Distance_to_Nearest_MRT_station;
x3_train = copy_train.Number_of_Convenience_Stores;
y_train = copy_train.House_Price_of_Unit_Area;
%%
% calculate the error for all combinations use for loops
for i = 1:40
    for j = 1:40
        for k = 1:40
            error(i,j,k) = 1/290*sum((mysigmoid(a0+a1(i)*x1_train+a2(j)*x2_train+a3(k)*x3_train)-y_train).^2);
        end
    end
end
%%
% find the optimal value for a1, a2, and a3.
% hint: look at the documentation for function min() and ind2sub()
[index, location] = min(error(:));
[i,j,k] = ind2sub(size(error), location);
% OPTIMAL VALUE for a1, a2, a3
a1(i)
a2(j)
a3(k)
%% 
% If the predicted value is less than or equal 0.5, we consider it as a 0 (lower 
% than 40), otherwise we consider it as 1 (higher than 40)
% 
% Calculate the accuracy of the model on train set.

yhat_train = mysigmoid(a0+a1(i)*x1_train+a2(j)*x2_train+a3(k)*x3_train);
yhat_train(yhat_train >= .5) = 1;
yhat_train(yhat_train < .5) = 0;
acc_train = accuracy(yhat_train,y_train)
%% 
% Calculate the accuracy of the model on test set.

x1_test = copy_test.House_Age;
x2_test = copy_test.Distance_to_Nearest_MRT_station;
x3_test = copy_test.Number_of_Convenience_Stores;
y_test = copy_test.House_Price_of_Unit_Area;

yhat_test = mysigmoid(a0+a1(i)*x1_test+a2(j)*x2_test+a3(k)*x3_test);
yhat_test(yhat_test >= .5) = 1;
yhat_test(yhat_test < .5) = 0;
acc_test = accuracy(yhat_test,y_test)
%% Functions

function f = mysigmoid(x)
    f = 1./(1+exp(-x));
end

function out = accuracy(yhat,y)
    correct = (yhat==y);
    out = (sum(correct)/length(correct))*100;
end