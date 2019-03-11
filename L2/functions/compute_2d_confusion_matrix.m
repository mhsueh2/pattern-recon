function [n_aa, n_ab, n_bb, n_ba] = compute_2d_confusion_matrix(X, Y, grid, A, B, cls_map)
    [n_aa, n_ab, n_bb, n_ba] = deal(0, 0, 0, 0);
    for row_index=1:length(A)
        [row, col] = find_grid_pos(X, Y, A(row_index,:));
        pred_a = grid(row, col);
        [n_aa, n_ba] = eval_prediction(pred_a, cls_map('a'), n_aa, n_ba);
        
        [row, col] = find_grid_pos(X, Y, B(row_index,:));
        pred_b = grid(row, col);
        [n_bb, n_ab] = eval_prediction(pred_b, cls_map('b'), n_bb, n_ab);
    end
end

function [row, col] = find_grid_pos(X, Y, point)
    x = point(1);
    y = point(2);
    x_min = X(1);
    y_min = Y(1);
    
    row = y - y_min + 1;
    col = x - x_min + 1;
end

function [n_true, n_false] = eval_prediction(pred, actual, n_true, n_false)
    if pred == actual
        n_true = n_true +1;
    else
        n_false = n_false +1;
    end
end
        