%   ELIENEZA NICODEMUS ABELLY.
%   2 January, 2024
%   Version 1
%   ---------------------------------------------------------------
%   Function Name:  DE Forward Transformation

function DERealPopulation = DEForwardTransformation(DEPop,PopSize,PopDimension)

for PopIter = 1:PopSize
    for IndiIter = 1:PopDimension
        DERealPopulation(PopIter,IndiIter) = -1 + ((DEPop(PopIter,IndiIter) * 500)/999);
    end
end
