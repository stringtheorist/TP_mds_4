function T=FctTemporelle(Nw,wn,an,bn,t,Aff)


for in=1:Nw
    % T_ij, avec i=>n et j=>t
    T(in,:)=an(in)*cos(wn(in)*t)+bn(in)*sin(wn(in)*t)/wn(in); 
end

% T=an.*cos(wn.*t)+bn.*sin(wn.*t)./wn;

%=> visualisation de T(t) pour quelques modes
figure(7);
plot(t,T([1:3 Nw],:),'LineWidth',2)
xlabel('t [s]')
legend('n=1','n=2','n=3','n=nmax')
set(gca,'FontSize',24)
