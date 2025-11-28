function [t]=DomaineTemporel(Per,L)
% [dt,t,Nt,tmax]=DomaineTemporel(Per,L)
	% % Domaine temporel
dt=min(Per)/20; % Pas en temps [s]
tmax=max(Per)*2;% Temps maximum de la simulation [s]
t=0:dt:tmax;    % Echantillonage temporel [s]
