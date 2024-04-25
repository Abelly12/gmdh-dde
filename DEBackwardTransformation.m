%   ELIENEZA NICODEMUS ABELLY.
%   2 January, 2024
%   Version 1
%   ---------------------------------------------------------------
%   Function Name:  DE Backward Transformation

function DEDiscretePopulation = DEBackwardTransformation(DEPop,PopSize,PopDimension)

for PopIter = 1:PopSize
    for IndiIter = 1:PopDimension
        DEDiscretePopulation(PopIter,IndiIter) = round(((1 + DEPop(PopIter,IndiIter)) * 999 ) / 500); 
    end
end
