function [up,lo] = get_env(data,np)
    nchannels = size(data.trial{1},1);
    nsamples = size(data.trial{1},2);
    
    up = zeros(nchannels,nsamples);
    lo = zeros(nchannels,nsamples);
    
    for i = 1:nchannels
        [up(i,:),lo(i,:)] = envelope(data.trial{1}(i,:),np,'peak');
    end
    print('envelope computed')
end