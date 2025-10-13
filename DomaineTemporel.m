function [dt,t,Nt,tmax]=DomaineTemporel(Per,L)
	% Domaine temporel
	dt=2*pi/(wmax/2);   % Pas en temps [s]
	tmax=2*pi/(dw);% Temps maximum de la simulation [s]
	t=0:dt:tmax;    % Echantillonage temporel [s]
	Nt=length(t);   % Nombre de points d'échantillonages en temps
