function [J_costs,thetas] = sgd(x_bar,y,thetas,alpha,iterations) 
   m = length(y);
   J_costs = zeros(iterations,1);
   for i=1:iterations
       thetas = thetas - ((alpha / m) * (x_bar' * ( x_bar * thetas - y )));
       H =  ( x_bar * thetas ) - y;
       error = (H' * H) / (2 * m);                                      
       J_costs(i) = error;
   end
end