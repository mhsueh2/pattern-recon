NN_boundry = get_NN_boundry({sample_C, sample_D, sample_E});
figure;
plot_scatter({sample_C, sample_D, sample_E},{'Class A', 'Class B'})
plot(NN_boundry(:,1), NN_boundry(:,2))

function NN_boundry = get_NN_boundry(samples)
% % Evaluates the samples and classify  points on the grid to get boundry
% % Input: samples: Array
% % Returns a xy cordinates requried to plot the boundry
    [max_x, max_y, min_x, min_y] = get_range(samples)

    NN_boundry = zeros(10000000, 2);
    tracker = 0;

    for x_=min_x:0.1:max_x
        for y_=min_y:0.1:max_y
            p = [x_ y_]
            min_distances = inf(1, length(samples));
            for i=1:length(min_distances)
                samp = samples{i};
                N = length(samp);
                for j=1:N
                    vector = [p;samp(j,:)];
                    d = round(pdist(vector,'euclidean'),1);
                    if d < min_distances(i), min_distances(i) = d; end
                end
            end
            
            if length(min_distances) > length(unique(min_distances))
                tracker = tracker +1;
                NN_boundry(tracker,:) = p;     
            end

        end
    end

    NN_boundry = NN_boundry(1:tracker,1:2);
end


