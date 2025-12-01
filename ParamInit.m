function [L,R,E,ro,Note,H,el,Nw,Aff]=ParamInit(typecorde)
Aff=[0,1,2,3,4,5];
L=1;            % Longueur [m]
R=0.001;        % Rayon [m]
% Tension : corde accordée sur le la-440
if(typecorde==1)
    E=210e9;        % Module de Young [Pa]
    ro=7800;        % Masse volumique [kg/m^3]
    Note=440;       % Fréquence fondamentale [Hz]
    el=L/6;         % Position de l'impact[m]
    Nw=10;
    H=L/5;
elseif(typecorde==2)
    E = 2.0e11;       
    ro = 7850;         
    Note = 440;        
    el = L/6;          
    Nw = 10;          
    H = L/5;           
elseif(typecorde==3)
    E = 4e9;           
    ro = 1150;          
    Note = 440;         
    el = L/6;         
    Nw = 10;           
    H = L/5;   

E=input('Module de Young (en Pa) =')

end
%file=['SonCorde' num2str(typecorde) '_CondInit' num2str(CI) '.wav']
