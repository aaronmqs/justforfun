clear; clc; close all;

Ts = 0.1;
Tsim = 100;

x0 = [1 1]'; % initial conditions
tspan = Ts:Ts:Tsim; % integration interval
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,2)); % making the solutions very accurate
[t,x] = ode45(@(t,x) nonlinearsystem(t,x),tspan,x0,options); % solves the differential equation system

x1 = x(:,1);
x2 = x(:,2);

V = x1.^2 + x2.^2;

[r,the]=meshgrid(0:0.01:sqrt(2),0:pi/100:2*pi);
a = r.*cos(the);
b = r.*sin(the);
c = a.^2 + b.^2;
l = surf(a,b,c);
alpha 0.5
shading flat
l.FaceColor = '#cc99ff';
hold on
plot3(sqrt(2)*cos(the),sqrt(2)*sin(the),2*ones(length(the),1),'r');

hold on

plot3(x1,x2,V,'b','LineWidth',3)

hold on

plot(x1,x2,'b--')

axis([-sqrt(2) sqrt(2) -sqrt(2) sqrt(2) 0 2])

xlabel("State $x_1$",'Interpreter','latex')
ylabel("State $x_2$",'Interpreter','latex')
zlabel("$V(x_1,x_2)$",'Interpreter','latex')
title("Asymptotic Stable System - Lyapunov Stability",'Interpreter','latex')