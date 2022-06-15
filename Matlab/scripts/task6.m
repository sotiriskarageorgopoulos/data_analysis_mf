clear, close all
X=importdata("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\kmeans.dat");

[n,d] = size(X);    % n=number of samples

% Normalization
a = min(min(X));
b = max(max(X-a));
X = (X-a)/b;

figure(1)
plot(X(:,1),X(:,2),'k*','MarkerSize',5);
title 'KMEANS DATA';
xlabel 'X';
ylabel 'Y';
axis([min(X(:,1)) max(X(:,1)) min(X(:,2)) max(X(:,2))])
hold on


%%
% parameter
clusters = 3;  % number of clusters - test for 3,4,5
iteration = 10;  % Number of iterations

%  k-means clustering 
% Decide randomly an initial value from X
P = randperm(n);
% initial value of center vector
mean_val = X(P(1,1:clusters)',:);


for iter = 1:iteration
    for i = 1:n
        for j = 1:clusters
            distance(i,j) = sum(abs(X(i,:) - mean_val(j,:)));
        end %EOF j
        [D(i,:),idx(i,:)] = min(distance(i,:)');
    end %EOF i
    
    for j=1:clusters
        mean_val(clusters,:) =  sum(X(idx==clusters,:)) / sum(idx==j);
    end
    
end


% Plot after kmeans clustering
for j=1:clusters
    plot(X(idx == j,1),X(idx == j,2),'*')
end
   
%% Consider the entire region
x1 = min(X(:,1)):1e-2:max(X(:,1));
x2 = min(X(:,2)):1e-2:max(X(:,2));
[x1G,x2G] = meshgrid(x1,x2);
XGrid = [x1G(:),x2G(:)];
    
for i = 1:size(XGrid,1)
    for j = 1:clusters
        % calculate the distance between mean_val created by kmeans
        % clustering
        distance_XGrid(i,j) = min(sum(abs(XGrid(i,:) - mean_val(j,:)))');
    end
    [D_X_Grid(i),idx_XGrid(i)] = min(distance_XGrid(i,:)');
end
    
figure(2)
gscatter(XGrid(:,1),XGrid(:,2),idx_XGrid)
axis([min(X(:,1)) max(X(:,1)) min(X(:,2)) max(X(:,2))])
title 'KMEANS REGION';
xlabel 'X';
ylabel 'Y';
