%   ELIENEZA NICODEMUS ABELLY.
%   2 January, 2024
%   Version 1
%   ---------------------------------------------------------------
%   Function Name:  finjac

function J = finjac(FUN,r,x,epsx)

echo off
rc = r(:);
lx = length(x);
J  = zeros(length(r),lx);
for k = 1:lx
    dx = .25*epsx(k);
    xd = x;
    xd(k) = xd(k)+dx;
    rd = feval(FUN,xd);

    J(:,k)=((rd(:)-rc)/dx);
end