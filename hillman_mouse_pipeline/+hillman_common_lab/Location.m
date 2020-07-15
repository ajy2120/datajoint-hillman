%{
  location                     : varchar(32)    # e.g. wfom1, 2p_room
  ---
  location_description=''      : varchar(255)
%}

classdef Location < dj.Lookup

end
