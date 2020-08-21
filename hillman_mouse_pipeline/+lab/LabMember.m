%{
  user        : varchar(32)     # columbia uni
  ---
  full_name  : varchar(32)
  -> lab.Lab
%}

classdef LabMember < dj.Lookup
    properties
        contents = {'hz2356', 'Teresa Zhao', 'Hillmanlab'; 'ajy2120','AJ Yagielski','HillmanLab'} % need an update
    end
end
