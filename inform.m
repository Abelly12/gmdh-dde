
% Specify the filename as a string
filename = 'data11.xlsx';  % Update with the path to your Excel file if it's not in the current directory

% Detect the import options based on the Excel file
opts = detectImportOptions(filename);

% Set VariableNamingRule to 'preserve' to keep original headers
opts.VariableNamingRule = 'preserve';

% Use readtable with the detected options to read the data
informations = readtable(filename, opts)
