function [file]=Son(u,t,typecorde)
fz=u(2,:);
tab=[];
for i=1:100
    tab=[tab fz];
end
dt=t(2)-t(1);
sound(tab,1/dt);
file=['SonCorde' num2str(typecorde) '.wav'];
