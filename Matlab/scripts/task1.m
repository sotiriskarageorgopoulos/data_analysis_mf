x_data = importdata("C:\Users\sotir\Dev\data_analysis_mf\datasets\linear_regressionx.dat");
y_data = importdata("C:\Users\sotir\Dev\data_analysis_mf\datasets\linear_regressiony.dat");
x_size = length(x_data);

%Add a column of ones, in order to have the constant values b of y=ax+b
X = [x_data ones(x_size,1)];

[coefficients,bint,residuals,rint,stats] = regress(y_data,X);
linear_regress_line_points = X*coefficients; %calculate the values of y.
disp(linear_regress);
disp(coefficients);

plot(x_data,y_data,'ro');
xlabel("X axis");
ylabel("Y axis");
hold on;

plot(x_data,linear_regress_line_points,'b-');

