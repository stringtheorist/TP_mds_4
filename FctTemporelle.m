function T=FctTemporelle(Nw,wn,an,bn,t,Aff)
for in=1:Nw
    % T_ij, avec i=>n et j=>t
    T(in,:)=an(in)*cos(wn(in)*t)+bn(in)*sin(wn(in)*t)/wn(in);
end
if (Aff==0)
    fprintf("pas d'affichage de la fonction temporelle \n");
elseif (Aff>0)
    %=> visualisation de T(t) pour quelques modes
    figure(Aff);
    plot(t,T([1:3 Nw],:),'LineWidth',2)
    xlabel('t [s]')
    legend('n=1','n=2','n=3','n=nmax')
    set(gca,'FontSize',24)
    % T=an.*cos(wn.*t)+bn.*sin(wn.*t)./wn;
end