function y=fun1(x)
F = 1;
V = 1;
k0 = 3.6e07;
delh = 6500;
E = -12000;
rho_cp = 500;
T_f = 298;
C_af = 10;
U_A = 150;
Tj0 = 298;
rhoj_cj = 600;
F_j = 1.25;
V_j = 0.25;
R = 1.9872;
y(1) = F*(C_af-x(1))-k0*exp(E/(R*x(2)))*x(1)*V;
y(2) = F*rho_cp*(T_f-x(2))+delh*k0*exp(E/(R*x(2)))*x(1)*V-U_A*(x(2)-x(3));
y(3) = F_j*rhoj_cj*(Tj0-x(3))+U_A*(x(2)-x(3));
end

function dydt=fun2(t,y)
F = 1;
V = 1;
k0 = 3.6e07;
delh = 6500;
E = -12000;
rho_cp = 500;
T_f = 298;
C_af = 10;
U_A = 150;
Tj0 = 298;
rhoj_cj = 600;
F_j = 1.25;
V_j = 0.25;
R = 1.9872;
dydt = [F*(C_af-y(1))-k0*exp(E/(R*y(2)))*y(1)*V;
F*(T_f-y(2))+delh*k0*exp(E/(R*y(2)))*y(1)*V*(1/rho_cp)-U_A*(y(2)-y(3))*(1/rho_cp);
F_j*(Tj0-y(3))*(1/V_j)+U_A*(y(2)-y(3))*(1/(V_j*rhoj_cj))];
end

%plotting the graphs
[t, y] = ode45(@fun2, [0,50], [9.0535 311.8635 302.7940]);
f1 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [9.4121 324.2145 314.7858]);
f2 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [11.2049 385.9696 374.7450]);
f3 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [6.2409 341.1146 307.6691]);
f4 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [6.4881 354.6241 319.8540]);
f5 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [7.7239 422.1715 380.7786]);
f6 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [1.4197 391.2561 316.0260]);
f7 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [1.4759 406.7514 328.5419]);
f8 = figure;
plot(t,y,'-x');

[t, y] = ode45(@fun2, [0,50], [1.7570 484.2279 391.1212]);
f9 = figure;
plot(t,y,'-x');
