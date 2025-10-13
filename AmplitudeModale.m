function [an,bn]=AmplitudeModale(L,el,kn,wn,n,H,Aff)
	%% Amplitude modale
	an=zeros(size(n));
	bn=L*V*(cos(kn.*el)+K/N0*sin(kn.*el)./kn)./normY2;
	%-> visualisation des amplitudes modales an
	figure(6);
	stem(Freq,abs(bn),'LineWidth',2)
	xlabel('fn [Hz]')
	ylabel('|bn| [m]')
	set(gca,'FontSize',24)
