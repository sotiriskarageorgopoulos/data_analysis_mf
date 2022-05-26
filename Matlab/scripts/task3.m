%author Sotirios Karageorgopoulos
x = importdata("C:\Users\sotir\Dev\data_analysis_mf\datasets\mv_regressionx.dat");
y = importdata("C:\Users\sotir\Dev\data_analysis_mf\datasets\mv_regressiony.dat");

learning_rates = 0.01:0.16125:1.3; 
m = 47;
x_bar = [ones(m,1) x];
position_in_diagram = 1;

for a=learning_rates
   fprintf("The learning rate a=%d \n",a);
   initial_thetas = zeros(3,1);
   [J_costs,theta] = sgd(x_bar,y,initial_thetas,a,1500);
   subplot(3,3,position_in_diagram);
   position_in_diagram = position_in_diagram + 1;
   plot(1:1500,flip(J_costs),'-b','LineWidth',3);
   title(sprintf("a=%f",a));
   xlabel("iterations");
   xticklabels('');
   yticklabels('');
   ylabel("J");
   grid on
end