%declare the fuction
function PdepeHeatConduction

% Define problem parameters
condValues = [1, 10, 100]; % (W/m.K)
rhoSteel = 7800; % (kg/m^3)
CpSteel = 500; % (J/kg.K)
alphaValues = condValues/(rhoSteel*CpSteel); % thermal diffusivity (m^2/s)

% Define the heat conduction equation
function [c,f,s] = heatEqn(x,t,u,DuDx)
    alpha = interp1(condValues, alphaValues, k);
    c = 1/(rhoSteel*CpSteel);
    f = alpha*DuDx;
    s = 0;
end

% Define the initial condition
function u0 = initCond(x)
    u0 = 350*ones(size(x));
end

% Define the boundary conditions
function [pl,ql,pr,qr] = boundaryCond(xl,ul,xr,ur,t)
    pl = ul-300;
    ql = 0;
    pr = ur-400;
    qr = 0;
end

% Define the domain
x = linspace(0,1,100);


% Define the time span
tspan = [0:100];

% Solve the PDE using pdepe for different k values
for i = 1:length(condValues)
    k = condValues(i);
    sol = pdepe(0,@heatEqn,@initCond,@boundaryCond,x,tspan);
    
    % Plot the temperature distribution at different times for each k value
    figure;
    hold on;
    plot(x,sol(1,:,1),'r-',x,sol(21,:,1),'g-',x,sol(41,:,1),'b-',x,sol(61,:,1),'m-',x,sol(end,:,1),'k-');
    xlabel('Distance (m)');
    ylabel('Temperature (K)');
    title(['Temperature distribution at different times for k = ', num2str(k), ' W/m.K']);
    legend('t=0','t=5','t=10','t=50','t=100');
end

end