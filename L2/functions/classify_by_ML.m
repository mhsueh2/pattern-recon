function grid = classify_by_ML(A, B, C)
    grid = zeros(size(A));
    for i=1:numel(A)
        max_val = max([A(i) B(i) C(i)]);
        
        if max_val == A(i)
            grid(i) = 1;
        elseif max_val == B(i)
            grid(i) = 2;
        elseif max_val == C(i)
            grid(i) = 3;
        end        
    end
end