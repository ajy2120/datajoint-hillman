function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'hillman_mouse_acquisition', 'hillman_mouse_acquisition');
end
obj = schemaObject;
end
