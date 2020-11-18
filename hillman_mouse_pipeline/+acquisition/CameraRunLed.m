%{
-> acquisition.CameraRun
led_color    : enum('red', 'blue', 'green', 'amber', 'lime', 'cyan')
%}

classdef CameraRunLed < dj.Part
    properties(SetAccess=protected)
        master = acquisition.CameraRun
    end
end
