%   ELIENEZA NICODEMUS ABELLY.
%   2 January, 2024
%   Version 1
%   ---------------------------------------------------------------
%   Function Name:  ReadData - read in data files and parameters

function ReadData()

global informations
% Read in problem data
%run /Users/Donald/Documents/MATLAB/Application/inform; 
run ('D:\paper three\J-FUNCTION\graph\GMDH\gmdh-dde\inform.m');
tic
clc

global metofcal          % metofcal=1
global N_pop             % N_pop=50%input('no pop:');
global N_HL              % N_HL=2%input('Hidden Layer:');
global pmm               % pmm=.1%input('Mutation prob:'); 
global N_Generation      % N_Generation=150%input('Generation:') 
global N_Prediction      % N_Prediction=5%input('Prediction:'); 
global first_seed        % first_seed=-400%input('seed:');
global CR                % Crossover constant
global F                 % Scaling factor

% Read in input Data
%[metofcal, N_pop, N_HL, pmm, N_Generation, N_Prediction, first_seed, CR, F ] = textread('/Users/Donald/Documents/MATLAB/Application/mydata.dat', ...
%'%d %d %d %f %d %d %d %f %f', 1)
[metofcal, N_pop, N_HL, pmm, N_Generation, N_Prediction, first_seed, CR, F ] = textread("D:\paper three\J-FUNCTION\graph\GMDH\gmdh-dde\mydata.dat")

clc


