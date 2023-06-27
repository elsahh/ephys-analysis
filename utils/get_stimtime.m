function [onset,duration,stimtime] = get_stimtime(data,up,threshold)
    nchannels = size(data.trial{1},1);
    nsamples = size(data.trial{1},2);
    stimtime = zeros(1, nsamples);
    onset = [];
    duration = [];
    
    for j = 1:nsamples
        consensus = true;
        
        for i = 1:nchannels
            if up(i, j) < (1 * 10^9)
                consensus = false;
                break;
            end
        end
        
        if consensus
            for i = 1:nchannels
                stimtime(1, j) = threshold;
                
                if j > 1 && stimtime(1, j-1) == 0
                    onset = [onset, j];
                end
            end
        else
            for i = 1:nchannels
                if j > 1 && stimtime(1, j-1) == 1
                    duration = [duration, j - onset(end)];
                end
            end
        end
    end
end