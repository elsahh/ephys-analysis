function data = read_data(datapath)
    ft_defaults
    cfg = [];
    cfg.dataset = datapath;
    data = ft_preprocessing(cfg);
end