%{
# Drug
drug    : varchar(32)
---
(drug_source) -> lab.Source
drug_description='': varchar(255)
%}

classdef Drug < dj.Lookup
    properties
        contents = {'caffeine', 'in house', ''; 'alcohol', 'in house', ''; 'ketamine', 'in house', ''} % need an update
    end
end
