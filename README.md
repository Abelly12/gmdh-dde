# Discrete Differential Evolution (DDE) in MATLAB

## Overview

Discrete Differential Evolution (DDE) is a modified version of the traditional Differential Evolution (DE) algorithm. It is a stochastic population-based optimization method that is tailored for discrete problem spaces. Implementing DDE in MATLAB enables efficient solving of complex combinatorial and discrete optimization problems, which are frequently encountered in areas like logistics, scheduling, and network design.
## Why Use DDE?
The DDE method maintains the benefits of the classical DE approach, such as its simplicity, user-friendliness, and strong ability to optimize globally. It also incorporates mechanisms to effectively handle discrete variables. This makes it suitable for:

Optimization problems where decision variables are integers or categorical.
Challenges that call for precise combinatorial arrangements, such as sequencing or routing.
Instances where conventional optimization techniques based on gradients prove ineffective due to the inherent characteristics of the problem domain.
Preparation
Prior to utilizing the DDE algorithm in MATLAB, it is essential to have MATLAB installed without any specific toolboxes needed for the fundamental functionality of DDE.

Implementing Discrete Differential Evolution
Here is a basic MATLAB function to begin working with DDE. This example assumes you are working on a problem that involves solving a discrete optimization problem. The goal is to minimize a straightforward cost function.

## Setup

Before you can begin using the DDE algorithm in MATLAB, make sure you have MATLAB installed with no specific toolboxes required for the basic functionality of DDE.

### Implementing Discrete Differential Evolution

simple MATLAB function to get started with DDE. This example assumes you are solving a discrete optimization problem where the objective is to minimize a simple cost function.

```matlab
function [bestSolution, bestCost] = discreteDE(popSize, dim, maxGen, costFunction)
    % Parameters
    CR = 0.9; % Crossover probability
    F = 0.5;  % Differential weight

    % Initialize population
    pop = randi([0, 1], popSize, dim); % Binary variables example
    cost = zeros(popSize, 1);
    for i = 1:popSize
        cost(i) = costFunction(pop(i, :));
    end

    % Evolution loop
    for gen = 1:maxGen
        for i = 1:popSize
            % Mutation and Crossover
            idxs = randperm(popSize, 3);
            while any(idxs == i)
                idxs = randperm(popSize, 3);
            end
            
            x1 = pop(idxs(1), :);
            x2 = pop(idxs(2), :);
            x3 = pop(idxs(3), :);

            % Mutation
            mutant = x1 + F * (x2 - x3);
            mutant = round(sigmoid(mutant)); % Sigmoid to squash values and round to nearest integer (0 or 1)

            % Crossover
            trial = pop(i, :);
            mask = rand(1, dim) < CR;
            trial(mask) = mutant(mask);

            % Selection
            trialCost = costFunction(trial);
            if trialCost < cost(i)
                pop(i, :) = trial;
                cost(i) = trialCost;
            end
        end

        % Track the best solution
        [bestCost, idx] = min(cost);
        bestSolution = pop(idx, :);
        
        % Display progress
        fprintf('Generation %d: Best Cost = %.2f\n', gen, bestCost);
    end
end

function y = sigmoid(x)
    y = 1 ./ (1 + exp(-x));
end
```

### Usage Instructions

1. **Define Your Cost Function**: Create a cost function specific to your problem. For instance, if you’re solving a routing problem, your cost might be the total distance traveled.

    ```matlab
    function cost = myCostFunction(solution)
        % Calculate the cost of the solution here
        cost = sum(solution); % Simplified example
    end
    ```
2. **Run the DDE Algorithm**:
    ```matlab
    % Set parameters
    populationSize = 50;
    dimensions = 10; % Number of binary decision variables
    maxGenerations = 100;
    
    % Execute the DDE
    [bestSol, bestCost] = discreteDE(populationSize, dimensions, maxGenerations, @myCostFunction);
    ```

3. **Evaluate and Utilize Results**: The output `bestSol` is the best found solution, and `bestCost` is its corresponding cost.
