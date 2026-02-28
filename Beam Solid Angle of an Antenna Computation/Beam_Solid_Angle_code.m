clc;
close all;
clear all;

tmin = input('The lower bound of theta in degree= ');
tmax = input('The upper bound of theta in degree= ');
pmin = input('The lower bound of phi in degree= ');
pmax = input('The upper bound of phi in degree= ');

% Angle vectors (convert to radians)
theta = (tmin:tmax) * pi/180;
phi   = (pmin:pmax) * pi/180;

% Angular increments
dth = theta(2) - theta(1);
dph = phi(2) - phi(1);

[THETA,PHI] = meshgrid(theta,phi);

% Field pattern
x = input('The field pattern : E(THETA,PHI)= ');
x = cos(THETA);

% Power pattern
v = input('The power pattern: P(THETA,PHI)= ','s');
P = cos(THETA).^2;

% Beam Area Calculation
Prad = sum(sum(P .* sin(THETA))) * dth * dph;

% Display Input Parameters
fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta =%2.0f',tmin);
fprintf(' : %2.0f',dth*180/pi);
fprintf(' : %2.0f',tmax);
fprintf('\n Phi =%2.0f',pmin);
fprintf(' : %2.0f',dph*180/pi);
fprintf(' : %2.0f',pmax);
fprintf('\n POWER PATTERN : %s',v)

% Display Output
fprintf('\n \n Output Parameters: \n-------------------- ');
fprintf('\n BEAM AREA (steradians) = %3.2f',Prad);
fprintf('\n');