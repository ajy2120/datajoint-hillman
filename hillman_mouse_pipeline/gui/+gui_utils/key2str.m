function key_str = key2str(key)
%KEY2STR converts a DataJoint primary key struct to a string
%   Inputs: 
%       key: DataJoint primary key structure
%   Outputs:
%       key_str: a displayable string of the key structure

assert(length(key) == 1, 'Can only convert one key to string.')

key_str = '';

for ifield = fields(key)'
    field = ifield{1};
    key_str = sprintf('%s\n%s: %s', key_str, field, key.(field));
end