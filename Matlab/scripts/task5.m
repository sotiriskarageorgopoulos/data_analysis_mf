%Sotirios Karageorgopoulos
x_data = importdata("C:\Users\sotir\Dev\data_analysis_mf\datasets\log_regressionx.dat");
y_data = importdata("C:\Users\sotir\Dev\data_analysis_mf\datasets\log_regressiony.dat");

m = length(x_data);
x_bar = [ones(m, 1), x_data]; 
thetas = zeros(3, 1);

sigma_func = inline('1.0 ./ (1.0 + exp(-f))'); 
iterations = 7;

for i = 1:iterations
    f = x_bar * thetas;
    h = sigma_func(f);
    anadelta_J = (1/m).*x_bar' * (h-y_data);
    H = (1/m).*x_bar' * diag(h) * diag(1-h) * x_bar;
    thetas = thetas - H\anadelta_J;
end

disp(thetas);
