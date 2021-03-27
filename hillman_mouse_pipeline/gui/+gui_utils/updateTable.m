function message = updateTable(table, key, newEntries, message, updateTs)
%UPDATEADDITIONTABLE update the entries in an additional table by comparing
%with the new data
%   Inputs: 
%       table: table object
%       masterKey: struct, primary key of the master entry
%       newEntries: struct array, new entries to insert or update
%       message: optional, cell array of initial message
%       updateTs: optional, 
%   Outputs:
%       message: output message
   
    if nargin < 5
        updateTs = false;
    end
    if nargin < 4
        message = {};
    end
    
    tableName = table.className;

    if ~length(newEntries) || nargin < 3
        try
            dj.config('safemode', false)
            numEntries = length(fetch(table & key));
            del(table & key)
            message{end+1} = ...
                sprintf('Successfully deleted %d entries from table %s', numEntries, tableName);
            dj.config('safemode', true)
        catch exception
            message{end+1} = ...
                sprintf('Error when deleting from table %s: %s', tableName, exception.message);
        end
        return
    end
    
    primaryKey = table.primaryKey;
    nonKeyFields = table.nonKeyFields;
    
    % Clean up the newEntries and get newEntryKeys
    for iNew = 1:length(newEntries)

        newEntry = newEntries(iNew);
        newEntry = gui_utils.cleanupEntry(newEntry, table);

        for field = primaryKey
            f = field{1};
            newEntryKey.(f) = newEntry.(f);
        end

        if iNew == 1
            newEntryKeys(1) = newEntryKey;
            cleanedNewEntries(1) = newEntry;
        else
            newEntryKeys(end+1) = newEntryKey;
            cleanedNewEntries(end+1) = newEntry;
        end
    end
    
    
    % delete the oldEntries that are not in the newEntries
    remainingEntryKeys = fetch((table & key) - newEntryKeys);

    if length(remainingEntryKeys)
        try
            dj.config('safemode', false)
            del(table & remainingEntryKeys)
            message{end+1} = ...
                sprintf('Successfully deleted %d from table %s', length(remainingEntryKeys), tableName);
            dj.config('safemode', true)
        catch exception
            message{end+1} = ...
                sprintf('Error when deleting from table %s: %s', tableName, exception.message);
        end
    end
    
    
    % loop through new entries, finding matched old entry, if there is not
    % matched old entry, insert, if there is, update if there are decrepancy
    for iNew = 1:length(newEntryKeys)
    
        newEntry = cleanedNewEntries(iNew);
        newEntryKey = newEntryKeys(iNew);
        % get the old entry
        oldEntry = fetch(table & newEntryKey, '*');

        if ~length(oldEntry)
            % insert as a new entry
            try
                insert(table, newEntry)
                message{end+1} = sprintf('Successfully inserted new entry in table %s', tableName);
            catch exception
                message{end+1} = sprintf('Error when inserting the %s entry: %s', tableName, exception.message);
            end

        else
            for field = nonKeyFields
                f = field{1};
                if ~isequal(newEntry.(f), oldEntry.(f))
                    newValue = newEntry.(f);
                    try
                        update(table & newEntryKey, f, newValue)
                        message{end+1} = ...
                           sprintf('Successfully updated field %s in table %s from %s to %s!', ...
                                   f, tableName, num2str(oldEntry.(f)), num2str(newEntry.(f)));

                        % if there is an update in the record, update the ts field to the
                        % current timestamp
                        if updateTs && any(contains(nonKeyFields, '_ts'))
                            tsField = nonKeyFields{contains(nonKeyFields, '_ts')};

                            timeNowStr = datestr(datetime('now'), 'yyyy-mm-dd HH:MM:ss');
                            update(table & newEntryKey, tsField, timeNowStr)
                        end

                    catch exception                
                        message{end+1} = ...
                            sprintf('Error when updating the field %s in table %s: %s', f, tableName, exception.message);
                    end
                end   
            end
        end

    end




