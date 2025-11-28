function Y=ModePropre(kn,s,Aff)
% % Modes propres

Nw=10;
if (Aff==0)
    fprintf("nooon mode propre no");
    for in=1:Nw
        % Y_ij, avec i=>n et j=>s
        Y(in,:)=sin(kn(in)*s);
    end

elseif (Aff>0)
    for in=1:Nw
        % Y_ij, avec i=>n et j=>s
        Y(in,:)=sin(kn(in)*s);
    end
    %=> visualisation de quelques modes propres
    figure(Aff);
    plot(s,Y([1:3 Nw],:),'LineWidth',2)
    xlabel('s [m]')
    legend('n=1','n=2','n=3','n=nmax')
    set(gca,'FontSize',24)
end