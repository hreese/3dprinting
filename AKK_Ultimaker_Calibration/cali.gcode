;TYPE:CUSTOM
M92 E893.589267
G21        ;metric values
G90        ;absolute positioning
M107       ;start with the fan off
G28 X0 Y0  ;move X/Y to min endstops
G28 Z0     ;move Z to min endstops
G92 X0 Y0 Z0 E0         ;reset software position to front/left/z=0.0
G92 E0                  ;zero the extruded length

G1 Z50.0 F300
M0
G1 Z5.0 F300
G1 Z0.0 F50
M0
G1 Z5.0 F300
G1 X130 F9000
G1 Z0.0 F50
M0
G1 Z5.0 F300
G1 Y180 F9000
G1 Z0.0 F50
M0
G1 Z5.0 F300
G1 X0 F9000
G1 Z0.0 F50
M0
G1 Z5.0 F300
G1 Y0 F9000
G1 Z0.0 F50
M0
G1 Z5.0 F300

