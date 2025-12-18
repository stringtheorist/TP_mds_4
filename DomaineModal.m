function [n,kn,wn,Lamb,Per,Freq]=DomaineModal(Nw,L,C,TypeCL)
	% Domaine modal
    n=(1:Nw)';    % Indices modaux
    if (TypeCL == 1)
        % fixe fixe
        kn = n*pi/L; % Nombres d'ondes [1/m] : corde fixee aux deux extremites
    elseif (TypeCL == 2)
        % Fixé-Libre / Dirichlet-Neumann
        % Les modes = (n - 0.5) * pi / L
        kn = (n - 0.5)*pi/L;
    end
    wn=C*kn;        % Pulsation [rad/s], relation de dispersion
    Lamb=2*pi./kn;  % Longueur d'onde de chaque mode [m]
    Per=2*pi./wn;   % Periode de chaque mode [s]
    Freq=1./Per;    % Frequence de chaque mode [Hz]
