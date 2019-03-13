function grid = classify_by_SC(discriminants, n_abs, n_bas, cls_map)
    grid = zeros(size(discriminants{1}));
    for i=1:numel(grid)
        for i_d=1:length(discriminants)
            G = discriminants{i_d};
            n_ab = n_abs{i_d};
            n_ba = n_bas{i_d};

            if G(i)== cls_map('b') && n_ab == 0
                grid(i) = cls_map('b');
                break
            end
            
            if G(i)== cls_map('a') && n_ba == 0
                grid(i) = cls_map('a');
                break
            end
        end
    end
end