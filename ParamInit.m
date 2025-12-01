function [L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit(typecorde)
Aff=[0,1,2,3,4,5];
L=1;            % Longueur [m]
el = L/6;          % Position de l'impact[m]
Nw = 10;% Indices modaux
H = L/5;% Hauteur [m]

if(typecorde==1)
    R=0.001;        % Rayon [m]
    E=210e9;        % Module de Young [Pa]
    ro=7800;        % Masse volumique [kg/m^3]
    Note=440;       % Fréquence fondamentale [Hz]

elseif(typecorde==2)
    R=0.001;        
    E = 10e9;
    ro = 7800;
    Note = 300;

elseif(typecorde==3)
    R=0.001;        
    E = 150e9;
    ro = 1150;
    Note = 440;

elseif (typecorde==0)
    E=input('Module de Young (en Pa) =');
    ro = input('masse volumique (en kg/m^3) =');
    R=input('rayon (en m) =');
    Note=input('fréquence fondametale (en Hz) = ');

end
