function cleanedEntry = cleanupEntry(entry, table)

    if exist('table', 'var')
        entryFields = [table.primaryKey, table.nonKeyFields];
        insertDefault = true;
    else
        insertDefault = false;
        entryFields = fields(entry);
    end
        
    for ifield = 1:length(entryFields)
        f = entryFields{ifield};
        if isfield(entry, f)
            entryValue = entry.(f);
            if isempty(entryValue)
                entry = rmfield(entry, f);
                if insertDefault
                    % fill the field with the default value in database
                    entry.(f) = gui_utils.getDefaultValue(table, f);
                end
            elseif isdatetime(entryValue)
                entry.(f) = datestr(entryValue, 'yyyy-mm-dd');
            end
        else
            if insertDefault
                entry.(f) = gui_utils.getDefaultValue(table, f);
            end
        end
    end
    cleanedEntry = entry;

end