% Solve the ODE using ode45
[t, y] = ode45(@stiff_ode, [0, 3000], [2; 0]);
plot(t, y(:,1));
title('Solution using ode45');
xlabel('Time');
ylabel('y1');

% Solve the ODE using ode15s
[t, y] = ode15s(@stiff_ode, [0, 3000], [2; 0]);

% Plot the solution
figure;
plot(t, y(:,1));
title('Solution using ode15s');
xlabel('Time');
ylabel('y1');

% Define the function representing the ODE
function dydt = stiff_ode(t, y)
  dydt = [y(2); 1000*(1 - y(1)^2)*y(2) - y(1)];
end