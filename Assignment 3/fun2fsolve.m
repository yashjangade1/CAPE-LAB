function f= fun2fsolve(X)

%define constants
F= 1;  
V= 1;
k0= 36*(10^6);
delH= 6500;
E= 12000;
rhoCp= 500;
Tf= 298;
Caf= 10;
UA= 150;
Tj0= 298;
rhojCj= 600;
Fj= 1.25;
Vj= 0.25;
R= 1.9861;

%define variables
Ca= X(1);
T= X(2);
Tj= X(3);
r= k0 * exp(-Ea/(R*T))*CA ;

%define functions
f(1,1)= F*Caf - F*Ca - exp(-E/(R*T))*k0*Ca*V;
f(2,1)= rhoCp*F*(Tf - T) + (delH)V*exp(-E/(R*T))*k0*Ca - UA(T - Tj);
f(3,1) = rhojCj*Fj*(Tj0 - Tj) + UA*(T - Tj);
xsol = fsolve(@(x) fun2fsolve(x),[9;500;500])

end

%xsol = fsolve(@(x) fun2fsolve(x),[5;300;300])
%xsol = fsolve(@(x) fun2fsolve(x),[6;350;300])
