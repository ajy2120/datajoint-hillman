function cleaned_entry = cleanupEntry(entry)

     for field = fields(entry)'
        f = field{1};
        entry_value = entry.(f);
        if isempty(entry_value)
            entry = rmfield(entry, f);
        elseif isdatetime(entry_value)
            entry.(f) = datestr(entry_value, 'yyyy-mm-dd');
        end
        
    end
    cleaned_entry = entry;

end