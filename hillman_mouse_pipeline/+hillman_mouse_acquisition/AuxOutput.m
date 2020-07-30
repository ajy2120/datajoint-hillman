%{
#AuxOutput
aux_output:  varchar(32)        
%}

classdef AuxOutput < dj.Lookup
    
    properties
        contents = {'rotary'; 'solenoid'; 'sound'}
    end
    
end