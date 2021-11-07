%% Lab A: System of Linear Equations
%% Part 1 
% *Practice problem*
% Calculate the solution of the linear system of equations using Gauss Elimination 
% method. Use the matrix operations from the pre-lab material. 
% 
% $$\begin{array}{l}5x+15y+56z=35\\-4x-11y-41z=-26\\-x-3y-11z=-7\end{array}$$

a = [5 15 56 35; -4 -11 -41 -26; -1 -3 -11 -7]
a(1,:) = a(1,:)/5
a(2,:) = a(2,:) + 4 * a(1,:)
a(3,:) = a(3,:) + a(1,:)
a(3,:) = 5*a(3,:)
a(1,:) = a(1,:) - 3*a(2,:)
a(1,:) = a(1,:) + 0.2*a(3,:)
a(2,:) = a(2,:) - 3.8*a(3,:)
%% 
% *STUDENT ANSWER:*
% 
% x = 1, y = 2, z = 0 
%% Part 2
% Example
% Solve the system of linear equations given below:
% 
% <https://www.mathworks.com/help/symbolic/solve-a-system-of-linear-equations.html 
% https://www.mathworks.com/help/symbolic/solve-a-system-of-linear-equations.html>
% 
% Solve $\textrm{Ax}=b\;\textrm{for}\;x$.
% 
% $$\begin{array}{l}2x+y+z=2\\-x+y-z=3\\x+2y+3z=-10\end{array}$$ 

A = [2, 1, 1;-1, 1, -1;1, 2, 3]
B = [2;3;-10]
X = linsolve(A, B)
Y = A\B
% ------------------------
% Practice problem
% Solve the system of linear equations from the Problem 1 using the above functions. 

a = [5 15 56; -4 -11 -41; -1 -3 -11]
b = [35; -26; -7]
x = linsolve(a,b)
y = a\b
%% 
% *STUDENT ANSWER*
% 
% x = 1, y = 2, z = 0
% 
% 
%% Part 3
% Example
% Solving a system of linear equations using the inverse method (this will be 
% covered later in the course lectures)

% defines a 3x3 matrix with random integers
A = randi(3, 3)
% gives the inverse of the matrix A
inv(A)
% gives the rank of the matrix
rank(A)
% gives the structural rank - useful when a number of elements are zeros,
% used for sparse matrix
sprank(A)
% example with sprank
C = sparse([1, 2, 3], [1, 2, 4], [10, 20, 30], 5, 5)
sprank(C)
% ------------------------
% Practice problem
% 1. Calculate the solution of the system of linear equations given in Problem 
% 2 using the inverse function as: $x=\left(A^{-1} \right)b$

A = [2, 1, 1;-1, 1, -1;1, 2, 3];
B = [2;3;-10];
x = inv(a)*b
%% 
% 
%% Part 4
% Using a "for" loop to iteratively perform operations
% 
% Resource for "for" loop : <https://www.mathworks.com/help/matlab/ref/for.html 
% https://www.mathworks.com/help/matlab/ref/for.html>
% 
% 
% Example
% Here are a few methods to perform "for" loops:
%% 
% # Run with each next element. 
%% 
% for i = 1:10
% 
% k = i^2
% 
% end
% 
% 2.     Run with a known difference
% 
% for i = 10:-0.5:1 
% 
% k = i^2
% 
% end
% 
% 3.     Run over a vector
% 
% for i = [1, 2, 3, 4, 5]
% 
% k = i^2
% 
% end
% 
% 
% ------------------------
% Practice problem
% 1. Using a "for" loop, calculate the function x^2+x+1 for x in range 1 to 
% 100. Plot the result. 

x = [];
y = [];
for i = 1:100
    x(i,1) = i;
    y(i,1) = i^2+i+1;
end
plot(x,y)