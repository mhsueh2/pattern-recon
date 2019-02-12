MED_AB = get_MED_boundary(classes{1}('mu'), classes{2}('mu'), X, Y);
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

MED_CD = get_MED_boundary(classes{3}('mu'), classes{4}('mu'), X, Y);
MED_DE = get_MED_boundary(classes{4}('mu'), classes{5}('mu'), X, Y);
MED_EC = get_MED_boundary(classes{5}('mu'), classes{3}('mu'), X, Y);
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

function [MED_boundary] = get_MED_boundary(mu_1, mu_2, X, Y)

    MED_boundary = zeros(size(X, 1), size(Y, 2));

    for i=1:size(X,1)
        for j=1:size(Y,2)
            cur_xy = [X(i,j) Y(i,j)];
            MED_boundary(i,j) = ((cur_xy-mu_1) * (cur_xy-mu_1)') - ((cur_xy-mu_2) * (cur_xy-mu_2)');
        end
    end
end