bml_defaults

function data_pow = get_pow(data)
    data_pow = bml_apply(@(x) x.^2,data); 
end