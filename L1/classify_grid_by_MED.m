function [MED_boundary] = classify_grid_by_MED(mu_1, mu_2, X, Y)

    MED_boundary = zeros(size(X, 1), size(Y, 2));

    for i=1:size(X,1)
        for j=1:size(Y,2)
            cur_xy = [X(i,j) Y(i,j)];
            MED_boundary(i,j) = ((cur_xy-mu_1) * (cur_xy-mu_1)') - ((cur_xy-mu_2) * (cur_xy-mu_2)');
        end
    end
end