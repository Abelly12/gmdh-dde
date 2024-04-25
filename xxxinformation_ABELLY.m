
%   Please, Insert your Experimental Results in a matrix,
  

%   that, column of matrix are :
%       Column 1 : Index of Experiment
%       Column 2 to n+1 ( n: number of inputs for Experiments) : Experiment Inputs  
%       Column n+2 ( or last column ) : Output of Experiment

%   and rows of this matrix are equal to number of Experiment .

%   You must be nmaed this matrix, " informatioins "

%4	56.94538693	62.8486321	38.91312226	40	25


% Specify the filename as a string
filename = 'data11.xlsx';  % Update with the path to your Excel file if it's not in the current directory

% Detect the import options based on the Excel file
opts = detectImportOptions(filename);

% Set VariableNamingRule to 'preserve' to keep original headers
opts.VariableNamingRule = 'preserve';

% Use readtable with the detected options to read the data
informations = readtable(filename, opts);

% Convert the table to a matrix, assuming all columns are numeric
% This step assumes all data in the table is suitable for a numeric matrix.
% If there are non-numeric columns, use the table2array selectively as shown later.

% Determine which columns are numeric
numericColumns = varfun(@isnumeric, informations, 'OutputFormat', 'uniform');

% Convert only the numeric columns to a matrix
matrixData = table2array(informations(:, numericColumns));

% Output the matrix
disp(matrixData);
