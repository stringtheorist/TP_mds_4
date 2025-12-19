%% ========================================================================
%% INITIALISATION =========================================================
clear;close all;clc;
%% ========================================================================

%choix du type de corde
typecorde = input('Choisissez le type de corde \n0 - entrez vos propres paramètres R/E/ro/note \n1 - Harpe (Boyau)\n2 - Guitare (Nylon)\n3 - Piano (Acier)\nVotre choix (0, 1, 2 ou 3) : \n\n');
%choix CL
TypeCL = input('Choissez vos CL \n1 - Fixé-Fixé \n2 - Fixé-Libre : \n\n'); 
%choix excitation
Excitation = input('Choisissez le type d excitation : \n1 - Pincée \n2 - Frappée \n\n');
V=0;
if Excitation == 2
    V=input('Vous avez choisis corde frapée. Choisissez la vitesse, en m/s :\n\n');
end
%paramètres
[L,C,H,el,Nw,Aff,R,N0] = Param(typecorde);

%interaction utilisateur pour affichage

fprintf('\nChoix affichage\n');
fprintf('0 - rien\n1 - juste analyse modale (Modes, Amplitudes, Temps)\n2 - juste animation (Film du mouvement de la corde)\n3 - Tout\n');

graph = input('Choisissez (0, 1, 2, 3) : ');


fprintf('\nLa tension calculée est N0 = %.2f N \n', N0);
fprintf('\nLe type de corde ne change pas les courbes/son !! Voir le compte-rendu pour plus de détail...\n\n');

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
[an,bn]=AmplitudeModale(L,el,kn,wn,n,H,Aff(3),Excitation,V);
% Fonction en temps
T=FctTemporelle(Nw,wn,an,bn,t,Aff(4));
% Deplacement
u=FctDeplacement(Y,T);

Son(u,t,typecorde);
%% ========================================================================
%% VALORISATION ==========================================================
Type=1;Illustration(Type,u,s,t,Nt,L,H,graph)