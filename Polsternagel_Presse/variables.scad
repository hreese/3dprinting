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

// end stop rail width
esrailwidth=10;
// end stop rail depth
esraildepth=8;
// end stop rail ration between thick and thin end
esrailratio=1.4;
// end stop rail height
esrailheight=toolheight;

// distance between holes in end stop switch
endstopholedistance = 10;
// diameter of holes in end stop switch
endstopholediam = 3;
// vertical offset of end stop switch
endstopsensoroffset = 0;
// mounting plate thickness
mplatethick = 6;