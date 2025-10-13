function Illustration(Type,u,s,t)
	%% Solution générale
	u=Y'*T;    % u_ij, avec i=>s et j=>t
	%-> visualisation de u(s,t) à divers instants
	figure(8);
	plot(s,u(:,[1 10 20]),'LineWidth',2);
	xlabel('s [m]');ylabel('u(s,t) [m]');
	legend(['t=' num2str(t(1)) ],['t=' num2str(t(10)) ],['t=' num2str(t(20)) ])
	axis equal
	set(gca,'FontSize',24)
	%-> visualisation de u(s,t) en divers point de la corde
	figure(8);
	plot(t,u([1 10 20],:),'LineWidth',2);
	xlabel('t [m]');ylabel('u(s,t) [m]');
	legend(['s=' num2str(s(1)) ],['s=' num2str(s(10)) ],['s=' num2str(s(20)) ])
	set(gca,'FontSize',24)
	%-> visualisation de u(s,t) au cours du temps
	figure(9);
	for j=1:length(t)
		plot(s,u(:,j),'LineWidth',2);
		xlabel('s [m]');ylabel('u(s,t) [m]');
		axis equal;axis([0,L,-1*1*max(max(abs(u))),1*1*max(max(abs(u)))])
		set(gca,'FontSize',24);
		pause(0.1)
	end
