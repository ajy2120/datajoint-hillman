%{ 
species: varchar(32)                  # e.g. Mouse, Rat
%}

classdef Species < dj.Lookup
    properties
        contents = {'mouse'; 'rat'; 'fly'} % need an update
    end
end