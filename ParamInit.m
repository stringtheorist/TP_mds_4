function [L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit(typecorde)
Aff=[0,1,2,3,4,5,6,7,8,9];
L=1;            % Longueur [m]
el = L/6;          % Position de l'impact[m]
Nw = 10;% Indices modaux
H = L/5;% Hauteur [m]

if(typecorde==1) %corde de harpe en boyau
    R = 1.0e-3;    % Rayon [m]
    E = 6e9;       % Module de Young [Pa]
    ro = 1300;     % Masse volumique [kg/m^3]
    Note=440;       % Fréquence fondamentale [Hz]

elseif(typecorde==2) %Pour une corde de Guitare classique, en nylon.
    R = 0.35e-3;   % Rayon [m]
    E = 5e9;       % Module de Young [Pa]
    ro = 1150;     % Masse volumique [kg/m^3] (Nylon)
    Note = 440;

elseif(typecorde==3) %Pour une corde de piano grave, en acier.
    R = 2.5e-3;    % Rayon [m]
    E = 200e9;     % Module de Young [Pa] (acier)
    ro = 8500;     % Masse volumique [kg/m^3] (Moyenne acier/cuivre)
    Note = 440;

elseif (typecorde==0)
    E=input('Module de Young (en Pa) =');
    ro = input('masse volumique (en kg/m^3) =');
    R=input('rayon (en m) =');
    Note=input('fréquence fondametale (en Hz) = ');

end
