function [A,C,N0,Def]=ParamInter(R,L,ro,E,Note)
	
	% Materiau : acier

	% Tension : corde accordée sur le la-440
	A=pi*R^2;
	C=2*L*Note;     % Celerité [m/s] <<FAUX>>
	N0=ro*A*C^2;    % Tension [N]
	Def=N0/(E*A);   % Deformation [~]
