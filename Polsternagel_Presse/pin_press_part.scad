include <variables.scad>
include <endstop_rail.scad>

//$fa=1;
//$fs=0.05;

module pin_press_tool() {
    difference() {
        union() {
            // outer body
            cylinder(h=toolheight, d=tooldiam, $fn=100);
            // rail for end stop
            for(i=[0:1]) {
                rotate([0,0,90+180*i]) translate([0,-0.8*tooldiam/2,0]) endstop_rail(height=esrailheight, ratio=esrailratio);
            }
        }
        union () {
            // shaft for attachment to linear actuator
            translate([0,0,magnetshaftstart+magnetheight+springheight]) cylinder(h=toolheight, d=shaftdiam, $fn=100);
            // hole for vertical attachment to shaft
            translate([0,0,magnetshaftstart+magnetheight+springheight+shaftdistancethroughhole])  rotate([90,0,0]) cylinder(d=throughholediam, h=2*tooldiam, center=true, $fn=100);
            // shaft for magnet
            translate([0,0,magnetshaftstart]) cylinder(h=magnetheight+springheight+0.1, d=magnetdiam, $fn=100);
            // hole for pin
            translate([0,0,-0.001]) rotate_extrude($fn = 100) {
                import("shape_pin.svg");
            }
            // space for screwhead
            for(i=[0:1]) {
                rotate([0,0,90+180*i]) translate([0,-0.8*tooldiam/2,0]) endstop_rail_screwslit();
            }
            // champfer for easier insertion
            translate([0,0,toolheight+shaftdiam/2]) sphere(d=shaftdiam*sqrt(2)+1, $fn = 100);
        }
    }
}

// punch tool
pin_press_tool();

/*
translate ([-75,75,0]) difference() {
    rotate([0,0,90]) pin_press_tool();
    translate([0,0,-0.01]) cube([25,25,50]);
}
*/