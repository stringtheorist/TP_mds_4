function [an,bn]=AmplitudeModale(L,el,kn,wn,n,H,Aff,Excitation,V)
% Amplitude modale
if Excitation == 1 %corde pincée
an = 2*H ./ (kn*L) * L/(L-el) .* sin(kn*el)./(kn*el); %On a remplacer (n*pi) par (kn*L), voir rapport.
bn = zeros(size(n));

elseif Excitation == 2 %corde frapée, voir rapport aussi. 
an = zeros(size(n));
bn = 2*V ./ L .* sin(kn*el);
end
%=> visualisation des amplitudes modales an
if (Aff==0)
    fprintf("pas d'affichage de l'amplitude modale \n");

elseif (Aff>0)
    figure(Aff);
    stem(wn,abs(an),'LineWidth',2)
    xlabel('wn [rad/s]')
    ylabel('|an| [m]')
    set(gca,'FontSize',24)
end
