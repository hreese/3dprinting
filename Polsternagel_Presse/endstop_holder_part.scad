include <variables.scad>
include <endstop_rail.scad>

// end stop holder
sensorrailthickness = 3;
sensorrailwidth = esrailwidth + 2*sensorrailthickness;
sensorraildepth = 7;

module endstopholder(spacing=endstopholedistance, offset=endstopsensoroffset, d=endstopholediam, platewidth=mplatethick) {
    difference() {
        union() {
            translate([-sensorrailwidth/2,0,0]) cube([sensorrailwidth, sensorraildepth, esrailheight*0.5]);
            // mounting plate
            translate([offset,-platewidth/2+0.001,0]) hull() {
                translate([-spacing,0,0]) translate([0,0,5]) rotate([90,0,0]) scale([0.2,1,1]) cylinder(d=10,h=platewidth,center=true,$fn=64);
                translate([ spacing,0,0]) translate([0,0,5]) rotate([90,0,0]) scale([0.2,1,1]) cylinder(d=10,h=platewidth,center=true,$fn=64);
            }
        }
        union() {
            // rail shape
            translate([0, esraildepth+sensorrailthickness,-0.1*esrailheight]) endstop_rail(height=esrailheight*2, ratio=esrailratio);
            // mounting plate holes
            translate([offset,0,0]) union() {
                translate([-spacing/2,0,0]) translate([0,0,5]) rotate([90,0,0]) cylinder(d=d, h=20, center=true, $fn=32);
                translate([ spacing/2,0,0]) translate([0,0,5]) rotate([90,0,0]) cylinder(d=d, h=20, center=true, $fn=32);
            }
            // fixation screw hole
            translate([0,0,15]) rotate([90,0,0]) cylinder(d=3.3, h=10, center=true, $fn=32);
        }
    }
}

//rotate([90,0,0])
endstopholder(offset=8);