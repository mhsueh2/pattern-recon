MED_AB = classify_grid_by_MED(classes{1}('mu'), classes{2}('mu'), X, Y);
MED_AB_final = zeros(size(X, 1), size(Y, 2));
for i=1:size(X,1)
    for j=1:size(Y,2)
        if MED_AB(i,j) >= 0
            MED_AB_final(i,j) = 1;
        elseif MED_AB(i,j) <= 0
            MED_AB_final(i,j) = 2;
        else
            disp('Error creating MED_AB_final...');
        end
    end
end

samples = {sample_A, sample_B};
contourf(X,Y,MED_AB_final, 'Color', 'black', 'LineWidth', 2)
hold on;
plot_scatter(samples, {'MED Boundries', clsA('name'), clsB('name')});
hold off;

MED_CD = classify_grid_by_MED(classes{3}('mu'), classes{4}('mu'), X, Y);
MED_DE = classify_grid_by_MED(classes{4}('mu'), classes{5}('mu'), X, Y);
MED_EC = classify_grid_by_MED(classes{5}('mu'), classes{3}('mu'), X, Y);
MED_CDE_final = zeros(size(X, 1), size(Y, 2));
for i=1:size(X,1)
    for j=1:size(Y,2)
        if MED_CD(i,j) >= 0 && MED_DE(i,j) <= 0
            MED_CDE_final(i,j) = 1;
        elseif MED_CD(i,j) <= 0 && MED_EC(i,j) >= 0
            MED_CDE_final(i,j) = 2;
        elseif MED_DE(i,j) >= 0 && MED_EC(i,j) <= 0
            MED_CDE_final(i,j) = 3;
        else
            disp('Error creating MED_CDE_final...');
        end
    end
end

samples = {sample_C, sample_D, sample_E};
figure;
contourf(X,Y,MED_CDE_final, 'Color', 'black', 'LineWidth', 2)
hold on;
plot_scatter(samples, {'MED Boundries', clsC('name'), clsD('name'), clsE('name')})
hold off;