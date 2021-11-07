%% Working with data in MATLAB
%% W6 - Topic 2 - Exercise 2
% 
% 
% Imagine you are analyzing air traffic control data for NAV Canada. They've 
% asked you to analyze one single moment in time of radar data on a busy morning 
% around Toronto.
%% Data tables
% Loading tabular data
% While flying, airplanes broadcast a "squawk code", a 4 digit number identifying 
% the plane that appears on radar screens. But most of the time, we want to use 
% that code to display other information about the flight (ie. flight number, 
% airplane type), and because we're lazy, we're going to tell MATLAB to do the 
% work for us!
% 
% 
% 
% *First, let's load in data about the location of planes and their squawk code.*
%% 
% * Use |readtable| to load |radardata.csv| from |https://raw.githubusercontent.com/dtxe/mat188_datasets/main/radardata.csv|
% * Store this into a variable named |radardata|.

radardata = readtable('https://raw.githubusercontent.com/dtxe/mat188_datasets/main/radardata.csv');    % <<< complete this line
%% 
% Whenever we load data in, it's always good to double check that it is loaded 
% properly. We can display the first few rows using the |head| command.

disp(head(radardata));    % <<< complete this line
%% 
% 
% 
% *Next, let's load in data about flights and their corresponding squawk codes.* 
%% 
% * Load |flightdata.csv| from |https://raw.githubusercontent.com/dtxe/mat188_datasets/main/flightdata.csv|
% * ... into the variable |flightdata| and ...
% * ... display the last few rows using the |tail| command to ensure the data 
% is properly loaded.

%%% complete the following code %%%
flightdata = readtable('https://raw.githubusercontent.com/dtxe/mat188_datasets/main/flightdata.csv');
disp(head(flightdata));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% 
% Sorting
% The flight data is looking a little haphazard. Suppose we want to find the 
% biggest planes because we need to pay special attention to them.
% 
% Let's use the |sortrows| function to *sort the* |flightdata| *table* by the 
% plane's weight in _descending order_.

sorted_flightdata = sortrows(flightdata,"weight","descend");   % <<< complete this line
%% 
% 
% 
% Next, display the first 15 rows in the sorted table.

disp(sorted_flightdata,15) % <<< complete this line
%% 
% 
% Combining information from multiple tables
% Notice that the radar data contains location information but no airplane information, 
% while the flight data table contains airplane information but not their location. 
% Now, let's harness the power of MATLAB to combine this information together 
% into one table!
% 
% Using the |join| command, *combine |radardata| and |flightdata| using the 
% squawk code as the _key.*_ Store the results into |enhanced_radardata|.
%%
% 
%   combined_table = join(table1, table2, 'Keys', 'name_of_key');
%

enhanced_radardata = join(radardata,flightdata,"Keys","squawk");   % <<< complete this line
%% 
% 
% 
% Let's take a look at the combined data using the |display| command.

display(enhanced_radardata);
%% 
% 
% 
% Notice how MATLAB used a common identifier / linking variable / the _key_, 
% to cross-reference and combine the data from both tables together. _This is 
% a very powerful tool!_
% 
% 
% Selecting a subset of data
% You can index a table in a similar manner to any MATLAB array.
%%
% 
%   small_table = big_table(15:30, :);   % get rows 15 to 30 in the table
%   small_table = big_table( big_table.value > 100, : )   % get all rows where value is > 100
%
%% 
% Now it's your turn! *Select all planes larger than 50 000 kg* from |enhanced_radardata| 
% and store them into the variable |bigplanes|, and store the rest into the variable 
% |smallplanes|.

%%% complete the following code %%%
bigplanes = enhanced_radardata(enhanced_radardata.weight > 50000, :)
smallplanes = enhanced_radardata(enhanced_radardata.weight < 50000, :)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% 
%% Polar plots
% Using the enhanced radar data, let's visualize the position of all the planes.
% 
% 
% Data check!!
% Look up the MATLAB documentation for the polarscatter command.
% 
% 
% 
% What units does it expect the data (specifically the angle data) to be in? 
% 
% *Radians*
% 
% What units are available in our dataset?
% 
% *Degrees*
% 
% 
% 
% *If the units are not appropriate*, convert them below. These functions may 
% be useful.
%%
% 
%   rad_data = deg2rad(deg_data);   % convert degrees to radians
%   deg_data = rad2deg(rad_data);   % convert radians to degrees
%

%%% your code here, if necessary %%%
enhanced_radardata.angle_receiver = deg2rad(enhanced_radardata.angle_receiver);
bigplanes.angle_receiver = deg2rad(bigplanes.angle_receiver);
smallplanes.angle_receiver = deg2rad(smallplanes.angle_receiver);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% 
% Basic polar plots
% Because each plane is an individual data point, it makes more sense to visualize 
% them in a scatterplot. 
%% 
% * Using the |polarscatter| command, *plot the location of each plane* relative 
% to the radar transmitter using the data from |enhanced_radardata|. 
% * Assume the radar transmitter is located at the origin. ie. $\left(\theta 
% =0,r=0\right)$

figure;   % create a new figure

%%% complete the following code %%%

polarscatter(enhanced_radardata.angle_receiver,enhanced_radardata.distance_receiver)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% 
% Polar plots with legend
% As we mentioned above, we want to pay special attention to big planes so let's 
% plot them in a different colour.
% 
% Using the |hold| and |polarscatter| commands and the |bigplanes| and |smallplanes| 
% subsetted data tables you obtained above, *visualize big planes with a different 
% shape and in a different colour*.

figure;    % create a new figure

%%% enter your code below %%%
polarscatter(bigplanes.angle_receiver,bigplanes.distance_receiver,20,"red","filled")
hold
polarscatter(smallplanes.angle_receiver,smallplanes.distance_receiver,5,"blue","filled")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
% 
%% Polar coordinates and transformations
% Uh oh, based on our plot above, it looks like some of the big planes might 
% be too close to each other! Big planes must stay at least 9260 m apart, but 
% it's hard to tell for sure if we are only looking at the graph.
% 
% Let's use the power of math to calculate the distance between them and check 
% if all the big planes are abiding by the minimum separation distance. However, 
% our data is currently in polar coordinates and computing the (Cartesian) distance 
% is rather complicated. To make things easier, let's convert the plane positions 
% into Cartesian coordinates first. 
% 
% Using the |pol2cart| command, *convert the location of the big planes into 
% Cartesian coordinates* and store the results into |bigplanes.x| and |bigplanes.y|.

[bigplanes.x, bigplanes.y] = pol2cart(bigplanes.angle_receiver,bigplanes.distance_receiver);   % <<< complete this line
pol2cart(-2.3934,45721)
disp(head(bigplanes))   % print the table just to check
% Plot to confirm
% Let's check that our conversion worked properly.
% 
% *Make a scatter plot using* |bigplanes.x| *and* |bigplanes.y| *in Cartesian 
% coordinates.*

%%% your code here %%%
figure
scatter(bigplanes.x,bigplanes.y)

%%%%%%%%%%%%%%%%%%%%%%
% Cartesian distances
% Next, using a nested for-loop, compute the distances between each pair of 
% big planes and store the _adjacency matrix_ into variable |separation_dists|.
% 
% Hint: $d=\sqrt{\Delta x^2 +\Delta y^2 }$

num_big_planes = height(bigplanes);   % how many big planes do we have
separation_dists = zeros(num_big_planes, num_big_planes);    % initialize adjacency matrix

% loop through each pair of planes
for plane1 = 1:num_big_planes
    for plane2 = 1:num_big_planes

        separation_dists(plane1, plane2) = sqrt((bigplanes(plane1,:).x-bigplanes(plane2,:).x)^2+(bigplanes(plane1,:).y-bigplanes(plane2,:).y)^2);     % <<< complete this line
        
    end
end
% Summarizing an array
% Finally, using the |any| command, *check if any of the separation distances 
% are under 1.5 nautical miles (2778 m), but greater than 0 m* because each plane 
% is by definition, 0 m from itself.
% 
% Hint: According to the MATLAB documentation, the |any| command usually operates 
% along the first array dimension (ie. down each column), but we want to look 
% throughout the entire matrix. Use the |'all'| argument to flatten the matrix.
%%
% 
%   ex = [0, 0, 1; 
%         1, 0, 1;];
%   
%   any(ex)          % returns [1 0 1]
%   any(ex, 'all')   % returns 1
%

%%% your code here %%%
dist_violations = any(separation_dists > 2278, 'all');
any_sep_dist_violations = any(dist_violations, 'all');
%%%%%%%%%%%%%%%%%%%%%%
%% 
%