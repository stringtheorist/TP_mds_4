function T=FctTemporelle(Nw,wn,an,bn,t,Aff)


for in=1:Nw
    % T_ij, avec i=>n et j=>t
    T(in,:)=an(in)*cos(wn(in)*t)+bn(in)*sin(wn(in)*t)/wn(in); 
end

% T=an.*cos(wn.*t)+bn.*sin(wn.*t)./wn;