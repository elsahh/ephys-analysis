function data = read_data(datapath)
    addpath('/Volumes/Nexus4/Users/EH015/code/fieldtrip')
    ft_defaults
    cfg = [];
    cfg.dataset = datapath;
    data = ft_preprocessing(cfg);
end