%% Pre-lab A: Dataset Generation
%% Exercise 1
% In probability theory, a normal distribution is a type of continuous distribution. 
% The general form of its probability density function (pdf) is
% 
% $$\textrm{pdf}\left(x\right)=\frac{1}{\sigma \;\sqrt{2\pi \;}}\;e^{\left(-0\ldotp 
% 5\;{\left(\frac{x-\mu \;}{\;\sigma \;}\right)}^{2\;} \right)}$$
% 
% The parameter set $\mu$ is the mean or expectation of the distribution (and 
% also its median and mode), while the parameter $\sigma \;$ is its standard deviation 
% The variance of the distribution is $\sigma {\;}^{2\;}$.
% 
% create a random set of 1000 points in 1-D space which normal distribution 
% with parameters set $\left\lbrace \mu =1\ldotp 0,\sigma =0\ldotp 5\right\rbrace$.
% 
% This means we randomly select 1000 points from a normal distribution with 
% a mean 1.0 and a standard deviation of 0.5 (hint: use *randn*  as you used in 
% the last session).

sz=1000;
mu_x=1.0;
std_x=0.5;
x= ... ;
figure
subplot(1,2,1)
plot(x,'.');
title('randomely selected samples')
xlabel('sample indx')
ylabel('x_value')
subplot(1,2,2)
hist(x,sz/10)
title(' frequently plot')
xlabel('x_values')
ylabel('count')
%% 
% *Optional*: Change the sample size for 1000 to 100 and 10000 to see what changes 
% in the frequently plot, what is your inference?



%% Exercise 2 
% Create a random set of 1000 points in 2-D spaces with normal probability distribution 
% parameters set $\mu_x =1,\sigma_x \;=0\ldotp 5$ for both x and y axies.



%% Exercise 3
% Plot two sets of 1000  points for two different means $\mu =\left\lbrace 1,-1\right\rbrace$ 
% and same standard deviation $\sigma =\ldotp 1$ in different colors


%% 
% 
%% *Exercise 4*
% Draw a line that separates these two red and blue points graphically. How 
% do you find the slope and y-intercept?


%% Message to take home
% In this pre-lab, we learned how we can generate some random points with different 
% statistical properties in 2-D and manually we find a line to separate these 
% two classes of data. 
%%