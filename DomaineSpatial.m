function [ds,s,Ns]=DomaineSpatial(Lamb,L)
	% Domaine spatial
	ds=R;         % Pas en espace [m]
	s=0:ds:L;       % Echantillonage spatial [m]
	Ns=length(s);   % Nombre de points d'échantillonages en espace


