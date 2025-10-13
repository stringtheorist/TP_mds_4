function [n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C)
	% Domaine modal
	nmax=10;        % Nombre maximal de mode considéré      
	n=(1:nmax)';    % Indices modaux
