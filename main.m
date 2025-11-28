%% ========================================================================
%% INITIALISATION =========================================================
clear;close all;clc;
%% ========================================================================

% Chargement des parametres
[L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit;
% Parametres intermediaires
[A,C,N0,Def]=ParamInter(R,L,ro,E,Note);
% Domaine modal
[n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C);
% Domaine spatial
[ds,s,Ns]=DomaineSpatial(Lamb,L,R);
% Domaine temporel
[dt,t,Nt,tmax]=DomaineTemporel(Per,L);
% Rq : dans une phase de bebeugage, il faut que [Nt,Ns,Nw] aient des valeurs 
% raisonnables (<=1000) et si possible distinctes.
disp(['[Nt,Ns,Nw]=[' num2str([Nt,Ns,Nw]) ']'])

%% ========================================================================
%% ANALYSE MODALE =========================================================

%Pour l'affichage, Aff(1) renvoie vers la première valeur du tableau Aff,
%soit 0. Ainsi, les fonctions appellées avec Aff(1) ne sont pas affichées,
%les autres sont affichées à la figure n-1 pour aff(n) dans la fonction.

% Modes propres
Y=ModePropre(kn,s,Nw,Aff(1));
% Amplitude modale
[an,bn]=AmplitudeModale(L,el,kn,wn,n,H,Aff(1));
% Fonction en temps
T=FctTemporelle(Nw,wn,an,bn,t,Aff(1));
% Deplacement
u=FctDeplacement(Y,T);

%% ========================================================================
%% VALORISATION ==========================================================
Type=1;Illustration(Type,u,s,t,Nt,L,H)
%Type=2;Illustration(Type,u,s,t,Nt,L,H)
%Type=3;Illustration(Type,u,s,t,Nt,L,H)
% D'autres valorisations peuvent etre envisagees, quelques propostion
% Film ?
% Son ?
% Autre ?