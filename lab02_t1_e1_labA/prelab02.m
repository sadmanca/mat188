%% Pre-lab A: Matrices
%% Exercise 1 
% 
% Example
% Create a 2D matrix with random elements and perform operations on the matrix. 

a = randi(4, 5)
b = a+2
c = a+b
d = a*c'
% Practice problem
% Create 2D matrices A and B of size 3x4 with random elements. Perform the following 
% operations on the matrix.

a = randi(3, 3, 4)
b = randi(3, 3, 4)
%% 
% a. Find the matrix A + B.

aplusb = a + b
%% 
% b. Create a matrix D and find the matrix A*D.

d = randi(3, 4, 3)
atimesd = a*d
%% 
% c. Multiply A and B, element-by-element.

atimesb = a.*b
%% 
% d. Create a 1D matrix C of size 4x1. Try subtracting the 1D matrix from A*B' 
% as A*B' - C. 
% 
% How do you think that would work?

c = [1;2;3;4]
%a*b'-c
%% 
% 
%% Exercise 2
% Example
% Create a square matrix. Perform a transpose, calculate the determinant and 
% perform matrix multiplication.

a = [1, 2, 3;4, 5, 6; 7, 8, 9]
% transpose of a
b = a'
% matrix multiplication of a and b, the dimensions must match
c = a*b
% calculating the determinant of a
D = det(c)
%% 
% 
%% Exercise 3
% Example
% Reference the elements of a matrix. Perform operations on individual elements, 
% rows and columns. Modify the matrix: add/remove columns. 

a = [1, 2, 3;4, 5, 6; 7, 8, 9]
%% 
% Reference an element on mth row and nth column:

a(2, 3)
a(3, 3)
%% 
% Perform operation on individual column or row:

a(:, 2) = a(:, 2)+2
a(2, :) = a(2, :)*5
%% 
% Add a row/column to another row/column:

a(:, 2) = a(:, 2)+a(:, 3)
a(1, :) = a(1, :)+a(2, :)
%% 
% Assigning the modified column/row to the array:

a(:, 2) = a(:, 2)+a(:, 3)
a(2, :) = a(2, :)*5
%% 
% Create a sub-matrix (can be used to delete a row/column). Concatenate a new 
% column:

b = a(1:2, 2:3)
%% 
% Add a row/column:

c = [1,2,3]
c(4,:) = [10, 20, 30]
c(:, 4) = [10; 20; 30; 50]
a = [1,1,1;2,2,2;3,3,3]
c = [a; [10, 20, 30]] % add vertically in matrix a
c = [a [10; 20; 30]] % add horizontally in matrix a
% Practice problems
% 1. Create a random matrix A of size (3x4) and show the answers for following 
% operations:

a = randi(3, 3, 4)
%% 
% a. Add twice Row 2 to Row 3.

a(3,:) = 2*a(2,:) + a(3,:) 
%% 
% b. Subtract Row 1 from 3*Row 2.
% 
% c. Add "(Column 4)/2" to the matrix as the fifth column

a(:,5) = a(:,4)/2
%% 
% . 
% 
% d. Create a sub-matrix of 2x2 from the matrix and add zeros to make the size 
% equal to that of A.

[a(1:2,1:2) [1;2]] 
%% 
% 2. Create a matrix A of random elements of size 4x5 and show the following 
% results:
% 
% a. Find the transpose of A.
% 
% b. Print the element A13 of the transpose of A.
% 
% c. Print the third row of the transpose of A.
% 
% d. Print the second column of the transpose of A.
% 
% e. Find the determinant of A. 

% perform your work here
%% 
% 
%% Exercise 4
% Example
% Create matrix of given size (4x5)

% make a matrix of zeros of size (4x5)
% creates a matrix of given size with each element equal to 0
a = zeros(4,5)
% make a matrix of ones of size (4x5)
% creates a matrix of given size with each element equal to 1
b = ones(4,5)

% square matrix of given size
% c = eye(3)
% creates an identity matrix of size 3, with diagonal elements of 1.
c = eye(3)
% create a sparse matrix
% c = sparse(a, b, v)
% here the vectors "a and "b" represent the location of the elements, and
% vector "v". 
d = sparse([1, 2, 3], [1, 2, 4], [10, 20, 30])
% Also, you can make the matrix of any size mxn by adding them
% as the 4th and 5th argument. 
e = sparse([1, 2, 3], [1, 2, 4], [10, 20, 30], 5, 5)
% show the fill sparse matrix
full(d)
full(e)
% Practice problems
%% 
% # Create the matrix of size 4x4 with the diagonal elements as 5 and the rest 
% of them 10 as below using above functions and matrix operations. 
%% 
% $$\left\lbrack \begin{array}{cccc}5 & 10 & 10 & 10\\10 & 5 & 10 & 10\\10 & 
% 10 & 5 & 10\\10 & 10 & 10 & 5\end{array}\right\rbrack$$

% perform your work here
%% 
% 2. Create a matrix of size 3x5 with the all ones other than two elements as 
% shown below using above functions and matrix operations. 
% 
% $$\left\lbrack \begin{array}{ccc}1 & 1 & 1\\1 & 1 & 1\\1 & 4 & 1\\1 & 1 & 
% 5\\1 & 1 & 1\end{array}\right\rbrack$$

% perform your work here
%% 
% 
%% Exercise 5
% 
% 
% Plotting multiple datasets with different linestyles, markers and colors. 
% Example 
% plot(x1, y1, 'ro')
% 
% hold on
% 
% plot(x2, y2, 'k-')
% 
% hold off
% 
% Here, r and k refer to the colors red and black while "o" and "-" refer to 
% the marker type. Other types of colors and markers can be found in the LineSpec 
% section here <https://www.mathworks.com/help/matlab/ref/linespec.html Line specification 
% - MATLAB LineSpec (Line Specification) (mathworks.com)> and <https://www.mathworks.com/help/matlab/ref/plot.html 
% 2-D line plot - MATLAB plot (mathworks.com)>. The hold on is used to hold the 
% figure while plotting the next plot. Use Hold off after adding all the plots 
% in the figure. 
% Practice problem
% Plot the following three functions on the same plot with different colors 
% and markers. 
% 
% f1(x) = sin(x)
% 
% f2(x) = 2*sin(x)
% 
% f3(x) = 3*sin(x)

% perform your work here