clc;
close all;
clear all;

% Input bounds
tmin = input('The lower bound of theta in degree= ');
tmax = input('The upper bound of theta in degree= ');
pmin = input('The lower bound of phi in degree= ');
pmax = input('The upper bound of phi in degree= ');

% Increment values and radian conversion
tinc = 2;
pinc = 4;
rad  = pi/180;

% Angle vectors
theta1 = (tmin:tinc:tmax);
phi1   = (pmin:pinc:pmax);

% Convert to radians
theta = theta1 .* rad;
phi   = phi1 .* rad;

% Create meshgrid
[THETA, PHI] = meshgrid(theta, phi);

% Field pattern input
y1 = input('The field pattern: E(THETA,PHI)= ');
v  = input('The field pattern: P(THETA,PHI)= ','s');

% Absolute value of field
y = abs(y1);

% Since omni antenna is constant, expand to matrix
y = y * ones(size(THETA));

% Maximum value
ratio = max(max(y));

% Convert spherical to Cartesian
[X,Y,Z] = sph2cart(THETA, PHI, y);

% Plot
mesh(X,Y,Z);
title('3 D Pattern','Color','b','FontName','Helvetica','FontSize',12,'FontWeight','demi');

fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta = %2.0f : %2.0f : %2.0f',tmin,tinc,tmax);
fprintf('\n Phi   = %2.0f : %2.0f : %2.0f',pmin,pinc,pmax);
fprintf('\n FIELD PATTERN : %s',v);
fprintf('\n\n Output is shown in the figure below----------- ');
fprintf('\n');