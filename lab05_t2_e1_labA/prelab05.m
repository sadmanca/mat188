%% Pre-lab A: Loop/Plot/Function
%% [ Your name here ]
%% Exercise 0 
%% Keeping track of multiple variables together
% Recall from , we computed the sine and cosine at equally spaced intervals 
% and plotted them together.

x = linspace(0, 5*pi, 50)';
y1 = sin(x);
y2 = cos(x);
%% 
% 
% Everything in MATLAB is a matrix...
% Notice that these are all _vectors._ In MATLAB, everything is a matrix, so 
% in this case, these variables are 1-dimensional matrices.

disp('The shape of matrix x is: '), size(x)
disp('The shape of matrix y1 is: '), size(y1)
disp('The shape of matrix y2 is: '), size(y2)
%% 
% Clear all defined matrix

clear
%% Exercise 1 
% Create an empty matix x

x = []
%% 
% Define x between -pi to pi with step size of 0.1

x=-pi:0.1:pi;

%% 
% Find the size of x vector

s=size(x) % first column of size shows number of rows and second column shows number of columns
%% 
% Create a for loop with *size of x* to show the values of *sin(x)* and index 
% of the x

clc
for i=1:s(1,2)
 disp('Sinx Value');
 sin(x(1,i))
 disp('Index Value');
  i  %index;
end
%% 
% In the previous example, we just showed the values of *Sinx* and *did NOT 
% save* them anywhere 
% 
% Now define *y matrix* and store the *Sin(x) values* by defining index for 
% the y matrix

% perform your work here
y=[];
for i=1:s(1,2)
 y(i)=sin(x(1,i));
end
%% 
% Now Plot x vs y and set xlabel and ylabel as *X* and *Y* and *title* as *Sinx* 
% 
% Set axis between *x=[-pi,pi] , y=[-1,1]*
% 
% Create a box for your plot
% 
% and hold on the plot to keep it for the next step
% 
% *Optional*: plot it with red markers and dashed lines.

plot(x,y,"r-");
hold on
xlabel('X')
ylabel('Y')
axis([-7,pi,-pi,pi]);
box on
title('Sinx')

%% Exercise 2
% Redo the excersie 1, now for Cosx and store the data in the y1 matrix

y1=[];
for i=1:s(1,2)
    y1(i)=cos(x(1,i));
end
% Change the title to 'Sinx & Cosx'
% put a legend to specify Cos x and Sin x
% 
% *Optional*: plot it with blue markers and dashed lines.

plot(x,y1,"b--");
legend('Sin x', 'Cos x')
%% Exercise 3
% use viscircles(centers,radii) to draw a circle at position [0,0] and with 
% radius of 0.05

viscircles([0,0],0.05)
%% 
% Create a *for loop* to add *10 more* circles in the same distance within x=[-pi,pi] 
% on the *Sinx* figure 
%% 
% # define the x values

x=linspace(-pi,pi,10)
%% 
% 2. define the y values corrospond to x values using for loop

y3=[];
for i=1:10
 y3(i)=sin(x(1,i));
end
%% 
% Create another for loop to plot t circle with calculated x and y

for i=1:10
    viscircles([i,sin(y3(i))],0.05);
end
legend('Sinx', 'Cosx')
%% 
% 
%% Exercise 4
% Defining a function
% define a function at the end of the code and name it *myfun*. Get two inputs 
% and multiply them by two and show them as two outputs
% 
% Test your *myfun* function with two numbers    

myfun(1,3)
%% 
% 

function [y1,y2] = myfun(x1,x2)
    
y1=x1*2;
y2=x2*2;
disp(y1);
disp(y2);
end