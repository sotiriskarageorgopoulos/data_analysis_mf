clear all; close all; clc;

x=importdata("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\linear_regressionx.dat");
y=importdata("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\linear_regressiony.dat");

a = 0.07; 
m = 50;
iterations = 1500;
x_bar = [ones(m,1) x];


fprintf("The learning rate a=%d \n",a);
initial_thetas = zeros(2,1);
[J_costs,theta] = sgd(x_bar,y,initial_thetas,a,iterations);

plot(1500:-1:1,flip(J_costs),'-b','LineWidth',3);
title(sprintf("a=%f",a));
xlabel("iterations");
xticklabels('');
yticklabels('');
ylabel(sprintf("J"));
grid on
