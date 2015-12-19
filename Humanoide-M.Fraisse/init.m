 %Alexis Artuso et Michael Sanchez Projet humanoïde avec M. FRAISSE


clear all
close all
clc

%% Variables

m1 = 15;
m2 = 25;
m3 = 35;
m4 = 10;
m5 = 5;

l1 = 0.4;
l2 = 0.6;
l3 = 0.7;
l4 = 0.6;
l5 = 0.35;
lbase = 0.3;

%% etat initial

M = m1+m2+m3+m4+m5;
theta1 = pi/2;
theta2 = -pi/2;
theta3 = pi/2;
theta4 = 3*pi/4;
theta5 = -pi/2;

c1 = 0.5*l1*cos(theta1)*m1;
c2 = ( l1*cos(theta1)+0.5*l2*cos(theta1+theta2) )*m2;
c3 = ( l1*cos(theta1)+l2*cos(theta1+theta2)+0.5*l3*cos(theta1+theta2+theta3) )*m3;
c4 = ( l1*cos(theta1)+l2*cos(theta1+theta2)+l3*cos(theta1+theta2+theta3)+0.5*l4*cos(theta1+theta2+theta3+theta4) )*m4;
c5 = ( l1*cos(theta1)+l2*cos(theta1+theta2)+l3*cos(theta1+theta2+theta3)+l4*cos(theta1+theta2+theta3+theta4)+0.5*l5*cos(theta1+theta2+theta3+theta4+theta5) )*m5;

CoMxinit = ( c1+c2+c3+c4+c5 )/M


%% Fonctions de transfert

K = 10;
Kp = 2;
tau = 0.1;

%% Simulation
sim('simu')

% figure(1)
% hold on
% plot(arti1)
% plot(arti2)
% plot(arti3)
% plot(arti4)
% plot(arti5)
% xlabel('Temps (s)')
% ylabel('Angles (rad)')
% legend('theta1', 'theta2', 'theta3', 'theta4', 'theta5')

x1 = l1*cos(theta1);
x2 = x1 + l2*cos(theta1+theta2);
x3 = x2 + l3*cos(theta1+theta2+theta3);
x4 = x3 + l4*cos(theta1+theta2+theta3+theta4);
x5 = x4 + l5*cos(theta1+theta2+theta3+theta4+theta5);

y1 = l1*sin(theta1);
y2 = y1 + l2*sin(theta1+theta2);
y3 = y2 + l3*sin(theta1+theta2+theta3);
y4 = y3 + l4*sin(theta1+theta2+theta3+theta4);
y5 = y4 + l5*sin(theta1+theta2+theta3+theta4+theta5);

figure(3)
hold on
line([0 x1], [0 y1], 'color', 'r','LineWidth', 2)
line([x1 x2], [y1 y2], 'color', 'b','LineWidth', 2)
line([x2 x3], [y2 y3], 'color', 'g','LineWidth', 2)
line([x3 x4], [y3 y4], 'color', 'k','LineWidth', 2)
line([x4 x5], [y4 y5], 'color', 'm','LineWidth', 2)
axis([-1 2 0 3])
xlabel('Position suivant x')
ylabel('Position suivant y')
plot(Cdmx.data(1), Cdmy.data(1), '+r', 'LineWidth', 2)
legend('jambe', 'cuisse', 'tronc', 'bras', 'avant-bras', 'centre de masse')
hold off
for i=1:length(arti1.data)
    x1 = l1*cos(arti1.data(i));
    x2 = x1 + l2*cos(arti1.data(i)+arti2.data(i));
    x3 = x2 + l3*cos(arti1.data(i)+arti2.data(i)+arti3.data(i));
    x4 = x3 + l4*cos(arti1.data(i)+arti2.data(i)+arti3.data(i)+arti4.data(i));
    x5 = x4 + l5*cos(arti1.data(i)+arti2.data(i)+arti3.data(i)+arti4.data(i)+arti5.data(i));

    y1 = l1*sin(arti1.data(i));
    y2 = y1 + l2*sin(arti1.data(i)+arti2.data(i));
    y3 = y2 + l3*sin(arti1.data(i)+arti2.data(i)+arti3.data(i));
    y4 = y3 + l4*sin(arti1.data(i)+arti2.data(i)+arti3.data(i)+arti4.data(i));
    y5 = y4 + l5*sin(arti1.data(i)+arti2.data(i)+arti3.data(i)+arti4.data(i)+arti5.data(i));

    figure(2)
    clf
    hold on
    line([0 x1], [0 y1], 'color', 'r', 'LineWidth', 2)
    line([x1 x2], [y1 y2], 'color', 'b', 'LineWidth', 2)
    line([x2 x3], [y2 y3], 'color', 'g', 'LineWidth', 2)
    line([x3 x4], [y3 y4], 'color', 'k', 'LineWidth', 2)
    line([x4 x5], [y4 y5], 'color', 'm', 'LineWidth', 2)
    plot(Cdmx.data(i), Cdmy.data(i), '+r', 'LineWidth', 2)
    hold off
    axis([-1 2 0 3])
    xlabel('Position suivant x')
    ylabel('Position suivant y')
    legend('jambe', 'cuisse', 'tronc', 'bras', 'avant-bras', 'centre de masse')
    pause(1)
    
end;

figure(4)
plot(Cdmx.time,Cdmx.data, '.r')
xlabel('Temps de simulation')
ylabel('Position centre de masse suivant x')
axis([0 10 -0.1 0.4])

figure(5)
plot(Yepaule.time,Yepaule.data, '.r')
xlabel('Temps de simulation')
ylabel('Position epaule suivant y')
axis([0 10 1 2])
