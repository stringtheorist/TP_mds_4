function [L,C,H,el,Nw,Aff,R,N0] = Param(typecorde)

[L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit(typecorde);

A=pi*R^2; % Aire [m^2]
C=2*L*Note;     % Celerité [m/s] 
N0=ro*A*C^2;    % Tension [N] 
Def=N0/(E*A);   % Deformation [~] 




end