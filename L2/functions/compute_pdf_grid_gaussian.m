function grid = compute_pdf_grid_gaussian(data, X, Y)
    grid = zeros(size(X));
    [mu_x, mu_y, sigma_x, sigma_y] = estimate_2d_gaussian(data);
    

    for i=1:numel(X)
        x = X(i);
        y = Y(i);

        pdf_x = calc_gaussian_pdf(x, mu_x, sigma_x);
        pdf_y = calc_gaussian_pdf(y, mu_y, sigma_y);
        pdf = pdf_x * pdf_y;
        
        grid(i) = pdf;
    end
end

function pdf = calc_gaussian_pdf(x, mu, sigma)
    A = sqrt(2*pi);
    B = -(1/2);
    pdf = 1/(sigma*A) * exp(B * ((x-mu)/sigma)^2);
end