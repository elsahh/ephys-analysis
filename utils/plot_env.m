function plot_env(data,nchannel,up,lo)
    print('plotting envelope')
    plot(data.time{1}, data.trial{1}(nchannel))
    hold on
    plot(data.time{1},up(nchannel,:),data.time{1},lo(nchannel,:),'linewidth',1.5)
    legend('data','up','lo')
    hold off
end