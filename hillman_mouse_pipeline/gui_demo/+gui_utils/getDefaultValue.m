function default_value = getDefaultValue(q, attr)
%GETDEFAULTVALUE get the default value of a particular field for a query
%   Inputs: q: query object
%           attr: string, attribute name
%   Outputs: default_value: default value of the field

attributes = q.header.attributes;
idx = strcmp({attributes.name}, attr);
default_value = attributes(idx).default;
if strcmp(default_value, 'current_timestamp()')
    default_value = datestr(datetime('now'), 'yyyy-mm-dd HH:MM:ss');
end


