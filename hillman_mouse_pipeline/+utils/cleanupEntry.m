function cleaned_entry = cleanupEntry(entry)

     for field = fields(entry)'
        f = field{1};
        if isempty(entry.(f))
            entry = rmfield(entry, f);
        end
        if isdatetime(entry.(f))
            entry.(f) = datestr(entry.(f), 'yyyy-mm-dd');
        end
    end
    cleaned_entry = entry;

end