%% ========================================================================
%% INITIALISATION =========================================================
clear;close all;clc;
%% ========================================================================


typecorde = input('Choisissez le type de corde \n0 - entrez vos propres paramètres R/E/ro/note \n1 - Harpe (Boyau)\n2 - Guitare (Nylon)\n3 - Piano (Acier)\nVotre choix (0, 1, 2 ou 3) : \n');
TypeCL = input('Choissez vos CL \n1 - Fixé-Fixé \n2 - Fixé-Libre : \n\n'); 
disp('Le type de corde ne change pas les courbes/son !! Voir le compte-rendu pour plus de détail...');

%paramètres
[L,C,H,el,Nw,Aff,R,N0] = Param(typecorde);
fprintf('Tension calculée N0 = %.2f N \n', N0);

fprintf('\nMenu affichage\n');
fprintf('0 - rien\n');
fprintf('1 - juste analyse modale (Modes, Amplitudes, Temps)\n');
fprintf('2 - juste animation (Film du mouvement de la corde)\n');
fprintf('3 - Tout\n');

graph = input('Choisissez (0, 1, 2, 3) : ');

% Gestion de 'Aff' (Figures 1, 2, 3 : Intermédiaires)
if graph == 0 || graph == 2
    Aff = zeros(size(Aff)); 
end
% Domaine modal
[n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C,TypeCL);
% Domaine spatial
[ds,s,Ns]=DomaineSpatial(Lamb,L);
% Domaine temporel
[t,Nt]=DomaineTemporel(Per);
% Rq : dans une phase de bebeugage, il faut que [Nt,Ns,Nw] aient des valeurs 
% raisonnables (<=1000) et si possible distinctes.
disp(['[Nt,Ns,Nw]=[' num2str([Nt,Ns,Nw]) ']'])

%% ========================================================================
%% ANALYSE MODALE =========================================================

%Pour l'affichage, Aff(1) renvoie vers la première valeur du tableau Aff,
%soit 0. Ainsi, les fonctions appellées avec Aff(1) ne sont pas affichées,
%les autres sont affichées à la figure n-1 pour aff(n) dans la fonction.

% Modes propres
%Y=ModePropre(kn,s,Nw,Aff(2));
Y=ModePropre(kn,s,Aff(2),Nw);
% Amplitude modale
[an,bn]=AmplitudeModale(L,el,kn,wn,n,H,Aff(3));
% Fonction en temps
T=FctTemporelle(Nw,wn,an,bn,t,Aff(4));
% Deplacement
u=FctDeplacement(Y,T);

Son(u,t,typecorde);
%% ========================================================================
%% VALORISATION ==========================================================
Type=1;Illustration(Type,u,s,t,Nt,L,H,graph)

%Type=2;Illustration(Type,u,s,t,Nt,L,H)
%Type=3;Illustration(Type,u,s,t,Nt,L,H)
% D'autres valorisations peuvent etre envisagees, quelques propostion
% Film ?
% Autre ?