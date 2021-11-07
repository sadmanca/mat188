%% Working with data in MATLAB
%% W6 - Topic 2 - Exercise 2
% 
%% README
% In this prelab, I've already included a lot of the code for each operation. 
% I encourage you to try editing the code for yourself, and seeing how you can 
% change and adapt these examples!
%% Keeping track of multiple variables together
% Recall from Exercise 1, we computed the sine and cosine at equally spaced 
% intervals and plotted them together.

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
% Combining matrices (vectors) into a table
% Notice also, that these variables are related to each other. It is useful 
% to place these variables into a table so we can keep track of them together.

data = table();
data.x = x;
data.sinx = y1;
data.cosx = y2;
%% 
% 
% 
% Here are the first few rows of the new table:

first_few_rows = head(data);
display(first_few_rows)
%% 
% Although in table format, all the variables maintain their shape (and type). 
% They continue to be 50 x 1 matrices of numbers.

summary(data)
%% 
% 
% 
% You can also view the table by double-clicking on the table variable the MATLAB 
% Workspace:
% 
% 
% 
% 
% 
% Finally, we can also plot the data from the table:

figure;
plot(data.x, data.sinx, data.x, data.cosx)
legend(["sin(x)", "cos(x)"])
%% 
% 
%% Manipulating data tables
% *Reference:* <https://www.mathworks.com/help/matlab/matlab_prog/access-data-in-a-table.html 
% Access Data in Tables - MATLAB & Simulink (mathworks.com)>
% 
% Tables in MATLAB are a neat way to work with datasets. It's a convenient format 
% for many types of datasets like results of experiments or timeseries (ie. stock 
% prices over time).
% 
% 
% 
% In this case, let's load some data from a botanical observational experiment 
% where a researcher measured various Iris flowers in the wild.

flower_measurements = readtable('https://raw.githubusercontent.com/mwaskom/seaborn-data/master/iris.csv');
flower_measurements.species = categorical(flower_measurements.species);
display(head(flower_measurements))
%% 
% 
% 
% We can index tables similar to MATLAB matrices. This will select the first 
% 5 rows. This is useful for sampling some of the raw data as a double-check that 
% we loaded the correct dataset, and loaded the dataset correctly.

flower_measurements(1:5,:)
%% 
% 
% 
% *Use your knowledge of MATLAB indexing to select the last 5 rows of the table:*

% <<< complete this line
flower_measurements(end-4:end,:)
%% 
% 
% 
% We can also generate some quick summary statistics on the table:

summary(flower_measurements)
%% 
% 
% 
% Let's find out how many different species of flowers were measured:

unique(flower_measurements.species)
%% 
% 
% 
% We can also assign new variables in the table. In this case, all the length 
% measurements are in inches, but since we're in Canada, we should convert them 
% to metric.

flower_measurements.petal_width_cm = flower_measurements.petal_width * 2.54;
flower_measurements.sepal_length_cm = flower_measurements.sepal_length * 2.54;
flower_measurements.sepal_width_cm = flower_measurements.sepal_width * 2.54;

head(flower_measurements)  % show first few rows to check we did the calculation correctly
%% 
% *Your turn: convert the* |petal_length| *variable to centimeters and store 
% this into the variable* |petal_length_cm|*:*

% <<< complete this line
flower_measurements.petal_length_cm = flower_measurements.petal_length * 2.54;
head(flower_measurements)
%% 
% 
% Visualization
% Finally, we can run analyses like plotting the different variables against 
% each other:

figure;
scatter(flower_measurements, "sepal_length_cm", "sepal_width_cm")
title('Iris flower measurements')
ylabel('Petal Width (cm)')
xlabel('Petal Length (cm)')
%% 
% Notice how there seems like there are two distinct "blobs" of points. Recall 
% that there were 3 different species of Iris flowers. Perhaps we should plot 
% them in different colours.

figure;
%                                                                    ↓↓↓↓↓↓↓  NEW  ↓↓↓↓↓↓↓
scatter(flower_measurements, "sepal_length_cm", "sepal_width_cm", "ColorVariable", "species")
title('Iris flower measurements')
ylabel('Petal Width (cm)')
xlabel('Petal Length (cm)')
%% 
% 
% 
% This new plot is a lot more meaningful!
% 
% 
% 
% *Your turn: Plot the Sepal length vs the Petal length.*
%% 
% # Make a basic plot of just the length values, with nothing fancy.
% # Next, colour each dot based on the species. Bonus: vary the shape by species 
% as well!
% # Finally, try adjusting the size of each dot based on the petal width.

figure;
%%% your code below %%%
scatter(flower_measurements, "petal_length_cm", "sepal_length_cm")
title('Iris flower measurements')
ylabel('Sepal Length (cm)')
xlabel('Petal Length (cm)')

figure;
%%% your code below %%%
s = scatter(flower_measurements, "petal_length_cm", "sepal_length_cm", "ColorVariable", "species")
s.SizeData = flower_measurements.petal_width_cm
title('Iris flower measurements')
ylabel('Sepal Length (cm)')
xlabel('Petal Length (cm)')
%%%%%%%%%%%%%%%%%%%%%%%
%% 
% 
%% Polar coordinates and transformations
% Although we can do this using transformation matrices as you will learn in 
% lecture, we can use MATLAB to convert between cartesian and polar coordinates.
% 
% Some useful functions:
%%
% 
%   % Cartesian conversion
%   [theta, rho] = cart2pol(x, y);   % convert from the cartesian coordinate system to polar coordinates
%   [x, y] = pol2cart(theta, rho);   % convert from polar to cartesian
%   
%   % Trigonometric functions in radians
%   sin(theta), cos(theta), tan(theta)
%   
%   % Radians and degrees conversion
%   rad2deg(theta), deg2rad(theta)
%   
%   % Trignotometric functions in degrees
%   sind(theta), cosd(theta), tand(theta)
%
%% 
% 
% 
% Here, we define two points in Cartesian coordinates:

a = [1; 2];
b = [5; 3];
%% 
% 

% plotting
figure;
hold on
scatter(a(1), a(2))
scatter(b(1), b(2))

% draw axes for reference
axis([-7, 7, -7, 7]), set(gca, 'XAxisLocation', 'origin', 'YAxisLocation', 'origin', 'XTick', -7:7, 'YTick', -7:7)
%% 
% 
% 
% *Your turn: Represent these points in Polar coordinates and store them into 
% variables |a_theta, a_rho, b_theta, b_rho|:*

%%% your code here %%%%
[a_theta,a_rho] = cart2pol(a(1),a(2));
[b_theta,b_rho] = cart2pol(b(1),b(2));
%%%%%%%%%%%%%%%%%%%%%%%

% display your final results
display(a_theta), display(a_rho)
display(b_theta), display(b_rho)
%% 
% *Notice:* What units are theta in? Radians or degrees?
% 
% Radians: "Angular coordinate, returned as an array. |theta| is the counterclockwise 
% angle in the _x_-_y_ plane measured in radians from the positive _x_-axis. The 
% value of the angle is in the range |[-pi pi]|."
%% Polar plots
% Now we can try plotting these points in polar coordinates:

figure;
polarscatter(a_theta, a_rho)
hold on
polarscatter(b_theta, b_rho)
%% 
% *Change the cartesian coordinates above and rerun this code to see how the 
% values change!*
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
%