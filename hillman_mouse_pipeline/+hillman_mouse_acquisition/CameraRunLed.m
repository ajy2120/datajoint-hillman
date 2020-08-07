%{
-> hillman_mouse_acquisition.CameraRun
led_color    : enum('red', 'blue', 'green', 'amber', 'lime', 'cyan')
%}

classdef CameraRunLed < dj.Part
    properties(SetAccess=protected)
        master = hillman_mouse_acquisition.CameraRun
    end
end