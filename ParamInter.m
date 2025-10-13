function [A,C,N0,Def]=ParamInter(R,L,ro,E,Note)
	% Geometrie : section cicrculaire
	L=1;            % Longueur [m]
	R=0.001;        % Rayon [m]
	A=pi*R^2;       % Aire [m^2]
	% Materiau : acier
	E=210e9;        % Module de Young [Pa]
	ro=7800;        % Masse volumique [kg/m^3]
	% Tension : corde accordée sur le la-440
	Note=440;       % Fréquence fondamentale [Hz]
	C=2*L*Note;     % Celerité [m/s] <<FAUX>>
	N0=ro*A*C^2;    % Tension [N]
	Def=N0/(E*A);   % Deformation [~]
