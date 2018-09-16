%Malcolm Williams 20530280
%Jalaj Sheth 20522149
%Ioan Curticapian 20512654
%%
%CODE FOR FEB 28 near the end of the file
%% Feb 26
clc;clear all; close all;

A = [0 1 0 0;0 0 1 0;-3 1 2 3;2 1 0 0];
B = [0 0;0 0;1 2;0 2];
C = [1 0 0 0;0 0 0 1];


r = rank(ctrb(A,B));
F = place(A',C',[-10 -11 -12 -13]);
F = F';

% K = place(A,B,[-10 -11 -12 -13]);

time = 0:0.01:1;
%% Only state feedback
% Anew = A-B*K;
% [y,t,x] = lsim(ss(Anew, B,C,[0 0;0 0]),ones(2,length(time)),time,[0;0;0;0]);
% plot(t,y);
%% Combined
% Anew  = [A -B*K;F*C A-F*C-B*K];
% Bnew = [B;B];
% Z = zeros(2,4);
% Cnew = [C K*0];
% [y,t,x] = lsim(ss(Anew, Bnew,Cnew,[0 0; 0 0]),ones(2,length(time)),time,[0;0;0;0;0;0;0;0]);
% figure;
% plot(t,y);
%% X0 not equal to Xbar0
% Anew  = [A -B*K;F*C A-F*C-B*K];
% Bnew = [B;B];
% Z = zeros(2,4);
% Cnew = [C K*0];
% time = 0:0.01:1;
% [y,t,x] = lsim(ss(Anew, Bnew,Cnew,[0 0; 0 0]),ones(2,length(time)),time,[0;0;0;0;1;1;1;1]);
% figure;
% plot(t,y);
%% For Z_dot Feb 28 Code
A_aug = [A zeros(4,2);C zeros(2,2)];
B_aug = [B;zeros(2)];
K = place(A_aug,B_aug,[-10,-11,-12,-13,-14,-15]);
K1 = K(:,1:4); K2 = K(:,5:6);
A_aug_new = [A-B*K1 -B*K2;C zeros(2)];
B_aug_new = [zeros(4,2); -1*eye(2)];
C_aug_new = [C zeros(2)];
D_aug_new = zeros(2);

time = 0:0.01:1;
[y,t,x] = lsim(ss(A_aug_new, B_aug_new,C_aug_new,[0 0; 0 0]),ones(2,length(time)),time,[0;0;0;0;0;0]);
figure;
plot(t,y);




