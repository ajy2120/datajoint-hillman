
%{
# strain - in the descripion please note about....
strain_name: varchar(64)                # unique strain id
---
strain_description='': varchar(255)
strain_ts = "current_timestamp()": timestamp 
%}

classdef Strain < dj.Lookup
    
end

