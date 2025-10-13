function [L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit

L=1;            % Longueur [m]
R=0.001;        % Rayon [m]
% A=pi*R^2;       % Aire [m^2]
% Materiau : acier
E=210e9;        % Module de Young [Pa]
ro=7800;        % Masse volumique [kg/m^3]
% Tension : corde accordée sur le la-440
Note=440;       % Fréquence fondamentale [Hz]
% C=2*L*Note;     % Celerité [m/s] <<FAUX>>
% N0=ro*A*C^2;    % Tension [N]
% Def=N0/(E*A);   % Deformation [~]
el=L/6;         % Position de l'impact[m]
Nw=nmax;
Aff=1;
H=L/5;
