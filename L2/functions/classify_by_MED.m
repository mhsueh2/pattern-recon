function grid = classify_by_MED(prot_a, prot_b, X, Y)
    % Staticlly set the discrimnats here, must match 
    grid = zeros(size(X));
    for i=1:numel(X)
        p = [X(i) Y(i)];
        
        % Manual distance computation to increase performance
        d_to_a = (p(1) - prot_a(1))^2 + (p(2) - prot_a(2))^2;
        d_to_b = (p(1) - prot_b(1))^2 + (p(2) - prot_b(2))^2;
        
        [min_val, cls_index] = min([d_to_a d_to_b]);
        grid(i) = cls_index;
    end
end