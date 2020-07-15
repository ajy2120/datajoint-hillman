function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'hillman_mouse_action', 'hillman_mouse_action');
end
obj = schemaObject;
end
