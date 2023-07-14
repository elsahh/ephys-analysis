function [onset,duration,stimtime] = get_stimtime(data,up,threshold)
    nchannels = size(data.trial{:,:},1);
    nsamples = size(data.trial{:,:},2);
    stimtime = zeros(1, nsamples);
    onset = [];
    stop = [];
    duration = [];
    
    for j = 1:nsamples
        consensus = true; 
        for i = 1:nchannels
            if up(i,j) < threshold
                consensus = false;
                break;
            end
        end
        
     if consensus == true
        stimtime(1, j) = 1;
        if j == 1
            onset = [onset, j];
        end
        if j > 1 && stimtime(1, j-1) == 0
            onset = [onset, j];
        end
    else
        if j > 1 && stimtime(1, j-1) ~= 0
            stop = [stop, j];
            stimdur = stop(end) - onset(end);
            if stimdur > 44000
                duration = [duration, stop(end) - onset(end)];
            else
                stop(end) = [];
                onset(end) = [];
            end
        end
    end
end