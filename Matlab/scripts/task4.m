x=importdata("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\log_regressionx.dat");
y=importdata("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\log_regressiony.dat");

[m,n] = size(x);
initial_thetas = zeros((n+1),1); 
[J_costs,theta] = sgd_log(initial_thetas, x, y);

fprintf("The J cost is : %f \n",J_costs);

for i=1 : 3
    fprintf("The theta(%i) is : %f \n",i, theta(i));
end