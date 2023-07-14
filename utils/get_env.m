function [up,lo] = get_env(data,np)
    data_abs = get_abs(data);
    
    nchannels = size(data_abs.trial{1},1);
    nsamples = size(data_abs.trial{1},2);
    
    up = zeros(nchannels,nsamples);
    lo = zeros(nchannels,nsamples);
    
    for i = 1:nchannels
        [up(i,:),lo(i,:)] = envelope(data_abs.trial{1}(i,:),np,'peak');
    end
end