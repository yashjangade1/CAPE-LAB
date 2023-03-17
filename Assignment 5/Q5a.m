% length l= 10 m
beta= 0.05; % beta value
T0=300; % in K
TL=400; % in K
Tinf=200; % in K
psi = 0.3*10^(-10); %psi value

% converting 2 nd order differential equation to 1st order equations
% T1=T, T2=dT/dx
%dT2/dx=(-beta*(Tinf-T1)-psi*(Tinf^4-T1^4))
f= @(x,y) [ y(2) ; (-beta*(Tinf-T(1)) - psi*(Tinf^4 - (y(1))^4))];

% boundary conditions, x=0, T=T0; x=10, T=TL
bc = @(ya, yb) [ya(1)-T0; yb(1) - TL]; 

% initial guess creation using solinit
xmesh = linspace(0 , 10 , 200); 
solinit = bvpinit(xmesh, [0 10]);
sol=bvp4c(f, bc,solinit);
T = sol.y;

plot( sol.x, T(1,:))
xlabel('length of rod,x')
ylabel('Temperature')
title('Temperature vs length of rod')
legend('temperature')