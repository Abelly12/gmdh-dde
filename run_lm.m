%   ELIENEZA NICODEMUS ABELLY.
%   2 January, 2024
%   Version 1

%   ---------------------------------------------------------------
%   Function Name:  run_lm
function [a]=run_lm(xin,qwe,A,u,v,a) 
echo off

global informations
[cs,rs]=size(informations); 
yexp=informations(:,rs);

w=1:qwe;
w=w';
u;
v;

size(xin);

yexp(w)=(yexp(w))';
res=@(x)(A*[x(1);x(2);x(3);x(4);x(5);x(6)])-yexp(w);

size(res);

x0=[a]; 
[x]=LMFnlsqman(res,x0,'Display',0,'MaxIter',50); 

a=x';