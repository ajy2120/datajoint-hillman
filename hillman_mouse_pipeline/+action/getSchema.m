function obj = getSchema
persistent schemaObject
if isempty(schemaObject)
    schemaObject = dj.Schema(dj.conn, 'action', 'hillman_mouse_action');
end
obj = schemaObject;
end
