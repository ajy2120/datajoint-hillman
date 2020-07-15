function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'hillman_common_lab', 'hillman_common_lab');
end
obj = schemaObject;
end
