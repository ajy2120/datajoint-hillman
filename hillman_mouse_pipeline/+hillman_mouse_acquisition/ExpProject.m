%{
# ExpProject
project_name:    varchar(255)
---
project_description:    varchar(1024)
%}

classdef ExpProject < dj.Lookup
    properties
        contents = {'endothelium',''; 'resting state',''; 'stroke',''; 'AJ',''} % need an update
    end
end

