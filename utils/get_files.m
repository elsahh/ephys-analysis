function files = get_files(subjectdir)
    files = dir(fullfile(subjectdir,'*.mat'))
end