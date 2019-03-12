function grid = classify_by_ML(A, B, C)
    grid = zeros(size(A));
    for i=1:numel(A)
        [max_val, cls_index] = max([A(i) B(i) C(i)]);
        grid(i) = cls_index;   
    end
end