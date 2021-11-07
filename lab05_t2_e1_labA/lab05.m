%% Lab A: For loop/Function/Animation
%% Part 0
% Here is a small explanation of how to define a function in MATLAB
% 
% 
% 
% |function [y1,...,yN] = *myfun*(x1,...,xM)| declares a function named |*myfun 
% (it can be whatever except Matlab built-in functions)*| that accepts inputs 
% |x1,...,xM| and returns outputs |y1,...,yN|. This declaration statement must 
% be the first line of the function and you should put all your functions *at 
% the end of the code*. Valid function names begin with an alphabetic character, 
% and can contain letters, numbers, or underscores.
% 
% Not accepted: 2a, 100!, !kj,...
% 
% Define a function named |*average* that accepts an *input values x1 and x2*, 
% calculates the average of the values, and returns a *single result*. (*check 
% the end of the page for function*)

average(2,5)
%% 
% Define another function named *area* that accepts an *input values h and w,* 
% calculates the area of a rectangle with those values, and returns a *single 
% result*. (*check the end of the page for function*)

area(2,3)
%% 
%% Part 1 
% Define a function at the end of the code and name it *sinplot* that *get a 
% range of x* and *number of divisions* as *three inputs* and plot Sin(x) in that 
% range and give y values of Sin(x) as output 
% 
% Test your function between -pi to pi

% write your code here
% test your function
sinplot(-pi,pi,8)
%% Part 2
% Divide the range of [0,20*pi] to 50 interval 
% 
% Use your *sinplot function* (defined in example 1) to plot Sin(x) in  the 
% first and second intervals with *division of 10*

x=linspace(0,20*pi,50) %dividing the range
sinplot(x(1),x(2),10); % first interval
sinplot(x(2),x(3),10); %second interval
%sinplot(x(i),x(i+1),10); %ith interval
% ------------------------
% Use a for loop to plot Sin(x) in the rest of the intervals using *sinplot 
% function* with *division of 10*

% perform your work here
for i=1:49
    % run sinplot in a suitable range of x vector
    sinplot(x(i),x(i+1),10);
end
%% 
% 
%% Part 3
% Animating Sin (x)
% Remove the previous figure using clf
% 
% Try to redo the same for loop but with a pause of 0.25 s at each loop to animate 
% drawing the plots 

clf
% write your code here
% perform your work here
for i=1:49
% run sinplot in a suitable range of x vector
    sinplot(x(i),x(i+1),10)
    viscircles([x(i+1),sin(x(i+1))],0.05); 
    pause(0.25)
end
%% 
% Use defined coordinate x and output of your *sinplot function* (y) to put 
% a *circle* (radius of 0.05) at end of your *sinplot* at each loop

% viscircles([xcoordinate,ycoordinate],radius); 
% ------------------------
% Part 4 
% Define a cosplot function similar to sinplot and try to animate both of them 
% in the same plot

% perform your work here
clf

for i=1:9
% run sinplot in a suitable range of x vector
    sinplot(x(i),x(i+1),10)
    cosplot(x(i),x(i+1),10)
    pause(0.25)
end
%% 
% 
%% Functions
% Write your functions here
% 
% *Part 0*

function ave = average(x1,x2)
    ave = (x1+x2)/2; 
end
function y = area(h,w)
    y = h*w; 
end
%% 
% *Part 1*

% perform your work here
% hint: function [y1] = sinplot(x1,x2,division) 
% Step 1 : divide the range between x1 to x2 with number of divisions 
% define a for loop to replace x values and find the corrosponding y values

function sinx = sinplot(x1,x2,num_divisions)
    x = linspace(x1,x2,num_divisions)
    sinx = zeros([1, num_divisions]);
    for i=1:size(x,2)
        sinx(i) = sin(x(i));
    end
    sinx
    plot(x,sinx,"r-");
end
%% 
% *Part 4*

% perform your work here
function cosx = cosplot(x1,x2,num_divisions)
    x = linspace(x1,x2,num_divisions)
    cosx = zeros([1, num_divisions]);
    for i=1:size(x,2)
        cosx(i) = cos(x(i));
    end
    cosx
    hold on 
    plot(x,cosx,"b-");
    hold off
end