%   ELIENEZA NICODEMUS ABELLY.
%   2 January, 2024
%   Version 1
%   ---------------------------------------------------------------
%   Function Name:  getAV

function [A,v] = getAv(FUN,JAC,x,r,epsx)

echo off
if isa(JAC,'function_handle')
    J = JAC(x);
else
    J = feval(JAC,FUN,r,x,epsx);
end
A = J'*J;
v = J'*r;