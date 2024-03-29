$fa=0.1;
$fs=0.5;

// Height distance pin (depends on shape in external svg file, don't change)
pinheight = 6.3;

// diameter of linear actuator shaft 
shaftdiam = 20.1;
// height of linear actuator shaft 
shaftheight = 18;
// vertical position of shaft throughhole
shaftdistancethroughhole = 9;
// throughhole diameter
throughholediam = 6;

// diameter of magnet to hold distance pin
magnetdiam = 7;
// height of magnet to hold distance pin
magnetheight = 15;
// distance of magnet to pin (to reduce magentic force)
magnetdistance = 2.3;

// length of spring above magnet
springheight = 0; // no spring
magnetshaftstart = pinheight+magnetdistance;

// diameter of punch tool (upper part of shaft)
tooldiam=30;

// acumulated height of tool
toolheight=pinheight+magnetheight+magnetdistance+springheight+shaftheight;

// endstop rail width
esrailwidth=10;
// endstop rail depth
esraildepth=8;
// endstop rail ration between thick and thin end
esrailratio=1.4;
// endstop rail height
esrailheight=toolheight;

// distance between holes in endstop switch
endstopholedistance = 10;
// diameter of holes in endstop switch
endstopholediam = 3;
// vertical offset of endstop switch
endstopswitchoffset = 11;
// mounting plate thickness
mplatethick = 6;