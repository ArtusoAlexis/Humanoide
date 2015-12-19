clear all
close all
clc

%% initialisation des variables
global zc Tc

g = 9.81;
zc = 0.8;   % m

Tc = sqrt(zc/g);
Ts = 0.8;                 % Temps support

% px = 0;
% py = 0;

sx = 0.3;
sy = 0.2;

% x0 = -0.15;
% xTs = x0 + 0.3;
% y0 = 0.1;
% yTs = y0;

% dx0 = ( xTs-(x0 - px)*cosh(Ts/Tc) ) / ( Tc*sinh(Ts/Tc) );
% dy0 = ( yTs-(y0 - py)*cosh(Ts/Tc) ) / ( Tc*sinh(Ts/Tc) );

% figure(1)
% % hold on
% plot3(x0, y0, z, '+g')
% xlabel('axe x')
% ylabel('axe y')
% zlabel('axe z')


%% calcul de trajectoire pour 1 pas

% [x, y, z, dx, dy] = CdM(Ts, x0, dx0, y0, dy0, px(1), py(1));
% 
% figure(1)
% plot3(x, y, z, 'r');
% hold off
% pause(0.1)


%% calcul pour plusieurs pas

Pos_cdm = [0 0 sx/2 3*sx/2 5*sx/2 7*sx/2
           0 sy/2 sy/2 sy/2 sy/2 sy/2];

P = [0 0 sx 2*sx 3*sx
     0 sy 0 sy 0];

 
figure(2)
grid on
hold on

for i=1:length(Pos_cdm)-1
    if(i==1)
        
        Xinit = Pos_cdm(1, i);
        Yinit = Pos_cdm(2, i);
        
    else 
        Xinit = x(length(x));
        Yinit = y(length(y));
    end
    
    Xf = Pos_cdm(1, i+1);
    Yf = Pos_cdm(2, i+1);
    
    dX = ( Xf-P(1,i)-(Xinit - P(1,i))*cosh(Ts/Tc) ) / ( Tc*sinh(Ts/Tc) );
    dY = ( Yf-P(2,i)-(Yinit - P(2,i))*cosh(Ts/Tc) ) / ( Tc*sinh(Ts/Tc) );

    [x, y, z] = CdM(Ts, Xinit, dX, Yinit, dY, P(1,i), P(2,i));

    
    plot3(x, y, z, 'r');
    
end






