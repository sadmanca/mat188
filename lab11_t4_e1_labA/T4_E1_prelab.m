%% Pre-lab A: Ploting Random Noise
%% Exercise 1 
%% Create a line on the 2D plane.
% Recall a line on a 2D plane can be defined by *only* two variables in the 
% form of  $y=\textrm{ax}+b$. This form illustrates all the lines except the vertical 
% ones, e.g. $x=3$. Of note, one may use the general form of $\textrm{Ax}+\textrm{By}=C$, 
% but it still has two variables if $B\not= 0$ because it is equivalent to $\frac{A}{B}x+\frac{B}{B\;}y=\frac{C}{B}$. 
% In this problem, we draw a line using the first approach and a random slop limited 
% to the range of (-2.5 , -0.5). The line passes from point$\left(0\ldotp 0,1\ldotp 
% 0\right)$. For this end, we use _rand()_ function that generates a uniformally 
% random number within the interval of $\left(0,1\right)$and apply a linear transformation 
% (i.e. multiplication and a summation) to its output. We then finally add $b$:

b = 1.0;                      % line passes the origin 
a = -2 * rand()  - 0.5      % creating a random slop
%% 
% Creating a line using vectors

N = 50;                     % numbr of points using to demonstrate a line
x = linspace(0, 10, 50);    
y = a * x + b;
clf reset                 % clearing the Figure
plot(x, y)
%% 
% Everything in MATLAB is a matrix...
%% Exercise 2
% In this exercise, we want to create $N$ random points and scatter them onto 
% the rectangle of $x\in \left(0\ldotp 75\;,2\ldotp 25\right)\;y\in \left(2\ldotp 
% 75,5\ldotp 25\right)$using _rand()_ with dual input:

rand(2,3)       % example for rand with two inputs
%% Part 1

N = 50;
x  = rand(1, N)
y= rand(1, N)
%% 
% Let's move our random horizontal locations (x) to the desired range, using 
% a linear transformation:

x= x * 1.5 + 0.75
y= y * 2.5 + 2.75  % .... your code here ... %
%% 
% Now we plot them:

scatter(x, y, 'filled')
xlabel('X')
ylabel('Y')
hold on
%% Part 2
% In this part, we want to find what percent of _N_ points inside the inner 
% green rectangle of $x\in \left(1\ldotp 0\;,2\ldotp 0\right)\;y\in \left(3\ldotp 
% 0,5\ldotp 0\right)$. We shall do so without and with a _for_ loop. The former 
% is:

rectangle('Position', [1.0 3.0 1.0 2.0] ,  "EdgeColor",'g');
rectangle('Position', [0.75 2.75 1.5 2.5], "EdgeColor",'r')
hold off
%% 
% Now we mark all the indices of vector _x_ within the horizontal range of the 
% green rectangle.

x_to_delete = x < 1.0   |   x > 2.0
%% 
% Next, you mark the ones for vector _y_:

y_to_delete = y < 3.0   |   y > 5.0;
points_to_delete = x_to_delete ==1  |   y_to_delete ==1
%% 
% One way to remove marked elements from a vector is to use _=[]_.

x(points_to_delete)=[];
y(points_to_delete)=[];
size(x)
size(y)
%% 
% Updated vectors _x_ and _y_ now have the same length and contain all the points 
% within the green range. Let's check that visually:

scatter(x, y, 'filled');
rectangle('Position', [1.0 3.0 1.0 2.0] ,  "EdgeColor",'g');
rectangle('Position', [0.75 2.75 1.5 2.5], "EdgeColor",'r');
%% 
% The ratio of the remaining points to the original one is:

ratio = length(x) / N
%% 
% Note $\textrm{rand}\left(\right)$ function distributes the data uniformly. 
% Therefore, as we increase the number of _N_ (try _N =1000_ and _10000_), the 
% number of remaining points gets closer to the ratio of the areas:
% 
% $$\frac{N\;\textrm{after}\;\textrm{removal}}{N\;\textrm{original}}=\frac{\textrm{area}\;\textrm{of}\;\textrm{the}\;\textrm{grean}\;\textrm{reactangle}}{\textrm{area}\;\textrm{of}\;\textrm{the}\;\textrm{red}\;\textrm{rectangle}}=\frac{1\ldotp 
% 0\times 2\ldotp 0}{1\ldotp 5\times 2\ldotp 5}=0\ldotp 533$$
%% Exercise 3
% Try to redo exercise 2 with a for loop. You should plot *the same figure as 
% exercise 2*.

x  = rand(1, N);
y= rand(1, N);
x(:)= x(:) * 1.5 + 0.75;
y(:)= y(:) * 2.5 + 2.75;

n = 1;
x_inner = [];
y_inner = [];

for i=1:N
    if ( x(i) >= 1.0     &   x(i) <= 2.0     &    y(i) >= 3.0     &   y(i) <= 5.0)
            x_inner(i) = x(i);
            y_inner(i) = y(i);
            n = n+1;
    end
end

scatter(x_inner, y_inner, 'filled');
rectangle('Position', [1.0 3.0 1.0 2.0] ,  "EdgeColor",'g');
rectangle('Position', [0.75 2.75 1.5 2.5], "EdgeColor",'r');
ratio = (n)/N
%% 
% Of note, vectors _x_ and _y_ changes in the beginning of this exercise. Therefore, 
% the values of _ration_ should be slightlly differnt compared to the previous 
% exercise; however, both numbers shall tend to 0.533 as you increase _N._