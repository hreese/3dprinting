// Height distance pin (depends on shape in external svg file, don't change)
pinheight = 6.3;

// diameter of linear actuator shaft 
shaftdiam = 21;
// height of linear actuator shaft 
shaftheight = 18;
// vertical position of shaft throughhole
shaftdistancethroughhole = 9;
// throughhole diameter
throughholediam = 6;

// diameter of magnet to hold distance pin
magnetdiam = 7.5;
// height of magnet to hold distance pin
magnetheight = 15;
// distance of magnet to pin (to reduce magentic force)
magnetdistance = 3;

// length of spring above magnet
springheight = 0; // no spring
magnetshaftstart = pinheight+magnetdistance;

// diameter of punch tool (upper part of shaft)
tooldiam=28;

// acumulated height of tool
toolheight=pinheight+magnetheight+magnetdistance+springheight+shaftheight;


// end stop rail width
esrailwidth=10;
// end stop rail depth
esraildepth=6;
// end stop rail ration between thick and thin end
esrailratio=0.6;
// end stop rail height
esrailheight=toolheight;
// end stop rail screw holes
esholes= [10,15,20,25,30,35,40];
// end stop rail screw hole diameter
esholediam=2.6;