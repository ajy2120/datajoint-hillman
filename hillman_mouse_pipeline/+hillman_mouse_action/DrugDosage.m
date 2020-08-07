%{
# DrugDosage
-> hillman_mouse_acquisition.Session
dosage_time: time
---
-> hillman_common_lab.Drug
dosage :                       decimal(3, 1)  # dilution
dosage_units :              enum('percent','mg/kg','none')
delivery_amount :         decimal(4, 2)  # (mL)
delivery_units :              enum('percent','mL')
delivery_method :         enum('IP', 'SC', 'IV', 'IM','Inhalation') #please add explanation
dosage_ts = CURRENT_TIMESTAMP:  timestamp
%}

classdef DrugDosage < dj.Manual
    
end