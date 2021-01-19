function options = getOptions(table, attr, conn)
%GETDROPDOWNLISTENUM get the options for a particualr attribute, both from
%enum or from a foreign key restrain.
%   Inputs: table: table object
%           attr: string, attribute name
%           conn: dj connection object
%   Outputs: default_value: default value of the field

attributes = table.header.attributes;
idx = strcmp({attributes.name}, attr);

type = attributes(idx).type;

lab.Source;
subject.Subject;

% If it is an enum field, extract the options
if contains(type, 'enum')
    temp = regexp(type, '(?<=\()[^)]*(?=\))', 'match', 'once');
    opts = regexp(temp, '([^,]+?)(?=,|$)', 'match');
    
    options = cell(size(opts));
    for i_opt = 1:length(opts)
        
        options{i_opt} = opts{i_opt}(2:end-1);
    end
    return
% If it is a dependent field
else
    utils.init_schemas
    % get the idx of the relevant field
    idx = strcmp({conn.foreignKeys.from}, table.fullTableName) & strcmp([conn.foreignKeys.attrs], attr);
    if sum(idx) == 0
        options = {};
        return
    end
    ref_fullname = conn.foreignKeys(idx).ref;
    ref_table = eval(conn.tableToClass(ref_fullname));
    ref_attr = conn.foreignKeys(idx).ref_attrs{1};
    options = fetchn(ref_table, ref_attr)';
end

